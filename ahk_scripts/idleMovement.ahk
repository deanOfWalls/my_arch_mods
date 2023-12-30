#Persistent
SetTimer, CheckMouse, 1000 ; Check mouse position every 1 second
MouseNotMovedTime := 0
ScriptActive := false
OriginalMouseX := 0, OriginalMouseY := 0

; Hotkey to toggle the script
Tab::ScriptActive := !ScriptActive

CheckMouse:
    if (!ScriptActive)
        return

    MouseGetPos, NewMouseX, NewMouseY

    if (NewMouseX = LastMouseX && NewMouseY = LastMouseY) {
        MouseNotMovedTime += 1
        if (MouseNotMovedTime >= 4) {
            Random, Delay, 1000, 4000
            SetTimer, TriggerMovement, -%Delay%
            MouseNotMovedTime := 0 ; Reset the timer
        }
    } else {
        MouseNotMovedTime := 0
    }

    LastMouseX := NewMouseX, LastMouseY := NewMouseY
return

TriggerMovement:
    MouseGetPos, OriginalMouseX, OriginalMouseY

    Random, NumMovements, 1, 6
    Loop, %NumMovements%
    {
        Random, MoveX, -216, 216 ; Increased distance for longer movements by 8%
        Random, MoveY, -108, 108 ; Increased distance for longer movements by 8%
        MouseMove, MoveX, MoveY, 40, R ; Slightly quicker movement with a speed of 40
        Sleep, 100
    }

    ; Return to the original position with a bit quicker movement
    MouseMove, OriginalMouseX, OriginalMouseY, 40
return

