print("asd")
loop {
    Gosub,CheckSotRunning
    Gosub,CheckSotActive
    if(sot_running && sot_active){
        print("SOT is running\n")
        Gosub, Jump
        Sleep, 75
    }
    Sleep, 1000
   
}



Jump:
Send, {Space Down}
sleep, 50
Send, {Space Up}
return

CheckSotRunning:
Process, Exist, SoTGame.exe
If (!ErrorLevel = 0) {
    ; Set sot Running Variable
    sot_running = 1
} else {
    ; Set sot Running Variable
    sot_running = 0
    
}
return

CheckSotActive:
WinGetTitle, active_window_title, A
If (active_window_title = "Sea of Thieves") {
    ; Set sot active variable
    sot_active = 1

} else {
    ; Set sot active variable
    sot_active = 0
    
}
return



























print(str)
{
 global h_stdout
 DebugConsoleInitialize()  ; start console window if not yet started
 str .= "`n" ; add line feed
 DllCall("WriteFile", "uint", h_Stdout, "uint", &str, "uint", StrLen(str), "uint*", BytesWritten, "uint", NULL) ; write into the console
 WinSet, Bottom,, ahk_id %h_stout%  ; keep console on bottom
}

DebugConsoleInitialize()
{
   global h_Stdout     ; Handle for console
   static is_open = 0  ; toogle whether opened before
   if (is_open = 1)     ; yes, so don't open again
     return
	 
   is_open := 1	
   ; two calls to open, no error check (it's debug, so you know what you are doing)
   DllCall("AttachConsole", int, -1, int)
   DllCall("AllocConsole", int)

   dllcall("SetConsoleTitle", "str","Paddy Debug Console")    ; Set the name. Example. Probably could use a_scriptname here 
   h_Stdout := DllCall("GetStdHandle", "int", -11) ; get the handle
   WinSet, Bottom,, ahk_id %h_stout%      ; make sure it's on the bottom
   WinActivate,Lightroom   ; Application specific; I need to make sure this application is running in the foreground. YMMV
   return
}




















End::ExitApp