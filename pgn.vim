" Vim syntax file
" Language:     Portable Game Notation (PGN)
" Maintainer:   Arto Jonsson <ajonsson@kapsi.fi>
"
" Based on the work of Charles Ford <cford@eudoramail.com>

if version < 600
	syn clear
elseif exists("b:current_syntax")
	finish
endif

if !exists("main_syntax")
	let main_syntax = "pgn"
endif

syn case ignore

" Comment
syn match pgnComment "^\s*%.*"
syn match pgnComment ";.*"
syn region pgnComment start=/{/ end=/}/

" Strings
syn region pgnString start=/"/ skip=/\\\\\|\\"/ end=/"/ contained oneline

" Tags
syn region pgnTag start=/^\s*\[/ end=/\]\s*$/ contains=pgnString oneline

" Move number
syn match pgnMoveNumber "[1-9][0-9]*\."

" Game result
syn match pgnResult "\*\|0-1\|1-0\|1\/2-1\/2"

hi def link pgnComment Comment
hi def link pgnString String
hi def link pgnTag Keyword
hi def link pgnMoveNumber Number
hi def link pgnResult Type

let b:current_syntax = "pgn"

if main_syntax == "pgn"
	unlet main_syntax
endif
