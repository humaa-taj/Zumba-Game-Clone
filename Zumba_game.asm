; use QWEADZXC keys (omnidirectional) to rotate the player. use spacebar to shoot. and use your brain to code. good luck.
include Irvine32.inc
include macros.inc
includelib winmm.lib


PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD


.data

; Sound System
sound1 db "level1song.wav",0
sound2 db "level2song.wav",0
sound3 db "level3song.wav",0
sound4 db "gun.wav",0
SND_ALIAS    DWORD 00010000h
SND_RESOURCE DWORD 00040005h
SND_FILENAME DWORD 00002000h



    ;GAME NAME LAYOUT
; Data declaration for main menu
title1 byte "######## ##     ## ##     ## ########     ###           ", 0ah, 0
title2 byte "     ##  ##     ## ###   ### ##     ##   ## ##          ", 0ah, 0
title3 byte "    ##   ##     ## #### #### ##     ##  ##   ##         ", 0ah, 0
title4 byte "   ##    ##     ## ## ### ## ########  ##     ##        ", 0ah, 0
title5 byte "  ##     ##     ## ##     ## ##     ## #########        ", 0ah, 0
title6 byte " ##      ##     ## ##     ## ##     ## ##     ##        ", 0ah, 0
title7 byte "########  #######  ##     ## ########  ##     ##        ", 0ah, 0



titl1 byte "######## ##   ##   #######     #######  ##      ##  ######## ", 0ah, 0
titl2 byte "   ##    ##   ##   ##          ##       ## #    ##  ##    ## ", 0ah, 0
titl3 byte "   ##    ##   ##   ##          ##       ##  #   ##  ##    ## ", 0ah, 0
titl4 byte "   ##    #######   ######      ######   ##   #  ##  ##    ## ", 0ah, 0
titl5 byte "   ##    ##   ##   ##          ##       ##    # ##  ##    ## ", 0ah, 0
titl6 byte "   ##    ##   ##   ##          ##       ##     ###  ##    ## ", 0ah, 0
titl7 byte "   ##    ##   ##   #######     #######  ##      ##  ######## ", 0ah, 0



msg1 BYTE '1.Start New Game', 0
msg2 BYTE '2.Control Menu', 0
msg3 BYTE '3.Exit the Game', 0
msg5 BYTE 'Enter From (1-4) : ',0
msg4 BYTE '4.Show Top Scores',0
choice byte ?

;control Menu
con1 byte '==> Use QWEADZXC keys (omnidirectional) to rotate the player.',0
con2 byte '==> Use spacebar to shoot.',0
con3 byte '==> Press 1 to Start Game',0

;for stopping at control menu
wait1 byte ?


; for pausedvariable
paused byte ?
                                                              
    ; Level layout
   walls1 BYTE " _____________________________________________________________________________ ", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                    1                                        |", 0
          BYTE "|                                    ---                                      |", 0
          BYTE "|                                   |   |                                     |", 0
          BYTE "|                                   |   |                                     |", 0
          BYTE "|                                   |   |                                     |", 0
          BYTE "|                                    ---                                      |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|_|", 0



     walls2 BYTE "                                     /\                                        ", 0
            BYTE "                                    /  \                                       ", 0
            BYTE "                                   /    \                                      ", 0
            BYTE "                                  /      \                                     ", 0
            BYTE "                                 /        \                                    ", 0
            BYTE "                                /          \                                   ", 0
            BYTE "                               /            \                                  ", 0
            BYTE "                              /              \                                 ", 0
            BYTE "                             /                \                                ", 0
            BYTE "                            /          3       \                               ", 0
            BYTE "                           /         ---        \                              ", 0
            BYTE "                          /         |   |        \                             ", 0
            BYTE "                          \         |   |        /                             ", 0
            BYTE "                           \        |   |       /                              ", 0
            BYTE "                            \        ---       /                               ", 0
            BYTE "                             \                /                                ", 0
            BYTE "                              \              /                                 ", 0
            BYTE "                               \            /                                  ", 0
            BYTE "                                \          /                                   ", 0
            BYTE "                                 \        /                                    ", 0
            BYTE "                                  \      /                                     ", 0
            BYTE "                                   \    /                                      ", 0
            BYTE "                                    \  /                                       ", 0
            BYTE "                                     \/                                        ", 0
            BYTE "                                                                               ", 0

     walls3 BYTE "                                     /\                                        ", 0
            BYTE "                                    /  \                                       ", 0
            BYTE "                                   /    \                                      ", 0
            BYTE "                                  /      \                                     ", 0
            BYTE "                                 /        \                                    ", 0
            BYTE "                                /          \                                   ", 0
            BYTE "                               /            \                                  ", 0
            BYTE "                              /              \                                 ", 0
            BYTE "                             /                \                                ", 0
            BYTE "                            /         2        \                               ", 0
            BYTE "                           /         ---        \                              ", 0
            BYTE "                          /         |   |        \                             ", 0
            BYTE "                         /          |   |         \                            ", 0
            BYTE "                        /           |   |          \                           ", 0
            BYTE "                       /             ---            \                          ", 0
            BYTE "                      /                              \                         ", 0
            BYTE "                     /                                \                        ", 0
            BYTE "                    /                                  \                       ", 0
            BYTE "                   /                                    \                      ", 0
            BYTE "                  /                                      \                     ", 0
            BYTE "                 /                                        \                    ", 0
            BYTE "                /                                          \                   ", 0
            BYTE "               /                                            \                  ", 0
            BYTE "              /                                              \                 ", 0
            BYTE "              -------------------------------------------------                ", 0








    
   ;MAKING BALLS
    
    row db 56  ;20 for rectangle 56 for diamond
    col db 4
    ballarrx db 50 DUP(-1)
    ballarry db 50 DUP(-1)
    ballind db 1
    balldirection db ?
    balldirection2 db ?

    update_mov db 1
    bool_collision db 0
    check_bool db 0
    color_index1 db 0
    color_index2 db 0
    r_find db 0
    l_find db 0
    randomm db 1
    bool_up db 0
    bool_down db 0
    bool_right db 0
    bool_left db 0

    resetgame db 0
    firstrow db 0
    firstcol db 0


    ;Coloring balls
    ballcolors db 4, 2, 14, 1, 5, 3  
    colorballs db 50 DUP(-1)
    currentIndex db 0              
    colorCounter db 2

    ; Player sprite
    player_right BYTE "   ", 0
                 BYTE " O-", 0
                 BYTE "   ", 0

    player_left BYTE "   ", 0
                BYTE "-O ", 0
                BYTE "   ", 0

    player_up BYTE " | ", 0
              BYTE " O ", 0
              BYTE "   ", 0

    player_down BYTE "   ", 0
                BYTE " O ", 0
                BYTE " | ", 0

    player_upright BYTE "  /", 0
                   BYTE " O ", 0
                   BYTE "   ", 0

    player_upleft BYTE "\  ", 0
                  BYTE " O ", 0
                  BYTE "   ", 0

    player_downright BYTE "   ", 0
                     BYTE " O ", 0
                     BYTE "  \", 0

    player_downleft BYTE "   ", 0
                    BYTE " O ", 0
                    BYTE "/  ", 0

    ; Player's starting position (center)
    xPos db 56      ; Column (X)
    yPos db 15      ; Row (Y)

    xDir db 0
    yDir db 0

    ; Default character (initial direction)
    inputChar db 0
    direction db "d"

  

    ; Fire symbol properties (fired from player)
    fire_row db 0        ; Fire will be fired from the player's position
    fire_col db 0        ; Initial fire column will be set in the update logic
    fire_color db 14     ; Fire symbol color (Yellow)

    ; Interface variables
    score db 0          ; Player's score
    lives db 3          ; Player's lives
    levelInfo db 1
    
    ; Counter variables for loops
    counter1 db 0
    counter2 db 0

    prompt1 db "Enter your name:",0
    names db 20 dup (32)
    strName db "Name:",0
    prompt2 db "Enter level:",0

.code

pausedscreen PROC
        call readkey
        mov paused,al
        cmp paused,"n"
        je nextlevel
        jne bss
        nextlevel:
        mov paused,"o"
        inc levelinfo
        mov row,56                   ; Reset starting row
        mov col,5                    ; Reset starting column
        mov ballind, 1               ; Reset ball index
        mov balldirection, 1
        mov balldirection2, 2
    bss:
    ret
pausedscreen endp

random_fireColor PROC
cmp randomm,5
je reset
inc randomm
jmp end_color
reset:
mov randomm,1
end_color:

cmp randomm,1
je color_red

cmp randomm,2
je color_green

cmp randomm,3
je color_blue

cmp randomm,4
je color_yellow

cmp randomm,5
je color_pink

color_red:
mov fire_color,10
jmp end_colors

color_green:
mov fire_color,10
jmp end_colors

color_blue:
mov fire_color,10
jmp end_colors

color_yellow:
mov fire_color,10
jmp end_colors

color_pink:
mov fire_color,10
jmp end_colors

end_colors:

ret
random_fireColor ENDP
check_collision PROC

mov ecx,0
mov ecx,lengthof ballarrx
mov ebx,0

x_checking:

cmp dl,ballarrx[ebx]
je y_checking
inc ebx
loop x_checking
jmp end_check


y_checking:

cmp dh,ballarry[ebx]
je color_check
jmp end_check
color_check:
push eax
push ebx
push ecx
push edx
call Check_color
pop edx
pop ecx
pop ebx
pop eax
cmp check_bool,1

je color_change
jmp end_check
color_change:                   
mov al,fire_color
mov colorballs[ebx],al
mov bool_collision,1
 add score,10
end_check:
mov check_bool,0
ret
check_collision ENDP

Check_color PROC
mov eax,0
mov al,colorballs[ebx]
cmp fire_color,al
je check_right
jmp nomatch
check_right:
mov color_index1,bl
mov eax,0
mov al,colorballs[ebx-1]
cmp fire_color,al
 je found_r
 check_left:
mov eax,0
mov al,colorballs[ebx+1]
cmp fire_color,al
 je found_l
 mov eax,0
 mov al,fire_color
mov colorballs[ebx-1],al
mov bool_collision,1

 jmp endhere

 found_r:
 mov r_find,1
 jmp found
 found_l:
 mov l_find,1

 found:
 cmp r_find,1
 je r_input

 cmp l_find,1
 je l_input
 jmp endhere

 r_input:
 mov color_index2,bl
 dec color_index2
 jmp found_working
 l_input:
 mov color_index2,bl
 inc color_index2
 jmp found_working

 nomatch:
 mov check_bool,1
 jmp resets
 found_working:           ; found the index of color matched ball 
                          ; shifting of array

 mov eax,0
 mov al,color_index2
 cmp color_index1,al
 jl found_at_right
 found_at_left:
 movzx ecx,color_index2                     ; Adjust for zero-based indexing
    mov esi, ecx
    shifting1:
    mov eax,0                
    mov al,ballarrx[esi-1]
    mov ballarrx[esi+1],al

    mov al,ballarry[esi-1]
    mov ballarry[esi+1],al

    mov al,colorballs[esi-1]
    mov colorballs[esi+1],al

    dec esi
    loop shifting1

   mov colorballs[esi],-1
   
    mov colorballs[esi+1],-1
 jmp redrawing

 found_at_right:
  movzx ecx,color_index1                    
    mov esi,ecx
    shifting:
    mov eax,0
    mov al,ballarrx[esi-1]
    mov ballarrx[esi+1],al

    mov al,ballarry[esi-1]
    mov ballarry[esi+1],al

    mov al,colorballs[esi-1]
    mov colorballs[esi+1],al

    dec esi
    loop shifting
    mov colorballs[esi],-1
   
    mov colorballs[esi+1],-1
   
    redrawing:

    pusha
     call ClrScr
     popa

 pusha
call InitialiseScreen
popa
    mov row,56                   ; Reset starting row
    mov col,5                    ; Reset starting column
    mov ballind, 1               ; Reset ball index
    mov balldirection, 1
    mov balldirection2, 2
    pusha 
  call BallMovement
popa
    

 endhere:
 mov check_bool,0
 mov bool_collision,1
 resets:
mov r_find,0
 mov l_find,0
 mov color_index1,0
 mov color_index2,0
ret 
Check_color ENDP

FireBall PROC
mov edx,0
mov eax,0
        push edx
        push eax
        call random_fireColor
        pop eax
        pop edx

    ; Fire a projectile from the player's current face direction

    mov dl, xPos      ; Fire column starts at the player's X position
    mov dh, yPos      ; Fire row starts at the player's Y position

    mov fire_col, dl  ; Save the fire column position
    mov fire_row, dh  ; Save the fire row position

    mov al, direction
    cmp al, "w"
    je fire_up

    cmp al, "x"
    je fire_down

    cmp al, "a"
    je fire_left

    cmp al, "d"
    je fire_right

    cmp al, "q"
    je fire_upleft

    cmp al, "e"
    je fire_upright

    cmp al, "z"
    je fire_downleft

    cmp al, "c"
    je fire_downright

    jmp end_fire

fire_up:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 57         ; Center fire position
    mov xDir, 0
    mov yDir, -1
    mov bool_up,1
    jmp fire_loop

fire_down:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 57         ; Center fire position
    mov xDir, 0
    mov yDir, 1
    mov bool_down,1

    jmp fire_loop

fire_left:
    mov fire_col, 55         ; Move fire position leftwards
    mov fire_row, 16         ; Center fire position
    mov xDir, -1
    mov yDir, 0
    mov bool_left,1

    jmp fire_loop

fire_right:
    mov fire_col, 59         ; Move fire position rightwards
    mov fire_row, 16         ; Center fire position
    mov xDir, 1
    mov yDir, 0
   mov bool_right,1

    jmp fire_loop

fire_upleft:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 55         ; Move fire position leftwards
    mov xDir, -1
    mov yDir, -1
    mov bool_up,1

    jmp fire_loop

fire_upright:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 59         ; Move fire position rightwards
    mov xDir, 1
    mov yDir, -1
   mov bool_up,1

    jmp fire_loop

fire_downleft:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 55         ; Move fire position leftwards
    mov xDir, -1
    mov yDir, 1
         mov bool_down,1

    jmp fire_loop

fire_downright:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 59         ; Move fire position rightwards
    mov xDir, 1
    mov yDir, 1
         mov bool_down,1

    jmp fire_loop

fire_loop:
    ; Initialise fire position
    mov dl, fire_col          
    mov dh, fire_row
    call GoToXY

    ; Loop to move the fireball in the current direction
    L1:

        ; Ensure fire stays within the bounds of the emitter wall

         push eax
        push ebx
        push edx
        push ecx
        call check_collision
        pop ecx
        pop edx
        pop ebx
        pop eax
        cmp bool_collision,1
        je end_fire

        cmp dl, 19            ; Left wall boundary
        jle end_fire

        cmp dl, 97            ; Right wall boundary
        jge end_fire

        cmp dh, 3            ; Upper wall boundary
        jle end_fire

        cmp dh, 28            ; Lower wall boundary
        jge end_fire
       

        ; Print the fire symbol at the current position
        
        movzx eax, fire_color    ; Set fire color
        call SetTextColor

        add dl, xDir
        add dh, yDir
        call Gotoxy

        mWrite "*"

        ; Continue moving fire in the current direction (recursive)
        mov eax, 50
        call Delay

        ; erase the fire before redrawing it
        call GoToXY
        mWrite " "

        jmp L1

    end_fire:
    mov bool_collision,0
        mov dx, 0
        call Gotoxy

    ret
FireBall ENDP

DrawWall PROC
	    call clrscr
        mov dl,90
        mov dh,0
        call gotoxy
        mov edx,offset strName
        mov ecx,lengthof strName
        mov eax, Yellow
	    call SetTextColor
        call writestring
        mov dl,96
        mov dh,0
        call gotoxy
        mov edx,offset names
        mov ecx,lengthof names
        mov eax, White
	    call SetTextColor
        call writestring
    mov dl,19
	mov dh,2
	call Gotoxy
	mWrite <"Score: ">
	mov eax, Blue + (black * 16)
	call SetTextColor
	mov al, score
	call WriteDec

    mov eax, White + (black * 16)
	call SetTextColor

	mov dl,90
	mov dh,2
	call Gotoxy
	mWrite <"Lives: ">
	mov eax, Red + (black * 16)
	call SetTextColor
	mov al, lives
	call WriteDec

	mov eax, white + (black * 16)
	call SetTextColor

	mov dl,55
	mov dh,2
	call Gotoxy

	mWrite "LEVEL " 
	mov al, levelInfo
	call WriteDec

	mov eax, gray + (black*16)
	call SetTextColor

	mov dl, 19
	mov dh, 4
	call Gotoxy

    cmp levelinfo,2
    je level3
    jg level2
    jl level1

    level2:
	mov esi, offset walls2
    jmp draw

    level3:
    mov esi, offset walls3
    jmp draw

    level1:
	mov esi, offset walls1
    jmp draw

    draw:
	mov counter1, 50
	mov counter2, 80
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow
		
        dec counter1
		movzx ecx, counter1

		mov dl, 19
		inc dh
		call Gotoxy
	loop printcolumn

	ret
DrawWall ENDP

PrintPlayer PROC
    mov eax, brown + (black * 16)
    call SetTextColor

    mov al, direction
    cmp al, "w"
    je print_up

    cmp al, "x"
    je print_down

    cmp al, "a"
    je print_left

    cmp al, "d"
    je print_right

    cmp al, "q"
    je print_upleft

    cmp al, "e"
    je print_upright

    cmp al, "z"
    je print_downleft

    cmp al, "c"
    je print_downright

    ret

    print_up:
        mov esi, offset player_up
        jmp print

    print_down:
        mov esi, offset player_down
        jmp print

    print_left:
        mov esi, offset player_left
        jmp print

    print_right:
        mov esi, offset player_right
        jmp print

    print_upleft:
        mov esi, offset player_upleft
        jmp print

    print_upright:
        mov esi, offset player_upright
        jmp print

    print_downleft:
        mov esi, offset player_downleft
        jmp print

    print_downright:
        mov esi, offset player_downright
        jmp print

    print:
    mov dl, xPos
    mov dh, yPos
    call GoToXY

    mov counter1, 3
	mov counter2, 4
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow

		movzx ecx, counter1

		mov dl, xPos
		inc dh
		call Gotoxy
	loop printcolumn
    
ret
PrintPlayer ENDP

MovePlayer PROC
    mov dx, 0
    call GoToXY

    checkInput:

    mov eax, 5
    call Delay

    ; Check for key press
    mov eax, 0
    call ReadKey
    mov inputChar, al

    cmp inputChar, VK_SPACE
    je shoot


    cmp inputChar, "p"
    je pausing

    cmp inputChar, "w"
    je move

    cmp inputChar, "a"
    je move

    cmp inputChar, "x"
    je move

    cmp inputChar, "d"
    je move

    cmp inputChar, "q"
    je move

    cmp inputChar, "e"
    je move

    cmp inputChar, "z"
    je move

    cmp inputChar, "c"
    je move

    ; if character is invalid, check for a new keypress
   ; jmp checkInput
   jmp finish
    move:
        mov al, inputChar
        mov direction, al
        jmp chosen

    pausing:
        mov inputChar,"o"
        ;call pausedscreen
        call waitmsg
        ;call clrscr
        ret
        
    shoot:
        ;INVOKE PlaySound, OFFSET sound4, NULL, 1
        call FireBall

    chosen:
        call PrintPlayer
        finish:
    ret
MovePlayer ENDP

InitialiseScreen PROC
    ; Draw the level layout at the start
    call DrawWall

    ; Set the initial player cannon position
    call PrintPlayer

    ret
InitialiseScreen ENDP

SetBallColors PROC
    mov ecx, lengthof colorballs   ; Set loop counter to the length of ballColors
    mov esi, 0                     ; Start index in ballColors array
    mov currentIndex, 0            ; Reset current color index
    mov colorCounter, 4            ; Reset counter to 3 for groups of the same color

    assign_colors:
        movzx edx,currentindex
        movzx eax, ballcolors[edx] ; Get current color
        mov colorballs[esi], al           ; Assign color to ballColors array
        inc esi                           ; Move to the next ball in ballColors
        dec colorCounter                  ; Decrement color group counter
        cmp colorCounter, 0               ; Check if the group is complete
        jne continue_loop                 ; If not, continue assigning the same color
        inc currentIndex
        mov colorCounter,4
        cmp currentindex,6
        je startcoloragain
        jne continue_loop

    startcoloragain:
        mov currentIndex,0
        mov colorCounter,4
        jmp continue_loop

    continue_loop:
        loop assign_colors                ; Continue until all balls are assigned

    ret
SetBallColors ENDP


; Main Ball Movement Procedure
BallMovement PROC
    mov ecx, lengthof ballarrx
    mov esi, ecx
    mov balldirection, 1  
    mov balldirection2, 2 

outer:
    mov ecx, 0
    mov cl, ballind    ; Load ballindex into cl
    mov ebx, 0
    mov bl, cl
    mov eax, 0
    mov edx, 0
    mov al, row
    mov dl, col

setting:
    mov ballarrx[ebx-1], al   ; Update ball's row position
    mov ballarry[ebx-1], dl   ; Update ball's column position
    call HandleDirection        ; Call direction handling procedure
    cmp resetgame,1
    je startagain
    jmp back_here

back_here:
    jmp drawhere
    dec ebx                     ; Move to the previous ball
    loop setting                ; Repeat until ecx reaches 0

back:
    inc ballind      ; Increment ballindex for the next ball
    mov ecx, esi        ; Restore the outer loop counter
    loop outer          ; Continue to the next iteration
    jmp end_draw        ; Jump to end of the procedure

drawhere:
    mov edx, 0          ; Reset draw-related registers
    mov ecx, 0
    mov cl, ballind   ; Reload ballindex into cl
    mov ebx, 0          ; Reset index for drawing balls

draw:
mov edx,0
  
    mov dl, ballarrx[ebx]
    mov dh, ballarry[ebx]
    cmp colorballs[ebx],-1
    je printspace

    mov eax, 0
    mov al, colorballs[ebx]
    call SetTextColor
     inc ebx
    call Gotoxy
    mWrite 'O'
    jmp changes


    printspace:
    inc ebx
    call Gotoxy
    mWrite " "


changes:
    push ecx
    push edx
    push ebx
    push eax

    call MovePlayer

    pop eax
    pop ebx
    pop edx
    pop ecx
   ; mov eax,100
   ; call Delay

    loop draw
    jmp back


startagain:
    dec lives 
    cmp lives,0
    je exitgame
    mov ecx, lengthof ballarrx  ; Get the length of ballarrrow
    mov edi, OFFSET ballarrx    ; Load the starting address of ballarrrow into edi
    mov al, -1                    ; Value to reset array (-1)
reset_ballarrrow:
    mov [edi], al                 ; Set each element to -1
    inc edi                       ; Move to the next byte
    loop reset_ballarrrow         ; Repeat until all elements are reset

    mov ecx, lengthof ballarry  ; Get the length of ballarrcol
    mov edi, OFFSET ballarry    ; Load the starting address of ballarrcol into edi
reset_ballarrcol:
    mov [edi], al                 ; Set each element to -1
    inc edi                       ; Move to the next byte
    loop reset_ballarrcol         ; Repeat until all elements are reset

    ; Reset other game variables
    mov row, 56                   ; Reset starting row
    mov col, 4                    ; Reset starting column
    mov ballind, 1              ; Reset ball index
    mov balldirection, 1          ; Reset direction to initial
    mov balldirection2, 2          ; Reset direction to initial
    mov resetgame , 0
    jmp end_draw
    
exitgame:

   call clrscr
     mov ax,Yellow
    call SetTextColor

    mov dl,20
    mov dh,4
    call GOTOXY

    mov edx,offset titl1
    call WriteString
    call crlf

    mov dl,20
    mov dh,5
    call GOTOXY

    mov edx, offset titl2
    call WriteString
    call crlf

    mov dl,20
    mov dh,6
    call GOTOXY

    mov edx, offset titl3
    call WriteString
    call crlf

    mov dl,20
    mov dh,7
    call GOTOXY

    mov edx, offset titl4
    call WriteString
    call crlf

    mov dl,20
    mov dh,8
    call GOTOXY

    mov edx, offset titl5
    call WriteString
    call crlf

    mov dl,20
    mov dh,9
    call GOTOXY

     mov edx, offset titl6
    call WriteString
    call crlf

     mov dl,20
    mov dh,10
    call GOTOXY

   mov edx, offset titl7
    call WriteString
    call crlf
    exit
    ret

end_draw:
    ret
BallMovement endp

; New Direction Handling Procedure
HandleDirection PROC
cmp levelinfo,2
je level3
jg level2
jl level1

level1:
    cmp balldirection, 1       ; Check if moving right
    je move_right
    cmp balldirection, 2       ; Check if moving down
    je move_down
    cmp balldirection, 3       ; Check if moving left
    je move_left
    cmp balldirection, 4       ; Check if moving up
    je move_up

move_right:
    inc al                     ; Increment column (move right)
    cmp al, 96                 ; Check if right boundary reached
    jle update_position      
    mov balldirection, 2       ; Change direction to down
    jmp update_position

move_down:
    inc dl                     ; Increment row (move down)
    cmp dl, 27                 ; Check if bottom boundary reached
    jle update_position
    mov balldirection, 3       ; Change direction to left
   jmp update_position
   jmp checkstart

move_left:
    dec al                     ; Decrement column (move left)
    cmp al, 19                 ; Check if left boundary reached
    jg update_position
    mov balldirection, 4       ; Change direction to up
    jmp update_position

move_up:
    dec dl                     ; Decrement row (move up)
    cmp dl, 3                  ; Check if top boundary reached
    jg update_position
    jmp checkstart

update_position:
    mov row, al                ; Update global row
    mov col, dl                ; Update global column
    ret     ; Return to caller

checkstart:
    cmp al,20
    je startagain

startagain:
    mov resetgame,1
    ;inc levelinfo
    ret
    jmp functions

level2:
cmp balldirection, 1       ; Check if moving right and down
je checkdown1
jne c2
checkdown1:
cmp balldirection2, 2 
je two_movements1
jne c2
two_movements1:
jmp move_rightDown

c2:
cmp balldirection, 1       
je checkdown2
jne c3
checkdown2:
cmp balldirection2, 4 
je two_movements2
two_movements2:
jmp move_rightUp

c3:
cmp balldirection, 3      
je checkdown3
jne c4
checkdown3:
cmp balldirection2, 2 
je two_movements3
jne c4
two_movements3:
jmp move_leftDown

c4:
cmp balldirection, 3      
je checkdown4
jne functions
checkdown4:
cmp balldirection2, 4 
je two_movements4
two_movements4:
jmp move_leftUp
   
 

move_rightDown:
 inc dl                     ; Increment row (move down)
 inc al                     ; Increment column (move right)
 cmp al, 67 
 jg chngLeft
 jle update
 chngLeft:
 mov balldirection, 3       ;hit right corner then Change direction to left
 update:
 jmp update_position2      


move_rightUp:

inc al
dec dl
cmp dl,3
jle startagain2
jg update_position2



move_leftDown:
 dec al                     ; Decrement column (move left)
 inc dl                     ; Increment row (move down)
 cmp dl, 27
 jg chngUp
 jle update2
 chngUp:
 mov balldirection2, 4       
 update2:
 jmp update_position2      

move_leftUp:
 dec dl                     ; Decrement row (move up)
 dec al                     ; Decrement column (move left)
 cmp al, 44
 jle chngRight
 jg update3
 chngRight:
 mov balldirection, 1       
 update3:
 jmp update_position2   


 

update_position2:
    mov row, al                ; Update global row
    mov col, dl                ; Update global column
    ret

startagain2:
    mov resetgame,1
    ;inc levelinfo
    ret
    jmp functions

jmp functions


level3:
cmp balldirection, 1       ; Check if moving right and down
je checkdown5
jne c5
checkdown5:
cmp balldirection2, 2 
je two_movements5
jne c5
two_movements5:
jmp move_rightDown2

c5:
cmp balldirection, 1       
je checkdown6
jne c6
checkdown6:
cmp balldirection2, 4 
je two_movements6
jne c6
two_movements6:
jmp move_rightUp2

c6:
cmp balldirection, 3
je move_left2


move_rightDown2:
 inc dl                     ; Increment row (move down)
 inc al                     ; Increment column (move right)
 cmp al, 78 
 jg chngLeft2
 jle update4
 chngLeft2:
 mov balldirection, 3       ;hit right corner then Change direction to left
 update4:
 jmp update_position3      


move_rightUp2:

inc al
dec dl
cmp dl,3
jle startagain3
jg update_position3


move_left2:
 dec al                     ; Decrement column (move left)
 cmp al, 32
 jle  changeUp2
 jg update5
 changeUp2:
 mov balldirection2, 4
 mov balldirection,1
 update5:
 jmp update_position3    


 update_position3:
    mov row, al                ; Update global row
    mov col, dl                ; Update global column
    ret

startagain3:
    mov resetgame,1
    ;inc levelinfo
    ret
    jmp functions

jmp functions
functions:
HandleDirection endp

MainMenu PROC

    mov ax,Yellow
    call SetTextColor

    mov dl,20
    mov dh,4
    call GOTOXY

    mov edx,offset title1
    call WriteString
    call crlf

    mov dl,20
    mov dh,5
    call GOTOXY

    mov edx, offset title2
    call WriteString
    call crlf

    mov dl,20
    mov dh,6
    call GOTOXY

    mov edx, offset title3
    call WriteString
    call crlf

    mov dl,20
    mov dh,7
    call GOTOXY

    mov edx, offset title4
    call WriteString
    call crlf

    mov dl,20
    mov dh,8
    call GOTOXY

    mov edx, offset title5
    call WriteString
    call crlf

    mov dl,20
    mov dh,9
    call GOTOXY

     mov edx, offset title6
    call WriteString
    call crlf

     mov dl,20
    mov dh,10
    call GOTOXY

   mov edx, offset title7
    call WriteString
    call crlf


    mov ax,Green
    call SetTextColor

    mov dl, 30       ; X-coordinate (column)
    mov dh, 12     ; Y-coordinate (row)
    call Gotoxy     

    mov edx,offset msg1
    call WriteString
    call crlf

    mov dl,30
    mov dh, 13    ; Y-coordinate (row)
    call Gotoxy

    mov edx,offset msg2
    call WriteString
    call crlf
    
    mov dl,30
    mov dh, 14     ; Y-coordinate (row)
    call Gotoxy

    mov edx,offset msg3
    call WriteString
    call crlf

    mov dl,30
    mov dh, 15     ; Y-coordinate (row)
    call Gotoxy

    mov edx,offset msg4
    call WriteString


    mov dl,30
    mov dh, 19    ; Y-coordinate (row)
    call Gotoxy

    mov edx,offset msg5
    call WriteString

    mov edx,offset choice
    call ReadInt
    mov choice,al

ret

MainMenu ENDP

controlMenu  PROC

call clrscr
;call border

mov dl,3
mov dh,5
call GOTOXY
mov eax,white
call settextcolor
mov edx, offset con1
call WriteString

mov dl,3
mov dh,6
call GOTOXY

mov edx, offset con2
call WriteString

mov dl,3
mov dh,8
call GOTOXY

mov edx, offset con3
call WriteString

L1:
   mov edx,offset wait1
   call ReadInt
   mov wait1,al
   cmp al,1
   je exit1
   jmp L1
exit1:
;jmp displayRandomBalls

ret
controlMenu ENDP




main PROC
    ;INVOKE PlaySound, OFFSET sound3, NULL, 1
    ;INVOKE PlaySound, OFFSET deviceConnect, NULL, 0
    ;MAIN SCREEN
    ;mov dl,0 
    ;mov dh,0
    ;mov eax,white
    ;call settextcolor
    ;call gotoxy
    ;mov edx,offset ZUMA_ART
    ;call writestring
    ;call waitmsg
    ;call clrscr

    call MainMenu
    cmp choice,2        ; Check if '2' is pressed for Control Menu
    je showControlMenu
    cmp choice,1
    je showname
    cmp choice,4
    ;je showfile
    cmp choice,3
    je done

    ;showfile:
    ; call displayfile
    ;jmp showname

    showControlMenu:
    call controlMenu
    jmp showname

    ;NAME INPUT
    showname:
    call clrscr
    mov dh,0
    mov dl,0
    call gotoxy
    mov eax,white
    call settextcolor
    mov edx,offset prompt1
    mov ecx,lengthof prompt1
    call writestring
    mov edx,offset names
    mov ecx,20
    call readstring
    mov dh,20
    mov dl,40
    call gotoxy
    mov eax,red
    call settextcolor
    mov edx,offset prompt2
    mov ecx,lengthof prompt2
    call writestring
    mov edx,offset levelinfo
    call ReadInt
    mov levelinfo,al


    call clrscr
    jmp gameloop

  
   


    gameloop:
         cmp levelinfo,2
        je level3
        jg level2
        jl level1
        level3:
        INVOKE PlaySound, OFFSET sound3, NULL, 1
        jmp d
        level2:
        INVOKE PlaySound, OFFSET sound2, NULL, 1
        jmp d
        level1:
        INVOKE PlaySound, OFFSET sound1, NULL, 1

        d:
        call InitialiseScreen
        call SetBallColors        ; Initialize ball colors

        call BallMovement
        call MovePlayer
        mov eax,1000
       

        
        call Delay
    jmp gameloop

done:
;call writename

 call clrscr
     mov ax,Yellow
    call SetTextColor

    mov dl,20
    mov dh,4
    call GOTOXY

    mov edx,offset titl1
    call WriteString
    call crlf

    mov dl,20
    mov dh,5
    call GOTOXY

    mov edx, offset titl2
    call WriteString
    call crlf

    mov dl,20
    mov dh,6
    call GOTOXY

    mov edx, offset titl3
    call WriteString
    call crlf

    mov dl,20
    mov dh,7
    call GOTOXY

    mov edx, offset titl4
    call WriteString
    call crlf

    mov dl,20
    mov dh,8
    call GOTOXY

    mov edx, offset titl5
    call WriteString
    call crlf

    mov dl,20
    mov dh,9
    call GOTOXY

     mov edx, offset titl6
    call WriteString
    call crlf

     mov dl,20
    mov dh,10
    call GOTOXY

   mov edx, offset titl7
    call WriteString
    call crlf
exit
main ENDP
END main

;main, menu processes 2, drawwall chunk, .data,