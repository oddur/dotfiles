-- LazyVim's editor.refactoring extra is missing the async.nvim dep that
-- refactoring.nvim added 2026-04. Remove once LazyVim#7122 lands upstream.
return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = { "lewis6991/async.nvim" },
}
