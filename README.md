# nvim-config

[LazyVim](https://www.lazyvim.org/) ベースの Neovim 設定。

## 必要なもの

- Neovim >= 0.10
- Git
- [fd](https://github.com/sharkdp/fd) — ファイル検索（Explorer, Telescope）
- [ripgrep](https://github.com/BurntSushi/ripgrep) — テキスト検索（Telescope grep）
- [lazygit](https://github.com/jesseduber/lazygit) — Git UI（`<leader>gg`）
- [ghq](https://github.com/x-motemen/ghq) — リポジトリ管理（`<leader>gq`）
- Node.js — TypeScript LSP, Prettier, ESLint で使用
- Go — gopls で使用

## セットアップ

Neovim, lazygit などの必要なものをインストールした上で：

```bash
git clone git@github.com:SawadaReverse/nvim-config.git ~/.config/nvim
nvim  # 起動するとプラグインが自動インストールされる
```

## 有効にしている Extras

`:LazyExtras` で管理。現在有効なもの：

| カテゴリ   | Extra                                                                             |
| ---------- | --------------------------------------------------------------------------------- |
| AI         | copilot, claudecode                                                               |
| Formatting | prettier                                                                          |
| Linting    | eslint                                                                            |
| Languages  | typescript (vtsls), go, python, json, toml, markdown, sql, docker, terraform, git |

## カスタムプラグイン

| ファイル              | 内容                                                     |
| --------------------- | -------------------------------------------------------- |
| `lua/plugins/ghq.lua` | `<leader>gq` で ghq リポジトリをファジー検索して切り替え |
