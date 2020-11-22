;must have parse article bookmarklet from https://articleparser.win as your first bookmarklet

;uses copypaste import to import quickly while browsing in chrome / edge. Also adds url references. 
;time to import = 5~ seconds
;success rate = 90%
;must have supermemo open in the background (easy to always leave it open)
;by TheTrueSquidward



!x::
		url = ; empties url variable
		article = ;empties article variable

		; Locates and presses 'Parse Article' button (must be your first bookmark)
		Send, {F6}
		Send, {F6}
		sleep, 500
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
		article := Clipboard
		sleep, 500
		Clipboard = ;empties clipboard



		;Pasting url in SuperMemo
		winactivate ahk_exe sm18.exe
		Clipboard := url
		Send ^n

		;Add the URL as a reference (from earlier, remember?)
		sleep, 500
		send, ^a
		send, !q    ;Makes a link reference
		send, l
		send, {Enter}
		send, {Enter}

		sleep, 2000

		send, {Up}
		Clipboard := article
		sleep, 50
		send, ^v
