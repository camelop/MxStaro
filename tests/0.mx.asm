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
_data_s1:
              db      `%s\n`                          
              db      0                               
_data_s0:
              db      `%s`                            
              db      0                               

              section .bss                            
_data_bss_N:
              resb    8                               
_data_bss_M:
              resb    8                               
_data_bss_check:
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
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+48] , rdi            ; null; save->v6
              mov     rbp            , _data_s0       ; null; save->v7
_text__print_call0:
              mov     rdi            , rbp            ; load->v7; null
              mov     rsi            , qword [rsp+48] ; load->v6; null
              call    _text__printf                   
              mov     rbp            , rax            ; null; save->v8
_text__print_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__println ] ---
;[----------------------------------
_text__println:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+48] , rdi            ; null; save->v6
              mov     rbp            , _data_s1       ; null; save->v7
_text__println_call0:
              mov     rdi            , rbp            ; load->v7; null
              mov     rsi            , qword [rsp+48] ; load->v6; null
              call    _text__printf                   
              mov     rbp            , rax            ; null; save->v8
_text__println_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _datainit ] ---
;[----------------------------------
_datainit:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     rbp            , 0              ; null; save->v6
              mov     [_data_bss_M]  , rbp            ; load->v6; null
_datainit_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 168            
;----------------------------------]
;[----------------------------------
_text__main_built_in_call_data_init:
              call    _datainit                       ; protocol required, built_in
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
_text__main_call0:
              call    _text__getInt                   
              mov     rbp            , rax            ; null; save->v6
              mov     [_data_bss_N]  , rbp            ; load->v6; null; null; save->v7
              mov     qword [rsp+48] , rbp            ; load->v7; null; save->v8
              mov     r10            , qword [rsp+48] ; load->v8
              add     r10            , 5              
              mov     qword [rsp+48] , r10            ; save->v8; load->v8; null
              mov     qword [rsp+56] , r10            ; save->v9; load->v9
              sal     r10            , 3              ; from imul
              mov     qword [rsp+56] , r10            ; save->v9; load->v9
              add     r10            , 8              
              mov     qword [rsp+56] , r10            ; save->v9
              mov     rdi            , qword [rsp+56] ; load->v9; null
              call    malloc                          
              mov     qword [rsp+64] , rax            ; null; save->v10
              mov     r11            , qword [rsp+48] ; load->v8
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+64] ; load->v10
              mov     [_data_bss_check], r11            
              mov     rbp            , 0              ; null; save->v11
              mov     qword [rsp+72] , rbp            ; load->v11; init->i; save->v12
_text__main_for0_init:
              mov     rbp            , [_data_bss_N]  ; null; save->v13
              mov     r10            , qword [rsp+72] ; load->v12
              mov     r11            , rbp            ; load->v13
              cmp     r10d           , r11d           
              mov     qword [rsp+72] , r10            ; save->v12
              mov     r10            , rbp            ; load->v14
              setle   r10b                            
              mov     rbp            , r10            ; save->v14; load->v14
              and     r10            , 255            
              mov     rbp            , r10            ; save->v14
_text__main_for0_init_check:
              mov     r10            , rbp            ; load->v14
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v14
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
              mov     rbp            , 255            ; null; save->v15
              mov     rbx            , [_data_bss_check]; null; save->v16
              mov     r12            , qword [rsp+72] ; load->v12; null; save->v17
              mov     r13            , qword [rsp+72] ; load->v12; null; save->v18
              mov     r10            , r13            ; load->v18
              add     r10            , 1              
              mov     r13            , r10            ; save->v18
              mov     qword [rsp+72] , r13            ; load->v18; assign->i; save->v12
              mov     r13            , r12            ; load->v17; null; save->v19
              mov     r10            , r13            ; load->v19
              sal     r10            , 3              ; from imul
              mov     r13            , r10            ; save->v19; load->v19
              add     r10            , 8              
              mov     r13            , r10            ; save->v19; load->v19
              mov     r11            , rbx            ; load->v16
              add     r10            , r11            
              mov     r13            , r10            ; save->v19
              mov     r11            , r13            ; translate->qword [v19]
              mov     rbx            , qword [r11]    ; null; save->v20
              mov     r10            , r13            ; translate->qword [v19]
              mov     qword [r10]    , rbp            ; load->v15; assign->check[i++]
_text__main_for0_continue:
              mov     rbp            , [_data_bss_N]  ; null; save->v21
              mov     r10            , qword [rsp+72] ; load->v12
              mov     r11            , rbp            ; load->v21
              cmp     r10d           , r11d           
              mov     qword [rsp+72] , r10            ; save->v12
              jle     _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
              mov     rbp            , [_data_bss_N]  ; null; save->v22
              mov     qword [rsp+80] , rbp            ; load->v22; null; save->v23
              mov     r10            , qword [rsp+80] ; load->v23
              add     r10            , 5              
              mov     qword [rsp+80] , r10            ; save->v23; load->v23; null
              mov     qword [rsp+88] , r10            ; save->v24; load->v24
              sal     r10            , 3              ; from imul
              mov     qword [rsp+88] , r10            ; save->v24; load->v24
              add     r10            , 8              
              mov     qword [rsp+88] , r10            ; save->v24
              mov     rdi            , qword [rsp+88] ; load->v24; null
              call    malloc                          
              mov     qword [rsp+96] , rax            ; null; save->v25
              mov     r11            , qword [rsp+80] ; load->v23
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+96] ; load->v25; init->phi
              mov     qword [rsp+104], r10            ; save->v26
              mov     rbp            , [_data_bss_N]  ; null; save->v27
              mov     qword [rsp+112], rbp            ; load->v27; null; save->v28
              mov     r10            , qword [rsp+112]; load->v28
              add     r10            , 5              
              mov     qword [rsp+112], r10            ; save->v28; load->v28; null
              mov     qword [rsp+120], r10            ; save->v29; load->v29
              sal     r10            , 3              ; from imul
              mov     qword [rsp+120], r10            ; save->v29; load->v29
              add     r10            , 8              
              mov     qword [rsp+120], r10            ; save->v29
              mov     rdi            , qword [rsp+120]; load->v29; null
              call    malloc                          
              mov     qword [rsp+128], rax            ; null; save->v30
              mov     r11            , qword [rsp+112]; load->v28
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+128]; load->v30; init->P
              mov     qword [rsp+136], r10            ; save->v31
              mov     rbp            , 1              ; null; save->v32
              mov     rbx            , 1              ; null; save->v33
              mov     r12            , rbx            ; load->v33; null; save->v34
              mov     r10            , r12            ; load->v34
              sal     r10            , 3              ; from imul
              mov     r12            , r10            ; save->v34; load->v34
              add     r10            , 8              
              mov     r12            , r10            ; save->v34; load->v34
              mov     r11            , qword [rsp+104]; load->v26
              add     r10            , r11            
              mov     r12            , r10            ; save->v34
              mov     r11            , r12            ; translate->qword [v34]
              mov     rbx            , qword [r11]    ; null; save->v35
              mov     r10            , r12            ; translate->qword [v34]
              mov     qword [r10]    , rbp            ; load->v32; assign->phi[1]
_text__main_for1_init:
              mov     rbp            , 2              ; null; save->v36
              mov     qword [rsp+72] , rbp            ; load->v36; assign->i; save->v12
              mov     rbp            , 255            ; null; save->v37
_text__main_for1_init_check:
              mov     r10            , rbp            ; load->v37
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v37
              je      _text__main_for1_end                 
;----------------------------------]
;[----------------------------------
_text__main_for1_start:
_text__main_if0_init:
              mov     rbp            , [_data_bss_N]  ; null; save->v38
_text__main_if0_check:
              mov     r10            , qword [rsp+72] ; load->v12
              mov     r11            , rbp            ; load->v38
              cmp     r10d           , r11d           
              mov     qword [rsp+72] , r10            ; save->v12
              jle     _text__main_if0_else                 
;----------------------------------]
;[----------------------------------
_text__main_if0_start:
_text__main_for1_break0:
              jmp     _text__main_for1_end                 
;----------------------------------]
;[----------------------------------
_text__main_if0_else:
_text__main_if0_end:
_text__main_if1_init:
              mov     rbp            , [_data_bss_check]; null; save->v39
              mov     rbx            , qword [rsp+72] ; load->v12; null; save->v40
              mov     r10            , rbx            ; load->v40
              sal     r10            , 3              ; from imul
              mov     rbx            , r10            ; save->v40; load->v40
              add     r10            , 8              
              mov     rbx            , r10            ; save->v40; load->v40
              mov     r11            , rbp            ; load->v39
              add     r10            , r11            
              mov     rbx            , r10            ; save->v40
              mov     r11            , rbx            ; translate->qword [v40]
              mov     rbp            , qword [r11]    ; null; save->v41
_text__main_if1_check:
              mov     r10            , rbp            ; load->v41
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v41
              je      _text__main_if1_else                 
;----------------------------------]
;[----------------------------------
_text__main_if1_start:
              mov     rbp            , [_data_bss_M]  ; null; save->v42
              mov     rbp            , [_data_bss_M]  ; null; save->v43
              mov     rbx            , rbp            ; load->v43; null; save->v44
              mov     r10            , rbx            ; load->v44
              add     r10            , 1              
              mov     rbx            , r10            ; save->v44
              mov     [_data_bss_M]  , rbx            ; load->v44; null
              mov     rbp            , rbx            ; load->v44; null; save->v45
              mov     r10            , rbp            ; load->v45
              sal     r10            , 3              ; from imul
              mov     rbp            , r10            ; save->v45; load->v45
              add     r10            , 8              
              mov     rbp            , r10            ; save->v45; load->v45
              mov     r11            , qword [rsp+136]; load->v31
              add     r10            , r11            
              mov     rbp            , r10            ; save->v45
              mov     r11            , rbp            ; translate->qword [v45]
              mov     rbx            , qword [r11]    ; null; save->v46
              mov     r10            , rbp            ; translate->qword [v45]
              mov     r11            , qword [rsp+72] ; load->v12
              mov     qword [r10]    , r11            ; assign->P[++M]
              mov     rbp            , 1              ; null; save->v47
              mov     rbx            , qword [rsp+72] ; load->v12; null; save->v48
              mov     r10            , rbx            ; load->v48
              mov     r11            , rbp            ; load->v47
              sub     r10            , r11            
              mov     rbx            , r10            ; save->v48
              mov     rbp            , qword [rsp+72] ; load->v12; null; save->v49
              mov     r10            , rbp            ; load->v49
              sal     r10            , 3              ; from imul
              mov     rbp            , r10            ; save->v49; load->v49
              add     r10            , 8              
              mov     rbp            , r10            ; save->v49; load->v49
              mov     r11            , qword [rsp+104]; load->v26
              add     r10            , r11            
              mov     rbp            , r10            ; save->v49
              mov     r11            , rbp            ; translate->qword [v49]
              mov     r12            , qword [r11]    ; null; save->v50
              mov     r10            , rbp            ; translate->qword [v49]
              mov     qword [r10]    , rbx            ; load->v48; assign->phi[i]
              jmp     _text__main_if1_end                 
;----------------------------------]
;[----------------------------------
_text__main_if1_else:
_text__main_if1_end:
              mov     r10            , qword [rsp+72] ; load->v12; init->k
              mov     qword [rsp+144], r10            ; save->v51
_text__main_for2_init:
              mov     rbp            , 1              ; null; save->v53
              mov     qword [rsp+152], rbp            ; load->v53; assign->i; save->v52
_text__main_and0_lvalue:
              mov     rbp            , 0              ; null; save->v54
              mov     rbx            , [_data_bss_M]  ; null; save->v55
              mov     r10            , qword [rsp+152]; load->v52
              mov     r11            , rbx            ; load->v55
              cmp     r10d           , r11d           
              mov     qword [rsp+152], r10            ; save->v52
              mov     r10            , rbx            ; load->v56
              setle   r10b                            
              mov     rbx            , r10            ; save->v56; load->v56
              and     r10            , 255            
              mov     rbx            , r10            ; save->v56; load->v56
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v56
              je      _text__main_and0_end                 
;----------------------------------]
;[----------------------------------
_text__main_and0_rvalue:
              mov     rbx            , qword [rsp+152]; load->v52; null; save->v57
              mov     r10            , rbx            ; load->v57
              sal     r10            , 3              ; from imul
              mov     rbx            , r10            ; save->v57; load->v57
              add     r10            , 8              
              mov     rbx            , r10            ; save->v57; load->v57
              mov     r11            , qword [rsp+136]; load->v31
              add     r10            , r11            
              mov     rbx            , r10            ; save->v57
              mov     r11            , rbx            ; translate->qword [v57]
              mov     r12            , qword [r11]    ; null; save->v58
              mov     rbx            , qword [rsp+144]; load->v51; null; save->v59
              mov     r10            , rbx            ; load->v59
              mov     r11            , r12            ; load->v58
              imul    r10            , r11            
              mov     rbx            , r10            ; save->v59; load->v59
              and     r10            , -1             
              mov     rbx            , r10            ; save->v59
              mov     r12            , [_data_bss_N]  ; null; save->v60
              mov     r10            , rbx            ; load->v59
              mov     r11            , r12            ; load->v60
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v59; load->v61
              setle   r10b                            
              mov     rbx            , r10            ; save->v61; load->v61
              and     r10            , 255            
              mov     rbx            , r10            ; save->v61; load->v61
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v61
              je      _text__main_and0_end                 
              mov     rbp            , 255            ; null; save->v54
_text__main_and0_end:
_text__main_for2_init_check:
              mov     r10            , rbp            ; load->v54
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v54
              je      _text__main_for2_end                 
;----------------------------------]
;[----------------------------------
_text__main_for2_start:
              mov     rbp            , qword [rsp+152]; load->v52; null; save->v62
              mov     r10            , rbp            ; load->v62
              sal     r10            , 3              ; from imul
              mov     rbp            , r10            ; save->v62; load->v62
              add     r10            , 8              
              mov     rbp            , r10            ; save->v62; load->v62
              mov     r11            , qword [rsp+136]; load->v31
              add     r10            , r11            
              mov     rbp            , r10            ; save->v62
              mov     r11            , rbp            ; translate->qword [v62]
              mov     rbx            , qword [r11]    ; null; save->v63
              mov     rbp            , qword [rsp+144]; load->v51; null; save->v64
              mov     r10            , rbp            ; load->v64
              mov     r11            , rbx            ; load->v63
              imul    r10            , r11            
              mov     rbp            , r10            ; save->v64; load->v64
              and     r10            , -1             
              mov     rbp            , r10            ; save->v64
              mov     qword [rsp+160], rbp            ; load->v64; init->tmp; save->v65
_text__main_if2_init:
              mov     rbp            , [_data_bss_N]  ; null; save->v66
_text__main_if2_check:
              mov     r10            , qword [rsp+160]; load->v65
              mov     r11            , rbp            ; load->v66
              cmp     r10d           , r11d           
              mov     qword [rsp+160], r10            ; save->v65
              jle     _text__main_if2_else                 
;----------------------------------]
;[----------------------------------
_text__main_if2_start:
_text__main_for2_continue0:
              jmp     _text__main_for2_continue                 
;----------------------------------]
;[----------------------------------
_text__main_if2_else:
_text__main_if2_end:
              mov     rbp            , 0              ; null; save->v67
              mov     rbx            , [_data_bss_check]; null; save->v68
              mov     r12            , qword [rsp+160]; load->v65; null; save->v69
              mov     r10            , r12            ; load->v69
              sal     r10            , 3              ; from imul
              mov     r12            , r10            ; save->v69; load->v69
              add     r10            , 8              
              mov     r12            , r10            ; save->v69; load->v69
              mov     r11            , rbx            ; load->v68
              add     r10            , r11            
              mov     r12            , r10            ; save->v69
              mov     r11            , r12            ; translate->qword [v69]
              mov     rbx            , qword [r11]    ; null; save->v70
              mov     r10            , r12            ; translate->qword [v69]
              mov     qword [r10]    , rbp            ; load->v67; assign->check[tmp]
_text__main_if3_init:
              mov     rbp            , qword [rsp+152]; load->v52; null; save->v71
              mov     r10            , rbp            ; load->v71
              sal     r10            , 3              ; from imul
              mov     rbp            , r10            ; save->v71; load->v71
              add     r10            , 8              
              mov     rbp            , r10            ; save->v71; load->v71
              mov     r11            , qword [rsp+136]; load->v31
              add     r10            , r11            
              mov     rbp            , r10            ; save->v71
              mov     r11            , rbp            ; translate->qword [v71]
              mov     rbx            , qword [r11]    ; null; save->v72
              mov     rbp            , rdx            ; null; save->v74
              mov     r12            , rax            ; null; save->v75
              mov     rax            , qword [rsp+144]; load->v51; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v72
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v72
              cqo                                     
              mov     r10            , rbx            ; load->v72
              idiv    r10d                            
              mov     rbx            , rdx            ; save->v72; null; save->v73
              mov     rdx            , rbp            ; load->v74; null
              mov     rax            , r12            ; load->v75; null
              mov     rbp            , 0              ; null; save->v76
              mov     r10            , rbx            ; load->v73
              mov     r11            , rbp            ; load->v76
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v73
              mov     r10            , rbp            ; load->v77
              sete    r10b                            
              mov     rbp            , r10            ; save->v77; load->v77
              and     r10            , 255            
              mov     rbp            , r10            ; save->v77
_text__main_if3_check:
              mov     r10            , rbp            ; load->v77
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v77
              je      _text__main_if3_else                 
;----------------------------------]
;[----------------------------------
_text__main_if3_start:
              mov     rbp            , qword [rsp+144]; load->v51; null; save->v78
              mov     r10            , rbp            ; load->v78
              sal     r10            , 3              ; from imul
              mov     rbp            , r10            ; save->v78; load->v78
              add     r10            , 8              
              mov     rbp            , r10            ; save->v78; load->v78
              mov     r11            , qword [rsp+104]; load->v26
              add     r10            , r11            
              mov     rbp            , r10            ; save->v78
              mov     r11            , rbp            ; translate->qword [v78]
              mov     rbx            , qword [r11]    ; null; save->v79
              mov     rbp            , qword [rsp+152]; load->v52; null; save->v80
              mov     r10            , rbp            ; load->v80
              sal     r10            , 3              ; from imul
              mov     rbp            , r10            ; save->v80; load->v80
              add     r10            , 8              
              mov     rbp            , r10            ; save->v80; load->v80
              mov     r11            , qword [rsp+136]; load->v31
              add     r10            , r11            
              mov     rbp            , r10            ; save->v80
              mov     r11            , rbp            ; translate->qword [v80]
              mov     r12            , qword [r11]    ; null; save->v81
              mov     rbp            , rbx            ; load->v79; null; save->v82
              mov     r10            , rbp            ; load->v82
              mov     r11            , r12            ; load->v81
              imul    r10            , r11            
              mov     rbp            , r10            ; save->v82; load->v82
              and     r10            , -1             
              mov     rbp            , r10            ; save->v82
              mov     rbx            , qword [rsp+160]; load->v65; null; save->v83
              mov     r10            , rbx            ; load->v83
              sal     r10            , 3              ; from imul
              mov     rbx            , r10            ; save->v83; load->v83
              add     r10            , 8              
              mov     rbx            , r10            ; save->v83; load->v83
              mov     r11            , qword [rsp+104]; load->v26
              add     r10            , r11            
              mov     rbx            , r10            ; save->v83
              mov     r11            , rbx            ; translate->qword [v83]
              mov     r12            , qword [r11]    ; null; save->v84
              mov     r10            , rbx            ; translate->qword [v83]
              mov     qword [r10]    , rbp            ; load->v82; assign->phi[tmp]
_text__main_for2_break1:
              jmp     _text__main_for2_end                 
;----------------------------------]
;[----------------------------------
_text__main_if3_else:
              mov     rbp            , qword [rsp+144]; load->v51; null; save->v85
              mov     r10            , rbp            ; load->v85
              sal     r10            , 3              ; from imul
              mov     rbp            , r10            ; save->v85; load->v85
              add     r10            , 8              
              mov     rbp            , r10            ; save->v85; load->v85
              mov     r11            , qword [rsp+104]; load->v26
              add     r10            , r11            
              mov     rbp            , r10            ; save->v85
              mov     r11            , rbp            ; translate->qword [v85]
              mov     rbx            , qword [r11]    ; null; save->v86
              mov     rbp            , qword [rsp+152]; load->v52; null; save->v87
              mov     r10            , rbp            ; load->v87
              sal     r10            , 3              ; from imul
              mov     rbp            , r10            ; save->v87; load->v87
              add     r10            , 8              
              mov     rbp            , r10            ; save->v87; load->v87
              mov     r11            , qword [rsp+136]; load->v31
              add     r10            , r11            
              mov     rbp            , r10            ; save->v87
              mov     r11            , rbp            ; translate->qword [v87]
              mov     r12            , qword [r11]    ; null; save->v88
              mov     rbp            , 1              ; null; save->v89
              mov     r13            , r12            ; load->v88; null; save->v90
              mov     r10            , r13            ; load->v90
              mov     r11            , rbp            ; load->v89
              sub     r10            , r11            
              mov     r13            , r10            ; save->v90
              mov     rbp            , rbx            ; load->v86; null; save->v91
              mov     r10            , rbp            ; load->v91
              mov     r11            , r13            ; load->v90
              imul    r10            , r11            
              mov     rbp            , r10            ; save->v91; load->v91
              and     r10            , -1             
              mov     rbp            , r10            ; save->v91
              mov     rbx            , qword [rsp+152]; load->v52; null; save->v92
              mov     r10            , rbx            ; load->v92
              sal     r10            , 3              ; from imul
              mov     rbx            , r10            ; save->v92; load->v92
              add     r10            , 8              
              mov     rbx            , r10            ; save->v92; load->v92
              mov     r11            , qword [rsp+136]; load->v31
              add     r10            , r11            
              mov     rbx            , r10            ; save->v92
              mov     r11            , rbx            ; translate->qword [v92]
              mov     r12            , qword [r11]    ; null; save->v93
              mov     rbx            , qword [rsp+144]; load->v51; null; save->v94
              mov     r10            , rbx            ; load->v94
              mov     r11            , r12            ; load->v93
              imul    r10            , r11            
              mov     rbx            , r10            ; save->v94; load->v94
              and     r10            , -1             
              mov     rbx            , r10            ; save->v94
              mov     r12            , rbx            ; load->v94; null; save->v95
              mov     r10            , r12            ; load->v95
              sal     r10            , 3              ; from imul
              mov     r12            , r10            ; save->v95; load->v95
              add     r10            , 8              
              mov     r12            , r10            ; save->v95; load->v95
              mov     r11            , qword [rsp+104]; load->v26
              add     r10            , r11            
              mov     r12            , r10            ; save->v95
              mov     r11            , r12            ; translate->qword [v95]
              mov     rbx            , qword [r11]    ; null; save->v96
              mov     r10            , r12            ; translate->qword [v95]
              mov     qword [r10]    , rbp            ; load->v91; assign->phi[k*P[i]]
_text__main_if3_end:
_text__main_for2_continue:
              mov     rbp            , qword [rsp+152]; load->v52; null; save->v97
              mov     rbp            , qword [rsp+152]; load->v52; null; save->v98
              mov     r10            , rbp            ; load->v98
              add     r10            , 1              
              mov     rbp            , r10            ; save->v98
              mov     qword [rsp+152], rbp            ; load->v98; assign->i; save->v52
_text__main_and1_lvalue:
              mov     rbp            , 0              ; null; save->v99
              mov     rbx            , [_data_bss_M]  ; null; save->v100
              mov     r10            , qword [rsp+152]; load->v52
              mov     r11            , rbx            ; load->v100
              cmp     r10d           , r11d           
              mov     qword [rsp+152], r10            ; save->v52
              mov     r10            , rbx            ; load->v101
              setle   r10b                            
              mov     rbx            , r10            ; save->v101; load->v101
              and     r10            , 255            
              mov     rbx            , r10            ; save->v101; load->v101
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v101
              je      _text__main_and1_end                 
;----------------------------------]
;[----------------------------------
_text__main_and1_rvalue:
              mov     rbx            , qword [rsp+152]; load->v52; null; save->v102
              mov     r10            , rbx            ; load->v102
              sal     r10            , 3              ; from imul
              mov     rbx            , r10            ; save->v102; load->v102
              add     r10            , 8              
              mov     rbx            , r10            ; save->v102; load->v102
              mov     r11            , qword [rsp+136]; load->v31
              add     r10            , r11            
              mov     rbx            , r10            ; save->v102
              mov     r11            , rbx            ; translate->qword [v102]
              mov     r12            , qword [r11]    ; null; save->v103
              mov     rbx            , qword [rsp+144]; load->v51; null; save->v104
              mov     r10            , rbx            ; load->v104
              mov     r11            , r12            ; load->v103
              imul    r10            , r11            
              mov     rbx            , r10            ; save->v104; load->v104
              and     r10            , -1             
              mov     rbx            , r10            ; save->v104
              mov     r12            , [_data_bss_N]  ; null; save->v105
              mov     r10            , rbx            ; load->v104
              mov     r11            , r12            ; load->v105
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v104; load->v106
              setle   r10b                            
              mov     rbx            , r10            ; save->v106; load->v106
              and     r10            , 255            
              mov     rbx            , r10            ; save->v106; load->v106
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v106
              je      _text__main_and1_end                 
              mov     rbp            , 255            ; null; save->v99
_text__main_and1_end:
              mov     r10            , rbp            ; load->v99
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v99
              jne     _text__main_for2_start                 
;----------------------------------]
;[----------------------------------
_text__main_for2_end:
              mov     rbp            , qword [rsp+144]; load->v51; null; save->v107
              mov     r10            , rbp            ; load->v107
              sal     r10            , 3              ; from imul
              mov     rbp            , r10            ; save->v107; load->v107
              add     r10            , 8              
              mov     rbp            , r10            ; save->v107; load->v107
              mov     r11            , qword [rsp+104]; load->v26
              add     r10            , r11            
              mov     rbp            , r10            ; save->v107
              mov     r11            , rbp            ; translate->qword [v107]
              mov     rbx            , qword [r11]    ; null; save->v108
_text__main_call1:
              mov     rdi            , rbx            ; load->v108; null
              call    _text__toString                 
              mov     rbp            , rax            ; null; save->v109
_text__main_call2:
              mov     rdi            , rbp            ; load->v109; null
              call    _text__println                  
              mov     rbp            , rax            ; null; save->v110
_text__main_for1_continue:
              mov     rbp            , qword [rsp+72] ; load->v12; null; save->v111
              mov     r10            , rbp            ; load->v111
              add     r10            , 1              
              mov     rbp            , r10            ; save->v111
              mov     qword [rsp+72] , rbp            ; load->v111; assign->i; save->v12
              mov     rbp            , 255            ; null; save->v112
              mov     r10            , rbp            ; load->v112
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v112
              jne     _text__main_for1_start                 
;----------------------------------]
;[----------------------------------
_text__main_for1_end:
              mov     rbp            , 0              ; null; save->v113
_text__main_ret0:
              mov     rax            , rbp            ; load->v113; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 168            
              ret                                     
;----------------------------------]
                                                      
