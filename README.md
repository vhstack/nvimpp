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
| `neogen` | Dokumentation Generator in Sourcen |
| `dashboard` | Startbildschirm für NeoVim mit Schnellzugriff |
| `whichkey` | Schnelle Anzeige von Tastenkombinationen |

## 🎨 Themen

**Installierte Farbthemen:**
- kanagawa
- onedark
- glowbeam
- catppuccin

**Standard-Theme:**  
`catppuccin` ist als voreingestelltes Colorscheme konfiguriert.

**Anpassungen:**  
Theme-Einstellungen können einfach angepasst werden in:
`~/.config/nvim/lua/core/colors.lua`

**Option für helle Themes:**  
Fans von hellen Themes können nutzen:
`catppuccin-latte` (Variante von catppuccin) oder weitere Themes installieren.

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

## 🛠 Konfiguration
### LSP Unterstützung
LSP Unterstützung kann in der Konfigurationsdatei `init.lua` über die Variable `vim.g.is_lsp_enabled` aktiviert/deaktiviert werden.

## ⌨  Grundlegende Tastenkombinationen
Dies ist eine Übersicht der wichtigsten Tastenkombinationen, die in meiner NeoVim-Konfiguration definiert sind. Die Tasten sind als Lua-Key-Mappings konfiguriert und decken eine Vielzahl von Funktionen ab, von der Navigation bis hin zu spezifischen Plugins.


### Neogen Plugin
- `<F5>`: Aktiviert das `Neogen` Plugin zur automatischen Dokumentation.

### Make Commands
- `<F9>`: Führt den `make` Befehl aus.
- `<F10>`: Führt `make clean` aus und baut das Projekt komplett aus
- `<F12>`: Schließt den aktuellen Puffer.

### NeoTree
- `<leader>E`: Öffnet `Neotree` im schwebenden Modus und zeigt den aktuellen Ordner an.
- `<leader>e`: Öffnet `Neotree` links und zeigt den aktuellen Ordner an.
- `<leader>o`: Öffnet `Neotree` im schwebenden Modus und zeigt den Git-Status an.
- `<c-e>`: Schaltet `Neotree` links ein oder aus.

### Telescope
- `<leader><leader>`: Zeigt eine Liste der zuletzt geöffneten Dateien mit `Telescope`.
- `<c-f>`: Sucht nach einer Datei mit `Telescope`.
- `<c-g>`: Führt eine Live-Suche in Dateien mit `Telescope` aus.
- `<c-t>`: Zeigt eine Liste geöffneter Puffer mit `Telescope`.

### Navigation
- `<c-k>`: Wechselt in das obere Fenster (`:wincmd k`).
- `<c-j>`: Wechselt in das untere Fenster (`:wincmd j`).
- `<c-h>`: Wechselt in das linke Fenster (`:wincmd h`).
- `<c-l>`: Wechselt in das rechte Fenster (`:wincmd l`).
- `<leader>/`: Kommentiert die aktuelle Zeile oder Auswahl ein oder aus.

### Git
- `<leader>gb`: Öffnet Git Branches (`:Telescope git_branches`).
- `<leader>gc`: Öffnet Git Commits (`:Telescope git_commits`).
- `<leader>gs`: Öffnet Git Diffs (`:Telescope git_status`).
- `<leader>gf`: Öffnet Git Files (`:Neotree float git_status`).

### Methodenübersicht
- `<c-s>`: Öffnet/schliesst die Methodenübersicht mit `:Outline`.

### Splits
- `|`: Vertikalen Split öffnen (`:vsplit`).
- `\\`: Horizontalen Split öffnen (`:split`).

### Tabs
- `<Tab>`: Wechselt zu dem nächsten Tab (`:BufferLineCycleNext`).
- `<s-Tab>`: Wechselt zu dem vorherigen Tab (`:BufferLineCyclePrev`).

### Terminal
- `<leader>tf`: Öffnet das Terminal im schwebenden Modus (`:ToggleTerm direction=float`).
- `<leader>th`: Öffnet das Terminal im horizontalen Modus (`:ToggleTerm direction=horizontal`).
- `<leader>tv`: Öffnet das Terminal im vertikalen Modus (`:ToggleTerm direction=vertical`).

### Sonstige Befehle
- `<leader>w`: Speichert die Datei (`:w`).
- `<leader>x`: Schließt den aktuellen Puffer (`:BufferLinePickClose`).
- `<leader>X`: Schließt alle Puffer rechts vom aktuellen (`:BufferLineCloseRight`).
- `<leader>s`: Sortiert die Puffer nach Tabs (`:BufferLineSortByTabs`).
- `<leader>h`: Hebt die Hervorhebung der Suche auf (`:nohlsearch`).

## 📜 Lizenz
Dieses Projekt steht unter der **MIT-Lizenz**.

---

Falls du weitere Funktionen hinzufügen möchtest, einfach anpassen! 🚀
