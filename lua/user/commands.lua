vim.cmd [[
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
    command! -nargs=0 Tabmerge call Tabmerge()
    command! -nargs=0 MarkTab let g:tabnr=tabpagenr()

    function! Tabmerge()
        let tabnr=g:tabnr
        let where='right'

        if !exists('l:where')
            let where = 'top'
        endif

        if !exists('l:tabnr')
            if type(tabpagebuflist(tabpagenr() + 1)) == 3
                let tabnr = tabpagenr() + 1
            elseif type(tabpagebuflist(tabpagenr() - 1)) == 3
                let tabnr = tabpagenr() - 1
            else
                echohl ErrorMsg
                echo "Already only one tab"
                echohl None
                return
            endif
        endif

        if tabnr == '$'
            let tabnr = tabpagenr(tabnr)
        else
            let tabnr = tabnr
        endif

        let tabwindows = tabpagebuflist(tabnr)

        if type(tabwindows) == 0 && tabwindows == 0
            echohl ErrorMsg
            echo "No such tab number: " . tabnr
            echohl None
            return
        elseif tabnr == tabpagenr()
            echohl ErrorMsg
            echo "Can't merge with the current tab"
            echohl None
            return
        endif

        if where =~? '^t\(op\)\?$'
            let where = 'topleft'
        elseif where =~? '^b\(ot\(tom\)\?\)\?$'
            let where = 'botright'
        elseif where =~? '^l\(eft\)\?$'
            let where = 'leftabove vertical'
        elseif where =~? '^r\(ight\)\?$'
            let where = 'rightbelow vertical'
        else
            echohl ErrorMsg
            echo "Invalid location: " . a:2
            echohl None
            return
        endif

        let save_switchbuf = &switchbuf
        let &switchbuf = ''

        if where == 'top'
            let tabwindows = reverse(tabwindows)
        endif

        for buf in tabwindows
            exe where . ' sbuffer ' . buf
        endfor

        exe 'tabclose ' . tabnr

        let &switchbuf = save_switchbuf
    endfunction
]]
