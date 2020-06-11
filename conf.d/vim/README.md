# Vim

## Syntax Hilighters

I used to include these syntax hilighters directly but now use [vim-polygot](https://github.com/sheerun/vim-polyglot)

```vim
Plug 'plasticboy/vim-markdown'

" JSON-specific mode rather than the default javascript mode
Plug 'elzr/vim-json'

" Coffeescript syntax
Plug 'kchmck/vim-coffee-script'

" Docker file syntax hilighting
Plug 'ekalinin/Dockerfile.vim'
```

# Dash

[Dash](https://kapeli.com/dash) is an API documentation browser. I've downloaded the docs for all of
the tools that I use and can easily search directly from Vim.

```vim
Plug 'rizzatti/dash.vim'
```

Use `:Dash array_map` to search a function directly or `:Dash!` to search the word under the cursor.
The correct language pack will automatically be selected in Dash based on the filetype.

# ALE Linter

See [dense-analysis/ale](https://github.com/dense-analysis/ale)

In addition to linting using several methods, Ale is a Language Server Protocol (LSP) client that
supports using language servers to facilitate completion.

My only gripe is that ale can sometimes cause the cursor to disappear when moving in insert mode on
long lines with mixed strings and other text. My solution is to use <ctrl> arrow keys for movement
when that happens.

Ale can use multiple linters. In a language buffer use `:ALEInfo` to see supported linters and their status.
```
 Current Filetype: php
Available Linters: ['langserver', 'phan', 'php', 'phpcs', 'phpmd', 'phpstan', 'psalm']
  Enabled Linters: ['langserver', 'phan', 'php', 'phpcs', 'phpmd', 'phpstan', 'psalm']
 Suggested Fixers:
  'php_cs_fixer' - Fix PHP files with php-cs-fixer.
  'phpcbf' - Fix PHP files with phpcbf.
  'remove_trailing_lines' - Remove all blank lines at the end of a file.
  'trim_whitespace' - Remove all trailing whitespace characters at the end of every line.
...

  Command History:
(executable check - failure) phan
(executable check - success) php
(finished - exit code 255) ['/bin/zsh', '-c', '''php'' -l -d error_reporting=E_ALL -d display_errors=1 -d log_errors=0 -- < ''/var/folders/03/695y3r_n5tnblwxwxkcr37yc0000gn/T/ve2OBfq/2/test.php''']
<<<OUTPUT STARTS>>>
Parse error: syntax error, unexpected end of file in - on line 25
Errors parsing -
<<<OUTPUT ENDS>>>
(executable check - success) phpcs
(finished - exit code 2) ['/bin/zsh', '-c', 'cd ''/Users/smgallo/src/tmp/flow'' && ''phpcs'' -s --report=emacs --stdin-path=''/Users/smgallo/src/tmp/flow/test.php'' --standard=''psr2'' < ''/var/folders/03/695y3r_n5tnblwxwxkc
r37yc0000gn/T/ve2OBfq/3/test.php''']
<<<OUTPUT STARTS>>>
/Users/smgallo/src/tmp/flow/test.php:1:1: warning - A file should declare new symbols (classes, functions, constants, etc.) and cause no other side effects, or it should execute logic with side effects, but should not do bot
h. The first symbol is defined on line 11 and the first side effect is on line 1. (PSR1.Files.SideEffects.FoundWithSymbols)
/Users/smgallo/src/tmp/flow/test.php:11:1: error - Each class must be in a namespace of at least one level (a top-level vendor name) (PSR1.Classes.ClassDeclaration.MissingNamespace)
/Users/smgallo/src/tmp/flow/test.php:11:9: error - Opening brace of a class must be on the line after the definition (PSR2.Classes.ClassDeclaration.OpenBraceNewLine)
<<<OUTPUT ENDS>>>
(executable check - failure) phpmd
(executable check - failure) phpstan
```

## Language Servers

See
- [Language Server List](https://langserver.org/)
- [Language Server Protocol](https://microsoft.github.io/language-server-protocol/)
- [Vim and LSP](https://www.vimfromscratch.com/articles/vim-and-language-server-protocol/)

### PHP

See
- [felixfbecker/php-language-server](https://github.com/felixfbecker/php-language-server)
- https://github.com/felixfbecker/php-language-server/issues/611

```
composer global require jetbrains/phpstorm-stubs:dev-master
composer global require felixfbecker/language-server
```

Ale will automatically recognize the language server. If it does not, you can tell it where to look:
```vim
let g:ale_php_langserver_use_global = 1
let g:ale_php_langserver_executable = $HOME.'/.composer/vendor/bin/php-language-server.php'
```

### Javascript

See
- [Flow](https://www.sitepoint.com/writing-better-javascript-with-flow/)
- [tsserver](https://github.com/microsoft/TypeScript/wiki/Standalone-Server-%28tsserver%29)
- [javascript-typescript-langserver](https://github.com/sourcegraph/javascript-typescript-langserver)

I'm using tsserver because Ale has built-in support for it and Flow required me to "opt-in" with
a `// @flow` comment in each file.

```
npm install --save typescript
ls node_modules\typescript\lib\tsserver.js
```

Also install eslint and configure it for your project

```
brew install eslint
```

# Completion

See
- [Omni completion](https://vim.fandom.com/wiki/Omni_completion)
- [Completion Menu IDE](https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE)
- [vim-mucomplete](https://github.com/lifepillar/vim-mucomplete)

Vim included OmniCompletion in v7. For many languages such as SQL, HTML, CSS, JavaScript and PHP,
omni completion will work out of the box. Other languages such as C and PHP will also take advantage
of a tags file - if one exists. This functionality is added via the `omnifunc` variable and is set
up in the `vim/runtime/autoload/*complete.vim` files. The function name appears to use 

I found that not all of these play well with language servers (e.g., Javascript autocomplete) so we
can override them for specific file formats:
```vim
autocmd BufNewFile,BufReadPost *.js set omnifunc=ale#completion#OmniFunc
```

Show the omnifunc call for this buffer:
```vim
:verbose set omnifunc?
```

Set up the completion menu to always show and automatically insert text if there is only one match.
See `:h completeopt`

```vim
set completeopt=menuone,longest
```

## Tab Completion

I'm using [MUcomplete](https://github.com/lifepillar/vim-mucomplete) to support chained
tab-completion. When you hit `<tab>` it attempts to complete using several methods until one returns
matches. For example, if omni-complete does not return any matches buffer keyword completion or tag
completion is tried.

By default omni-completion only works if there is a keyword character in front of the cursor
but I want to be able to use the Ale language server client to introspect class properties so I
enable completion after a `->` or `::`.

See :h mucomplete-customization
See https://github.com/lifepillar/vim-mucomplete/blob/master/doc/mucomplete.txt (Customization)

Extend the default condition to trigger omni-completion. See `let g:mucomplete#can_complete` in
https://github.com/lifepillar/vim-mucomplete/blob/master/autoload/mucomplete.vim#L130

```vim
" Trigger omni-completion on a keyword or -> and :: (see http://vimregex.com/)
let s:omni_cond = { t -> t =~# '\m\%(\k\|->\|::\)$' }
let g:mucomplete#can_complete = {}
let g:mucomplete#can_complete.default = { 'omni': s:omni_cond }

" Customize completions to use (add 'tags', remove 'uspl')
let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['omni', 'keyn', 'tags', 'path', 'dict' ]
```

Completion via the language server
![Language Server Completion](lang_server.png)

Object introspection

![Object Introspection 1](object1.png)

![Object Introspection 2](object2.png)

