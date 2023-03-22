" Vim syntax file
" Language:    CERNLIB kumac (Kit for a User interface MACro) files (for PAW)
" Maintainer:  Kevin B. McCarty <kmccarty@debian.org>

" Standard syntax initialization
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Case doesn't matter for us
syn case ignore

" Only match keywords if they don't include a '/'
setlocal iskeyword+=/

syn region kumacComment start="^\s*\*" skip="_$" end="$" keepend
syn region kumacCommand start="^\s*[a-z0-9_/]\+\s*[^=]" skip="_$" end="$" keepend contains=kumacInlineComment,kumacLocalVariable,kumacSystemFunction,kumacString,kumacBoolean,kumacFortranOperator,kumacOperator,kumacNumber,kumacNumberEnd,kumacFor,kumacBlockBegin,kumacBlockEnd,kumacKeyword
syn region kumacAssignment start="^\s*\(sigma\|do\|\)\s*[a-z0-9_]\+\s*[=]" skip="_$" end="$" keepend contains=kumacVariableAssign,kumacLocalVariable,kumacSystemFunction,kumacInlineComment,kumacString,kumacBoolean,kumacFortranOperator,kumacOperator,kumacNumber,kumacNumberEnd,kumacMessage,kumacRead,kumacKeyword,kumacBlockBegin
syn match kumac1Command "^\s*[a-z0-9_/]\+\s*$" contains=kumacKeyword,kumacBlockEnd

syn region kumacApplication matchgroup=kumacApplicationStart start="^\s*appl\(i\(c\(a\(t\(i\(o\(n\|\)\|\)\|\)\|\)\|\)\|\)\|\)\s\+[a-z]\+\s\+\z(\S\+\)\s*$" matchgroup=kumacApplicationStop end="^\s*\z1\s*$" contains=kumacAssignment,kumacNumber,kumacNumberEnd

syn include @kumacFortran syntax/fortran.vim
syn region kumacFortranComment contained start="^\S" end="$" oneline
syn region kumacComisDirective contained start="!\s*\(file\|setopt\)\s\+" end="$" oneline
syn region kumacComisBlock matchgroup=kumacComisStart start="^\s*appl\(i\(c\(a\(t\(i\(o\(n\|\)\|\)\|\)\|\)\|\)\|\)\|\)\s\+comis\s\+\z(\S\+\)\s*$" matchgroup=kumacComisStop end="^\s*\z1\s*$" contains=@kumacFortran,kumacFortranComment,kumacFortranVector,kumacComisDirective
syn keyword kumacFortranVector contained vector

syn region kumacInlineComment start="[|]" skip="_$" end="$"
syn region kumacString start="'" skip="\(_$\|''\)" end="'"
syn match kumacLocalVariable "[^a-z0-9_]\@<=\[\([a-z_][a-z_0-9]*\|[0-9]\+\|@\|#\|\*\)\]"
syn match kumacVariableAssign contained "\(\(sigma\|do\)\?\)\@<=\s*[a-z0-9_]\+\s*[=]"me=e-1
syn match kumacSystemFunction "[$][a-z_0-9]\+"
syn match kumacFor contained "\(for\|case\) \S\+ in" contains=kumacForKeyword,kumacSystemFunction

syn keyword kumacForKeyword contained case for in
syn keyword kumacBlockBegin contained if then elseif else do while repeat
syn keyword kumacBlockEnd   contained else endif endfor enddo endwhile endcase until breakl nextl

syn region kumacMessage start="^\s*mess\(a\(g\(e\|\)\|\)\|\)\(\s\|$\)" skip="_$" end="$" contains=kumacMessKeyword,kumacInlineComment,kumacString,kumacLocalVariable,kumacSystemFunction
syn keyword kumacMessKeyword contained mess[age]
syn region kumacRead start="^\s*read\s" skip="_$" end="$" contains=kumacReadVariable,kumacInlineComment
syn region kumacReadVariable contained start="^\s*read\s" skip="_$" end="[a-z_][a-z0-9_]*\s" contains=kumacReadKeyword
syn keyword kumacReadKeyword contained read

syn keyword kumacKeyword contained macro return exec goto call exitm stopm sh[ell] sigma exit cd[ir]
syn match kumacGotoLabel "^\s*[a-z_][a-z0-9_]*:"

syn keyword kumacEndKeyword contained endkumac
syn region kumacEndComment start="^\s*endkumac\s*$" end="\%$" contains=kumacEndKeyword

syn match kumacFortranOperator "\.\(not\|or\|and\|eq\|ne\|ge\|le\|gt\|lt\)\."
syn match kumacBoolean "\.\(true\|false\)\."
syn match kumacNumber contained "\(^\|[^a-z0-9]\)\@<=\([0-9]\+\(\.[0-9]*\|\)\|\.[0-9]\+\)\(e[+-]\?[0-9]\+\)\?[^a-z0-9.]"me=e-1
syn match kumacNumberEnd contained "\(^\|[^a-z0-9]\)\@<=\([0-9]\+\(\.[0-9]*\|\)\|\.[0-9]\+\)\(e[+-]\?[0-9]\+\)\?$"

" Associate our matches and regions with pretty colours
if version >= 508 || !exists("did_kuip_syn_inits")
  if version < 508
    let did_kuip_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink kumacComment			Comment
  HiLink kumacInlineComment		Comment
  HiLink kumacFortranComment		Comment
  HiLink kumacString			String
  HiLink kumacLocalVariable		Identifier
  HiLink kumacVariableAssign		Identifier
  HiLink kumacReadVariable		Identifier
  HiLink kumacMessage			String
  HiLink kumacMessKeyword		Statement
  HiLink kumacRead			String
  HiLink kumacReadKeyword		Statement
  HiLink kumacSystemFunction		Special
  HiLink kumacBlockBegin		Statement
  HiLink kumacBlockEnd			Statement
  HiLink kumacForKeyword		Statement
  HiLink kumacKeyword			Statement
  HiLink kumacFor			Identifier
  HiLink kumacGotoLabel			Special
  HiLink kumacOperator			Special
  HiLink kumacFortranOperator		Special
  HiLink kumacBoolean			Number
  HiLink kumacNumber			Number
  HiLink kumacNumberEnd			Number
  HiLink kumacApplicationStart		Error
  HiLink kumacApplicationStop		Error
  HiLink kumacComisStart		Error
  HiLink kumacFortranVector		Type
  HiLink kumacComisDirective		Error
  HiLink kumacComisStop			Error
  HiLink kumacEndKeyword		Statement
  HiLink kumacEndComment		Comment

  delcommand HiLink
endif

let b:current_syntax = "kumac"

" vim: ts=8 sw=2
" Vim syntax file
" Language:    CERNLIB kumac (Kit for a User interface MACro) files (for PAW)
" Maintainer:  Kevin B. McCarty <kmccarty@debian.org>

" Standard syntax initialization
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Case doesn't matter for us
syn case ignore

" Only match keywords if they don't include a '/'
setlocal iskeyword+=/

syn region kumacComment start="^\s*\*" skip="_$" end="$" keepend
syn region kumacCommand start="^\s*[a-z0-9_/]\+\s*[^=]" skip="_$" end="$" keepend contains=kumacInlineComment,kumacLocalVariable,kumacSystemFunction,kumacString,kumacBoolean,kumacFortranOperator,kumacOperator,kumacNumber,kumacNumberEnd,kumacFor,kumacBlockBegin,kumacBlockEnd,kumacKeyword
syn region kumacAssignment start="^\s*\(sigma\|do\|\)\s*[a-z0-9_]\+\s*[=]" skip="_$" end="$" keepend contains=kumacVariableAssign,kumacLocalVariable,kumacSystemFunction,kumacInlineComment,kumacString,kumacBoolean,kumacFortranOperator,kumacOperator,kumacNumber,kumacNumberEnd,kumacMessage,kumacRead,kumacKeyword,kumacBlockBegin
syn match kumac1Command "^\s*[a-z0-9_/]\+\s*$" contains=kumacKeyword,kumacBlockEnd

syn region kumacApplication matchgroup=kumacApplicationStart start="^\s*appl\(i\(c\(a\(t\(i\(o\(n\|\)\|\)\|\)\|\)\|\)\|\)\|\)\s\+[a-z]\+\s\+\z(\S\+\)\s*$" matchgroup=kumacApplicationStop end="^\s*\z1\s*$" contains=kumacAssignment,kumacNumber,kumacNumberEnd

syn include @kumacFortran syntax/fortran.vim
syn region kumacFortranComment contained start="^\S" end="$" oneline
syn region kumacComisDirective contained start="!\s*\(file\|setopt\)\s\+" end="$" oneline
syn region kumacComisBlock matchgroup=kumacComisStart start="^\s*appl\(i\(c\(a\(t\(i\(o\(n\|\)\|\)\|\)\|\)\|\)\|\)\|\)\s\+comis\s\+\z(\S\+\)\s*$" matchgroup=kumacComisStop end="^\s*\z1\s*$" contains=@kumacFortran,kumacFortranComment,kumacFortranVector,kumacComisDirective
syn keyword kumacFortranVector contained vector

syn region kumacInlineComment start="[|]" skip="_$" end="$"
syn region kumacString start="'" skip="\(_$\|''\)" end="'"
syn match kumacLocalVariable "[^a-z0-9_]\@<=\[\([a-z_][a-z_0-9]*\|[0-9]\+\|@\|#\|\*\)\]"
syn match kumacVariableAssign contained "\(\(sigma\|do\)\?\)\@<=\s*[a-z0-9_]\+\s*[=]"me=e-1
syn match kumacSystemFunction "[$][a-z_0-9]\+"
syn match kumacFor contained "\(for\|case\) \S\+ in" contains=kumacForKeyword,kumacSystemFunction

syn keyword kumacForKeyword contained case for in
syn keyword kumacBlockBegin contained if then elseif else do while repeat
syn keyword kumacBlockEnd   contained else endif endfor enddo endwhile endcase until breakl nextl

syn region kumacMessage start="^\s*mess\(a\(g\(e\|\)\|\)\|\)\(\s\|$\)" skip="_$" end="$" contains=kumacMessKeyword,kumacInlineComment,kumacString,kumacLocalVariable,kumacSystemFunction
syn keyword kumacMessKeyword contained mess[age]
syn region kumacRead start="^\s*read\s" skip="_$" end="$" contains=kumacReadVariable,kumacInlineComment
syn region kumacReadVariable contained start="^\s*read\s" skip="_$" end="[a-z_][a-z0-9_]*\s" contains=kumacReadKeyword
syn keyword kumacReadKeyword contained read

syn keyword kumacKeyword contained macro return exec goto call exitm stopm sh[ell] sigma exit cd[ir]
syn match kumacGotoLabel "^\s*[a-z_][a-z0-9_]*:"

syn keyword kumacEndKeyword contained endkumac
syn region kumacEndComment start="^\s*endkumac\s*$" end="\%$" contains=kumacEndKeyword

syn match kumacFortranOperator "\.\(not\|or\|and\|eq\|ne\|ge\|le\|gt\|lt\)\."
syn match kumacBoolean "\.\(true\|false\)\."
syn match kumacNumber contained "\(^\|[^a-z0-9]\)\@<=\([0-9]\+\(\.[0-9]*\|\)\|\.[0-9]\+\)\(e[+-]\?[0-9]\+\)\?[^a-z0-9.]"me=e-1
syn match kumacNumberEnd contained "\(^\|[^a-z0-9]\)\@<=\([0-9]\+\(\.[0-9]*\|\)\|\.[0-9]\+\)\(e[+-]\?[0-9]\+\)\?$"

" Associate our matches and regions with pretty colours
if version >= 508 || !exists("did_kuip_syn_inits")
  if version < 508
    let did_kuip_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink kumacComment			Comment
  HiLink kumacInlineComment		Comment
  HiLink kumacFortranComment		Comment
  HiLink kumacString			String
  HiLink kumacLocalVariable		Identifier
  HiLink kumacVariableAssign		Identifier
  HiLink kumacReadVariable		Identifier
  HiLink kumacMessage			String
  HiLink kumacMessKeyword		Statement
  HiLink kumacRead			String
  HiLink kumacReadKeyword		Statement
  HiLink kumacSystemFunction		Special
  HiLink kumacBlockBegin		Statement
  HiLink kumacBlockEnd			Statement
  HiLink kumacForKeyword		Statement
  HiLink kumacKeyword			Statement
  HiLink kumacFor			Identifier
  HiLink kumacGotoLabel			Special
  HiLink kumacOperator			Special
  HiLink kumacFortranOperator		Special
  HiLink kumacBoolean			Number
  HiLink kumacNumber			Number
  HiLink kumacNumberEnd			Number
  HiLink kumacApplicationStart		Error
  HiLink kumacApplicationStop		Error
  HiLink kumacComisStart		Error
  HiLink kumacFortranVector		Type
  HiLink kumacComisDirective		Error
  HiLink kumacComisStop			Error
  HiLink kumacEndKeyword		Statement
  HiLink kumacEndComment		Comment

  delcommand HiLink
endif

let b:current_syntax = "kumac"

" vim: ts=8 sw=2
