return {
  --URL Open
  {
    "url-open",
    cmd = "URLOpenUnderCursor",
    event = "DeferredUIEnter",
    after = function()
      local status_ok, url_open = pcall(require, "url-open")
      if not status_ok then
        return
      end
      url_open.setup({})
      vim.keymap.set("n", "<leader>u", "<esc>:URLOpenUnderCursor<cr>")
    end,
  },
}
