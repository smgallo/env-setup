# VSCode

# User Interface

- Outline view: Separate section in the bottom of the File Explorer that shows the symbol tree of
  the currently active editor.
- Toggle the minimap with `shift-cmd-P` View: Toggle Minimap
- Breadcrumbs bar facilitates quick navigation to files and symbols. Click on breadcrumb.
- Column selection with `shift+option`

## Useful Shortcuts

- `ctrl-space` Enable completion. Can use tab to cycle through once enabled.
- `opt-cmd-arrow` Extend cursor to additional lines.

## Quick Search

The Command Palette provides access to many commands and provides search.

Quick Search (`cmd-p`)
`>` Command pallete
`@` Symbol search within file (`:` groups by category) (`shift-cmd-O`)
`#` Global symbol search using tags (`cmd-T`). Note that you need to open a directory with a .tags file directly

# Configuration

I also needed to be able to turn off some features such as automatic code completion because I find
it distracting. Rather, I wanted to be able to enable it only when needed. Configuration is really
easy and the configuration editor has setting completion and the Code Lens feature provides
easy-to-use help.

The default configuration was very reasonable so configuration changes were minimal.
- Don't show the completion window unless I ask for it (ctrl-space)
- Wrap lines at 120 chars. 80 is too small for today's monitors.
- Automatically format code that is pasted into the editor
- Allow ctrl-a and ctrl-e for cursor movement since this is native on Mac and I used to be an emacs
  user.
- Customize file extension language associations
- Hilight modified tabs in addition to the dot
- If I select a file from the quick open pane (cmd-P) open it in a new tab instead of the preview
  pane.

Change the following behaviors:
- Editor
    - Don't show completions unless I manually request one with ctrl+space
    - Don't show function parameters unless I manually request it with shift+ctrl+space
    - Don't highlight occurrences of the word under the cursor
    - Don't auto-close quotes and brackets
- If I select a file from the search pane open it in a new tab
- Hilight modified tabs in addition to the dot
- Delay showing ErrorLens messages while I'm in the middle of writing a statement
- Do not complain about undefined classes in vendor such as \App and \Gateway

[~/Library/Application\ Support/Code/User/settings.json](settings.json)

Change the following keybindings:
- ctrl+arrow to move one word left and right
- ctrl+backspace, ctrl+delete to delete one word left and right
- Disable ctrl+k from the Split Text extension so I kill a line in vim
- Remap triggerParameterHints to shift+ctrl+space to be more in line with quickSuggestions

[~/Library/Application\ Support/Code/User/keybindings.json](keybindings.json)

To enable key-repeating execute the following in your Terminal and restart VS Code. See
[VSCode Setup](https://github.com/VSCodeVim/Vim#mac-setup)

```
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool true
```

# Plugins and Extensions

VSCode implements some of these features out of the box. For example, command-p brings up the quick open pane and
replaces the ctrl-p plugin allowing you to search file names, paths, tags, and symbols. Intellisense provides code
completion and parameter info as well as identifying usages of undefined variables.

| Name | Description |
|------|-------------|
| [advanced-new-file] | Use `alt+cmd+N` to specify path and filename to create without needing to use the mouse. Similar to vim `:tabnew private/views/report.view`. See also "Advanced New File". |
| [Color Highlight] | Apply style to css/web colors found in the document. |
| [Css Peek] | Provides symbol definition tracking for CSS selectors. |
| [CTags] |  Go to symbol definition and include tags in auto-completion. The tags file needs to be in the project root so I'm not able to open my entire source directory as the project directory unless I create a global tags file. |
| [Docker] |  Build, manage, and deploy containerized applications from Visual Studio Code. |
| [DotENV] | .env syntax hilighting. |
| [ESLint] |  Integrates ESLint for Javascript code analysis. Installed with JavaScript language support on the VSCode landing page. |
| [IngelliSense for CSS] | CSS class name completion for the HTML class attribute based on the definitions found in your workspace or external files referenced through the link element. See also HTML CSS Support. |
| [Inline Parameters for VSCode] | Adds inline parameter annotations when calling a function. |
| [Mermaid Markdown Syntax Hilighting] | For [Mermaid markdown](https://mermaid-js.github.io/) |
| [Markdown Preview Meremaid Support] | Adds Mermaid diagram and flowchart support to VS Code's builtin markdown preview. |
| [Mermaid Editor] | Live edit, syntax hilight, geneate png, jpg, svg. |
| [Markdown PDF] | Converts Markdown files to pdf, html, png or jpeg files. |
| [PHP Debug] | Debug adapter between VS Code and XDebug. This is installed when you select PHP language support on the VSCode landing page. |
| [PHP DocBlocker] | Improved support for generating docblocks. |
| [PHPDoc Generator] | Hit `ctrl+Enter` on a line to generate PHPDoc above it. I like the generated docs they are concise and reflect parameter types. |
| [PHP Intelephense] | PHP language server. This appears to be better rated than PHP IntelliSense, and is self-contained. |
| [pcpcs] | Plugin for phpcs linter that uses a global install of phpcs. |
| [Quick and Simple Text Selection] | Allows selection of text inside of markers such as quotes, brackets, and parens - just like `wip` in vim. |
| [ToDo Tree] |  Find comment tags like TODO and FIXME, and displays them in a tree view in the explorer pane. Clicking a TODO within the tree will open the file and put the cursor on the line containing the TODO. Also useful for markdown notes. Enable "Use Color Scheme". |
| [VSCode Icons] | Add filetype based icons to the Explorer. Enable with `Preferences > File Icon Theme > VSCode Icons`. |
| [Rewrap] | Wrap comments to a set number of columns with option-q, similar to `:gq` in vim. |
| [SQL Formatter] | Format sql files using the sql-formatter npm package. |
| [Split Join texts] | Operates similar to vim's `:Join ','` by joining multiple lines with a delimiter `ctrl-k ctrl-2` or splitting a delimited list into multiple lines. |

[advanced-new-file]: https://marketplace.visualstudio.com/items?itemName=patbenatar.advanced-new-file
[Color Highlight]: https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight
[CSS Peek]: https://marketplace.visualstudio.com/items?itemName=pranaygp.vscode-css-peek
[CTags]: https://marketplace.visualstudio.com/items?itemName=jaydenlin.ctags-support
[Docker]: https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker
[DotENV]: https://marketplace.visualstudio.com/items?itemName=mikestead.dotenv
[ESLint]: https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint
[IngelliSense for CSS]: https://marketplace.visualstudio.com/items?itemName=Zignd.html-css-class-completion
[Inline Parameters for VSCode]: https://marketplace.visualstudio.com/items?itemName=liamhammett.inline-parameters
[Mermaid Markdown Syntax Hilighting]: https://marketplace.visualstudio.com/items?itemName=bpruitt-goddard.mermaid-markdown-syntax-highlighting
[Markdown Preview Meremaid Support]: https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid
[Mermaid Editor]: https://marketplace.visualstudio.com/items?itemName=tomoyukim.vscode-mermaid-editor
[Markdown PDF]: https://marketplace.visualstudio.com/items?itemName=yzane.markdown-pdf
[PHP Debug]: https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-debug
[PHP DocBlocker]: https://marketplace.visualstudio.com/items?itemName=neilbrayfield.php-docblocker
[PHPDoc Generator]: https://marketplace.visualstudio.com/items?itemName=ronvanderheijden.phpdoc-generator
[PHP Intelephense]: https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client
[pcpcs]: https://marketplace.visualstudio.com/items?itemName=ikappas.phpcs
[Quick and Simple Text Selection]: https://marketplace.visualstudio.com/items?itemName=dbankier.vscode-quick-select
[ToDo Tree]: https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree
[VSCode Icons]: https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons
[Rewrap]: https://marketplace.visualstudio.com/items?itemName=stkb.rewrap
[SQL Formatter]: https://marketplace.visualstudio.com/items?itemName=adpyke.vscode-sql-formatter
[Split Join texts]: https://marketplace.visualstudio.com/items?itemName=Matsuyanagi.split-join-text


Currently Disabled:
- **Error Lens**. Make diagnostics stand out more prominently, highlighting the entire line wherever a
  diagnostic is generated by the language and also prints the message inline. This happens
  immediately out of the box, which was annoying because it shows errors while in the middle of
  coding an `if` statement. Setting `"errorLens.delay": 5000` mitigates this.  **I disabled this due to too much visual clutter.**
- **Regex Previewer**. Opens a secondary document with `ctrl-cmd-M` and shows matches for the regex under the cursor.

## Dependencies

Install phpcs via composer:

```
$ composer global require squizlabs/php_codesniffer
Changed current directory to /Users/smgallo/.composer
Using version ^3.5 for squizlabs/php_codesniffer
./composer.json has been updated
Loading composer repositories with package information
Updating dependencies (including require-dev)
Package operations: 0 installs, 1 update, 0 removals
  - Updating squizlabs/php_codesniffer (3.5.5 => 3.5.6): Downloading (100%)
Writing lock file
Generating autoload files
```

Install ESLint via homebrew (also available via `npm install -g eslint`)

```
brew install eslint
```

# Taking Notes in VSCode

I take extensive notes in Markdown and had been using [BoostNote](http://boostnote.io/). Due to the nature of work and
protecting PHI, we cannot use cloud services and many apps sync across all devices so choices were somewhat limited.  I
tried:
- [Joplin](https://joplinapp.org/): Most promising but did not support tabs, color schemes were not optimal, and could not export mermaid as svg/png
- [BoostNote.next](https://github.com/BoostIO/BoostNote.next): still a work in progress and supports local storage but did not have good UI support for organizing notes at the time
- [Lightpaper](https://getlightpaper.com/): Looked promising with folder hierarchy and markdown support but appears abandoned?
-  MS One Note: no markdown support

Required features:
- Customizable folder hierarchy (1 directory per project with multiple notes per project)
- Open notes in tabs
- Customizable color schemes that were easy on the eyes
- Support [mermaid markdown](https://mermaid-js.github.io) for diagrams, with export to svg/png
- Would like to tag notes

I decided on using VSCode with plugins for [Mermaid Markdown Syntax Hilighting], [Markdown Preview Meremaid Support],
[Mermaid Editor], and [ToDo Tree]. I am already familar with the keystrokes, VSCode already supports complex editing
options, and combined with [Todo Tree] you can tag todo items, bugs, and other items across multiple files/projects, and
view them in a single place. This is great for a quick-and-dirty way to track todo items across multiple projects
without needing a separate application. VSCode does not support tags, but with Todo Tree you can define rudimentary
tags.

# Switching From Vim

Omni-completion in Vim became very slow between 8.2.1159 and 8.2.1719. At this point rather than
trying to make Vim more like an IDE I decided to make an IDE more like Vim. It was important that I
maintain the keystrokes that I'm used to and features that make Vim so useful including plugins that
I used the most. Many of the default keybindings that VSCode uses are similar to what I used in Vim.

My list of the most useful Vim plugins was:
- [jamessan/vim-gnupg](https://www.github.com/jamessan/vim-gnupg) Edit GPG encrypted files
- [w0rp/ale](https://www.github.com/w0rp/ale) Ale realtime linter
- [airblade/vim-gitgutter](https://www.github.com/airblade/vim-gitgutter) Show git diff in the gutter
- [itchyny/lightline.vim](https://www.github.com/itchyny/lightline.vim) Improved status line
- [sk1418/Join](https://www.github.com/sk1418/Join) more powerful line join features than the built-in :join
- [ctrlpvim/ctrlp.vim](https://www.github.com/ctrlpvim/ctrlp.vim) Fuzzy file finder for files and
  tags
- [vim-vdebug/vdebug](https://www.github.com/vim-vdebug/vdebug) Debugger plugin for XDebug
- [chrisbra/Colorizer](https://www.github.com/chrisbra/Colorizer) Apply color to names and color codes in source code
- [rizzatti/dash.vim](https://www.github.com/rizzatti/dash.vim) Integrate with [Dash](https://kapeli.com/dash)
- [lifepillar/vim-mucomplete](https://www.github.com/lifepillar/vim-mucomplete) Chained tab
  completion. If a match is not found using one completion method, try others.  For example, try the
  language server then tags then local bufffer completion.

[Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim). Great implementation of Vim keybindings and
functionality with plenty of customization available. **I disabled this because I want to use `ctrl+a` and `ctrl+e` for
cursor movement on mac and after a while the cursor got lost and was not finding the end of the line properly.**

Customizations:
- Dont's let vimcode handle ctrl+{a,e,d,l} so I can use default Mac behaviors
- Properly handle cmd+c, cmd+v without exiting insert mode
