Date: 2013-03-25
Title: Vim Add Serial Number

Here is a vim script function to add serial numbers.

`Code`

    function! AddSerialNumbers() range
    python << PYEND
    # for range function vim automatically creates argument
    # firstline and lastline.
    firstline = int(vim.eval("a:firstline"))
    lastline  = int(vim.eval("a:lastline"))
    # width for indenting the serial numbers.
    width     = len(str(lastline - firstline))

    serialNumber = 1
    for lineNumber in range(firstline, lastline + 1):
	line = vim.current.buffer[lineNumber - 1] # 0 vs 1 based
	vim.current.buffer[lineNumber - 1 ] =
            str(serialNumber).rjust(width) + ". " + line
	serialNumber += 1
    PYEND
    endfunction


For this function to work you need to have python support in you VIM.
