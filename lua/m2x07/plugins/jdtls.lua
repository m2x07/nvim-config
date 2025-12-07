-- BIG THANKS to Knightvim's config for this
-- https://github.com/justlookz/Knightvim_v2/blob/main/lua/plugins/jdtls.lua
-- also refer: https://sookocheff.com/post/vim/neovim-java-ide/
--
-- Setting up java debugging on neovim is HELL as of now.
-- use vscode for java development instead. Only language server is configured

local data = vim.fn.stdpath("data")
local workspace_path = data .. "/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name
local os_config = "linux"
if vim.fn.has("mac") == 1 then
  os_config = "mac"
elseif vim.fn.has("win32") == 1 then
  os_config = "win"
end
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "-jar",
    vim.fn.glob(
      data .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
    ),
    "-configuration",
    data .. "/mason/packages/jdtls/config_" .. os_config,
    "-data",
    workspace_dir,
  },
  filetypes = { "java" },

  root_dir = vim.fs.root(0, {
    "mvnw",
    "gradlew",
    "build.xml",
    "build.gradle",
    "build.gradle.kts",
    ".git",
    "pom.xml",
    "settings.gradle",
    "settings.gradle.kts",
  }),
  -- root_markers = { {"mvnw", "gradlew", "build.xml"}, ".git" },

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      project = {
        sourcePaths = {
          "",
          "src",
          "src/main",
          "src/test",
        },
      },
    },
  },
}

return {
  "https://github.com/mfussenegger/nvim-jdtls",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        require("jdtls").start_or_attach(config)
      end,
    })
  end,
}
