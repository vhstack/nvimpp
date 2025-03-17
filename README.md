# NeoVim C/C++ Development Setup

Dieses Repository enthält eine optimierte **NeoVim**-Konfiguration für die **C/C++-Entwicklung** mit leistungsstarken Plugins für Autovervollständigung, Syntaxhervorhebung, Git-Integration und mehr.

## 🚀 Features
- **LSP-Unterstützung** für C/C++ mit automatischer Vervollständigung
- **Syntax-Highlighting** mit Treesitter
- **Git-Integration** direkt in NeoVim
- **Erweiterte Datei-Navigation** mit Telescope und NeoTree
- **Terminal-Integration** für reibungslose Entwicklungsabläufe

## 📦 Installierte Plugins

| Plugin | Beschreibung |
|--------|-------------|
| `telescope` | Erweiterte Fuzzy-Suche und Datei-Navigation |
| `lsp` | Language Server Protocol (LSP) für C/C++-Unterstützung |
| `mason` | Einfaches Management von LSP-Servern, Debuggern und Lintern |
| `cmp` | Auto-Completion-Engine für besseren Code-Workflow |
| `nullls` | Unterstützung für Formatierung und statische Analyse (Linter) |
| `lualine` | Anpassbare Statusleiste für NeoVim |
| `gitsigns` | Git-Integration mit Inline-Diff-Anzeige |
| `treesitter` | Verbesserte Syntaxhervorhebung für C/C++ |
| `toggleterm` | Integriertes Terminal in NeoVim |
| `outline` | Anzeige der Symbolstruktur (z. B. Klassen, Funktionen) |
| `autopairs` | Automatische Klammer- und Anführungszeichen-Paare |
| `comments` | Einfaches Kommentieren von Codeblöcken |
| `buffline` | Erweiterte Buffer-Navigation |
| `blankline` | Visuelle Darstellung von Einrückungen |
| `neotree` | Dateimanager für verbesserte Navigation |
| `dashboard` | Startbildschirm für NeoVim mit Schnellzugriff |
| `whichkey` | Schnelle Anzeige von Tastenkombinationen |

## 📥 Installation

1. **NeoVim installieren** (mindestens Version 0.8 erforderlich)
2. **Repository klonen & Git-Verzeichnis entfernen:**
   ```sh
   git clone https://github.com/vhstack/nvimpp ~/.config/nvim
   rm -rf ~/.config/nvim/.git
   ```
3. **Plugins synchronisieren** mit dem Plugin-Manager (`Packer`, `Lazy`, etc.)
4. **LSPs & Tools installieren** über Mason (`:Mason` in NeoVim ausführen)

```sh
# Falls Mason installiert ist, öffne NeoVim und führe aus:
:MasonInstall clangd cmake-language-server
```

## 🛠 Nutzung

- **Suche nach Dateien:** `:Telescope find_files`
- **Code-Autovervollständigung:** Automatisch mit `nvim-cmp`
- **LSP-Diagnosen anzeigen:** `:lua vim.diagnostic.open_float()`
- **Dateimanager öffnen:** `:NeoTree`
- **Git-Änderungen anzeigen:** `:Gitsigns toggle_current_line_blame`
- **Terminal öffnen:** `<leader>t` (mit `toggleterm` konfiguriert)

## 📜 Lizenz
Dieses Projekt steht unter der **MIT-Lizenz**.

---

Falls du weitere Funktionen hinzufügen möchtest, einfach anpassen! 🚀
