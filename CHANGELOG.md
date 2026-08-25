# Changelog

Dieses Projekt folgt [Semantic Versioning](https://semver.org/lang/de/).

Für eine Konfigurationssammlung gilt:

- **major** — Update braucht Handarbeit (Pfade, Keybindings, Breaking Change)
- **minor** — neue Funktionen, abwärtskompatibel
- **patch** — Fehlerbehebungen, Feinschliff

## [1.5.2] — 2026-08-25

### Behoben

- `<leader>lp` (`GenerateCompileCommands`): clangd wurde unter NVim 0.11+ nur
  gestoppt, aber nicht neu gestartet (`LspRestart` kennt Server aus
  `vim.lsp.config` nicht) — jetzt Neustart über `client:stop()` und erneutes
  Anhängen in allen C/C++-Buffern, kein Neuöffnen mehr nötig
- `compile_commands.json`: gültiges JSON (kein Komma vor `]`), `file` zeigt auf
  die Quelldatei statt auf das letzte Token der Compilerzeile
- clangd ohne `--compile-commands-dir=build`: die Datei liegt per Konvention in
  der Projektwurzel und wird dort gefunden

## [1.5.1] — 2026-08-25

### Behoben

- `cmp-nvim-lsp` auf Commit `cbc7b02` gesetzt: beseitigt die Deprecation-Warnungen
  `client.is_stopped` / `client.request` (`:checkhealth vim.deprecated`) unter
  NVim 0.11+; bleibt kompatibel zu NVim 0.10
- `nvim-lspconfig`: unvollständiger Commit-Hash (`38de86f...`) durch den
  vollständigen Hash ersetzt (gleicher Stand)

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
