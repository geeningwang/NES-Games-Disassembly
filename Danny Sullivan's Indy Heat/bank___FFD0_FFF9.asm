; bzk code must be placed at the same address in all banks

; code was copied from bank 00

; _inc_ in label names means this label
; is referred from outside of this included bank



loc_inc_FFD0_prg_bankswitch:
sub_inc_FFD0_prg_bankswitch:
C D 3 - - - 0x007FE0 01:FFD0: 86 0B     STX ram_prg_bank_jsr
sub_inc_FFD2_prg_bankswitch:
C - - - - - 0x007FE2 01:FFD2: 85 08     STA ram_prg_bank_pointer
C - - - - - 0x007FE4 01:FFD4: 84 06     STY ram_prg_bank_rts
C - - - - - 0x007FE6 01:FFD6: BD E8 FF  LDA tbl_FFE8,X
C - - - - - 0x007FE9 01:FFD9: 9D E8 FF  STA tbl_FFE8,X
- - - - - - 0x007FEC 01:FFDC: 20 00 80  JSR $8000
- - - - - - 0x007FEF 01:FFDF: A6 06     LDX ram_prg_bank_rts
- - - - - - 0x007FF1 01:FFE1: BD E8 FF  LDA tbl_FFE8,X
- - - - - - 0x007FF4 01:FFE4: 9D E8 FF  STA tbl_FFE8,X
bra_inc_FFE7_RTS:
C - - - - - 0x007FF7 01:FFE7: 60        RTS



tbl_FFE8:
tbl_inc_FFE8:
- - - - - - 0x007FF8 01:FFE8: 00        .byte $00, $01, $02, $03   ; 


; bzk garbage
- - - - - - 0x007FFC 01:FFEC: 10        .byte $10, $11, $12, $13   ; 



vec_inc_FFF0_RESET:
C - - - - - 0x008000 01:FFF0: 78        SEI
C - - - - - 0x008001 01:FFF1: A9 00     LDA #$00
C - - - - - 0x008003 01:FFF3: 8D E8 FF  STA tbl_FFE8
.if con_include_bank = $00
C - - - - - 0x008006 01:FFF6: 4C 03 80  JMP loc_out_8003_reset
.else
; bzk this JMP won't be executed here from other banks,
; instead instruction at 0x008006 will be executed.
; this is made just for assembling into original ROM.
; you can safely delete this condition and leave
; 0x008006 intact, also delete con_include_bank variables
                                        JMP $FFF0
.endif


; bzk garbage
- - - - - - 0x008009 01:FFF9: FF        .byte $FF   ; 











































































































































































































; FFuck you ANROM mapper