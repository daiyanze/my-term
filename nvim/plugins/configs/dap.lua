return {
  config = function()
    vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
    vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='', linehl='', numhl=''})
    vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='', linehl='', numhl=''})
    vim.fn.sign_define('DapLogPoint', {text='קּ', texthl='', linehl='', numhl=''})
    vim.fn.sign_define('DapStopped', {text='ﱢ', texthl='', linehl='', numhl=''})
  end
}
