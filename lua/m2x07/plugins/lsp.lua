---@diagnostic disable: undefined-field
return {
  "neovim/nvim-lspconfig",
  lazy = true,
  event = "BufReadPre",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- enable virtual text as it defaults to disabled since neovim v0.11
    vim.diagnostic.config({
      virtual_text = true,
      float = {
        border = "single",
      },
    })
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("m2x07-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set(
            "n",
            keys,
            func,
            { buffer = event.buf, desc = "LSP: " .. desc }
          )
        end

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map(
          "gd",
          require("telescope.builtin").lsp_definitions,
          "[G]oto [D]efinition"
        )

        -- Find references for the word under your cursor.
        map(
          "gr",
          require("telescope.builtin").lsp_references,
          "[G]oto [R]eferences"
        )

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map(
          "gI",
          require("telescope.builtin").lsp_implementations,
          "[G]oto [I]mplementation"
        )

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map(
          "<leader>D",
          require("telescope.builtin").lsp_type_definitions,
          "Type [D]efinition"
        )

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        map(
          "<leader>ws",
          require("telescope.builtin").lsp_dynamic_workspace_symbols,
          "[W]orkspace [S]ymbols"
        )

        -- Rename the object under your cursor.
        --  Most Language Servers support renaming across files.
        map("<F2>", vim.lsp.buf.rename, "Rename object under cursor")

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        -- Opens a popup that displays documentation about the word under your cursor
        map("K", function()
          vim.lsp.buf.hover({
            border = "single",
            title = "Hover Documentation",
          })
        end, "Hover Documentation")

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          -- print(client.server_capabilities.documentHighlightProvider)
          local highlight_augroup = vim.api.nvim_create_augroup(
            "m2x07-lsp-highlight",
            { clear = false }
          )
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup(
              "m2x07-lsp-detach",
              { clear = true }
            ),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({
                group = "m2x07-lsp-highlight",
                buffer = event2.buf,
              })
            end,
          })
        end

        -- The following autocommand is used to enable inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if
          client
          and client.server_capabilities.inlayHintProvider
          and vim.lsp.inlay_hint
        then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(
              ---@diagnostic disable-next-line: missing-parameter
              not vim.lsp.inlay_hint.is_enabled()
            )
          end, "[T]oggle Inlay [H]ints")
        end
      end,
    })

    -- add autocomplete capabilities from lsp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      "force",
      capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    local servers = {
      bashls = {},
      html = {},
      cssls = {},
      emmet_language_server = {
        filetypes = {
          "css",
          "eruby",
          "html",
          "htmldjango",
          "less",
          "pug",
          "sass",
          "scss",
          "htmlangular",
        },
      },
      ts_ls = {},
      marksman = {},
      gopls = {},
      lua_ls = {
        -- capabilities = {},
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
    }

    ---@diagnostic disable-next-line: missing-fields
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "󰸞",
          package_pending = "",
          package_uninstalled = "",
        },
      },
    })
    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_enable = {
        exclude = {
          "ts_ls"
        }
      }
    })
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua",
      "prettier",
      "marksman",
    })
    require("mason-tool-installer").setup({
      ensure_installed = servers,
    })

    -- automatic server setup // OUTDATED
    -- require("mason-lspconfig").setup_handlers({
    --   -- default handler that will be ran for each lsp server
    --   function(server_name)
    --     local server = servers[server_name] or {}
    --
    --     -- merge server's capabilities with autocomplete capabilities
    --     server.capabilities = vim.tbl_deep_extend(
    --       "force",
    --       {},
    --       capabilities,
    --       server.capabilities or {}
    --     )
    --     require("lspconfig")[server_name].setup(server)
    --   end,
    --
    --   -- avoid setting up tsserver, as it will replace 'typescript-tools.nvim'
    --   ["ts_ls"] = function() end,
    -- })
  end,
}
