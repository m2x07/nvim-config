return {
	"mxsdev/nvim-dap-vscode-js",
	config = function()
		require("dap-vscode-js").setup({
			debugger_path = os.getenv("HOME") .. "/.local/src/vscode-js-debug",
			adapters = {
				"pwa-node",
				"pwa-chrome",
				"node-terminal",
				"pwa-extensionHost",

				-- uncomment these to use vscode's debug configs
				-- "chrome",
				-- "node",
			},
		})

		for _, language in ipairs({ "javascript", "typescript" }) do
			require("dap").configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
				-- {
				-- 	type = "pwa-chrome",
				-- 	request = "launch",
				-- 	name = 'Start Chrome with "localhost"',
				-- 	url = "http://localhost:5173",
				-- 	webRoot = "${workspaceFolder}",
				-- 	userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
				-- },
			}
		end
	end,
}
