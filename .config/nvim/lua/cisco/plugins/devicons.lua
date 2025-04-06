return {
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        override = {
          tsx = { icon = "󰜈", color = "#7daea3", name = "tsx" },
          ts = { icon = "", color = "#7daea3", name = "ts" },
          scss = { icon = "", color = "#D3869B", name = "scss" },
          html = { icon = "", color = "#EA6962", name = "html" },
          css = { icon = "", color = "#7daea3", name = "css" },
          json = { icon = "󰘦", color = "#D8A657", name = "json" },
          svg = { icon = "󰜡", color = "#D8A657", name = "svg" },
          env = { icon = "", color = "#D8A657", name = "env" },
          rs = { icon = "󱘗", color = "#E78A4E", name = "rust" },
          lua = { icon = "", color = "#7daea3", name = "lua" },
          go = { icon = "󰟓", color = "#7daea3", name = "go" },
        },
        override_by_filename = {
          ["tsconfig.json"] = { icon = "", color = "#7daea3", name = "TSConfig" }, -- Gruvbox Yellow
          ["package.json"] = { icon = "", color = "#A9B665", name = "PackageJSON" }, -- Gruvbox Yellow
          ["package-lock.json"] = { icon = "", color = "#A9B665", name = "PackageLockJSON" }, -- Gruvbox Yellow
          [".gitignore"] = { icon = "", color = "#EA6962", name = "git" },
          ["vite-env.d.ts"] = { icon = "", color = "#E78A4E", name = "vite" },
          ["eslint.config.js"] = { icon = "", color = "#7DAEA3", name = "eslintJs" },
          ["eslint.config.ts"] = { icon = "", color = "#7DAEA3", name = "eslintTs" },
          ["README.md"] = { icon = "", color = "#7DAEA3", name = "readme" },
        },
        default = true,
      })
    end
  },
}
