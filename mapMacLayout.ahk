#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode "Input"
SetTitleMatchMode 2

; Helper to detect if a remote session or VM is active
IsRemoteSessionActive() {
    SetTitleMatchMode 2
    ; Check Chrome Remote Desktop (either running as app or tab)
    if (WinActive("Chrome Remote Desktop") 
        or WinActive("Remote Desktop - ") 
        or WinActive("macbook-air.vulture-ionian.ts.net")
        or WinActive(".ts.net"))
        return true
        
    ; Check common standalone remote desktop and VM processes
    if WinActive("ahk_exe mstsc.exe")       ; Microsoft Remote Desktop
        or WinActive("ahk_exe TeamViewer.exe")
        or WinActive("ahk_exe AnyDesk.exe")
        or WinActive("ahk_exe cdviewer.exe")  ; Citrix
        or WinActive("ahk_exe wfica32.exe")   ; Citrix
        or WinActive("ahk_exe vncviewer.exe") ; VNC
        or WinActive("ahk_exe vmware.exe")
        or WinActive("ahk_exe VirtualBox.exe")
        or WinActive("ahk_exe VirtualBoxVM.exe")
        return true
        
    return false
}


; ============================================================
; macOS-like shortcuts on LOCAL WINDOWS
; ------------------------------------------------------------
; Alt   = Command
; Win   = Option
;
; F11   = Reload script
; F12   = Exit script
; ============================================================

; -----------------------------
; GLOBAL MAC-LIKE SHORTCUTS
; -----------------------------
#HotIf !IsRemoteSessionActive()

; Editing / file / app
!a::Send "^a"
!c::Send "^c"
!x::Send "^x"
!v::Send "^v"
!z::Send "^z"
!+z::Send "^y"
!s::Send "^s"
!+s::Send "^+s"
!o::Send "^o"
!n::Send "^n"
!w::Send "^w"
!p::Send "^p"
!f::Send "^f"
!r::Send "^r"
!t::Send "^t"
!+t::Send "^+t"
!l::Send "^l"
!q::Send "!{F4}"
!,::Send "!{Space}"

; Find next / previous
!g::Send "{F3}"
!+g::Send "+{F3}"

; Tabs
!Tab::Send "^{Tab}"
!+Tab::Send "^+{Tab}"

; Browser / tab index
!1::Send "^1"
!2::Send "^2"
!3::Send "^3"
!4::Send "^4"
!5::Send "^5"
!6::Send "^6"
!7::Send "^7"
!8::Send "^8"
!9::Send "^9"
!0::Send "^0"

; Cmd+Arrow style navigation
!Left::Send "{Home}"
!Right::Send "{End}"
!Up::Send "^{Home}"
!Down::Send "^{End}"

!+Left::Send "+{Home}"
!+Right::Send "+{End}"
!+Up::Send "^+{Home}"
!+Down::Send "^+{End}"

; Option-style word movement on Win key
#Left::Send "^{Left}"
#Right::Send "^{Right}"
#+Left::Send "^+{Left}"
#+Right::Send "^+{Right}"

#Up::Send "^{Up}"
#Down::Send "^{Down}"
#+Up::Send "^+{Up}"
#+Down::Send "^+{Down}"

; Delete behavior
#Backspace::Send "^{Backspace}"
#Delete::Send "^{Delete}"

!Backspace::Send "+{Home}{Backspace}"
!Delete::Send "+{End}{Backspace}"

; Back / forward
![::Send "!{Left}"
!]::Send "!{Right}"

; Some handy extras
!d::Send "^d"
!/::Send "^/"
!Enter::Send "!{Enter}"

; Shifted global shortcuts
!+a::Send "^+a"
!+c::Send "^+c"
!+n::Send "^+n"
!+o::Send "^+o"
!+p::Send "^+p"
!+r::Send "^+r"
!+v::Send "^+v"
!+w::Send "^+w"
!+x::Send "^+x"
!+l::Send "^+l"

; -----------------------------
; VS CODE / VSCODIUM / CURSOR
; -----------------------------
#HotIf WinActive("ahk_exe Code.exe")
    or WinActive("ahk_exe VSCodium.exe")
    or WinActive("ahk_exe Cursor.exe")

; ----- Command-like shortcuts on Alt -----
!p::Send "^p"          ; Quick Open
!+p::Send "^+p"        ; Command Palette
!f::Send "^f"          ; Find
!+h::Send "^h"         ; Replace
!g::Send "^g"          ; Next match
!+g::Send "^+g"        ; Previous match
!b::Send "^b"          ; Toggle sidebar
!w::Send "^w"          ; Close tab
!s::Send "^s"          ; Save
!+s::Send "^+s"        ; Save As
!/::Send "^/"          ; Toggle comment
!l::Send "^g"          ; Go to line

; Terminal toggle
!j::Send "^+``"
!vkC0::Send "^+``"

; Format document
!+f::Send "+!f"

; Line start/end
!Left::Send "{Home}"
!Right::Send "{End}"
!+Left::Send "+{Home}"
!+Right::Send "+{End}"

; File start/end
!Up::Send "^{Home}"
!Down::Send "^{End}"
!+Up::Send "^+{Home}"
!+Down::Send "^+{End}"

; Delete to start/end of line
!Backspace::Send "+{Home}{Backspace}"
!Delete::Send "+{End}{Backspace}"

; ----- Option-like shortcuts on Win -----
; word movement
#Left::Send "^{Left}"
#Right::Send "^{Right}"
#+Left::Send "^+{Left}"
#+Right::Send "^+{Right}"

; word delete
#Backspace::Send "^{Backspace}"
#Delete::Send "^{Delete}"

; add next occurrence / select all occurrences
#d::Send "^d"
#+l::Send "^+l"

; move line up/down
#Up::Send "!{Up}"
#Down::Send "!{Down}"

; copy line up/down
#+Up::Send "+!{Up}"
#+Down::Send "+!{Down}"

; ----- Command+Option-style combos (Alt+Win) -----
; insert cursor above/below
#!Up::Send "^!{Up}"
#!Down::Send "^!{Down}"

; select by word
#!Left::Send "^+{Left}"
#!Right::Send "^+{Right}"

; insert line below / above
!Enter::Send "^Enter"
!+Enter::Send "^+Enter"

#HotIf

; -----------------------------
; WINDOWS EXPLORER
; -----------------------------
#HotIf WinActive("ahk_class CabinetWClass")

!Backspace::Send "!{Up}"
!+n::Send "^+n"
!i::Send "!{Enter}"
!r::Send "{F2}"
!Delete::Send "+{Delete}"
!o::Send "{Enter}"

#HotIf

; -----------------------------
; BROWSERS
; -----------------------------
#HotIf (WinActive("ahk_exe chrome.exe")
    or WinActive("ahk_exe msedge.exe")
    or WinActive("ahk_exe firefox.exe"))
    and !IsRemoteSessionActive()

!r::Send "^r"
!+r::Send "^+r"
!l::Send "^l"
!t::Send "^t"
!+t::Send "^+t"
!w::Send "^w"
!+w::Send "^+w"
!Left::Send "!{Left}"
!Right::Send "!{Right}"
![::Send "!{Left}"
!]::Send "!{Right}"

#HotIf

; -----------------------------
; SCRIPT CONTROLS
; -----------------------------
F10::MsgBox("Active Title: " WinGetTitle("A") "`nActive Process: " WinGetProcessName("A") "`nIsRemoteSessionActive: " (IsRemoteSessionActive() ? "Yes" : "No"))
F11::Reload
F12::ExitApp