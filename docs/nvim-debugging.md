# Neovim debugging (nvim-dap)

[nvim-dap](../nvim/lua/plugins/dap.lua) debugs Python and JavaScript/TypeScript
(including React) inside Neovim. nvim-dap-ui opens automatically when a session
starts and closes when it ends. The adapters (`debugpy` and `js-debug-adapter`)
are Mason packages that the editor bootstrap installs on every platform.

## Keymaps

| Key          | Action                                   |
| ------------ | ---------------------------------------- |
| `<leader>db` | Toggle breakpoint                        |
| `<leader>dB` | Conditional breakpoint                   |
| `<F5>`       | Start / continue (picks a configuration) |
| `<F10>`      | Step over                                |
| `<F11>`      | Step into                                |
| `<F12>`      | Step out                                 |
| `<leader>dc` | Run to cursor                            |
| `<leader>dl` | Rerun last configuration                 |
| `<leader>dx` | Stop                                     |
| `<leader>dr` | Open REPL                                |
| `<leader>du` | Toggle debug UI                          |

## Configurations

- **Python** (nvim-dap-python): launch the current file, with or without
  arguments, plus pytest/Django variants. The program runs with the project's
  interpreter: `$VIRTUAL_ENV`, then `./.venv` or `./venv`, then `python3`.
- **JS/TS (Node)**: launch the current file, or attach to a running Node
  process. TypeScript files run directly on Node versions that strip types
  (22.18+/23.6+); otherwise attach to a process started with `--inspect`.
- **React (Chrome)**: start the dev server first (for example `npm run dev`),
  then choose the Chrome configuration and confirm the URL (default
  `http://localhost:5173`; CRA uses `http://localhost:3000`). Requires Chrome or
  Chromium installed.

A project `.vscode/launch.json` is also read by nvim-dap for the `pwa-node` and
`pwa-chrome` types.
