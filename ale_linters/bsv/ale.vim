" Author: Vijayvithal <jahagirdar.vs@gmail.com>
" Description: Linter for bluespec system verilog

call ale#Set('bsv_executable', 'bsc')

function! <SID>GetCommand(buffer, output) abort
	let bsc_options = g:ale_bsv_bsc_options ?? ''
	return 'bsc -u' . bsc_options .'%s'
endfunction

call ale#linter#Define('bsv', {
\   'name': 'bsv',
\   'output_stream': 'stderr',
\   'executable': {b -> ale#Var(b, 'bsv_executable')},
\   'command': {function('<SID>GetCommand')
\   'callback': 'ale#handlers#c#HandleGCCFormatWithIncludes',
\})
"   'callback': function('<SID>HandleBSCLint')
