" Vim syntax file
" Language:    CERNLIB KUIPC (Kit for a User Interface Compiler) CDF files
" Maintainer:  Kevin B. McCarty <kmccarty@debian.org>

" Standard syntax initialization
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Case doesn't matter for us
syn case ignore

" generic definitions
syn match kuipDirective contained "^>\(Name\|menu\|command\|help_item\|guidance\|user_help\|parameters\|keyword\|action\|class\|graphics\|browse\|Icon_bitmaps\|Motif_customize\|Button\)"
syn region kuipArgument contained start=" " skip="_$" end="$" contains=kuipString,kuipParameterFormat
syn region kuipDefinition start="^>[^*]" skip="_$" end="$" contains=kuipDirective,kuipArgument keepend
syn match kuipNumber contained "\m[+-]\?\([0-9]\+\(\.[0-9]*\|\)\|\.[0-9]\+\)\(e[+-]\?[0-9]\+\)\?"
syn match kuipParseError "^\s*[^>*[:space:]].*$"
syn match kuipEmpty contained "^\s*$"
syn region kuipString start="'" skip="_$" end="\('\|$\)"

" comments
syn region kuipComment start="^\*" skip="_$" end="$"
syn region kuipBlockComment start="^>\*" end="^>"me=s-1

" informational text
syn region kuipGuidanceBlock start="^>\(Guidance\|Keyword\)\s*$" end="^>"me=s-1 contains=kuipDirective,kuipComment,kuipGuidanceSpacer
syn match kuipGuidanceSpacer contained "^\.\s*$"

" block of parameters
syn region kuipParametersBlock start="^>Parameters\s*$" end="^>"me=s-1 contains=kuipDirective,kuipParameterName,kuipParameterOption,kuipComment,kuipParameterFormat,kuipEmpty keepend
syn match kuipType contained "\s[CIR]\(\s\|$\)"
syn match kuipParameterFormat contained "\(^+\(\|+\)$\|^-\|%c\)"
syn match kuipParameterFormat2 contained ".\*"ms=s+1
syn match kuipParameterDefault contained "\([DR]\|Slider\)="me=e-1
syn keyword kuipParameterKeywords contained option loop vararg separate minus
syn region kuipParameterName contained start="^[a-z]" end="\s\S"me=s-1 nextgroup=kuipParameterDef contains=kuipParameterFormat,kuipParameterFormat2 oneline
syn region kuipParameterOption contained start="^-" end="\s\S"me=s-1 nextgroup=kuipParameterOptionDesc oneline
syn region kuipParameterDef contained start="[^*>+\s]" skip="_$" end="$" contains=kuipString,kuipType,kuipParameterDefault,kuipNumber,kuipParameterKeywords
syn region kuipParameterOptionDesc contained start="[^*>+\s]" skip="_$" end="$"

" block of browser or class statement
syn region kuipClassBlock start="^>\(Class\|Browse\)\(\s\|$\)" end="^>"me=s-1 contains=kuipDefinition,kuipMenuItem,kuipComment,kuipEmpty keepend
syn region kuipMenuItem contained start="^[^>*]" skip="_$" end="$" contains=kuipMenuString,kuipString,kuipParameterFormat,kuipMenuSpecial
syn match kuipMenuSpecial contained "\(\s\|^\)[/!]\+"
syn region kuipMenuString contained start="^[[:space:]/!]*[']"ms=e skip="_$" end="\($\|'\)" contains=kuipMenuSpecialString
syn match kuipMenuSpecialString contained "['][/!]\+"ms=s+1

" block of xpm icon data
syn include @kuipC syntax/c.vim
syn region kuipIconBitmapsBlock start="^>Icon_bitmaps\s*$" end="^>"me=s-1 contains=kuipDirective,@kuipC

" Associate our matches and regions with pretty colours
if version >= 508 || !exists("did_kuip_syn_inits")
  if version < 508
    let did_kuip_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink kuipComment			Comment
  HiLink kuipBlockComment		Comment
  HiLink kuipDirective			Statement
  HiLink kuipArgument			Identifier
  HiLink kuipString			String
  HiLink kuipGuidanceBlock		Normal
  HiLink kuipGuidanceSpacer		SpecialChar
  HiLink kuipEmpty			Normal
  HiLink kuipParametersBlock		Error
  HiLink kuipParametersDef		Normal
  HiLink kuipParameterFormat		SpecialChar
  HiLink kuipParameterFormat2		SpecialChar
  HiLink kuipMenuSpecial		SpecialChar
  HiLink kuipParameterName		Identifier
  HiLink kuipParameterDefault		Statement
  HiLink kuipParameterKeywords		Statement
  HiLink kuipParameterOption		Special
  HiLink kuipParameterOptionDesc	String
  HiLink kuipMenuItem			Identifier
  HiLink kuipMenuString			String
  HiLink kuipMenuSpecialString		SpecialChar
  HiLink kuipNumber			Number
  HiLink kuipType			Type
  HiLink kuipParseError			Error

  delcommand HiLink
endif

let b:current_syntax = "kuip"

" vim: ts=8 sw=2
" Vim syntax file
" Language:    CERNLIB KUIPC (Kit for a User Interface Compiler) CDF files
" Maintainer:  Kevin B. McCarty <kmccarty@debian.org>

" Standard syntax initialization
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Case doesn't matter for us
syn case ignore

" generic definitions
syn match kuipDirective contained "^>\(Name\|menu\|command\|help_item\|guidance\|user_help\|parameters\|keyword\|action\|class\|graphics\|browse\|Icon_bitmaps\|Motif_customize\|Button\)"
syn region kuipArgument contained start=" " skip="_$" end="$" contains=kuipString,kuipParameterFormat
syn region kuipDefinition start="^>[^*]" skip="_$" end="$" contains=kuipDirective,kuipArgument keepend
syn match kuipNumber contained "\m[+-]\?\([0-9]\+\(\.[0-9]*\|\)\|\.[0-9]\+\)\(e[+-]\?[0-9]\+\)\?"
syn match kuipParseError "^\s*[^>*[:space:]].*$"
syn match kuipEmpty contained "^\s*$"
syn region kuipString start="'" skip="_$" end="\('\|$\)"

" comments
syn region kuipComment start="^\*" skip="_$" end="$"
syn region kuipBlockComment start="^>\*" end="^>"me=s-1

" informational text
syn region kuipGuidanceBlock start="^>\(Guidance\|Keyword\)\s*$" end="^>"me=s-1 contains=kuipDirective,kuipComment,kuipGuidanceSpacer
syn match kuipGuidanceSpacer contained "^\.\s*$"

" block of parameters
syn region kuipParametersBlock start="^>Parameters\s*$" end="^>"me=s-1 contains=kuipDirective,kuipParameterName,kuipParameterOption,kuipComment,kuipParameterFormat,kuipEmpty keepend
syn match kuipType contained "\s[CIR]\(\s\|$\)"
syn match kuipParameterFormat contained "\(^+\(\|+\)$\|^-\|%c\)"
syn match kuipParameterFormat2 contained ".\*"ms=s+1
syn match kuipParameterDefault contained "\([DR]\|Slider\)="me=e-1
syn keyword kuipParameterKeywords contained option loop vararg separate minus
syn region kuipParameterName contained start="^[a-z]" end="\s\S"me=s-1 nextgroup=kuipParameterDef contains=kuipParameterFormat,kuipParameterFormat2 oneline
syn region kuipParameterOption contained start="^-" end="\s\S"me=s-1 nextgroup=kuipParameterOptionDesc oneline
syn region kuipParameterDef contained start="[^*>+\s]" skip="_$" end="$" contains=kuipString,kuipType,kuipParameterDefault,kuipNumber,kuipParameterKeywords
syn region kuipParameterOptionDesc contained start="[^*>+\s]" skip="_$" end="$"

" block of browser or class statement
syn region kuipClassBlock start="^>\(Class\|Browse\)\(\s\|$\)" end="^>"me=s-1 contains=kuipDefinition,kuipMenuItem,kuipComment,kuipEmpty keepend
syn region kuipMenuItem contained start="^[^>*]" skip="_$" end="$" contains=kuipMenuString,kuipString,kuipParameterFormat,kuipMenuSpecial
syn match kuipMenuSpecial contained "\(\s\|^\)[/!]\+"
syn region kuipMenuString contained start="^[[:space:]/!]*[']"ms=e skip="_$" end="\($\|'\)" contains=kuipMenuSpecialString
syn match kuipMenuSpecialString contained "['][/!]\+"ms=s+1

" block of xpm icon data
syn include @kuipC syntax/c.vim
syn region kuipIconBitmapsBlock start="^>Icon_bitmaps\s*$" end="^>"me=s-1 contains=kuipDirective,@kuipC

" Associate our matches and regions with pretty colours
if version >= 508 || !exists("did_kuip_syn_inits")
  if version < 508
    let did_kuip_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink kuipComment			Comment
  HiLink kuipBlockComment		Comment
  HiLink kuipDirective			Statement
  HiLink kuipArgument			Identifier
  HiLink kuipString			String
  HiLink kuipGuidanceBlock		Normal
  HiLink kuipGuidanceSpacer		SpecialChar
  HiLink kuipEmpty			Normal
  HiLink kuipParametersBlock		Error
  HiLink kuipParametersDef		Normal
  HiLink kuipParameterFormat		SpecialChar
  HiLink kuipParameterFormat2		SpecialChar
  HiLink kuipMenuSpecial		SpecialChar
  HiLink kuipParameterName		Identifier
  HiLink kuipParameterDefault		Statement
  HiLink kuipParameterKeywords		Statement
  HiLink kuipParameterOption		Special
  HiLink kuipParameterOptionDesc	String
  HiLink kuipMenuItem			Identifier
  HiLink kuipMenuString			String
  HiLink kuipMenuSpecialString		SpecialChar
  HiLink kuipNumber			Number
  HiLink kuipType			Type
  HiLink kuipParseError			Error

  delcommand HiLink
endif

let b:current_syntax = "kuip"

" vim: ts=8 sw=2
