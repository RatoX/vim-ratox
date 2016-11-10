
let g:pymode_rope_goto_definition_cmd = 'vnew'
let g:pymode_indent = 1
let g:pymode_folding = 0
"Use C e M como Classe e Metodo
let g:pymode_motion = 1
let g:pymode_doc = 0
let g:pymode_virtualenv = 1
"Run code
let g:pymode_run = 0
let g:pymode_run_bind = '<leader>r'
"Breakpoint
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<leader>l'
"Lint
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_message = 1
let g:pymode_lint_ignore = 'E501,W'
let g:pymode_lint_cwindow = 0
let g:pymode_lint_message = 1
let g:pymode_lint_signs = 1
"Completion
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion_bind = '<C-c>rc'
let g:pymode_rope_organize_imports_bind = '<C-c>ro'
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_bind = '<C-c>ra'
let g:pymode_rope_goto_definition_bind = "<C-]>"
"Open definition in a new vsplit
let g:pymode_rope_show_doc_bind = '<C-c>d'
let g:pymode_rope_rename_bind = '<C-c>rr'
let g:pymode_rope_rename_module_bind = '<C-c>r1r'
let g:pymode_rope_extract_method_bind = '<C-c>rm'
let g:pymode_rope_extract_variable_bind = '<C-c>rl'
"find the places in which a function can be used and changes the
"code to call it instead
let g:pymode_rope_use_function_bind = '<C-c>ru'
let g:pymode_rope_move_bind = '<C-c>rv'
let g:pymode_rope_change_signature_bind = '<C-c>rs'
let g:pymode_options_colorcolumn = 0
