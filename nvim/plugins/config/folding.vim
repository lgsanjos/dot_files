function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

if has('multi_byte')
    let defaults = {'placeholder': '⋯',   'line': '▤', 'multiplication': '×' }
else
    let defaults = {'placeholder': '...', 'line': 'L', 'multiplication': '*' }
endif

let g:FoldText_placeholder    = get(g:, 'FoldText_placeholder',    defaults['placeholder'])
let g:FoldText_line           = get(g:, 'FoldText_line',           defaults['line'])
let g:FoldText_multiplication = get(g:, 'FoldText_multiplication', defaults['multiplication'])
let g:FoldText_info           = get(g:, 'FoldText_info',           1)
let g:FoldText_width          = get(g:, 'FoldText_width',          0)

unlet defaults

function! FoldText()
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$'
        let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let spaces = repeat(' ', &tabstop)
        let line = substitute(getline(fs), '\t', spaces, 'g')
    endif

    let endBlockChars   = ['end', '}', ']', ')', '})', '},', '}}}']
    let endBlockRegex = printf('^\(\s*\|\s*\"\s*\)\(%s\);\?$', join(endBlockChars, '\|'))
    let endCommentRegex = '\s*\*/\s*$'
    let startCommentBlankRegex = '\v^\s*/\*!?\s*$'

    let foldEnding = strpart(getline(v:foldend), indent(v:foldend), 3)

    if foldEnding =~ endBlockRegex
        if foldEnding =~ '^\s*\"'
            let foldEnding = strpart(getline(v:foldend), indent(v:foldend)+2, 3)
        end
        let foldEnding = " " . g:FoldText_placeholder . " " . foldEnding
    elseif foldEnding =~ endCommentRegex
        if getline(v:foldstart) =~ startCommentBlankRegex
            let nextLine = substitute(getline(v:foldstart + 1), '\v\s*\*', '', '')
            let line = line . nextLine
        endif
        let foldEnding = " " . g:FoldText_placeholder . " " . foldEnding
    else
        let foldEnding = " " . g:FoldText_placeholder
    endif
    let foldEnding = substitute(foldEnding, '\s\+$', '', '')

    redir =>signs | exe "silent sign place buffer=".bufnr('') | redir end
    let signlist = split(signs, '\n')
    let foldColumnWidth = (&foldcolumn ? &foldcolumn : 0)
    let numberColumnWidth = &number ? strwidth(line('$')) : 0
    let signColumnWidth = len(signlist) >= 2 ? 2 : 0
    let width = winwidth(0) - foldColumnWidth - numberColumnWidth - signColumnWidth

    let ending = ""
    if g:FoldText_info
        if g:FoldText_width > 0 && g:FoldText_width < (width-6)
            let endsize = "%-" . string(width - g:FoldText_width + 4) . "s"
        else
            let endsize = "%-11s"
        end
        let foldSize = 1 + v:foldend - v:foldstart
        let ending = printf("%s%s%s", g:FoldText_line, g:FoldText_multiplication, foldSize)
        let ending = printf(endsize, ending)

        if strwidth(line . foldEnding . ending) >= width
            let line = strpart(line, 0, width - strwidth(foldEnding . ending) - 2)
        endif
    endif

    let expansionStr = repeat(" ", width - strwidth(line . foldEnding . ending))
    return line . foldEnding . expansionStr . ending
endfunction

set foldtext=FoldText()

let g:fold_rspec_foldenable = 0      " disables folding (toggle with `zi`)
let g:fold_rspec_foldlevel = 2       " sets initial open/closed state of all folds (open unless nested more than two levels deep)
let g:fold_rspec_foldcolumn = 4      " shows a 4-character column on the lefthand side of the window displaying the document's fold structure
let g:fold_rspec_foldclose = 'all'   " closes folds automatically when the cursor is moved out of them (only applies to folds deeper than 'foldlevel')
let g:fold_rspec_foldminlines = 3    " disables closing of folds containing two lines or fewer

let g:FoldText_info=!g:FoldText_info
set foldlevel=1
"set foldopen=all
"set foldclose=all

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldtext=FoldText()
