-- ~/.config/nvim/lua/plugins/rust_clippy.lua
return {
  "mrcjkb/rustaceanvim",
  opts = {
    server = {
      default_settings = {
        ["rust-analyzer"] = {
          checkOnSave = { command = "clippy" },
        },
      },
    },
  },
}
