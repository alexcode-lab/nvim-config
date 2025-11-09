return {
  'numToStr/Comment.nvim',
  event = 'VeryLazy',
  opts = {
    toggler = {
      ---Line-comment toggle keymap
      line = ',cc',
      ---Block-comment toggle keymap
      block = ',cm',
    },
    opleader = {
      ---Line-comment keymap
      line = ',cc',
      ---Block-comment keymap
      block = ',cm',
    },
    extra = {
      ---Add comment on the line above
      above = ',cO',
      ---Add comment on the line below
      below = ',co',
      ---Add comment at the end of line
      eol = ',ca',
    },
  },
}
