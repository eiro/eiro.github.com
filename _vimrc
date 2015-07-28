" vim: ts=2 sw=2 fdm=indent fdn=1

func Win32Setup ()
	" ensure <alt-space> behave correctly
	set wak=yes
	set directory=$TMP

	" execute visual selection with a powershell
	vmap ,x !PowerShell -NoLogo -NonInteractive -WindowStyle Hidden -ExecutionPolicy Unrestricted -Command -<cr>
endf

" common settings : these are mine for a while
	set nu nocp aw ai hid vb ff=unix enc=utf-8 wim=list:full is hls nobk
	syn on
	filetype indent plugin on

" Toggle paste, number, ...
	nnoremap ,n :set nu! 
	nnoremap ,p :set paste!

if has('gui_running')
	" Gui options and font
	set guifont=Consolas:h16:cANSI
		\ guioptions=aAmM
		" mM = only <alt-space> menu works
		" aA = copy paste with mouse
		
	if has('gui_win32') | call Win32Setup() | endif
endif

" Pairs mappings 
	noremap! " ""<left>
	noremap! '' ''<left>
	noremap! " ""<left>

	noremap! ( ()<left>
	noremap! { {}<left>
	noremap! [ []<left>
	noremap! < <><left>

	noremap! () ()
	noremap! {} {}
	noremap! [] []
	noremap! <> <>

	noremap! {<cr> {<cr>}<esc>O
	noremap! {<cr> {<cr>}<esc>O

" Buffer navigation mappings 
  set hidden
	nnoremap <up>    :ls<cr>:buffer<space>
	nnoremap <left>  :bprevious<cr>
	nnoremap <right> :bnext<cr>
	nnoremap <down>  :blast<cr>

" The MP command ease the setting of makeprg by writting it as a shell command
	" example:
	" :MP perl %
	" to set perl\ % as 'makeprg'
	command! -nargs=* -complete=shellcmd  MP  exec 'setlocal mp=' . escape(<q-args>,' ')
	command! -nargs=* -complete=shellcmd  MPg exec 'set      mp=' . escape(<q-args>,' ')
	"  MP recommended extra settings
	set aw
	nnoremap ,x :make<cr>

" BufPick: use buffers as menu
	" as example, this pick a name of a file
	" call BufPick('0r !dir',[ 'norm f>Wy$'],[ 'normal p' ])
	
  let g:BufPickCtx = []

	fun ExecStep(prg)
		let l:len = len(a:prg)
		if  !l:len | return 0 | endif
		let l:cmd = remove(a:prg,0)
		while len(l:cmd)
			exec remove(l:cmd,0)
		endwhile
	endf

  fun! BufPickClose()
		call ExecStep(g:BufPickCtx[-1]["post"])
  	bd!
		call ExecStep(g:BufPickCtx[-1]["post"])
  endf
  
  fun! BufPick(pre,...)
		new
		call add( g:BufPickCtx, { "pos": getpos('.'), "post": copy(a:000) } )
  	setlocal bt=nofile cursorline
  	exec "nnoremap <buffer> <cr> :call BufPickClose()<cr>"
  	exec a:pre
  endf

