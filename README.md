# Zed + Defold

Here I collect any ideas on how to adapt the [Zed](https://zed.dev/) editor for Defold game development.

The editor is now in an active stage of development, so many things are still to come. I plan to keep an eye on it and catch useful updates.

## Settings

Zed by default uses a 4 space indent for Lua. To fix this, add the following to [`settings.json`](.zed/settings.json):

```json
"language_overrides": {
  "Lua": {
    "tab_size": 2
  }
}
```

Also add Lua file associations:

```json
"file_types": {
  "Lua": ["script", "render_script", "gui_script", "editor_script"]
}
```

## Lua Language Server

Zed already includes [Lua Language Server](https://github.com/LuaLS/lua-language-server) and all we have to do is setup the [`.luarc.json`](.luarc.json) file.

It would be better to share it between projects somewhere, but don't know how to do it yet.

## Defold API

Defold API annotations can be downloaded from [here](https://github.com/astrochili/defold-annotations/releases).

It would be a good idea to place them to some shared place and add the path to `workspace.library` array in the `.luarc.json` file. It allows to reuse the annotations folder between projects.

In the example it's `~/Library/Application Support/Code/User/globalStorage/astronachos.defold` for macOS because I also use [Defold Kit](https://github.com/astrochili/vscode-defold/) for VSCode.

## Libraries API

Same story. At the moment I sync libraries API with [Defold Kit](https://github.com/astrochili/vscode-defold/) and then copy the unique path to the workspace annotations froms `.vscode/settings.json` to `.luarc.json`.

## Build

The [`build.sh`](build.sh) file is an example how to build and run a game with Defold `1.9.8` on macOS. For other versions or platforms you need to adapt it.

> A more detailed reference of the shell script is [here](https://github.com/astrochili/vscode-defold/blob/4b0408306b3bdc759b7c28f12c5f79a54eb2c1a0/.vscode/defold.sh).


There are tasks `build`, `resolve`, `clean`, `distclean` provided by [`.zed/tasks.json`](.zed/tasks.json) file.

The easiest way to run the task is creating a keybinding `Cmd+R` in the general `keymap.json` file:

```js
[
  {
    "context": "Workspace",
    "bindings": {
      "cmd-r": ["task::Spawn", { "task_name": "build" }]
    }
  }
]
```

## Debug

No way to do it natively with Zed. Upvote and watch for updates [zed-industries/community/issues/811](https://github.com/zed-industries/community/issues/811).

### debugger.lua

There is a minimalistic [debugger.lua](debugger.lua) that may help if the need for debugging is modest and infrequent and you would like to do it inside Zed environment. It required some edits to work with Defold, so this is an adapted version without using `ffi` and `require`.

A simple example:

```lua
-- Require it globally
dbg = require 'debugger'

-- Call a breakpoint
dbg()
```

To understand how to interact with it, check out the original repository [slembcke/debugger.lua](https://github.com/slembcke/debugger.lua).
