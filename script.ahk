;SOT ANIT AFK SOFTWARE PRO V2 PLUS - 31b4
;if u r sot dev PLEASE fix hitreg :D
;GUI config
Gui, Add, Button, x10 y10 gBUTTON_PRESSED, start
Gui, Show, w500 h500,SoT Anti AFK Software Pro V2 Plus
AntiAFKActive := False ;status of anti afk
Return

GuiClose:
    ExitApp
;END GUI config


BUTTON_PRESSED:
    global AntiAFKActive
    if(AntiAFKActive) {
        global AntiAFKActive := False
    }  
    else{
        global AntiAFKActive := True
        Start_Anti_AFK()
    }
return

;SHORTCUTS---------------------
g:: ;pause
    global AntiAFKActive := False

return

h:: ;start
    global AntiAFKActive := True
    Start_Anti_AFK()
return
;-------------------------------

Start_Anti_AFK(){
    loop {
        global AntiAFKActive ;HIBAAAAAAAAAAAAAAAA
        if(AntiAFKActive){
            if(CheckSotRunning() && CheckSotActive()){
                Jump()
                Sleep, 75
            }
        }
        else{
            return
        }
        Sleep, 1000
    
    }
    Return
}


;FUNCTIONS-------------------------
Jump(){
    Send, {Space Down}
    sleep, 50
    Send, {Space Up}
    return
}


CheckSotRunning(){
    Process, Exist, SoTGame.exe
    If (!ErrorLevel = 0) {
        Return True ; running
    } else {
        Return False ; not running   
    }
}

CheckSotActive(){
    WinGetTitle, active_window_title, A
    If (active_window_title = "Sea of Thieves") {
         Return True ;active
    } else {
        Return False ;inactive
    }
}



;---------------------------------------











j::ExitApp ;Full stop