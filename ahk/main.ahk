
;#InstallKeybdHook
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#MaxHotkeysPerInterval 2000 ; To prevent warning from popping up when scrolling with mac touchpad
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

; Mouse over taskbar actions
#If MouseIsOver("ahk_class Shell_TrayWnd")
	; Wheel down/up over taskbar => increase/decrease volume.
	WheelDown::Send {Volume_Up}     
	WheelUp::Send {Volume_Down} ;
	; Wheel click on taskbar => play/pause media
    MButton::Send {Media_Play_Pause}
#If ; Closing the #If statement


; Mouse Button 4 (ususally on the side of the mouse) => moves one desktop to the right
XButton1::
	Send ^#{Right}
return

; Mouse Button 5 (ususally on the side of the mouse) => move one desktop to the left
XButton2::
	Send ^#{Left}
return


; Mouse Button 5 + Left Click => open Task View
XButton2 & LButton::
	Send #{Tab}
return

; Mouse Button 5 + Right Click => switch to previously opened window
XButton2 & RButton::
	Send !{Tab}
return


; Alt + Backspace => delete text until the start of the line
!Backspace:: 
	Send {Shift down}{Home}{Shift up}{Backspace}
return

; Alt + Delete => delete text until the end of the line
!Delete::
	Send {Shift down}{End}{Shift up}{Delete}
return


; CapsLock => switch languages, switches twice every other time
CapsLock::
	ToggleLang := !ToggleLang
	Send, {Alt Down}{Shift Down}
	sleep, 50
	Send, {Alt Up}{Shift Up}
	If (ToggleLang){
		sleep, 50
		Send, {Alt Down}{Shift Down}
		sleep, 50
		Send, {Alt Up}{Shift Up}
	}
return


; AppsKey => turn capitalization on/off
AppsKey::
if GetKeyState("CapsLock", "T") = 1
	SetCapsLockState, Off
else if GetKeyState("CapsLock", "T") = 0
	SetCapsLockState, On
return


; AppsKey + Left Arrow => align current window to the left part of the screen
AppsKey & Left::
	Send #{Left}
return

; AppsKey + Right Arrow => align current window to the right part of the screen
AppsKey & Right::
	Send #{Right}
return

; AppsKey + Right Arrow => align current window to the upper quarter/ full screen (depending on the context)
AppsKey & Up::
	Send #{Up}
return

; AppsKey + Right Arrow => expand upper quarter to half/ shrink full screen window/ minimize window (depending on the context)
AppsKey & Down::
	Send #{Down}
return


; Alt + Wheel down => fast scrolling down
!WheelDown::
	Send {WheelDown}{WheelDown}{WheelDown}{WheelDown}
return

; Alt + Wheel up => fast scrolling up
!WheelUp::
	Send {WheelUp}{WheelUp}{WheelUp}{WheelUp}
return


; Reverts the scrolling wheel
; Caveat: won't work in administrative apps
; Alternative: set FlipFlopWheel to 1 in the registry
;WheelDown::
;	Send {WheelUp}
;return
;WheelUp::
;	Send {WheelDown}
;return