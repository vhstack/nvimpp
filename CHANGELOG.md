# Changelog

Dieses Projekt folgt [Semantic Versioning](https://semver.org/lang/de/).

Für eine Konfigurationssammlung gilt:

- **major** — Update braucht Handarbeit (Pfade, Keybindings, Breaking Change)
- **minor** — neue Funktionen, abwärtskompatibel
- **patch** — Fehlerbehebungen, Feinschliff

## [1.5.0] — 2026-08-22

Erstes getaggtes Release. Der Stand entspricht der bisherigen Entwicklung auf
`main` (seit 2025-03-17).

### Enthalten

- Plugin-Verwaltung mit `lazy.nvim`, automatischer Bootstrap beim ersten Start
- LSP über `nvim-lspconfig` mit `mason.nvim` und `mason-tool-installer`
- Vervollständigung mit `nvim-cmp` (LSP, Buffer, Pfad, Cmdline, Signature-Help)
  und `LuaSnip`
- Syntax über `nvim-treesitter`, Formatierung über `conform.nvim`
- Navigation: `telescope.nvim`, `neo-tree.nvim`, `nvim-window-picker`,
  `outline.nvim`
- Oberfläche: `lualine.nvim`, `bufferline.nvim`, `dashboard-nvim`,
  `lsp-progress.nvim`, `indent-blankline.nvim`
- Git-Integration mit `gitsigns.nvim`, Tastenhilfe mit `which-key.nvim`,
  Terminal mit `toggleterm.nvim`
- Komfort: `nvim-autopairs`, `nvim-comment`, `neogen`, `nvim-colorizer.lua`,
  `vim-interestingwords`
- Themes: Catppuccin, Kanagawa, OneDark, Glowbeam sowie `transparent.nvim`
- Erweiterungspunkte `lua/custom/_preload.lua` und `lua/custom/_postload.lua`,
  die bei einem Update nicht überschrieben werden
- Versionskennung in `VERSION`, ausgewertet vom vhstack-Installer

### Hinweis

Vor diesem Tag wurde nicht versioniert. Die Startnummer spiegelt den Reifegrad
des Projekts, nicht eine Folge früherer Releases — v1.0.0 bis v1.4.x haben nie
existiert.

[1.5.0]: https://github.com/vhstack/nvimpp/releases/tag/v1.5.0
