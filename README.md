![screenshot1](./media/screenshot1.png)

<div align="center">
<h1>My Neovim Configuration</h2>

![neovim](https://cyber.dabamos.de/88x31/neovim.gif)
![free](https://cyber.dabamos.de/88x31/fscripts.gif)
![blink](https://cyber.dabamos.de/88x31/blink-0.gif)
![love](https://cyber.dabamos.de/88x31/lovenow.gif)

</div>

## Dependencies

- `git`
- `nodejs`
- `fd`/`ripgrep`
- `curl` or `wget`
- `unzip`
- GNU tar `tar` or `gtar`
- `gzip`
- A C compiler

## Install

```bash
$ git clone https://github.com/m2x07/nvim-config $HOME/.config/nvim
```

> [!IMPORTANT]
> Run `:checkhealth` after installing

## Configuration

- Each plugin's spec lives in its own file under `lua/m2x07/plugins`, which is our plugin directory.
- Use `ftplugin/` for filetype specific configurations.
- To add a new plugin, create a new file inside the plugin dir by the name
  `<your_plugin>.lua`.
- If the plugin requires very minimal or no config, you can put it inside of
  `extra.lua` file keep the directory structure clean.

<sub>Feel free to open a PR for anything</sub>
