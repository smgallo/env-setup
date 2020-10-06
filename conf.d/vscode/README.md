# VSCode

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

# User Interface

- Outline view: Separate section in the bottom of the File Explorer that shows the symbol tree of
  the currently active editor.
- The Vim extension enables `:split`, `:vsplit`, `ctrl-W arrow`, etc. window management functions.
- Toggle the minimap with `shift-cmd-P` View: Toggle Minimap
- Breadcrumbs bar facilitates quick navigation to files and symbols. Click on breadcrumb.
- Column selection with `shift+option`

## Useful Shortcuts

- `ctrl-space` Enable completion. Can use tab to cycle through once enabled.

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

```javascript
{
    // See https://code.visualstudio.com/docs/editor/intellisense#_customizing-intellisense
    // Don't show completions unless I manually request one with ctrl-space
    "editor.tabCompletion": "on",
    "editor.acceptSuggestionOnCommitCharacter": false,
    "editor.quickSuggestions": {
        "other": false,
        "comments": false,
        "strings": false
    },
    "editor.suggestOnTriggerCharacters": false,
    "editor.wordWrapColumn": 120,
    "editor.formatOnPaste": true,
    // Don't let vimcode handle these keys. Makes cursor movement easier on OSX.
    "vim.handleKeys": {
        "<C-a>": false,
        "<C-e>": false
    },
    "vim.textwidth": 120,
    "files.associations": {
        "*.view": "php"
    },
    "files.trimTrailingWhitespace": true,
    "diffEditor.renderSideBySide": false,
    // If I select a file from the search pane open it in a new tab
    "workbench.editor.enablePreviewFromQuickOpen": false,
    // Hilight modified tabs in addition to the dot
    "workbench.editor.highlightModifiedTabs": true,
    // Don't show errors while I'm in the middle of writing a statement
    "errorLens.delay": 5000,
    "workbench.iconTheme": "vscode-icons",
    "editor.fontFamily": "Source Code Variable, Menlo, Monaco, 'Courier New', monospace"
}
```

# Plugins and Extensions

VSCode implements some of these features out of the box. For example, command-p brings up the quick
open pane and replaces the ctrl-p plugin allowing you to search file names, paths, tags, and symbols.
Intellisense provides code completion and parameter info as well as identifying usages of undefined
variables.

- **Color Highlight**. Apply style to css/web colors found in the document.
- **CSS Peek**. Provides symbol definition tracking for CSS selectors.
- **CTags**. Go to symbol definition and include tags in auto-completion. The tags file needs to be
  in the project root so I'm not able to open my entire source directory as the project directory.
- **Docker**. Build, manage, and deploy containerized applications from Visual Studio Code.
- **Error Lens**. Make diagnostics stand out more prominently, highlighting the entire line wherever a
  diagnostic is generated by the language and also prints the message inline. This happens
  immediately out of the box, which was annoying because it shows errors while in the middle of
  coding an `if` statement. Setting `"errorLens.delay": 5000` mitigates this.
- **ESLint**. Integrates ESLint for Javascript code analysis.
- **IngelliSense for CSS**. Provides CSS class name completion for the HTML class attribute based on
  the definitions found in your workspace or external files referenced through the link element.
- **PHP Debug**. Debug adapter between VS Code and XDebug.
- **PHP Extension Pack**. Meta-package for PHP debugging and IntelliSense.
- **PHP Intelephense**. PHP language server. This appears to be better rated than PHP IntelliSense,
  and is self-contained.
- **PHP IntelliSense**. Interface to Felix Becker's [php-language-server](https://github.com/felixfbecker/php-language-server)
  This is what I had used under Vim but Intelephense is much better rated and does not have external
  dependencies.
- **phpcs**. Plugin for phpcs linter that uses a global install of phpcs.
- **Regex Previewer**. Opens a secondary document with `ctrl-cmd-M` and shows matches for the regex under the cursor.
- **Split Join texts**. Operates similar to vim's `:Join ','` by joining multiple lines with a
  delimiter `ctrl-k ctrl-2` or splitting a delimited list into multiple lines.
- **Vim**. Great implementation of Vim keybindings and functionality with plenty of customization
  available.
- **VSCode Icons** Add filetype based icons to the Explorer. Enable with `Preferences > File Icon Theme > VSCode Icons`

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
Brew install eslint
```
