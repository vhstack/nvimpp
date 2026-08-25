# nvimpp — „IDE im Terminal“ (Hero-GIF)
# Ein echter Arbeitsgang im C++-Projekt stacktop (baut auf vlib2):
# Dateien finden → Header → Explorer → Implementierung → Outline → Methode →
# LSP (Hover/Definition) → Änderung mit Diagnostic → Completion → Live-grep.

Output ide.gif

Set Width 1000
Set Height 640
Set Framerate 15
Set FontSize 15
Set Padding 16
Set FontFamily "CaskaydiaCove Nerd Font Mono"
Set Theme "Catppuccin Mocha"
Set Shell bash
Set TypingSpeed 60ms

# ── Setup (unsichtbar): stacktop + vlib2 im Demo-HOME, vh@stack-Shell ──
Hide
Type "SP=${VHS_DEMO_DIR:-$HOME/.cache/vhstack-demo}; FH=$SP/fakehome"
Enter
Type "mkdir -p $FH/projekte/vlib2; rm -rf $FH/projekte/stacktop; cp -r ${VHS_APP_DIR:-$HOME/projekte/stacktop} $FH/projekte/stacktop; rm -rf $FH/projekte/stacktop/build $FH/projekte/stacktop/stacktop"
Enter
Type "cp -ru ${VHS_VLIB_DIR:-$HOME/projekte/vlib2}/include ${VHS_VLIB_DIR:-$HOME/projekte/vlib2}/lib $FH/projekte/vlib2/"
Enter
Type "VLIB=$FH/projekte/vlib2 make -s -C $FH/projekte/stacktop ccdb"
Enter
Type "rm -rf $FH/.local/state/nvim/shada"
Enter
Type "git -C $FH/projekte/stacktop init -qb main 2>/dev/null; git -C $FH/projekte/stacktop add -A 2>/dev/null; git -C $FH/projekte/stacktop -c user.name=vh -c user.email=vh@stack commit -qm 'stacktop: Grundgeruest' 2>/dev/null; git -C $FH/projekte/stacktop config core.pager cat"
Enter
Type "export PATH=$SP/nvim-shim:$PATH; exec $SP/stackshell $FH"
Enter
Sleep 2s
Type "cd projekte/stacktop && nvim"
Enter
Sleep 3s
Type ":q"
Enter
Sleep 500ms
Type "clear"
Enter
Sleep 500ms
Show

# ── 1. nvim im Projekt → Dashboard ──
Sleep 1.5s
Type "nvim"
Sleep 400ms
Enter
Sleep 1.5s
Hide
Type ":lua vim.deprecate = function() end"
Enter
Type ":echo ''"
Enter
Show
Sleep 1.5s

# ── 2. Dateien finden: der Header ──
Type "f"
Sleep 1.5s
Type "dashboard.h"
Sleep 1.5s
Enter
Sleep 2.5s

# ── 3. Neo-tree: vom Header zur Implementierung ──
Space
Sleep 200ms
Type "e"
Sleep 2s
Type "k"
Sleep 800ms
Enter
Sleep 2s
Ctrl+E
Sleep 1s

# ── 4. Outline: zur Methode springen, die geändert wird ──
Ctrl+S
Sleep 1.8s
Type "gg"
Sleep 300ms
Type "j"
Sleep 250ms
Type "j"
Sleep 250ms
Type "j"
Sleep 250ms
Type "j"
Sleep 250ms
Type "j"
Sleep 250ms
Type "j"
Sleep 900ms
Enter
Sleep 2s

# ── 5. LSP: Hover auf die Bibliotheksmethode, Definition und zurück ──
Type "/blocksTotal"
Sleep 400ms
Enter
Sleep 800ms
Type "K"
Sleep 2.6s
Escape
Sleep 400ms
Ctrl+]
Sleep 2.4s
Ctrl+O
Sleep 1.5s

# ── 6. Änderung mit Tippfehler → Diagnostic → korrigieren ──
Type "/blocksFree"
Sleep 400ms
Enter
Sleep 800ms
Type "ciw"
Sleep 300ms
Type "blockFree"
Escape
Sleep 3s
Type "u"
Sleep 2s

# ── 7. Completion aus der Bibliothek ──
Type "o"
Sleep 300ms
Type "long frei = fs."
Sleep 2.2s
Escape
Sleep 400ms
Type "u"
Sleep 1.2s
Hide
Type ":echo ''"
Enter
Show
Sleep 300ms

# ── 8. Live-grep über das Projekt ──
Space
Sleep 300ms
Type "fg"
Sleep 1.5s
Type "cpu"
Sleep 2.2s
Sleep 1.3s
