# Zed + Defold

Here I collect any ideas on how to adapt the [Zed](https://zed.dev/) editor for Defold game development.

The editor is now in an active stage of development, so many things are still to come. I plan to keep an eye on it and catch useful updates.

## Settings

Zed by default uses a 4 space indent for Lua. To fix this, add the following to `settings.json`:

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

## Build and Debug

There's no way to do it yet. Upvote 👍 and watch for updates https://github.com/zed-industries/community/issues/811.

The only thing there is is a terminal from which you can run any commands.

### Debug in Terminal

There is a minimalistic cli [debugger.lua](https://github.com/slembcke/debugger.lua). It may help if the need for debugging is modest and infrequent and you would like to do it inside Zed environment.

- Tested with pure Lua — PERFECT.
- Tested with Defold — OKAY, but requires:
  - Few edits to avoid calling the `require` function inside `debugger.lua`
  - Running `bob.jar` and `dmengine` from Zed terminal as it happens in [defold-vscode-guide](https://github.com/astrochili/vscode-defold/blob/4b0408306b3bdc759b7c28f12c5f79a54eb2c1a0/.vscode/defold.sh#L364-L367).
