        .equ Monday, 1
        .equ Tuesday, 1
        @ ...

        .text
        day .req r7
main:   mov day, #Monday
        mov day, #Tuesday
        .unreq day
        @ ...
stop:   wfi
