function! ToggleNumbersOn()
    set relativenumber!
    set number
endfunction

function! ToggleRelativeOn()
    set number
    set relativenumber
endfunction

autocmd FocusLost * call ToggleNumbersOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleNumbersOn()
autocmd InsertLeave * call ToggleRelativeOn()
