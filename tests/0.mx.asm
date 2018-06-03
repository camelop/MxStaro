              global  main                            
              extern  strlen                          
              extern  malloc                          
              extern  strcmp                          
              extern  strcpy                          
              extern  strncpy                         
              extern  strtol                          
              extern  printf                          
              extern  scanf                           
              extern  sprintf                         

              section .data                           
_data_s5:
              db      ` <= 0;\n`                      
              db      0                               
_data_s1:
              db      `%s\n`                          
              db      0                               
_data_s2:
              db      `- `                            
              db      0                               
_data_s7:
              db      ` + `                           
              db      0                               
_data_s8:
              db      ` = 1;\n`                       
              db      0                               
_data_s6:
              db      `x`                             
              db      0                               
_data_s9:
              db      `max: xz;\n`                    
              db      0                               
_data_s0:
              db      `%s`                            
              db      0                               
_data_s3:
              db      `*x`                            
              db      0                               
_data_s4:
              db      `xz `                           
              db      0                               

              section .bss                            
_data_bss_sat:
              resb    8                               
_data_bss_assignment:
              resb    8                               
_data_bss_cond_ass:
              resb    8                               
_data_bss_k:
              resb    8                               
_data_bss_n:
              resb    8                               
_data_bss_m:
              resb    8                               
_data_bss_last:
              resb    8                               
_data_bss_myHash:
              resb    8                               

              section .text                           
_text_built_in_string_length:
              sub     rsp            , 8              
              call    strlen                          
              add     rsp            , 8              
              ret                                     
                                                      
_text_built_in_string_substring:
              push    r13                             
              push    rbx                             
              push    r12                             
              mov     r12            , rdi            
              mov     r13            , rdx            
              mov     rbx            , rsi            
              sub     r13            , rbx            
              add     r13            , 1              
              mov     rdi            , r13            
              call    malloc                          
              mov     rdi            , rax            
              mov     rsi            , r12            
              add     rsi            , rbx            
              mov     rdx            , r13            
              mov     r12            , rax            
              call    strncpy                         
              mov     qword [r12+r13], 0              
              pop     r12                             
              pop     rbx                             
              pop     r13                             
              ret                                     
                                                      
_text_built_in_string_parseInt:
              push    rbx                             
              mov     rbx            , rdi            
              mov     rdi            , 8              
              call    malloc                          
              mov     rdi            , rbx            
              mov     rsi            , rax            
              mov     rdx            , 10             
              call    strtol                          
              pop     rbx                             
              ret                                     
                                                      
_text_built_in_string_ord:
              mov     rax            , qword [rdi+rsi]
              and     rax            , 255            
              ret                                     
                                                      
_text_built_in_array_size:
              mov     rax            , qword [rdi]    
              and     rax            , -1             
              ret                                     
                                                      
_text__printf:
              xor     rax            , rax            
              sub     rsp            , 8              
              call    printf                          
              add     rsp            , 8              
              ret                                     
                                                      
_text__getString_format:
              db      `%s`           , 0              
_text__getString:
              push    rbx                             
              mov     rdi            , 257            
              call    malloc                          
              mov     rbx            , rax            
              mov     rdi            , _text__getString_format
              mov     rsi            , rax            
              xor     rdx            , rdx            
              call    scanf                           
              mov     rax            , rbx            
              pop     rbx                             
              ret                                     
                                                      
_text__getInt_format:
              db      `%lld`         , 0              
_text__getInt:
              push    rbx                             
              mov     rdi            , 8              
              call    malloc                          
              and     rax            , -1             
              mov     rbx            , rax            
              mov     rdi            , _text__getInt_format
              mov     rsi            , rax            
              xor     rdx            , rdx            
              call    scanf                           
              mov     rax            , qword [rbx]    
              pop     rbx                             
              ret                                     
                                                      
_text__toString_format:
              db      `%d`           , 0              
_text__toString:
              sub     rsp            , 8              
              push    r12                             
              push    rbx                             
              mov     rbx            , rdi            
              mov     rdi            , 12             
              call    malloc                          
              mov     r12            , rax            
              mov     rdi            , rax            
              mov     rsi            , _text__toString_format
              mov     rdx            , rbx            
              xor     rcx            , rcx            
              call    sprintf                         
              mov     rax            , r12            
              pop     rbx                             
              pop     r12                             
              add     rsp            , 8              
              ret                                     
                                                      
; --- [ _text__print ] ---
;[----------------------------------
_text__print:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     rbp            , rdi            ; load->v6; null; save->v6
              mov     rbx            , _data_s0       ; load->v7; null; save->v7
_text__print_call0:
              mov     rdi            , rbx            ; load->v7; null
              mov     rsi            , rbp            ; load->v6; null
              call    _text__printf                   
              mov     rbp            , rax            ; load->v8; null; save->v8
_text__print_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__println ] ---
;[----------------------------------
_text__println:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     rbp            , rdi            ; load->v6; null; save->v6
              mov     rbx            , _data_s1       ; load->v7; null; save->v7
_text__println_call0:
              mov     rdi            , rbx            ; load->v7; null
              mov     rsi            , rbp            ; load->v6; null
              call    _text__printf                   
              mov     rbp            , rax            ; load->v8; null; save->v8
_text__println_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _datainit ] ---
;[----------------------------------
_datainit:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     rbp            , 0              ; load->v6; null; save->v6
              mov     [_data_bss_myHash], rbp            ; load->v6; null
_datainit_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__check ] ---
;[----------------------------------
_text__check:
              sub     rsp            , 360            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
_text__check_for0_init:
              mov     qword [rsp+48] , 0              ; load->v8; null; save->v8
              mov     r10            , rbp            ; load->v6
              mov     rbp            , qword [rsp+48] ; load->v8; assign->i; save->v6
              mov     r10            , qword [rsp+56] ; load->v9
              mov     r10            , [_data_bss_m]  
              mov     qword [rsp+56] , r10            ; save->v9
              mov     r10            , rbp            ; load->v6
              mov     r11            , qword [rsp+56] ; load->v9
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v6
              mov     r10            , qword [rsp+64] ; load->v10
              setl    r10b                            
              mov     qword [rsp+64] , r10            ; save->v10; load->v10
              and     r10            , 255            
              mov     qword [rsp+64] , r10            ; save->v10
_text__check_for0_init_check:
              mov     r10            , qword [rsp+64] ; load->v10
              cmp     r10b           , 0              
              mov     qword [rsp+64] , r10            ; save->v10
              je      _text__check_for0_end                 
;----------------------------------]
;[----------------------------------
_text__check_for0_start:
              mov     qword [rsp+72] , 0              ; load->v11; null; save->v11
              mov     r10            , r15            ; load->v12
              mov     r15            , qword [rsp+72] ; load->v11; init->succ; save->v12
_text__check_for1_init:
              mov     r13            , 0              ; load->v13; null; save->v13
              mov     r10            , rbx            ; load->v7
              mov     rbx            , r13            ; load->v13; assign->j; save->v7
              mov     r14            , 3              ; load->v14; null; save->v14
              mov     r10            , rbx            ; load->v7
              mov     r11            , r14            ; load->v14
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v7
              mov     r10            , r12            ; load->v15
              setl    r10b                            
              mov     r12            , r10            ; save->v15; load->v15
              and     r10            , 255            
              mov     r12            , r10            ; save->v15
_text__check_for1_init_check:
              mov     r10            , r12            ; load->v15
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v15
              je      _text__check_for1_end                 
;----------------------------------]
;[----------------------------------
_text__check_for1_start:
              mov     r10            , qword [rsp+80] ; load->v16
              mov     r10            , [_data_bss_sat]
              mov     qword [rsp+80] , r10            ; save->v16
              mov     r10            , qword [rsp+88] ; load->v17
              mov     qword [rsp+88] , rbp            ; load->v6; null; save->v17
              mov     r10            , qword [rsp+88] ; load->v17
              imul    r10            , 8              
              mov     qword [rsp+88] , r10            ; save->v17; load->v17
              add     r10            , 8              
              mov     qword [rsp+88] , r10            ; save->v17; load->v17
              mov     r11            , qword [rsp+80] ; load->v16
              add     r10            , r11            
              mov     qword [rsp+88] , r10            ; save->v17
              mov     r10            , qword [rsp+96] ; load->v18
              mov     r11            , qword [rsp+88] ; translate->qword [v17]
              mov     r10            , qword [r11]    
              mov     qword [rsp+96] , r10            ; save->v18
              mov     r10            , qword [rsp+104]; load->v19
              mov     qword [rsp+104], rbx            ; load->v7; null; save->v19
              mov     r10            , qword [rsp+104]; load->v19
              imul    r10            , 8              
              mov     qword [rsp+104], r10            ; save->v19; load->v19
              add     r10            , 8              
              mov     qword [rsp+104], r10            ; save->v19; load->v19
              mov     r11            , qword [rsp+96] ; load->v18
              add     r10            , r11            
              mov     qword [rsp+104], r10            ; save->v19
              mov     r10            , qword [rsp+112]; load->v20
              mov     r11            , qword [rsp+104]; translate->qword [v19]
              mov     r10            , qword [r11]    
              mov     qword [rsp+112], r10            ; save->v20
              mov     r10            , qword [rsp+120]; load->v21
              mov     r10            , qword [rsp+112]; load->v20; init->var
              mov     qword [rsp+120], r10            ; save->v21
_text__check_if0_init:
_text__check_and0_lvalue:
              mov     qword [rsp+128], 0              ; load->v22; null; save->v22
              mov     qword [rsp+136], 0              ; load->v23; null; save->v23
              mov     r10            , qword [rsp+120]; load->v21
              mov     r11            , qword [rsp+136]; load->v23
              cmp     r10d           , r11d           
              mov     qword [rsp+120], r10            ; save->v21
              mov     r10            , qword [rsp+144]; load->v24
              setg    r10b                            
              mov     qword [rsp+144], r10            ; save->v24; load->v24
              and     r10            , 255            
              mov     qword [rsp+144], r10            ; save->v24; load->v24
              cmp     r10            , 0              
              mov     qword [rsp+144], r10            ; save->v24
              je      _text__check_and0_end                 
;----------------------------------]
;[----------------------------------
_text__check_and0_rvalue:
              mov     r10            , qword [rsp+152]; load->v25
              mov     r10            , [_data_bss_assignment]
              mov     qword [rsp+152], r10            ; save->v25
              mov     r10            , qword [rsp+160]; load->v26
              mov     r10            , qword [rsp+120]; load->v21; null
              mov     qword [rsp+160], r10            ; save->v26; load->v26
              imul    r10            , 8              
              mov     qword [rsp+160], r10            ; save->v26; load->v26
              add     r10            , 8              
              mov     qword [rsp+160], r10            ; save->v26; load->v26
              mov     r11            , qword [rsp+152]; load->v25
              add     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v26
              mov     r10            , qword [rsp+168]; load->v27
              mov     r11            , qword [rsp+160]; translate->qword [v26]
              mov     r10            , qword [r11]    
              mov     qword [rsp+168], r10            ; save->v27
              mov     qword [rsp+176], 1              ; load->v28; null; save->v28
              mov     r10            , qword [rsp+168]; load->v27
              mov     r11            , qword [rsp+176]; load->v28
              cmp     r10d           , r11d           
              mov     qword [rsp+168], r10            ; save->v27
              mov     r10            , qword [rsp+184]; load->v29
              sete    r10b                            
              mov     qword [rsp+184], r10            ; save->v29; load->v29
              and     r10            , 255            
              mov     qword [rsp+184], r10            ; save->v29; load->v29
              cmp     r10            , 0              
              mov     qword [rsp+184], r10            ; save->v29
              je      _text__check_and0_end                 
              mov     qword [rsp+128], 255            ; load->v22; null; save->v22
_text__check_and0_end:
_text__check_if0_check:
              mov     r10            , qword [rsp+128]; load->v22
              cmp     r10b           , 0              
              mov     qword [rsp+128], r10            ; save->v22
              je      _text__check_if0_else                 
;----------------------------------]
;[----------------------------------
_text__check_if0_start:
              mov     qword [rsp+192], 1              ; load->v30; null; save->v30
              mov     r10            , r15            ; load->v12
              mov     r15            , qword [rsp+192]; load->v30; assign->succ; save->v12
              jmp     _text__check_if0_end                 
;----------------------------------]
;[----------------------------------
_text__check_if0_else:
_text__check_if0_end:
_text__check_if1_init:
_text__check_and1_lvalue:
              mov     qword [rsp+200], 0              ; load->v31; null; save->v31
              mov     qword [rsp+208], 0              ; load->v32; null; save->v32
              mov     r10            , qword [rsp+120]; load->v21
              mov     r11            , qword [rsp+208]; load->v32
              cmp     r10d           , r11d           
              mov     qword [rsp+120], r10            ; save->v21
              mov     r10            , qword [rsp+216]; load->v33
              setl    r10b                            
              mov     qword [rsp+216], r10            ; save->v33; load->v33
              and     r10            , 255            
              mov     qword [rsp+216], r10            ; save->v33; load->v33
              cmp     r10            , 0              
              mov     qword [rsp+216], r10            ; save->v33
              je      _text__check_and1_end                 
;----------------------------------]
;[----------------------------------
_text__check_and1_rvalue:
              mov     r10            , qword [rsp+224]; load->v34
              mov     r10            , [_data_bss_assignment]
              mov     qword [rsp+224], r10            ; save->v34
              mov     r10            , qword [rsp+232]; load->v35
              mov     r10            , qword [rsp+120]; load->v21; null
              mov     qword [rsp+232], r10            ; save->v35; load->v35
              neg     r10                             
              mov     qword [rsp+232], r10            ; save->v35
              mov     r10            , qword [rsp+240]; load->v36
              mov     r10            , qword [rsp+232]; load->v35; null
              mov     qword [rsp+240], r10            ; save->v36; load->v36
              imul    r10            , 8              
              mov     qword [rsp+240], r10            ; save->v36; load->v36
              add     r10            , 8              
              mov     qword [rsp+240], r10            ; save->v36; load->v36
              mov     r11            , qword [rsp+224]; load->v34
              add     r10            , r11            
              mov     qword [rsp+240], r10            ; save->v36
              mov     r10            , qword [rsp+248]; load->v37
              mov     r11            , qword [rsp+240]; translate->qword [v36]
              mov     r10            , qword [r11]    
              mov     qword [rsp+248], r10            ; save->v37
              mov     qword [rsp+256], 0              ; load->v38; null; save->v38
              mov     r10            , qword [rsp+248]; load->v37
              mov     r11            , qword [rsp+256]; load->v38
              cmp     r10d           , r11d           
              mov     qword [rsp+248], r10            ; save->v37
              mov     r10            , qword [rsp+264]; load->v39
              sete    r10b                            
              mov     qword [rsp+264], r10            ; save->v39; load->v39
              and     r10            , 255            
              mov     qword [rsp+264], r10            ; save->v39; load->v39
              cmp     r10            , 0              
              mov     qword [rsp+264], r10            ; save->v39
              je      _text__check_and1_end                 
              mov     qword [rsp+200], 255            ; load->v31; null; save->v31
_text__check_and1_end:
_text__check_if1_check:
              mov     r10            , qword [rsp+200]; load->v31
              cmp     r10b           , 0              
              mov     qword [rsp+200], r10            ; save->v31
              je      _text__check_if1_else                 
;----------------------------------]
;[----------------------------------
_text__check_if1_start:
              mov     qword [rsp+272], 1              ; load->v40; null; save->v40
              mov     r10            , r15            ; load->v12
              mov     r15            , qword [rsp+272]; load->v40; assign->succ; save->v12
              jmp     _text__check_if1_end                 
;----------------------------------]
;[----------------------------------
_text__check_if1_else:
_text__check_if1_end:
_text__check_for1_continue:
              mov     qword [rsp+280], 1              ; load->v41; null; save->v41
              mov     r10            , qword [rsp+288]; load->v42
              mov     qword [rsp+288], rbx            ; load->v7; null; save->v42
              mov     r10            , qword [rsp+288]; load->v42
              mov     r11            , qword [rsp+280]; load->v41
              add     r10            , r11            
              mov     qword [rsp+288], r10            ; save->v42
              mov     r10            , rbx            ; load->v7
              mov     rbx            , qword [rsp+288]; load->v42; assign->j; save->v7
              mov     qword [rsp+296], 3              ; load->v43; null; save->v43
              mov     r10            , rbx            ; load->v7
              mov     r11            , qword [rsp+296]; load->v43
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v7
              jl      _text__check_for1_start                 
;----------------------------------]
;[----------------------------------
_text__check_for1_end:
_text__check_if2_init:
              mov     qword [rsp+304], 0              ; load->v44; null; save->v44
              mov     r10            , r15            ; load->v12
              mov     r11            , qword [rsp+304]; load->v44
              cmp     r10d           , r11d           
              mov     r15            , r10            ; save->v12
              mov     r10            , qword [rsp+312]; load->v45
              sete    r10b                            
              mov     qword [rsp+312], r10            ; save->v45; load->v45
              and     r10            , 255            
              mov     qword [rsp+312], r10            ; save->v45
_text__check_if2_check:
              mov     r10            , qword [rsp+312]; load->v45
              cmp     r10b           , 0              
              mov     qword [rsp+312], r10            ; save->v45
              je      _text__check_if2_else                 
;----------------------------------]
;[----------------------------------
_text__check_if2_start:
              mov     qword [rsp+320], 0              ; load->v46; null; save->v46
_text__check_ret0:
              mov     rax            , qword [rsp+320]; load->v46; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 360            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__check_if2_else:
_text__check_if2_end:
_text__check_for0_continue:
              mov     qword [rsp+328], 1              ; load->v47; null; save->v47
              mov     r10            , qword [rsp+336]; load->v48
              mov     qword [rsp+336], rbp            ; load->v6; null; save->v48
              mov     r10            , qword [rsp+336]; load->v48
              mov     r11            , qword [rsp+328]; load->v47
              add     r10            , r11            
              mov     qword [rsp+336], r10            ; save->v48
              mov     r10            , rbp            ; load->v6
              mov     rbp            , qword [rsp+336]; load->v48; assign->i; save->v6
              mov     r10            , qword [rsp+344]; load->v49
              mov     r10            , [_data_bss_m]  
              mov     qword [rsp+344], r10            ; save->v49
              mov     r10            , rbp            ; load->v6
              mov     r11            , qword [rsp+344]; load->v49
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v6
              jl      _text__check_for0_start                 
;----------------------------------]
;[----------------------------------
_text__check_for0_end:
              mov     rbp            , 1              ; load->v50; null; save->v50
_text__check_ret1:
              mov     rax            , rbp            ; load->v50; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 360            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__myprint ] ---
;[----------------------------------
_text__myprint:
              sub     rsp            , 88             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbp            , rdi            ; load->v6; null; save->v6
_text__myprint_for0_init:
              mov     r12            , 0              ; load->v8; null; save->v8
              mov     r10            , rbx            ; load->v7
              mov     rbx            , r12            ; load->v8; assign->i; save->v7
_text__myprint_call0:
              mov     rdi            , rbp            ; load->v6; null
              call    _text_built_in_string_length                 
              mov     qword [rsp+48] , rax            ; load->v9; null; save->v9
              mov     r10            , rbx            ; load->v7
              mov     r11            , qword [rsp+48] ; load->v9
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v7
              mov     r10            , r13            ; load->v10
              setl    r10b                            
              mov     r13            , r10            ; save->v10; load->v10
              and     r10            , 255            
              mov     r13            , r10            ; save->v10
_text__myprint_for0_init_check:
              mov     r10            , r13            ; load->v10
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v10
              je      _text__myprint_for0_end                 
;----------------------------------]
;[----------------------------------
_text__myprint_for0_start:
              mov     r10            , r14            ; load->v11
              mov     r14            , [_data_bss_myHash]; null; save->v11
_text__myprint_call1:
              mov     rdi            , rbp            ; load->v6; null
              mov     rsi            , rbx            ; load->v7; null
              call    _text_built_in_string_ord                 
              mov     qword [rsp+56] , rax            ; load->v12; null; save->v12
              mov     r10            , r15            ; load->v13
              mov     r15            , r14            ; load->v11; null; save->v13
              mov     r10            , r15            ; load->v13
              mov     r11            , qword [rsp+56] ; load->v12
              add     r10            , r11            
              mov     r15            , r10            ; save->v13
              mov     [_data_bss_myHash], r15            ; load->v13; null
_text__myprint_for0_continue:
              mov     qword [rsp+64] , 1              ; load->v14; null; save->v14
              mov     r10            , qword [rsp+72] ; load->v15
              mov     qword [rsp+72] , rbx            ; load->v7; null; save->v15
              mov     r10            , qword [rsp+72] ; load->v15
              mov     r11            , qword [rsp+64] ; load->v14
              add     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v15
              mov     r10            , rbx            ; load->v7
              mov     rbx            , qword [rsp+72] ; load->v15; assign->i; save->v7
_text__myprint_call2:
              mov     rdi            , rbp            ; load->v6; null
              call    _text_built_in_string_length                 
              mov     qword [rsp+80] , rax            ; load->v16; null; save->v16
              mov     r10            , rbx            ; load->v7
              mov     r11            , qword [rsp+80] ; load->v16
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v7
              jl      _text__myprint_for0_start                 
;----------------------------------]
;[----------------------------------
_text__myprint_for0_end:
_text__myprint_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 88             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__payoff ] ---
;[----------------------------------
_text__payoff:
              sub     rsp            , 152            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbp            , rdi            ; load->v6; null; save->v6
              mov     rbx            , rsi            ; load->v7; null; save->v7
              mov     r12            , 0              ; load->v8; null; save->v8
              mov     r10            , r13            ; load->v9
              mov     r13            , r12            ; load->v8; init->ret; save->v9
_text__payoff_for0_init:
              mov     r14            , 0              ; load->v11; null; save->v11
              mov     r10            , r12            ; load->v10
              mov     r12            , r14            ; load->v11; assign->i; save->v10
              mov     r15            , 3              ; load->v12; null; save->v12
              mov     r10            , r12            ; load->v10
              mov     r11            , r15            ; load->v12
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v10
              mov     r10            , qword [rsp+48] ; load->v13
              setl    r10b                            
              mov     qword [rsp+48] , r10            ; save->v13; load->v13
              and     r10            , 255            
              mov     qword [rsp+48] , r10            ; save->v13
_text__payoff_for0_init_check:
              mov     r10            , qword [rsp+48] ; load->v13
              cmp     r10b           , 0              
              mov     qword [rsp+48] , r10            ; save->v13
              je      _text__payoff_for0_end                 
;----------------------------------]
;[----------------------------------
_text__payoff_for0_start:
_text__payoff_if0_init:
              mov     r10            , qword [rsp+56] ; load->v14
              mov     qword [rsp+56] , r12            ; load->v10; null; save->v14
              mov     r10            , qword [rsp+56] ; load->v14
              imul    r10            , 8              
              mov     qword [rsp+56] , r10            ; save->v14; load->v14
              add     r10            , 8              
              mov     qword [rsp+56] , r10            ; save->v14; load->v14
              mov     r11            , rbp            ; load->v6
              add     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v14
              mov     r10            , qword [rsp+64] ; load->v15
              mov     r11            , qword [rsp+56] ; translate->qword [v14]
              mov     r10            , qword [r11]    
              mov     qword [rsp+64] , r10            ; save->v15
              mov     r10            , qword [rsp+72] ; load->v16
              mov     qword [rsp+72] , r12            ; load->v10; null; save->v16
              mov     r10            , qword [rsp+72] ; load->v16
              imul    r10            , 8              
              mov     qword [rsp+72] , r10            ; save->v16; load->v16
              add     r10            , 8              
              mov     qword [rsp+72] , r10            ; save->v16; load->v16
              mov     r11            , rbx            ; load->v7
              add     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v16
              mov     r10            , qword [rsp+80] ; load->v17
              mov     r11            , qword [rsp+72] ; translate->qword [v16]
              mov     r10            , qword [r11]    
              mov     qword [rsp+80] , r10            ; save->v17
              mov     r10            , qword [rsp+64] ; load->v15
              mov     r11            , qword [rsp+80] ; load->v17
              cmp     r10d           , r11d           
              mov     qword [rsp+64] , r10            ; save->v15
              mov     r10            , qword [rsp+88] ; load->v18
              setne   r10b                            
              mov     qword [rsp+88] , r10            ; save->v18; load->v18
              and     r10            , 255            
              mov     qword [rsp+88] , r10            ; save->v18
_text__payoff_if0_check:
              mov     r10            , qword [rsp+88] ; load->v18
              cmp     r10b           , 0              
              mov     qword [rsp+88] , r10            ; save->v18
              je      _text__payoff_if0_else                 
;----------------------------------]
;[----------------------------------
_text__payoff_if0_start:
              mov     r10            , qword [rsp+96] ; load->v19
              mov     qword [rsp+96] , r13            ; load->v9; null; save->v19
              mov     qword [rsp+104], 1              ; load->v20; null; save->v20
              mov     r10            , qword [rsp+112]; load->v21
              mov     qword [rsp+112], r13            ; load->v9; null; save->v21
              mov     r10            , qword [rsp+112]; load->v21
              mov     r11            , qword [rsp+104]; load->v20
              add     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v21
              mov     r10            , r13            ; load->v9
              mov     r13            , qword [rsp+112]; load->v21; assign->ret; save->v9
              jmp     _text__payoff_if0_end                 
;----------------------------------]
;[----------------------------------
_text__payoff_if0_else:
_text__payoff_if0_end:
_text__payoff_for0_continue:
              mov     qword [rsp+120], 1              ; load->v22; null; save->v22
              mov     r10            , qword [rsp+128]; load->v23
              mov     qword [rsp+128], r12            ; load->v10; null; save->v23
              mov     r10            , qword [rsp+128]; load->v23
              mov     r11            , qword [rsp+120]; load->v22
              add     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v23
              mov     r10            , r12            ; load->v10
              mov     r12            , qword [rsp+128]; load->v23; assign->i; save->v10
              mov     qword [rsp+136], 3              ; load->v24; null; save->v24
              mov     r10            , r12            ; load->v10
              mov     r11            , qword [rsp+136]; load->v24
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v10
              jl      _text__payoff_for0_start                 
;----------------------------------]
;[----------------------------------
_text__payoff_for0_end:
_text__payoff_ret0:
              mov     rax            , r13            ; load->v9; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 152            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__print_cond ] ---
;[----------------------------------
_text__print_cond:
              sub     rsp            , 248            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     qword [rsp+48] , rdi            ; load->v6; null; save->v6
_text__print_cond_if0_init:
              mov     r10            , rbx            ; load->v7
              mov     rbx            , [_data_bss_n]  ; null; save->v7
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r11            , rbx            ; load->v7
              cmp     r10d           , r11d           
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , rbx            ; load->v8
              sete    r10b                            
              mov     rbx            , r10            ; save->v8; load->v8
              and     r10            , 255            
              mov     rbx            , r10            ; save->v8
_text__print_cond_if0_check:
              mov     r10            , rbx            ; load->v8
              cmp     r10b           , 0              
              mov     rbx            , r10            ; save->v8
              je      _text__print_cond_if0_else                 
;----------------------------------]
;[----------------------------------
_text__print_cond_if0_start:
              mov     qword [rsp+56] , _data_s2       ; load->v9; null; save->v9
              mov     r10            , rbx            ; load->v10
              mov     rbx            , [_data_bss_cond_ass]; null; save->v10
              mov     r10            , r12            ; load->v11
              mov     r12            , [_data_bss_assignment]; null; save->v11
_text__print_cond_call0:
              mov     rdi            , rbx            ; load->v10; null
              mov     rsi            , r12            ; load->v11; null
              call    _text__payoff                   
              mov     rbx            , rax            ; load->v12; null; save->v12
_text__print_cond_call1:
              mov     rdi            , rbx            ; load->v12; null
              call    _text__toString                 
              mov     qword [rsp+64] , rax            ; load->v13; null; save->v13
              mov     rdi            , qword [rsp+56] ; load->v9; null
              call    strlen                          
              mov     qword [rsp+72] , rax            ; load->v14; null; save->v14
              mov     rdi            , qword [rsp+64] ; load->v13; null
              call    strlen                          
              mov     qword [rsp+80] , rax            ; load->v15; null; save->v15
              mov     r10            , qword [rsp+80] ; load->v15
              mov     r11            , qword [rsp+72] ; load->v14
              add     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v15; load->v15
              add     r10            , 1              
              mov     qword [rsp+80] , r10            ; save->v15
              mov     rdi            , qword [rsp+80] ; load->v15; null
              call    malloc                          
              mov     qword [rsp+88] , rax            ; load->v16; null; save->v16
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+56] ; load->v9; null
              call    strcpy                          
              mov     rdi            , qword [rsp+88] ; load->v16; null
              mov     r11            , qword [rsp+72] ; load->v14
              add     rdi            , r11            
              mov     rsi            , qword [rsp+64] ; load->v13; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
              mov     qword [rsp+96] , _data_s3       ; load->v17; null; save->v17
              mov     rdi            , qword [rsp+88] ; load->v16; null
              call    strlen                          
              mov     qword [rsp+104], rax            ; load->v18; null; save->v18
              mov     rdi            , qword [rsp+96] ; load->v17; null
              call    strlen                          
              mov     qword [rsp+112], rax            ; load->v19; null; save->v19
              mov     r10            , qword [rsp+112]; load->v19
              mov     r11            , qword [rsp+104]; load->v18
              add     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v19; load->v19
              add     r10            , 1              
              mov     qword [rsp+112], r10            ; save->v19
              mov     rdi            , qword [rsp+112]; load->v19; null
              call    malloc                          
              mov     qword [rsp+120], rax            ; load->v20; null; save->v20
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+88] ; load->v16; null
              call    strcpy                          
              mov     rdi            , qword [rsp+120]; load->v20; null
              mov     r11            , qword [rsp+104]; load->v18
              add     rdi            , r11            
              mov     rsi            , qword [rsp+96] ; load->v17; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
_text__print_cond_call2:
              mov     rdi            , qword [rsp+120]; load->v20; null
              call    _text__myprint                  
              mov     rbx            , rax            ; load->v21; null; save->v21
_text__print_cond_for0_init:
              mov     r12            , 0              ; load->v23; null; save->v23
              mov     r10            , rbx            ; load->v22
              mov     rbx            , r12            ; load->v23; assign->i; save->v22
              mov     r10            , r13            ; load->v24
              mov     r13            , [_data_bss_n]  ; null; save->v24
              mov     r10            , rbx            ; load->v22
              mov     r11            , r13            ; load->v24
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v22
              mov     r10            , r14            ; load->v25
              setl    r10b                            
              mov     r14            , r10            ; save->v25; load->v25
              and     r10            , 255            
              mov     r14            , r10            ; save->v25
_text__print_cond_for0_init_check:
              mov     r10            , r14            ; load->v25
              cmp     r10b           , 0              
              mov     r14            , r10            ; save->v25
              je      _text__print_cond_for0_end                 
;----------------------------------]
;[----------------------------------
_text__print_cond_for0_start:
_text__print_cond_if1_init:
              mov     r15            , 10             ; load->v26; null; save->v26
              mov     qword [rsp+128], rdx            ; load->v28; null; save->v28
              mov     qword [rsp+136], rax            ; load->v29; null; save->v29
              mov     rax            , rbx            ; load->v22; null
              and     rax            , -1             
              mov     r10            , r15            ; load->v26
              and     r10d           , -1             
              mov     r15            , r10            ; save->v26
              cqo                                     
              mov     r10            , r15            ; load->v26
              idiv    r10d                            
              mov     r15            , r10            ; save->v26
              mov     rbp            , rdx            ; load->v27; null; save->v27
              mov     rdx            , qword [rsp+128]; load->v28; null
              mov     rax            , qword [rsp+136]; load->v29; null
              mov     qword [rsp+144], 0              ; load->v30; null; save->v30
              mov     r10            , rbp            ; load->v27
              mov     r11            , qword [rsp+144]; load->v30
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v27
              mov     r10            , qword [rsp+152]; load->v31
              sete    r10b                            
              mov     qword [rsp+152], r10            ; save->v31; load->v31
              and     r10            , 255            
              mov     qword [rsp+152], r10            ; save->v31
_text__print_cond_if1_check:
              mov     r10            , qword [rsp+152]; load->v31
              cmp     r10b           , 0              
              mov     qword [rsp+152], r10            ; save->v31
              je      _text__print_cond_if1_else                 
;----------------------------------]
;[----------------------------------
_text__print_cond_if1_start:
              mov     r10            , qword [rsp+160]; load->v32
              mov     r10            , [_data_bss_cond_ass]
              mov     qword [rsp+160], r10            ; save->v32
              mov     qword [rsp+168], 1              ; load->v33; null; save->v33
              mov     r10            , qword [rsp+176]; load->v34
              mov     qword [rsp+176], rbx            ; load->v22; null; save->v34
              mov     r10            , qword [rsp+176]; load->v34
              mov     r11            , qword [rsp+168]; load->v33
              add     r10            , r11            
              mov     qword [rsp+176], r10            ; save->v34
              mov     r10            , qword [rsp+184]; load->v35
              mov     r10            , qword [rsp+176]; load->v34; null
              mov     qword [rsp+184], r10            ; save->v35; load->v35
              imul    r10            , 8              
              mov     qword [rsp+184], r10            ; save->v35; load->v35
              add     r10            , 8              
              mov     qword [rsp+184], r10            ; save->v35; load->v35
              mov     r11            , qword [rsp+160]; load->v32
              add     r10            , r11            
              mov     qword [rsp+184], r10            ; save->v35
              mov     r10            , qword [rsp+192]; load->v36
              mov     r11            , qword [rsp+184]; translate->qword [v35]
              mov     r10            , qword [r11]    
              mov     qword [rsp+192], r10            ; save->v36
_text__print_cond_call3:
              mov     rdi            , qword [rsp+192]; load->v36; null
              call    _text__toString                 
              mov     qword [rsp+200], rax            ; load->v37; null; save->v37
_text__print_cond_call4:
              mov     rdi            , qword [rsp+200]; load->v37; null
              call    _text__myprint                  
              mov     qword [rsp+208], rax            ; load->v38; null; save->v38
              jmp     _text__print_cond_if1_end                 
;----------------------------------]
;[----------------------------------
_text__print_cond_if1_else:
_text__print_cond_if1_end:
_text__print_cond_for0_continue:
              mov     qword [rsp+216], 1              ; load->v39; null; save->v39
              mov     r10            , qword [rsp+224]; load->v40
              mov     qword [rsp+224], rbx            ; load->v22; null; save->v40
              mov     r10            , qword [rsp+224]; load->v40
              mov     r11            , qword [rsp+216]; load->v39
              add     r10            , r11            
              mov     qword [rsp+224], r10            ; save->v40
              mov     r10            , rbx            ; load->v22
              mov     rbx            , qword [rsp+224]; load->v40; assign->i; save->v22
              mov     r10            , qword [rsp+232]; load->v41
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+232], r10            ; save->v41
              mov     r10            , rbx            ; load->v22
              mov     r11            , qword [rsp+232]; load->v41
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v22
              jl      _text__print_cond_for0_start                 
;----------------------------------]
;[----------------------------------
_text__print_cond_for0_end:
_text__print_cond_ret0:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 248            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__print_cond_if0_else:
_text__print_cond_if0_end:
              mov     rbp            , 1              ; load->v42; null; save->v42
              mov     r10            , rbx            ; load->v43
              mov     rbx            , [_data_bss_cond_ass]; null; save->v43
              mov     r12            , 1              ; load->v44; null; save->v44
              mov     r10            , r13            ; load->v45
              mov     r13            , qword [rsp+48] ; load->v6; null; save->v45
              mov     r10            , r13            ; load->v45
              mov     r11            , r12            ; load->v44
              add     r10            , r11            
              mov     r13            , r10            ; save->v45
              mov     r10            , r12            ; load->v46
              mov     r12            , r13            ; load->v45; null; save->v46
              mov     r10            , r12            ; load->v46
              imul    r10            , 8              
              mov     r12            , r10            ; save->v46; load->v46
              add     r10            , 8              
              mov     r12            , r10            ; save->v46; load->v46
              mov     r11            , rbx            ; load->v43
              add     r10            , r11            
              mov     r12            , r10            ; save->v46
              mov     r10            , rbx            ; load->v47
              mov     r11            , r12            ; translate->qword [v46]
              mov     rbx            , qword [r11]    ; null; save->v47
              mov     r10            , r12            ; translate->qword [v46]
              mov     qword [r10]    , rbp            ; load->v42; assign->cond_ass[dep+1]
              mov     rbp            , 1              ; load->v48; null; save->v48
              mov     r10            , rbx            ; load->v49
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v49
              mov     r10            , rbx            ; load->v49
              mov     r11            , rbp            ; load->v48
              add     r10            , r11            
              mov     rbx            , r10            ; save->v49
_text__print_cond_call5:
              mov     rdi            , rbx            ; load->v49; null
              call    _text__print_cond                 
              mov     rbp            , 0              ; load->v50; null; save->v50; load->v51; null; save->v51
              mov     r10            , rbx            ; load->v52
              mov     rbx            , [_data_bss_cond_ass]; null; save->v52
              mov     r12            , 1              ; load->v53; null; save->v53
              mov     r10            , r13            ; load->v54
              mov     r13            , qword [rsp+48] ; load->v6; null; save->v54
              mov     r10            , r13            ; load->v54
              mov     r11            , r12            ; load->v53
              add     r10            , r11            
              mov     r13            , r10            ; save->v54
              mov     r10            , r12            ; load->v55
              mov     r12            , r13            ; load->v54; null; save->v55
              mov     r10            , r12            ; load->v55
              imul    r10            , 8              
              mov     r12            , r10            ; save->v55; load->v55
              add     r10            , 8              
              mov     r12            , r10            ; save->v55; load->v55
              mov     r11            , rbx            ; load->v52
              add     r10            , r11            
              mov     r12            , r10            ; save->v55
              mov     r10            , rbx            ; load->v56
              mov     r11            , r12            ; translate->qword [v55]
              mov     rbx            , qword [r11]    ; null; save->v56
              mov     r10            , r12            ; translate->qword [v55]
              mov     qword [r10]    , rbp            ; load->v51; assign->cond_ass[dep+1]
              mov     rbp            , 1              ; load->v57; null; save->v57
              mov     r10            , rbx            ; load->v58
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v58
              mov     r10            , rbx            ; load->v58
              mov     r11            , rbp            ; load->v57
              add     r10            , r11            
              mov     rbx            , r10            ; save->v58
_text__print_cond_call6:
              mov     rdi            , rbx            ; load->v58; null
              call    _text__print_cond                 
              mov     rbp            , rax            ; load->v59; null; save->v59
_text__print_cond_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 248            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__dfs ] ---
;[----------------------------------
_text__dfs:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     rbp            , rdi            ; load->v6; null; save->v6
_text__dfs_if0_init:
              mov     r10            , rbx            ; load->v7
              mov     rbx            , [_data_bss_n]  ; null; save->v7
              mov     r10            , rbp            ; load->v6
              mov     r11            , rbx            ; load->v7
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v6
              mov     r10            , rbx            ; load->v8
              sete    r10b                            
              mov     rbx            , r10            ; save->v8; load->v8
              and     r10            , 255            
              mov     rbx            , r10            ; save->v8
_text__dfs_if0_check:
              mov     r10            , rbx            ; load->v8
              cmp     r10b           , 0              
              mov     rbx            , r10            ; save->v8
              je      _text__dfs_if0_else                 
;----------------------------------]
;[----------------------------------
_text__dfs_if0_start:
_text__dfs_if1_init:
_text__dfs_call0:
              call    _text__check                    
              mov     rbx            , rax            ; load->v9; null; save->v9
              mov     r12            , 1              ; load->v10; null; save->v10
              mov     r10            , rbx            ; load->v9
              mov     r11            , r12            ; load->v10
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v9; load->v11
              sete    r10b                            
              mov     rbx            , r10            ; save->v11; load->v11
              and     r10            , 255            
              mov     rbx            , r10            ; save->v11
_text__dfs_if1_check:
              mov     r10            , rbx            ; load->v11
              cmp     r10b           , 0              
              mov     rbx            , r10            ; save->v11
              je      _text__dfs_if1_else                 
;----------------------------------]
;[----------------------------------
_text__dfs_if1_start:
              mov     rbx            , _data_s4       ; load->v12; null; save->v12
_text__dfs_call1:
              mov     rdi            , rbx            ; load->v12; null
              call    _text__myprint                  
              mov     rbx            , 0              ; load->v13; null; save->v13; load->v14; null; save->v14
_text__dfs_call2:
              mov     rdi            , rbx            ; load->v14; null
              call    _text__print_cond                 
              mov     rbx            , _data_s5       ; load->v15; null; save->v15; load->v16; null; save->v16
_text__dfs_call3:
              mov     rdi            , rbx            ; load->v16; null
              call    _text__myprint                  
              mov     rbx            , rax            ; load->v17; null; save->v17
              jmp     _text__dfs_if1_end                 
;----------------------------------]
;[----------------------------------
_text__dfs_if1_else:
_text__dfs_if1_end:
_text__dfs_ret0:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
;[----------------------------------
_text__dfs_if0_else:
_text__dfs_if0_end:
              mov     rbx            , 1              ; load->v18; null; save->v18
              mov     r10            , r12            ; load->v19
              mov     r12            , [_data_bss_assignment]; null; save->v19
              mov     r13            , 1              ; load->v20; null; save->v20
              mov     r10            , r14            ; load->v21
              mov     r14            , rbp            ; load->v6; null; save->v21
              mov     r10            , r14            ; load->v21
              mov     r11            , r13            ; load->v20
              add     r10            , r11            
              mov     r14            , r10            ; save->v21
              mov     r10            , r13            ; load->v22
              mov     r13            , r14            ; load->v21; null; save->v22
              mov     r10            , r13            ; load->v22
              imul    r10            , 8              
              mov     r13            , r10            ; save->v22; load->v22
              add     r10            , 8              
              mov     r13            , r10            ; save->v22; load->v22
              mov     r11            , r12            ; load->v19
              add     r10            , r11            
              mov     r13            , r10            ; save->v22
              mov     r10            , r12            ; load->v23
              mov     r11            , r13            ; translate->qword [v22]
              mov     r12            , qword [r11]    ; null; save->v23
              mov     r10            , r13            ; translate->qword [v22]
              mov     qword [r10]    , rbx            ; load->v18; assign->assignment[dep+1]
              mov     rbx            , 1              ; load->v24; null; save->v24
              mov     r10            , r12            ; load->v25
              mov     r12            , rbp            ; load->v6; null; save->v25
              mov     r10            , r12            ; load->v25
              mov     r11            , rbx            ; load->v24
              add     r10            , r11            
              mov     r12            , r10            ; save->v25
_text__dfs_call4:
              mov     rdi            , r12            ; load->v25; null
              call    _text__dfs                      
              mov     rbx            , 0              ; load->v26; null; save->v26; load->v27; null; save->v27
              mov     r10            , r12            ; load->v28
              mov     r12            , [_data_bss_assignment]; null; save->v28
              mov     r13            , 1              ; load->v29; null; save->v29
              mov     r10            , r14            ; load->v30
              mov     r14            , rbp            ; load->v6; null; save->v30
              mov     r10            , r14            ; load->v30
              mov     r11            , r13            ; load->v29
              add     r10            , r11            
              mov     r14            , r10            ; save->v30
              mov     r10            , r13            ; load->v31
              mov     r13            , r14            ; load->v30; null; save->v31
              mov     r10            , r13            ; load->v31
              imul    r10            , 8              
              mov     r13            , r10            ; save->v31; load->v31
              add     r10            , 8              
              mov     r13            , r10            ; save->v31; load->v31
              mov     r11            , r12            ; load->v28
              add     r10            , r11            
              mov     r13            , r10            ; save->v31
              mov     r10            , r12            ; load->v32
              mov     r11            , r13            ; translate->qword [v31]
              mov     r12            , qword [r11]    ; null; save->v32
              mov     r10            , r13            ; translate->qword [v31]
              mov     qword [r10]    , rbx            ; load->v27; assign->assignment[dep+1]
              mov     rbx            , 1              ; load->v33; null; save->v33
              mov     r10            , r12            ; load->v34
              mov     r12            , rbp            ; load->v6; null; save->v34
              mov     r10            , r12            ; load->v34
              mov     r11            , rbx            ; load->v33
              add     r10            , r11            
              mov     r12            , r10            ; save->v34
_text__dfs_call5:
              mov     rdi            , r12            ; load->v34; null
              call    _text__dfs                      
              mov     rbp            , rax            ; load->v35; null; save->v35
_text__dfs_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__print_last_cond ] ---
;[----------------------------------
_text__print_last_cond:
              sub     rsp            , 200            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     qword [rsp+48] , rdi            ; load->v6; null; save->v6
_text__print_last_cond_if0_init:
              mov     r10            , rbx            ; load->v7
              mov     rbx            , [_data_bss_n]  ; null; save->v7
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r11            , rbx            ; load->v7
              cmp     r10d           , r11d           
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , rbx            ; load->v8
              sete    r10b                            
              mov     rbx            , r10            ; save->v8; load->v8
              and     r10            , 255            
              mov     rbx            , r10            ; save->v8
_text__print_last_cond_if0_check:
              mov     r10            , rbx            ; load->v8
              cmp     r10b           , 0              
              mov     rbx            , r10            ; save->v8
              je      _text__print_last_cond_if0_else                 
;----------------------------------]
;[----------------------------------
_text__print_last_cond_if0_start:
              mov     rbx            , _data_s6       ; load->v9; null; save->v9
_text__print_last_cond_call0:
              mov     rdi            , rbx            ; load->v9; null
              call    _text__myprint                  
              mov     rbx            , 1              ; load->v10; null; save->v10; load->v11; null; save->v11
              mov     r10            , r12            ; load->v12
              mov     r12            , rbx            ; load->v11; init->islast; save->v12
_text__print_last_cond_for0_init:
              mov     r13            , 0              ; load->v14; null; save->v14
              mov     r10            , rbx            ; load->v13
              mov     rbx            , r13            ; load->v14; assign->i; save->v13
              mov     r10            , r14            ; load->v15
              mov     r14            , [_data_bss_n]  ; null; save->v15
              mov     r10            , rbx            ; load->v13
              mov     r11            , r14            ; load->v15
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v13
              mov     r10            , r15            ; load->v16
              setl    r10b                            
              mov     r15            , r10            ; save->v16; load->v16
              and     r10            , 255            
              mov     r15            , r10            ; save->v16
_text__print_last_cond_for0_init_check:
              mov     r10            , r15            ; load->v16
              cmp     r10b           , 0              
              mov     r15            , r10            ; save->v16
              je      _text__print_last_cond_for0_end                 
;----------------------------------]
;[----------------------------------
_text__print_last_cond_for0_start:
_text__print_last_cond_if1_init:
              mov     r10            , rbp            ; load->v17
              mov     rbp            , [_data_bss_assignment]; null; save->v17
              mov     qword [rsp+56] , 1              ; load->v18; null; save->v18
              mov     r10            , qword [rsp+64] ; load->v19
              mov     qword [rsp+64] , rbx            ; load->v13; null; save->v19
              mov     r10            , qword [rsp+64] ; load->v19
              mov     r11            , qword [rsp+56] ; load->v18
              add     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v19
              mov     r10            , qword [rsp+72] ; load->v20
              mov     r10            , qword [rsp+64] ; load->v19; null
              mov     qword [rsp+72] , r10            ; save->v20; load->v20
              imul    r10            , 8              
              mov     qword [rsp+72] , r10            ; save->v20; load->v20
              add     r10            , 8              
              mov     qword [rsp+72] , r10            ; save->v20; load->v20
              mov     r11            , rbp            ; load->v17
              add     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v20
              mov     r10            , qword [rsp+80] ; load->v21
              mov     r11            , qword [rsp+72] ; translate->qword [v20]
              mov     r10            , qword [r11]    
              mov     qword [rsp+80] , r10            ; save->v21
              mov     qword [rsp+88] , 1              ; load->v22; null; save->v22
              mov     r10            , qword [rsp+80] ; load->v21
              mov     r11            , qword [rsp+88] ; load->v22
              cmp     r10d           , r11d           
              mov     qword [rsp+80] , r10            ; save->v21
              mov     r10            , qword [rsp+96] ; load->v23
              sete    r10b                            
              mov     qword [rsp+96] , r10            ; save->v23; load->v23
              and     r10            , 255            
              mov     qword [rsp+96] , r10            ; save->v23
_text__print_last_cond_if1_check:
              mov     r10            , qword [rsp+96] ; load->v23
              cmp     r10b           , 0              
              mov     qword [rsp+96] , r10            ; save->v23
              je      _text__print_last_cond_if1_else                 
;----------------------------------]
;[----------------------------------
_text__print_last_cond_if1_start:
              mov     qword [rsp+104], 0              ; load->v24; null; save->v24
              mov     r10            , r12            ; load->v12
              mov     r12            , qword [rsp+104]; load->v24; assign->islast; save->v12
              jmp     _text__print_last_cond_if1_end                 
;----------------------------------]
;[----------------------------------
_text__print_last_cond_if1_else:
_text__print_last_cond_if1_end:
              mov     r10            , qword [rsp+112]; load->v25
              mov     r10            , [_data_bss_assignment]
              mov     qword [rsp+112], r10            ; save->v25
              mov     qword [rsp+120], 1              ; load->v26; null; save->v26
              mov     r10            , qword [rsp+128]; load->v27
              mov     qword [rsp+128], rbx            ; load->v13; null; save->v27
              mov     r10            , qword [rsp+128]; load->v27
              mov     r11            , qword [rsp+120]; load->v26
              add     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v27
              mov     r10            , qword [rsp+136]; load->v28
              mov     r10            , qword [rsp+128]; load->v27; null
              mov     qword [rsp+136], r10            ; save->v28; load->v28
              imul    r10            , 8              
              mov     qword [rsp+136], r10            ; save->v28; load->v28
              add     r10            , 8              
              mov     qword [rsp+136], r10            ; save->v28; load->v28
              mov     r11            , qword [rsp+112]; load->v25
              add     r10            , r11            
              mov     qword [rsp+136], r10            ; save->v28
              mov     r10            , qword [rsp+144]; load->v29
              mov     r11            , qword [rsp+136]; translate->qword [v28]
              mov     r10            , qword [r11]    
              mov     qword [rsp+144], r10            ; save->v29
_text__print_last_cond_call1:
              mov     rdi            , qword [rsp+144]; load->v29; null
              call    _text__toString                 
              mov     qword [rsp+152], rax            ; load->v30; null; save->v30
_text__print_last_cond_call2:
              mov     rdi            , qword [rsp+152]; load->v30; null
              call    _text__myprint                  
              mov     qword [rsp+160], rax            ; load->v31; null; save->v31
_text__print_last_cond_for0_continue:
              mov     qword [rsp+168], 1              ; load->v32; null; save->v32
              mov     r10            , qword [rsp+176]; load->v33
              mov     qword [rsp+176], rbx            ; load->v13; null; save->v33
              mov     r10            , qword [rsp+176]; load->v33
              mov     r11            , qword [rsp+168]; load->v32
              add     r10            , r11            
              mov     qword [rsp+176], r10            ; save->v33
              mov     r10            , rbx            ; load->v13
              mov     rbx            , qword [rsp+176]; load->v33; assign->i; save->v13
              mov     r10            , qword [rsp+184]; load->v34
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+184], r10            ; save->v34
              mov     r10            , rbx            ; load->v13
              mov     r11            , qword [rsp+184]; load->v34
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v13
              jl      _text__print_last_cond_for0_start                 
;----------------------------------]
;[----------------------------------
_text__print_last_cond_for0_end:
_text__print_last_cond_if2_init:
              mov     rbp            , 0              ; load->v35; null; save->v35
              mov     r10            , r12            ; load->v12
              mov     r11            , rbp            ; load->v35
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v12
              mov     r10            , rbp            ; load->v36
              sete    r10b                            
              mov     rbp            , r10            ; save->v36; load->v36
              and     r10            , 255            
              mov     rbp            , r10            ; save->v36
_text__print_last_cond_if2_check:
              mov     r10            , rbp            ; load->v36
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v36
              je      _text__print_last_cond_if2_else                 
;----------------------------------]
;[----------------------------------
_text__print_last_cond_if2_start:
              mov     rbp            , _data_s7       ; load->v37; null; save->v37
_text__print_last_cond_call3:
              mov     rdi            , rbp            ; load->v37; null
              call    _text__myprint                  
              mov     rbp            , rax            ; load->v38; null; save->v38
              jmp     _text__print_last_cond_if2_end                 
;----------------------------------]
;[----------------------------------
_text__print_last_cond_if2_else:
              mov     rbp            , _data_s8       ; load->v39; null; save->v39
_text__print_last_cond_call4:
              mov     rdi            , rbp            ; load->v39; null
              call    _text__myprint                  
              mov     rbp            , rax            ; load->v40; null; save->v40
_text__print_last_cond_if2_end:
_text__print_last_cond_ret0:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 200            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__print_last_cond_if0_else:
_text__print_last_cond_if0_end:
              mov     rbp            , 1              ; load->v41; null; save->v41
              mov     r10            , rbx            ; load->v42
              mov     rbx            , [_data_bss_assignment]; null; save->v42
              mov     r12            , 1              ; load->v43; null; save->v43
              mov     r10            , r13            ; load->v44
              mov     r13            , qword [rsp+48] ; load->v6; null; save->v44
              mov     r10            , r13            ; load->v44
              mov     r11            , r12            ; load->v43
              add     r10            , r11            
              mov     r13            , r10            ; save->v44
              mov     r10            , r12            ; load->v45
              mov     r12            , r13            ; load->v44; null; save->v45
              mov     r10            , r12            ; load->v45
              imul    r10            , 8              
              mov     r12            , r10            ; save->v45; load->v45
              add     r10            , 8              
              mov     r12            , r10            ; save->v45; load->v45
              mov     r11            , rbx            ; load->v42
              add     r10            , r11            
              mov     r12            , r10            ; save->v45
              mov     r10            , rbx            ; load->v46
              mov     r11            , r12            ; translate->qword [v45]
              mov     rbx            , qword [r11]    ; null; save->v46
              mov     r10            , r12            ; translate->qword [v45]
              mov     qword [r10]    , rbp            ; load->v41; assign->assignment[dep+1]
              mov     rbp            , 1              ; load->v47; null; save->v47
              mov     r10            , rbx            ; load->v48
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v48
              mov     r10            , rbx            ; load->v48
              mov     r11            , rbp            ; load->v47
              add     r10            , r11            
              mov     rbx            , r10            ; save->v48
_text__print_last_cond_call5:
              mov     rdi            , rbx            ; load->v48; null
              call    _text__print_last_cond                 
              mov     rbp            , 0              ; load->v49; null; save->v49; load->v50; null; save->v50
              mov     r10            , rbx            ; load->v51
              mov     rbx            , [_data_bss_assignment]; null; save->v51
              mov     r12            , 1              ; load->v52; null; save->v52
              mov     r10            , r13            ; load->v53
              mov     r13            , qword [rsp+48] ; load->v6; null; save->v53
              mov     r10            , r13            ; load->v53
              mov     r11            , r12            ; load->v52
              add     r10            , r11            
              mov     r13            , r10            ; save->v53
              mov     r10            , r12            ; load->v54
              mov     r12            , r13            ; load->v53; null; save->v54
              mov     r10            , r12            ; load->v54
              imul    r10            , 8              
              mov     r12            , r10            ; save->v54; load->v54
              add     r10            , 8              
              mov     r12            , r10            ; save->v54; load->v54
              mov     r11            , rbx            ; load->v51
              add     r10            , r11            
              mov     r12            , r10            ; save->v54
              mov     r10            , rbx            ; load->v55
              mov     r11            , r12            ; translate->qword [v54]
              mov     rbx            , qword [r11]    ; null; save->v55
              mov     r10            , r12            ; translate->qword [v54]
              mov     qword [r10]    , rbp            ; load->v50; assign->assignment[dep+1]
              mov     rbp            , 1              ; load->v56; null; save->v56
              mov     r10            , rbx            ; load->v57
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v57
              mov     r10            , rbx            ; load->v57
              mov     r11            , rbp            ; load->v56
              add     r10            , r11            
              mov     rbx            , r10            ; save->v57
_text__print_last_cond_call6:
              mov     rdi            , rbx            ; load->v57; null
              call    _text__print_last_cond                 
              mov     rbp            , rax            ; load->v58; null; save->v58
_text__print_last_cond_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 200            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 344            
;----------------------------------]
;[----------------------------------
_text__main_built_in_call_data_init:
              call    _datainit                       ; protocol required, built_in
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
_text__main_call0:
              call    _text__getInt                   
              mov     rbp            , rax            ; load->v6; null; save->v6
              mov     [_data_bss_k]  , rbp            ; load->v6; null
              mov     rbp            , 2              ; load->v7; null; save->v7
              mov     r10            , rbx            ; load->v8
              mov     rbx            , [_data_bss_k]  ; null; save->v8
              mov     r10            , r12            ; load->v9
              mov     r12            , rbp            ; load->v7; null; save->v9
              mov     r10            , r12            ; load->v9
              mov     r11            , rbx            ; load->v8
              imul    r10            , r11            
              mov     r12            , r10            ; save->v9; load->v9
              and     r10            , -1             
              mov     r12            , r10            ; save->v9
              mov     rbp            , 1              ; load->v10; null; save->v10
              mov     r10            , rbx            ; load->v11
              mov     rbx            , r12            ; load->v9; null; save->v11
              mov     r10            , rbx            ; load->v11
              mov     r11            , rbp            ; load->v10
              add     r10            , r11            
              mov     rbx            , r10            ; save->v11
              mov     [_data_bss_n]  , rbx            ; load->v11; null
              mov     r10            , rbp            ; load->v12
              mov     rbp            , [_data_bss_k]  ; null; save->v12
              mov     [_data_bss_m]  , rbp            ; load->v12; null
              mov     rbp            , 1              ; load->v13; null; save->v13
              mov     [_data_bss_last], rbp            ; load->v13; null
              mov     rbp            , _data_s9       ; load->v14; null; save->v14
_text__main_call1:
              mov     rdi            , rbp            ; load->v14; null
              call    _text__myprint                  
              mov     rbp            , rax            ; load->v15; null; save->v15
              mov     r10            , qword [rsp+48] ; load->v16
              mov     r10            , [_data_bss_m]  
              mov     qword [rsp+48] , r10            ; save->v16
              mov     r10            , qword [rsp+56] ; load->v17
              mov     r10            , qword [rsp+48] ; load->v16; null
              mov     qword [rsp+56] , r10            ; save->v17; load->v17
              imul    r10            , 8              
              mov     qword [rsp+56] , r10            ; save->v17; load->v17
              add     r10            , 8              
              mov     qword [rsp+56] , r10            ; save->v17
              mov     rdi            , qword [rsp+56] ; load->v17; null
              call    malloc                          
              mov     qword [rsp+64] , rax            ; load->v18; null; save->v18
              mov     r11            , qword [rsp+48] ; load->v16
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+64] ; load->v18
              mov     [_data_bss_sat], r11            
_text__main_for0_init:
              mov     rbx            , 0              ; load->v20; null; save->v20
              mov     r10            , rbp            ; load->v19
              mov     rbp            , rbx            ; load->v20; assign->i; save->v19
              mov     r10            , r12            ; load->v21
              mov     r12            , [_data_bss_m]  ; null; save->v21
              mov     r10            , rbp            ; load->v19
              mov     r11            , r12            ; load->v21
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v19
              mov     r10            , r13            ; load->v22
              setl    r10b                            
              mov     r13            , r10            ; save->v22; load->v22
              and     r10            , 255            
              mov     r13            , r10            ; save->v22
_text__main_for0_init_check:
              mov     r10            , r13            ; load->v22
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v22
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
              mov     qword [rsp+72] , 3              ; load->v23; null; save->v23
              mov     r10            , qword [rsp+80] ; load->v24
              mov     r10            , qword [rsp+72] ; load->v23; null
              mov     qword [rsp+80] , r10            ; save->v24; load->v24
              imul    r10            , 8              
              mov     qword [rsp+80] , r10            ; save->v24; load->v24
              add     r10            , 8              
              mov     qword [rsp+80] , r10            ; save->v24
              mov     rdi            , qword [rsp+80] ; load->v24; null
              call    malloc                          
              mov     qword [rsp+88] , rax            ; load->v25; null; save->v25
              mov     r11            , qword [rsp+72] ; load->v23
              mov     qword [rax]    , r11            
              mov     r10            , r14            ; load->v26
              mov     r14            , qword [rsp+88] ; load->v25; init->clause; save->v26
              mov     r10            , r15            ; load->v27
              mov     r15            , [_data_bss_last]; null; save->v27
              mov     qword [rsp+96] , 0              ; load->v28; null; save->v28
              mov     r10            , qword [rsp+104]; load->v29
              mov     r10            , qword [rsp+96] ; load->v28; null
              mov     qword [rsp+104], r10            ; save->v29; load->v29
              imul    r10            , 8              
              mov     qword [rsp+104], r10            ; save->v29; load->v29
              add     r10            , 8              
              mov     qword [rsp+104], r10            ; save->v29; load->v29
              mov     r11            , r14            ; load->v26
              add     r10            , r11            
              mov     qword [rsp+104], r10            ; save->v29
              mov     r10            , qword [rsp+112]; load->v30
              mov     r11            , qword [rsp+104]; translate->qword [v29]
              mov     r10            , qword [r11]    
              mov     qword [rsp+112], r10            ; save->v30
              mov     r10            , qword [rsp+104]; translate->qword [v29]
              mov     qword [r10]    , r15            ; load->v27; assign->clause[0]
              mov     r10            , qword [rsp+120]; load->v31
              mov     r10            , [_data_bss_last]
              mov     qword [rsp+120], r10            ; save->v31
              mov     qword [rsp+128], 1              ; load->v32; null; save->v32
              mov     r10            , qword [rsp+136]; load->v33
              mov     r10            , qword [rsp+120]; load->v31; null
              mov     qword [rsp+136], r10            ; save->v33; load->v33
              mov     r11            , qword [rsp+128]; load->v32
              add     r10            , r11            
              mov     qword [rsp+136], r10            ; save->v33
              mov     qword [rsp+144], 1              ; load->v34; null; save->v34
              mov     r10            , qword [rsp+152]; load->v35
              mov     r10            , qword [rsp+144]; load->v34; null
              mov     qword [rsp+152], r10            ; save->v35; load->v35
              imul    r10            , 8              
              mov     qword [rsp+152], r10            ; save->v35; load->v35
              add     r10            , 8              
              mov     qword [rsp+152], r10            ; save->v35; load->v35
              mov     r11            , r14            ; load->v26
              add     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v35
              mov     r10            , qword [rsp+160]; load->v36
              mov     r11            , qword [rsp+152]; translate->qword [v35]
              mov     r10            , qword [r11]    
              mov     qword [rsp+160], r10            ; save->v36
              mov     r10            , qword [rsp+152]; translate->qword [v35]
              mov     r11            , qword [rsp+136]; load->v33
              mov     qword [r10]    , r11            ; assign->clause[1]
              mov     r10            , qword [rsp+168]; load->v37
              mov     r10            , [_data_bss_last]
              mov     qword [rsp+168], r10            ; save->v37
              mov     qword [rsp+176], 2              ; load->v38; null; save->v38
              mov     r10            , qword [rsp+184]; load->v39
              mov     r10            , qword [rsp+168]; load->v37; null
              mov     qword [rsp+184], r10            ; save->v39; load->v39
              mov     r11            , qword [rsp+176]; load->v38
              add     r10            , r11            
              mov     qword [rsp+184], r10            ; save->v39
              mov     r10            , qword [rsp+192]; load->v40
              mov     r10            , qword [rsp+184]; load->v39; null
              mov     qword [rsp+192], r10            ; save->v40; load->v40
              neg     r10                             
              mov     qword [rsp+192], r10            ; save->v40
              mov     qword [rsp+200], 2              ; load->v41; null; save->v41
              mov     r10            , qword [rsp+208]; load->v42
              mov     r10            , qword [rsp+200]; load->v41; null
              mov     qword [rsp+208], r10            ; save->v42; load->v42
              imul    r10            , 8              
              mov     qword [rsp+208], r10            ; save->v42; load->v42
              add     r10            , 8              
              mov     qword [rsp+208], r10            ; save->v42; load->v42
              mov     r11            , r14            ; load->v26
              add     r10            , r11            
              mov     qword [rsp+208], r10            ; save->v42
              mov     r10            , qword [rsp+216]; load->v43
              mov     r11            , qword [rsp+208]; translate->qword [v42]
              mov     r10            , qword [r11]    
              mov     qword [rsp+216], r10            ; save->v43
              mov     r10            , qword [rsp+208]; translate->qword [v42]
              mov     r11            , qword [rsp+192]; load->v40
              mov     qword [r10]    , r11            ; assign->clause[2]
              mov     r10            , qword [rsp+224]; load->v44
              mov     r10            , [_data_bss_last]
              mov     qword [rsp+224], r10            ; save->v44
              mov     qword [rsp+232], 2              ; load->v45; null; save->v45
              mov     r10            , qword [rsp+240]; load->v46
              mov     r10            , qword [rsp+224]; load->v44; null
              mov     qword [rsp+240], r10            ; save->v46; load->v46
              mov     r11            , qword [rsp+232]; load->v45
              add     r10            , r11            
              mov     qword [rsp+240], r10            ; save->v46
              mov     r11            , qword [rsp+240]; load->v46
              mov     [_data_bss_last], r11            
              mov     r10            , qword [rsp+248]; load->v47
              mov     r10            , [_data_bss_sat]
              mov     qword [rsp+248], r10            ; save->v47
              mov     r10            , qword [rsp+256]; load->v48
              mov     qword [rsp+256], rbp            ; load->v19; null; save->v48
              mov     r10            , qword [rsp+256]; load->v48
              imul    r10            , 8              
              mov     qword [rsp+256], r10            ; save->v48; load->v48
              add     r10            , 8              
              mov     qword [rsp+256], r10            ; save->v48; load->v48
              mov     r11            , qword [rsp+248]; load->v47
              add     r10            , r11            
              mov     qword [rsp+256], r10            ; save->v48
              mov     r10            , qword [rsp+264]; load->v49
              mov     r11            , qword [rsp+256]; translate->qword [v48]
              mov     r10            , qword [r11]    
              mov     qword [rsp+264], r10            ; save->v49
              mov     r10            , qword [rsp+256]; translate->qword [v48]
              mov     qword [r10]    , r14            ; load->v26; assign->sat[i]
_text__main_for0_continue:
              mov     qword [rsp+272], 1              ; load->v50; null; save->v50
              mov     r10            , qword [rsp+280]; load->v51
              mov     qword [rsp+280], rbp            ; load->v19; null; save->v51
              mov     r10            , qword [rsp+280]; load->v51
              mov     r11            , qword [rsp+272]; load->v50
              add     r10            , r11            
              mov     qword [rsp+280], r10            ; save->v51
              mov     r10            , rbp            ; load->v19
              mov     rbp            , qword [rsp+280]; load->v51; assign->i; save->v19
              mov     r10            , qword [rsp+288]; load->v52
              mov     r10            , [_data_bss_m]  
              mov     qword [rsp+288], r10            ; save->v52
              mov     r10            , rbp            ; load->v19
              mov     r11            , qword [rsp+288]; load->v52
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v19
              jl      _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
              mov     r10            , rbp            ; load->v53
              mov     rbp            , [_data_bss_n]  ; null; save->v53
              mov     rbx            , 1              ; load->v54; null; save->v54
              mov     r10            , qword [rsp+296]; load->v55
              mov     qword [rsp+296], rbp            ; load->v53; null; save->v55
              mov     r10            , qword [rsp+296]; load->v55
              mov     r11            , rbx            ; load->v54
              add     r10            , r11            
              mov     qword [rsp+296], r10            ; save->v55
              mov     r10            , qword [rsp+304]; load->v56
              mov     r10            , qword [rsp+296]; load->v55; null
              mov     qword [rsp+304], r10            ; save->v56; load->v56
              imul    r10            , 8              
              mov     qword [rsp+304], r10            ; save->v56; load->v56
              add     r10            , 8              
              mov     qword [rsp+304], r10            ; save->v56
              mov     rdi            , qword [rsp+304]; load->v56; null
              call    malloc                          
              mov     qword [rsp+312], rax            ; load->v57; null; save->v57
              mov     r11            , qword [rsp+296]; load->v55
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+312]; load->v57
              mov     [_data_bss_assignment], r11            
              mov     r10            , rbp            ; load->v58
              mov     rbp            , [_data_bss_n]  ; null; save->v58
              mov     rbx            , 1              ; load->v59; null; save->v59
              mov     r10            , qword [rsp+320]; load->v60
              mov     qword [rsp+320], rbp            ; load->v58; null; save->v60
              mov     r10            , qword [rsp+320]; load->v60
              mov     r11            , rbx            ; load->v59
              add     r10            , r11            
              mov     qword [rsp+320], r10            ; save->v60
              mov     r10            , qword [rsp+328]; load->v61
              mov     r10            , qword [rsp+320]; load->v60; null
              mov     qword [rsp+328], r10            ; save->v61; load->v61
              imul    r10            , 8              
              mov     qword [rsp+328], r10            ; save->v61; load->v61
              add     r10            , 8              
              mov     qword [rsp+328], r10            ; save->v61
              mov     rdi            , qword [rsp+328]; load->v61; null
              call    malloc                          
              mov     qword [rsp+336], rax            ; load->v62; null; save->v62
              mov     r11            , qword [rsp+320]; load->v60
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+336]; load->v62
              mov     [_data_bss_cond_ass], r11            
              mov     rbp            , 0              ; load->v63; null; save->v63
_text__main_call2:
              mov     rdi            , rbp            ; load->v63; null
              call    _text__dfs                      
              mov     rbp            , 0              ; load->v64; null; save->v64; load->v65; null; save->v65
_text__main_call3:
              mov     rdi            , rbp            ; load->v65; null
              call    _text__print_last_cond                 
              mov     rbp            , rax            ; load->v66; null; save->v66
              mov     r10            , rbp            ; load->v67
              mov     rbp            , [_data_bss_myHash]; null; save->v67
_text__main_call4:
              mov     rdi            , rbp            ; load->v67; null
              call    _text__toString                 
              mov     rbp            , rax            ; load->v68; null; save->v68
_text__main_call5:
              mov     rdi            , rbp            ; load->v68; null
              call    _text__println                  
              mov     rbp            , 0              ; load->v69; null; save->v69; load->v70; null; save->v70
_text__main_ret0:
              mov     rax            , rbp            ; load->v70; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 344            
              ret                                     
;----------------------------------]
                                                      
