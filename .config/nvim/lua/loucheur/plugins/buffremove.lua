return {
    "echasnovski/mini.bufremove",
    version = false,
    main = "mini.bufremove",
    keys = {
      { "<leader>bd", "<CMD>:lua MiniBufremove.delete()<CR>", desc = "Delete buffer" },
    },
    config = true,
  }