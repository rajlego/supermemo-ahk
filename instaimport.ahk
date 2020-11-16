;uses copypaste import to import quickly while browsing in chrome / edge. Also adds url references.
;must have supermemo open in the background (easy to always leave it open)
;by TheTrueSquidward


#ifwinactive ahk_class Chrome_WidgetWin_1 



;———————————————————Quick Import———————————————————

;you need to have articleparser as your first bookmark


!x::
url = ; empties url variable

; Locates and presses 'Parse Article' button (must be your first bookmark)
Send, {F6}
Send, {F6}
Send, ^c ;Copies the url as it passes omnibox
url := Clipboard
Clipboard = ;Empty Clipboard
Send, {F6}
Sleep, 50
Send, {Enter}






;Selects and copys the article
Sleep, 1500
Send, ^{a}
Send, ^{c}
ClipWait, 2
IF ErrorLevel{
  SplashTextOn,,,Error`, try again,
  Sleep,500
  SplashTextOff
  return
}

;Pasting in SuperMemo
winactivate ahk_exe sm18.exe
Send ^n


;Clearing the formatting
sleep, 1000
send, {F6}
send, ^{a}
sleep, 50
send, s
send, {Enter}
send, {Enter}
WinwaitClose, Filtering




;Add the URL as a reference (from earlier, remember?)
send, ^{t} ;enter the component to begin typing
send, %url%
sleep, 50

Gosub, SelectTwoLines ;selects the typed url


send, !q    ;Makes a link reference
send, l
send, {Enter}
send, {Enter}

sleep, 1000
send, {Right} ;(cursor is always one too left for some reason)
Gosub, SelectTwoLines
return
