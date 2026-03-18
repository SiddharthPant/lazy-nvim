if exists("b:current_syntax")
  finish
endif

syntax case match

syntax match dotenvComment /^\s*#.*$/
syntax match dotenvExport /^\s*export\>/
syntax match dotenvKey /^\s*\zs[A-Za-z_][A-Za-z0-9_]*\ze\s*=/ containedin=ALL
syntax match dotenvEquals /=/
syntax region dotenvValue start=/=/ end=/$/ oneline contained contains=dotenvSingleQuoted,dotenvDoubleQuoted,dotenvComment

syntax region dotenvSingleQuoted start=/'/ skip=/\\'/ end=/'/ contained
syntax region dotenvDoubleQuoted start=/"/ skip=/\\"/ end=/"/ contained

highlight def link dotenvComment Comment
highlight def link dotenvExport Keyword
highlight def link dotenvKey Identifier
highlight def link dotenvEquals Delimiter
highlight def link dotenvValue String
highlight def link dotenvSingleQuoted String
highlight def link dotenvDoubleQuoted String

let b:current_syntax = "dotenv"
