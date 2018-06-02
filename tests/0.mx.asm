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
_data_s2:
              db      ` `                             
              db      0                               
_data_s3:
              db      0                               
_data_s5:
              db      `Let's start!`                  
              db      0                               
_data_s1:
              db      `%s\n`                          
              db      0                               
_data_s7:
              db      ` step(s)`                      
              db      0                               
_data_s4:
              db      `Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i`                 
              db      0                               
_data_s0:
              db      `%s`                            
              db      0                               
_data_s6:
              db      `Total: `                       
              db      0                               

              section .bss                            
_data_bss_n:
              resb    8                               
_data_bss_h:
              resb    8                               
_data_bss_now:
              resb    8                               
_data_bss_a:
              resb    8                               
_data_bss_A:
              resb    8                               
_data_bss_M:
              resb    8                               
_data_bss_Q:
              resb    8                               
_data_bss_R:
              resb    8                               
_data_bss_seed:
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
              mov     rdi            , 512            
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
              mov     rdi            , 512            
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
              sub     rsp            , 72             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
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
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 72             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__println ] ---
;[----------------------------------
_text__println:
              sub     rsp            , 72             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
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
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 72             
              ret                                     
;----------------------------------]
                                                      
; --- [ _datainit ] ---
;[----------------------------------
_datainit:
              sub     rsp            , 72             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbp            , 48271          ; load->v6; null; save->v6
              mov     [_data_bss_A]  , rbp            ; load->v6; null
              mov     rbp            , 2147483647     ; load->v7; null; save->v7
              mov     [_data_bss_M]  , rbp            ; load->v7; null
              mov     rbp            , 1              ; load->v8; null; save->v8
              mov     [_data_bss_seed], rbp            ; load->v8; null
_datainit_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 72             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__random ] ---
;[----------------------------------
_text__random:
              sub     rsp            , 216            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     r10            , rbp            ; load->v6
              mov     rbp            , [_data_bss_A]  ; null; save->v6
              mov     r10            , rbx            ; load->v7
              mov     rbx            , [_data_bss_seed]; null; save->v7
              mov     r10            , r12            ; load->v8
              mov     r12            , [_data_bss_Q]  ; null; save->v8
              mov     r13            , rdx            ; load->v10; null; save->v10
              mov     r14            , rax            ; load->v11; null; save->v11
              mov     rax            , rbx            ; load->v7; null
              and     rax            , -1             
              mov     r10            , r12            ; load->v8
              and     r10d           , -1             
              mov     r12            , r10            ; save->v8
              cqo                                     
              mov     r10            , r12            ; load->v8
              idiv    r10d                            
              mov     r12            , r10            ; save->v8
              mov     rbx            , rdx            ; load->v9; null; save->v9
              mov     rdx            , r13            ; load->v10; null
              mov     rax            , r14            ; load->v11; null
              mov     r10            , r12            ; load->v12
              mov     r12            , rbp            ; load->v6; null; save->v12
              mov     r10            , r12            ; load->v12
              mov     r11            , rbx            ; load->v9
              imul    r10            , r11            
              mov     r12            , r10            ; save->v12; load->v12
              and     r10            , -1             
              mov     r12            , r10            ; save->v12
              mov     r10            , rbp            ; load->v13
              mov     rbp            , [_data_bss_R]  ; null; save->v13
              mov     r10            , rbx            ; load->v14
              mov     rbx            , [_data_bss_seed]; null; save->v14
              mov     r10            , r13            ; load->v15
              mov     r13            , [_data_bss_Q]  ; null; save->v15
              mov     r14            , rdx            ; load->v17; null; save->v17
              mov     r15            , rax            ; load->v18; null; save->v18
              mov     rax            , rbx            ; load->v14; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v15
              and     r10d           , -1             
              mov     r13            , r10            ; save->v15
              cqo                                     
              mov     r10            , r13            ; load->v15
              idiv    r10d                            
              mov     r13            , r10            ; save->v15
              mov     rbx            , rax            ; load->v16; null; save->v16
              mov     rdx            , r14            ; load->v17; null
              mov     rax            , r15            ; load->v18; null
              mov     r10            , r13            ; load->v19
              mov     r13            , rbp            ; load->v13; null; save->v19
              mov     r10            , r13            ; load->v19
              mov     r11            , rbx            ; load->v16
              imul    r10            , r11            
              mov     r13            , r10            ; save->v19; load->v19
              and     r10            , -1             
              mov     r13            , r10            ; save->v19
              mov     r10            , rbp            ; load->v20
              mov     rbp            , r12            ; load->v12; null; save->v20
              mov     r10            , rbp            ; load->v20
              mov     r11            , r13            ; load->v19
              sub     r10            , r11            
              mov     rbp            , r10            ; save->v20
              mov     r10            , rbx            ; load->v21
              mov     rbx            , rbp            ; load->v20; init->tempseed; save->v21
_text__random_if0_init:
              mov     rbp            , 0              ; load->v22; null; save->v22
              mov     r10            , rbx            ; load->v21
              mov     r11            , rbp            ; load->v22
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v21
              mov     r10            , rbp            ; load->v23
              setge   r10b                            
              mov     rbp            , r10            ; save->v23; load->v23
              and     r10            , 255            
              mov     rbp            , r10            ; save->v23
_text__random_if0_check:
              mov     r10            , rbp            ; load->v23
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v23
              je      _text__random_if0_else                 
;----------------------------------]
;[----------------------------------
_text__random_if0_start:
              mov     [_data_bss_seed], rbx            ; load->v21; null
              jmp     _text__random_if0_end                 
;----------------------------------]
;[----------------------------------
_text__random_if0_else:
              mov     r10            , rbp            ; load->v24
              mov     rbp            , [_data_bss_M]  ; null; save->v24
              mov     r10            , r12            ; load->v25
              mov     r12            , rbx            ; load->v21; null; save->v25
              mov     r10            , r12            ; load->v25
              mov     r11            , rbp            ; load->v24
              add     r10            , r11            
              mov     r12            , r10            ; save->v25
              mov     [_data_bss_seed], r12            ; load->v25; null
_text__random_if0_end:
              mov     r10            , rbp            ; load->v26
              mov     rbp            , [_data_bss_seed]; null; save->v26
_text__random_ret0:
              mov     rax            , rbp            ; load->v26; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 216            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__initialize ] ---
;[----------------------------------
_text__initialize:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbp            , rdi            ; load->v6; null; save->v6
              mov     [_data_bss_seed], rbp            ; load->v6; null
_text__initialize_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__swap ] ---
;[----------------------------------
_text__swap:
              sub     rsp            , 168            
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
              mov     r10            , r12            ; load->v8
              mov     r12            , [_data_bss_a]  ; null; save->v8
              mov     r10            , r13            ; load->v9
              mov     r13            , rbp            ; load->v6; null; save->v9
              mov     r10            , r13            ; load->v9
              imul    r10            , 8              
              mov     r13            , r10            ; save->v9; load->v9
              add     r10            , 8              
              mov     r13            , r10            ; save->v9; load->v9
              mov     r11            , r12            ; load->v8
              add     r10            , r11            
              mov     r13            , r10            ; save->v9
              mov     r10            , r12            ; load->v10
              mov     r11            , r13            ; translate->qword [v9]
              mov     r12            , qword [r11]    ; null; save->v10
              mov     r10            , r13            ; load->v11
              mov     r13            , r12            ; load->v10; init->temp; save->v11
              mov     r10            , r12            ; load->v12
              mov     r12            , [_data_bss_a]  ; null; save->v12
              mov     r10            , r14            ; load->v13
              mov     r14            , rbx            ; load->v7; null; save->v13
              mov     r10            , r14            ; load->v13
              imul    r10            , 8              
              mov     r14            , r10            ; save->v13; load->v13
              add     r10            , 8              
              mov     r14            , r10            ; save->v13; load->v13
              mov     r11            , r12            ; load->v12
              add     r10            , r11            
              mov     r14            , r10            ; save->v13
              mov     r10            , r12            ; load->v14
              mov     r11            , r14            ; translate->qword [v13]
              mov     r12            , qword [r11]    ; null; save->v14
              mov     r10            , r14            ; load->v15
              mov     r14            , [_data_bss_a]  ; null; save->v15
              mov     r10            , r15            ; load->v16
              mov     r15            , rbp            ; load->v6; null; save->v16
              mov     r10            , r15            ; load->v16
              imul    r10            , 8              
              mov     r15            , r10            ; save->v16; load->v16
              add     r10            , 8              
              mov     r15            , r10            ; save->v16; load->v16
              mov     r11            , r14            ; load->v15
              add     r10            , r11            
              mov     r15            , r10            ; save->v16
              mov     r10            , rbp            ; load->v17
              mov     r11            , r15            ; translate->qword [v16]
              mov     rbp            , qword [r11]    ; null; save->v17
              mov     r10            , r15            ; translate->qword [v16]
              mov     qword [r10]    , r12            ; load->v14; assign->a[x]
              mov     r10            , rbp            ; load->v18
              mov     rbp            , [_data_bss_a]  ; null; save->v18
              mov     r10            , r12            ; load->v19
              mov     r12            , rbx            ; load->v7; null; save->v19
              mov     r10            , r12            ; load->v19
              imul    r10            , 8              
              mov     r12            , r10            ; save->v19; load->v19
              add     r10            , 8              
              mov     r12            , r10            ; save->v19; load->v19
              mov     r11            , rbp            ; load->v18
              add     r10            , r11            
              mov     r12            , r10            ; save->v19
              mov     r10            , rbp            ; load->v20
              mov     r11            , r12            ; translate->qword [v19]
              mov     rbp            , qword [r11]    ; null; save->v20
              mov     r10            , r12            ; translate->qword [v19]
              mov     qword [r10]    , r13            ; load->v11; assign->a[y]
_text__swap_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 168            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__pd ] ---
;[----------------------------------
_text__pd:
              sub     rsp            , 216            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbp            , rdi            ; load->v6; null; save->v6
_text__pd_for0_init:
              mov     r10            , rbx            ; load->v7
              mov     rbx            , [_data_bss_h]  ; null; save->v7
              mov     r10            , rbx            ; load->v7
              mov     r11            , rbp            ; load->v6
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v7
              mov     r10            , r12            ; load->v8
              setle   r10b                            
              mov     r12            , r10            ; save->v8; load->v8
              and     r10            , 255            
              mov     r12            , r10            ; save->v8
_text__pd_for0_init_check:
              mov     r10            , r12            ; load->v8
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v8
              je      _text__pd_for0_end                 
;----------------------------------]
;[----------------------------------
_text__pd_for0_start:
_text__pd_if0_init:
              mov     r10            , r13            ; load->v9
              mov     r13            , [_data_bss_h]  ; null; save->v9
              mov     r10            , r14            ; load->v10
              mov     r14            , [_data_bss_h]  ; null; save->v10
              mov     r15            , 1              ; load->v11; null; save->v11
              mov     r10            , qword [rsp+96] ; load->v12
              mov     qword [rsp+96] , r14            ; load->v10; null; save->v12
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , r15            ; load->v11
              add     r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+104]; load->v13
              mov     qword [rsp+104], r13            ; load->v9; null; save->v13
              mov     r10            , qword [rsp+104]; load->v13
              mov     r11            , qword [rsp+96] ; load->v12
              imul    r10            , r11            
              mov     qword [rsp+104], r10            ; save->v13; load->v13
              and     r10            , -1             
              mov     qword [rsp+104], r10            ; save->v13
              mov     qword [rsp+112], 2              ; load->v14; null; save->v14
              mov     qword [rsp+128], rdx            ; load->v16; null; save->v16
              mov     qword [rsp+136], rax            ; load->v17; null; save->v17
              mov     rax            , qword [rsp+104]; load->v13; null
              and     rax            , -1             
              mov     r10            , qword [rsp+112]; load->v14
              and     r10d           , -1             
              mov     qword [rsp+112], r10            ; save->v14
              cqo                                     
              mov     r10            , qword [rsp+112]; load->v14
              idiv    r10d                            
              mov     qword [rsp+112], r10            ; save->v14
              mov     qword [rsp+120], rax            ; load->v15; null; save->v15
              mov     rdx            , qword [rsp+128]; load->v16; null
              mov     rax            , qword [rsp+136]; load->v17; null
              mov     r10            , rbp            ; load->v6
              mov     r11            , qword [rsp+120]; load->v15
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v6
              mov     r10            , qword [rsp+144]; load->v18
              sete    r10b                            
              mov     qword [rsp+144], r10            ; save->v18; load->v18
              and     r10            , 255            
              mov     qword [rsp+144], r10            ; save->v18
_text__pd_if0_check:
              mov     r10            , qword [rsp+144]; load->v18
              cmp     r10b           , 0              
              mov     qword [rsp+144], r10            ; save->v18
              je      _text__pd_if0_else                 
;----------------------------------]
;[----------------------------------
_text__pd_if0_start:
              mov     qword [rsp+152], 255            ; load->v19; null; save->v19
_text__pd_ret0:
              mov     rax            , qword [rsp+152]; load->v19; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 216            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__pd_if0_else:
_text__pd_if0_end:
_text__pd_for0_continue:
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+168]; load->v21
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+168], r10            ; save->v21
              mov     qword [rsp+176], 1              ; load->v22; null; save->v22
              mov     r10            , qword [rsp+184]; load->v23
              mov     r10            , qword [rsp+168]; load->v21; null
              mov     qword [rsp+184], r10            ; save->v23; load->v23
              mov     r11            , qword [rsp+176]; load->v22
              add     r10            , r11            
              mov     qword [rsp+184], r10            ; save->v23
              mov     r11            , qword [rsp+184]; load->v23
              mov     [_data_bss_h]  , r11            
              mov     r10            , qword [rsp+192]; load->v24
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+192], r10            ; save->v24; load->v24
              mov     r11            , rbp            ; load->v6
              cmp     r10d           , r11d           
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+200]; load->v25
              setle   r10b                            
              mov     qword [rsp+200], r10            ; save->v25; load->v25
              and     r10            , 255            
              mov     qword [rsp+200], r10            ; save->v25; load->v25
              cmp     r10b           , 0              
              mov     qword [rsp+200], r10            ; save->v25
              jne     _text__pd_for0_start                 
;----------------------------------]
;[----------------------------------
_text__pd_for0_end:
              mov     rbp            , 0              ; load->v26; null; save->v26
_text__pd_ret1:
              mov     rax            , rbp            ; load->v26; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 216            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__show ] ---
;[----------------------------------
_text__show:
              sub     rsp            , 264            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
_text__show_for0_init:
              mov     rbx            , 0              ; load->v7; null; save->v7
              mov     r10            , rbp            ; load->v6
              mov     rbp            , rbx            ; load->v7; assign->i; save->v6
              mov     r10            , r12            ; load->v8
              mov     r12            , [_data_bss_now]; null; save->v8
              mov     r10            , rbp            ; load->v6
              mov     r11            , r12            ; load->v8
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v6
              mov     r10            , r13            ; load->v9
              setl    r10b                            
              mov     r13            , r10            ; save->v9; load->v9
              and     r10            , 255            
              mov     r13            , r10            ; save->v9
_text__show_for0_init_check:
              mov     r10            , r13            ; load->v9
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v9
              je      _text__show_for0_end                 
;----------------------------------]
;[----------------------------------
_text__show_for0_start:
              mov     r10            , r14            ; load->v17
              mov     r14            , [_data_bss_a]  ; null; save->v17
              mov     r10            , r15            ; load->v18
              mov     r15            , rbp            ; load->v6; null; save->v18
              mov     r10            , r15            ; load->v18
              imul    r10            , 8              
              mov     r15            , r10            ; save->v18; load->v18
              add     r10            , 8              
              mov     r15            , r10            ; save->v18; load->v18
              mov     r11            , r14            ; load->v17
              add     r10            , r11            
              mov     r15            , r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r11            , r15            ; translate->qword [v18]
              mov     r10            , qword [r11]    
              mov     qword [rsp+152], r10            ; save->v19
_text__show_call3:
              mov     rdi            , qword [rsp+152]; load->v19; null
              call    _text__toString                 
              mov     qword [rsp+160], rax            ; load->v20; null; save->v20
              mov     qword [rsp+168], _data_s2       ; load->v21; null; save->v21
              mov     rdi            , qword [rsp+160]; load->v20; null
              call    strlen                          
              mov     qword [rsp+176], rax            ; load->v22; null; save->v22
              mov     rdi            , qword [rsp+168]; load->v21; null
              call    strlen                          
              mov     qword [rsp+184], rax            ; load->v23; null; save->v23
              mov     r10            , qword [rsp+184]; load->v23
              mov     r11            , qword [rsp+176]; load->v22
              add     r10            , r11            
              mov     qword [rsp+184], r10            ; save->v23; load->v23
              add     r10            , 1              
              mov     qword [rsp+184], r10            ; save->v23
              mov     rdi            , qword [rsp+184]; load->v23; null
              call    malloc                          
              mov     qword [rsp+192], rax            ; load->v24; null; save->v24
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+160]; load->v20; null
              call    strcpy                          
              mov     rdi            , qword [rsp+192]; load->v24; null
              mov     r11            , qword [rsp+176]; load->v22
              add     rdi            , r11            
              mov     rsi            , qword [rsp+168]; load->v21; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
_text__show_call4:
              mov     rdi            , qword [rsp+192]; load->v24; null
              call    _text__print                    
              mov     qword [rsp+200], rax            ; load->v25; null; save->v25
_text__show_for0_continue:
              mov     qword [rsp+208], 1              ; load->v26; null; save->v26
              mov     r10            , qword [rsp+216]; load->v27
              mov     qword [rsp+216], rbp            ; load->v6; null; save->v27
              mov     r10            , qword [rsp+216]; load->v27
              mov     r11            , qword [rsp+208]; load->v26
              add     r10            , r11            
              mov     qword [rsp+216], r10            ; save->v27
              mov     r10            , rbp            ; load->v6
              mov     rbp            , qword [rsp+216]; load->v27; assign->i; save->v6
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , rbp            ; load->v6
              mov     r11            , qword [rsp+224]; load->v28
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v6
              mov     r10            , qword [rsp+232]; load->v29
              setl    r10b                            
              mov     qword [rsp+232], r10            ; save->v29; load->v29
              and     r10            , 255            
              mov     qword [rsp+232], r10            ; save->v29; load->v29
              cmp     r10b           , 0              
              mov     qword [rsp+232], r10            ; save->v29
              jne     _text__show_for0_start                 
;----------------------------------]
;[----------------------------------
_text__show_for0_end:
              mov     rbp            , _data_s3       ; load->v30; null; save->v30
_text__show_call5:
              mov     rdi            , rbp            ; load->v30; null
              call    _text__println                  
              mov     rbp            , rax            ; load->v31; null; save->v31
_text__show_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 264            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__win ] ---
;[----------------------------------
_text__win:
              sub     rsp            , 600            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     qword [rsp+64] , 101            ; load->v8; null; save->v8
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , qword [rsp+64] ; load->v8; null
              mov     qword [rsp+72] , r10            ; save->v9; load->v9
              imul    r10            , 8              
              mov     qword [rsp+72] , r10            ; save->v9; load->v9
              add     r10            , 8              
              mov     qword [rsp+72] , r10            ; save->v9
              mov     rdi            , qword [rsp+72] ; load->v9; null
              call    malloc                          
              mov     qword [rsp+80] , rax            ; load->v10; null; save->v10
              mov     r11            , qword [rsp+64] ; load->v8
              mov     qword [rax]    , r11            
              mov     r10            , rbp            ; load->v11
              mov     rbp            , qword [rsp+80] ; load->v10; init->b; save->v11
_text__win_if0_init:
              mov     r10            , rbx            ; load->v13
              mov     rbx            , [_data_bss_now]; null; save->v13
              mov     r10            , r12            ; load->v14
              mov     r12            , [_data_bss_h]  ; null; save->v14
              mov     r10            , rbx            ; load->v13
              mov     r11            , r12            ; load->v14
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v13; load->v15
              setne   r10b                            
              mov     rbx            , r10            ; save->v15; load->v15
              and     r10            , 255            
              mov     rbx            , r10            ; save->v15
_text__win_if0_check:
              mov     r10            , rbx            ; load->v15
              cmp     r10b           , 0              
              mov     rbx            , r10            ; save->v15
              je      _text__win_if0_else                 
;----------------------------------]
;[----------------------------------
_text__win_if0_start:
              mov     rbx            , 0              ; load->v16; null; save->v16
_text__win_ret0:
              mov     rax            , rbx            ; load->v16; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 600            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__win_if0_else:
_text__win_if0_end:
_text__win_for0_init:
              mov     r12            , 0              ; load->v17; null; save->v17
              mov     r10            , rbx            ; load->v7
              mov     rbx            , r12            ; load->v17; assign->j; save->v7
              mov     r10            , r13            ; load->v18
              mov     r13            , [_data_bss_now]; null; save->v18
              mov     r10            , rbx            ; load->v7
              mov     r11            , r13            ; load->v18
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v7
              mov     r10            , r14            ; load->v19
              setl    r10b                            
              mov     r14            , r10            ; save->v19; load->v19
              and     r10            , 255            
              mov     r14            , r10            ; save->v19
_text__win_for0_init_check:
              mov     r10            , r14            ; load->v19
              cmp     r10b           , 0              
              mov     r14            , r10            ; save->v19
              je      _text__win_for0_end                 
;----------------------------------]
;[----------------------------------
_text__win_for0_start:
              mov     r10            , r15            ; load->v20
              mov     r15            , [_data_bss_a]  ; null; save->v20
              mov     r10            , qword [rsp+168]; load->v21
              mov     qword [rsp+168], rbx            ; load->v7; null; save->v21
              mov     r10            , qword [rsp+168]; load->v21
              imul    r10            , 8              
              mov     qword [rsp+168], r10            ; save->v21; load->v21
              add     r10            , 8              
              mov     qword [rsp+168], r10            ; save->v21; load->v21
              mov     r11            , r15            ; load->v20
              add     r10            , r11            
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+176]; load->v22
              mov     r11            , qword [rsp+168]; translate->qword [v21]
              mov     r10            , qword [r11]    
              mov     qword [rsp+176], r10            ; save->v22
              mov     r10            , qword [rsp+184]; load->v23
              mov     qword [rsp+184], rbx            ; load->v7; null; save->v23
              mov     r10            , qword [rsp+184]; load->v23
              imul    r10            , 8              
              mov     qword [rsp+184], r10            ; save->v23; load->v23
              add     r10            , 8              
              mov     qword [rsp+184], r10            ; save->v23; load->v23
              mov     r11            , rbp            ; load->v11
              add     r10            , r11            
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , qword [rsp+192]; load->v24
              mov     r11            , qword [rsp+184]; translate->qword [v23]
              mov     r10            , qword [r11]    
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+184]; translate->qword [v23]
              mov     r11            , qword [rsp+176]; load->v22
              mov     qword [r10]    , r11            ; assign->b[j]
_text__win_for0_continue:
              mov     qword [rsp+200], 1              ; load->v25; null; save->v25
              mov     r10            , qword [rsp+208]; load->v26
              mov     qword [rsp+208], rbx            ; load->v7; null; save->v26
              mov     r10            , qword [rsp+208]; load->v26
              mov     r11            , qword [rsp+200]; load->v25
              add     r10            , r11            
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , rbx            ; load->v7
              mov     rbx            , qword [rsp+208]; load->v26; assign->j; save->v7
              mov     r10            , qword [rsp+216]; load->v27
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+216], r10            ; save->v27
              mov     r10            , rbx            ; load->v7
              mov     r11            , qword [rsp+216]; load->v27
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v7
              mov     r10            , qword [rsp+224]; load->v28
              setl    r10b                            
              mov     qword [rsp+224], r10            ; save->v28; load->v28
              and     r10            , 255            
              mov     qword [rsp+224], r10            ; save->v28; load->v28
              cmp     r10b           , 0              
              mov     qword [rsp+224], r10            ; save->v28
              jne     _text__win_for0_start                 
;----------------------------------]
;[----------------------------------
_text__win_for0_end:
_text__win_for1_init:
              mov     qword [rsp+232], 0              ; load->v29; null; save->v29
              mov     r10            , r12            ; load->v6
              mov     r12            , qword [rsp+232]; load->v29; assign->i; save->v6
              mov     r10            , qword [rsp+240]; load->v30
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+240], r10            ; save->v30
              mov     qword [rsp+248], 1              ; load->v31; null; save->v31
              mov     r10            , qword [rsp+256]; load->v32
              mov     r10            , qword [rsp+240]; load->v30; null
              mov     qword [rsp+256], r10            ; save->v32; load->v32
              mov     r11            , qword [rsp+248]; load->v31
              sub     r10            , r11            
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , r12            ; load->v6
              mov     r11            , qword [rsp+256]; load->v32
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v6
              mov     r10            , qword [rsp+264]; load->v33
              setl    r10b                            
              mov     qword [rsp+264], r10            ; save->v33; load->v33
              and     r10            , 255            
              mov     qword [rsp+264], r10            ; save->v33
_text__win_for1_init_check:
              mov     r10            , qword [rsp+264]; load->v33
              cmp     r10b           , 0              
              mov     qword [rsp+264], r10            ; save->v33
              je      _text__win_for1_end                 
;----------------------------------]
;[----------------------------------
_text__win_for1_start:
_text__win_for2_init:
              mov     r14            , 1              ; load->v34; null; save->v34
              mov     r10            , r15            ; load->v35
              mov     r15            , r12            ; load->v6; null; save->v35
              mov     r10            , r15            ; load->v35
              mov     r11            , r14            ; load->v34
              add     r10            , r11            
              mov     r15            , r10            ; save->v35
              mov     r10            , rbx            ; load->v7
              mov     rbx            , r15            ; load->v35; assign->j; save->v7
              mov     r10            , qword [rsp+288]; load->v36
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+288], r10            ; save->v36
              mov     r10            , rbx            ; load->v7
              mov     r11            , qword [rsp+288]; load->v36
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v7
              mov     r10            , qword [rsp+296]; load->v37
              setl    r10b                            
              mov     qword [rsp+296], r10            ; save->v37; load->v37
              and     r10            , 255            
              mov     qword [rsp+296], r10            ; save->v37
_text__win_for2_init_check:
              mov     r10            , qword [rsp+296]; load->v37
              cmp     r10b           , 0              
              mov     qword [rsp+296], r10            ; save->v37
              je      _text__win_for2_end                 
;----------------------------------]
;[----------------------------------
_text__win_for2_start:
_text__win_if1_init:
              mov     r10            , qword [rsp+304]; load->v38
              mov     qword [rsp+304], r12            ; load->v6; null; save->v38
              mov     r10            , qword [rsp+304]; load->v38
              imul    r10            , 8              
              mov     qword [rsp+304], r10            ; save->v38; load->v38
              add     r10            , 8              
              mov     qword [rsp+304], r10            ; save->v38; load->v38
              mov     r11            , rbp            ; load->v11
              add     r10            , r11            
              mov     qword [rsp+304], r10            ; save->v38
              mov     r10            , qword [rsp+312]; load->v39
              mov     r11            , qword [rsp+304]; translate->qword [v38]
              mov     r10            , qword [r11]    
              mov     qword [rsp+312], r10            ; save->v39
              mov     r10            , qword [rsp+320]; load->v40
              mov     qword [rsp+320], rbx            ; load->v7; null; save->v40
              mov     r10            , qword [rsp+320]; load->v40
              imul    r10            , 8              
              mov     qword [rsp+320], r10            ; save->v40; load->v40
              add     r10            , 8              
              mov     qword [rsp+320], r10            ; save->v40; load->v40
              mov     r11            , rbp            ; load->v11
              add     r10            , r11            
              mov     qword [rsp+320], r10            ; save->v40
              mov     r10            , qword [rsp+328]; load->v41
              mov     r11            , qword [rsp+320]; translate->qword [v40]
              mov     r10            , qword [r11]    
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+312]; load->v39
              mov     r11            , qword [rsp+328]; load->v41
              cmp     r10d           , r11d           
              mov     qword [rsp+312], r10            ; save->v39
              mov     r10            , qword [rsp+336]; load->v42
              setg    r10b                            
              mov     qword [rsp+336], r10            ; save->v42; load->v42
              and     r10            , 255            
              mov     qword [rsp+336], r10            ; save->v42
_text__win_if1_check:
              mov     r10            , qword [rsp+336]; load->v42
              cmp     r10b           , 0              
              mov     qword [rsp+336], r10            ; save->v42
              je      _text__win_if1_else                 
;----------------------------------]
;[----------------------------------
_text__win_if1_start:
              mov     r10            , qword [rsp+344]; load->v43
              mov     qword [rsp+344], r12            ; load->v6; null; save->v43
              mov     r10            , qword [rsp+344]; load->v43
              imul    r10            , 8              
              mov     qword [rsp+344], r10            ; save->v43; load->v43
              add     r10            , 8              
              mov     qword [rsp+344], r10            ; save->v43; load->v43
              mov     r11            , rbp            ; load->v11
              add     r10            , r11            
              mov     qword [rsp+344], r10            ; save->v43
              mov     r10            , qword [rsp+352]; load->v44
              mov     r11            , qword [rsp+344]; translate->qword [v43]
              mov     r10            , qword [r11]    
              mov     qword [rsp+352], r10            ; save->v44
              mov     r10            , r13            ; load->v12
              mov     r13            , qword [rsp+352]; load->v44; assign->temp; save->v12
              mov     r10            , qword [rsp+360]; load->v45
              mov     qword [rsp+360], rbx            ; load->v7; null; save->v45
              mov     r10            , qword [rsp+360]; load->v45
              imul    r10            , 8              
              mov     qword [rsp+360], r10            ; save->v45; load->v45
              add     r10            , 8              
              mov     qword [rsp+360], r10            ; save->v45; load->v45
              mov     r11            , rbp            ; load->v11
              add     r10            , r11            
              mov     qword [rsp+360], r10            ; save->v45
              mov     r10            , qword [rsp+368]; load->v46
              mov     r11            , qword [rsp+360]; translate->qword [v45]
              mov     r10            , qword [r11]    
              mov     qword [rsp+368], r10            ; save->v46
              mov     r10            , qword [rsp+376]; load->v47
              mov     qword [rsp+376], r12            ; load->v6; null; save->v47
              mov     r10            , qword [rsp+376]; load->v47
              imul    r10            , 8              
              mov     qword [rsp+376], r10            ; save->v47; load->v47
              add     r10            , 8              
              mov     qword [rsp+376], r10            ; save->v47; load->v47
              mov     r11            , rbp            ; load->v11
              add     r10            , r11            
              mov     qword [rsp+376], r10            ; save->v47
              mov     r10            , qword [rsp+384]; load->v48
              mov     r11            , qword [rsp+376]; translate->qword [v47]
              mov     r10            , qword [r11]    
              mov     qword [rsp+384], r10            ; save->v48
              mov     r10            , qword [rsp+376]; translate->qword [v47]
              mov     r11            , qword [rsp+368]; load->v46
              mov     qword [r10]    , r11            ; assign->b[i]
              mov     r10            , qword [rsp+392]; load->v49
              mov     qword [rsp+392], rbx            ; load->v7; null; save->v49
              mov     r10            , qword [rsp+392]; load->v49
              imul    r10            , 8              
              mov     qword [rsp+392], r10            ; save->v49; load->v49
              add     r10            , 8              
              mov     qword [rsp+392], r10            ; save->v49; load->v49
              mov     r11            , rbp            ; load->v11
              add     r10            , r11            
              mov     qword [rsp+392], r10            ; save->v49
              mov     r10            , qword [rsp+400]; load->v50
              mov     r11            , qword [rsp+392]; translate->qword [v49]
              mov     r10            , qword [r11]    
              mov     qword [rsp+400], r10            ; save->v50
              mov     r10            , qword [rsp+392]; translate->qword [v49]
              mov     qword [r10]    , r13            ; load->v12; assign->b[j]
              jmp     _text__win_if1_end                 
;----------------------------------]
;[----------------------------------
_text__win_if1_else:
_text__win_if1_end:
_text__win_for2_continue:
              mov     qword [rsp+408], 1              ; load->v51; null; save->v51
              mov     r10            , qword [rsp+416]; load->v52
              mov     qword [rsp+416], rbx            ; load->v7; null; save->v52
              mov     r10            , qword [rsp+416]; load->v52
              mov     r11            , qword [rsp+408]; load->v51
              add     r10            , r11            
              mov     qword [rsp+416], r10            ; save->v52
              mov     r10            , rbx            ; load->v7
              mov     rbx            , qword [rsp+416]; load->v52; assign->j; save->v7
              mov     r10            , qword [rsp+424]; load->v53
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+424], r10            ; save->v53
              mov     r10            , rbx            ; load->v7
              mov     r11            , qword [rsp+424]; load->v53
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v7
              mov     r10            , qword [rsp+432]; load->v54
              setl    r10b                            
              mov     qword [rsp+432], r10            ; save->v54; load->v54
              and     r10            , 255            
              mov     qword [rsp+432], r10            ; save->v54; load->v54
              cmp     r10b           , 0              
              mov     qword [rsp+432], r10            ; save->v54
              jne     _text__win_for2_start                 
;----------------------------------]
;[----------------------------------
_text__win_for2_end:
_text__win_for1_continue:
              mov     qword [rsp+440], 1              ; load->v55; null; save->v55
              mov     r10            , qword [rsp+448]; load->v56
              mov     qword [rsp+448], r12            ; load->v6; null; save->v56
              mov     r10            , qword [rsp+448]; load->v56
              mov     r11            , qword [rsp+440]; load->v55
              add     r10            , r11            
              mov     qword [rsp+448], r10            ; save->v56
              mov     r10            , r12            ; load->v6
              mov     r12            , qword [rsp+448]; load->v56; assign->i; save->v6
              mov     r10            , qword [rsp+456]; load->v57
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+456], r10            ; save->v57
              mov     qword [rsp+464], 1              ; load->v58; null; save->v58
              mov     r10            , qword [rsp+472]; load->v59
              mov     r10            , qword [rsp+456]; load->v57; null
              mov     qword [rsp+472], r10            ; save->v59; load->v59
              mov     r11            , qword [rsp+464]; load->v58
              sub     r10            , r11            
              mov     qword [rsp+472], r10            ; save->v59
              mov     r10            , r12            ; load->v6
              mov     r11            , qword [rsp+472]; load->v59
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v6
              mov     r10            , qword [rsp+480]; load->v60
              setl    r10b                            
              mov     qword [rsp+480], r10            ; save->v60; load->v60
              and     r10            , 255            
              mov     qword [rsp+480], r10            ; save->v60; load->v60
              cmp     r10b           , 0              
              mov     qword [rsp+480], r10            ; save->v60
              jne     _text__win_for1_start                 
;----------------------------------]
;[----------------------------------
_text__win_for1_end:
_text__win_for3_init:
              mov     rbx            , 0              ; load->v61; null; save->v61
              mov     r10            , r12            ; load->v6
              mov     r12            , rbx            ; load->v61; assign->i; save->v6
              mov     r10            , r13            ; load->v62
              mov     r13            , [_data_bss_now]; null; save->v62
              mov     r10            , r12            ; load->v6
              mov     r11            , r13            ; load->v62
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v6
              mov     r10            , r14            ; load->v63
              setl    r10b                            
              mov     r14            , r10            ; save->v63; load->v63
              and     r10            , 255            
              mov     r14            , r10            ; save->v63
_text__win_for3_init_check:
              mov     r10            , r14            ; load->v63
              cmp     r10b           , 0              
              mov     r14            , r10            ; save->v63
              je      _text__win_for3_end                 
;----------------------------------]
;[----------------------------------
_text__win_for3_start:
_text__win_if2_init:
              mov     r10            , r15            ; load->v64
              mov     r15            , r12            ; load->v6; null; save->v64
              mov     r10            , r15            ; load->v64
              imul    r10            , 8              
              mov     r15            , r10            ; save->v64; load->v64
              add     r10            , 8              
              mov     r15            , r10            ; save->v64; load->v64
              mov     r11            , rbp            ; load->v11
              add     r10            , r11            
              mov     r15            , r10            ; save->v64
              mov     r10            , qword [rsp+520]; load->v65
              mov     r11            , r15            ; translate->qword [v64]
              mov     r10            , qword [r11]    
              mov     qword [rsp+520], r10            ; save->v65
              mov     qword [rsp+528], 1              ; load->v66; null; save->v66
              mov     r10            , qword [rsp+536]; load->v67
              mov     qword [rsp+536], r12            ; load->v6; null; save->v67
              mov     r10            , qword [rsp+536]; load->v67
              mov     r11            , qword [rsp+528]; load->v66
              add     r10            , r11            
              mov     qword [rsp+536], r10            ; save->v67
              mov     r10            , qword [rsp+520]; load->v65
              mov     r11            , qword [rsp+536]; load->v67
              cmp     r10d           , r11d           
              mov     qword [rsp+520], r10            ; save->v65
              mov     r10            , qword [rsp+544]; load->v68
              setne   r10b                            
              mov     qword [rsp+544], r10            ; save->v68; load->v68
              and     r10            , 255            
              mov     qword [rsp+544], r10            ; save->v68
_text__win_if2_check:
              mov     r10            , qword [rsp+544]; load->v68
              cmp     r10b           , 0              
              mov     qword [rsp+544], r10            ; save->v68
              je      _text__win_if2_else                 
;----------------------------------]
;[----------------------------------
_text__win_if2_start:
              mov     qword [rsp+552], 0              ; load->v69; null; save->v69
_text__win_ret1:
              mov     rax            , qword [rsp+552]; load->v69; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 600            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__win_if2_else:
_text__win_if2_end:
_text__win_for3_continue:
              mov     qword [rsp+560], 1              ; load->v70; null; save->v70
              mov     r10            , qword [rsp+568]; load->v71
              mov     qword [rsp+568], r12            ; load->v6; null; save->v71
              mov     r10            , qword [rsp+568]; load->v71
              mov     r11            , qword [rsp+560]; load->v70
              add     r10            , r11            
              mov     qword [rsp+568], r10            ; save->v71
              mov     r10            , r12            ; load->v6
              mov     r12            , qword [rsp+568]; load->v71; assign->i; save->v6
              mov     r10            , qword [rsp+576]; load->v72
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+576], r10            ; save->v72
              mov     r10            , r12            ; load->v6
              mov     r11            , qword [rsp+576]; load->v72
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v6
              mov     r10            , qword [rsp+584]; load->v73
              setl    r10b                            
              mov     qword [rsp+584], r10            ; save->v73; load->v73
              and     r10            , 255            
              mov     qword [rsp+584], r10            ; save->v73; load->v73
              cmp     r10b           , 0              
              mov     qword [rsp+584], r10            ; save->v73
              jne     _text__win_for3_start                 
;----------------------------------]
;[----------------------------------
_text__win_for3_end:
              mov     rbp            , 255            ; load->v74; null; save->v74
_text__win_ret2:
              mov     rax            , rbp            ; load->v74; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 600            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__merge ] ---
;[----------------------------------
_text__merge:
              sub     rsp            , 376            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
_text__merge_for0_init:
              mov     qword [rsp+56] , 0              ; load->v7; null; save->v7
              mov     r10            , rbp            ; load->v6
              mov     rbp            , qword [rsp+56] ; load->v7; assign->i; save->v6
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , rbp            ; load->v6
              mov     r11            , qword [rsp+64] ; load->v8
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v6
              mov     r10            , qword [rsp+72] ; load->v9
              setl    r10b                            
              mov     qword [rsp+72] , r10            ; save->v9; load->v9
              and     r10            , 255            
              mov     qword [rsp+72] , r10            ; save->v9
_text__merge_for0_init_check:
              mov     r10            , qword [rsp+72] ; load->v9
              cmp     r10b           , 0              
              mov     qword [rsp+72] , r10            ; save->v9
              je      _text__merge_for0_end                 
;----------------------------------]
;[----------------------------------
_text__merge_for0_start:
_text__merge_if0_init:
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+88] ; load->v11
              mov     qword [rsp+88] , rbp            ; load->v6; null; save->v11
              mov     r10            , qword [rsp+88] ; load->v11
              imul    r10            , 8              
              mov     qword [rsp+88] , r10            ; save->v11; load->v11
              add     r10            , 8              
              mov     qword [rsp+88] , r10            ; save->v11; load->v11
              mov     r11            , qword [rsp+80] ; load->v10
              add     r10            , r11            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+88] ; translate->qword [v11]
              mov     r10            , qword [r11]    
              mov     qword [rsp+96] , r10            ; save->v12
              mov     qword [rsp+104], 0              ; load->v13; null; save->v13
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+104]; load->v13
              cmp     r10d           , r11d           
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+112]; load->v14
              sete    r10b                            
              mov     qword [rsp+112], r10            ; save->v14; load->v14
              and     r10            , 255            
              mov     qword [rsp+112], r10            ; save->v14
_text__merge_if0_check:
              mov     r10            , qword [rsp+112]; load->v14
              cmp     r10b           , 0              
              mov     qword [rsp+112], r10            ; save->v14
              je      _text__merge_if0_else                 
;----------------------------------]
;[----------------------------------
_text__merge_if0_start:
_text__merge_for1_init:
              mov     r15            , 1              ; load->v16; null; save->v16
              mov     r10            , r13            ; load->v17
              mov     r13            , rbp            ; load->v6; null; save->v17
              mov     r10            , r13            ; load->v17
              mov     r11            , r15            ; load->v16
              add     r10            , r11            
              mov     r13            , r10            ; save->v17
              mov     r10            , rbx            ; load->v15
              mov     rbx            , r13            ; load->v17; assign->j; save->v15
              mov     r10            , r14            ; load->v18
              mov     r14            , [_data_bss_now]; null; save->v18
              mov     r10            , rbx            ; load->v15
              mov     r11            , r14            ; load->v18
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v15
              mov     r10            , r12            ; load->v19
              setl    r10b                            
              mov     r12            , r10            ; save->v19; load->v19
              and     r10            , 255            
              mov     r12            , r10            ; save->v19
_text__merge_for1_init_check:
              mov     r10            , r12            ; load->v19
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v19
              je      _text__merge_for1_end                 
;----------------------------------]
;[----------------------------------
_text__merge_for1_start:
_text__merge_if1_init:
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+168]; load->v21
              mov     qword [rsp+168], rbx            ; load->v15; null; save->v21
              mov     r10            , qword [rsp+168]; load->v21
              imul    r10            , 8              
              mov     qword [rsp+168], r10            ; save->v21; load->v21
              add     r10            , 8              
              mov     qword [rsp+168], r10            ; save->v21; load->v21
              mov     r11            , qword [rsp+160]; load->v20
              add     r10            , r11            
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+176]; load->v22
              mov     r11            , qword [rsp+168]; translate->qword [v21]
              mov     r10            , qword [r11]    
              mov     qword [rsp+176], r10            ; save->v22
              mov     qword [rsp+184], 0              ; load->v23; null; save->v23
              mov     r10            , qword [rsp+176]; load->v22
              mov     r11            , qword [rsp+184]; load->v23
              cmp     r10d           , r11d           
              mov     qword [rsp+176], r10            ; save->v22
              mov     r10            , qword [rsp+192]; load->v24
              setne   r10b                            
              mov     qword [rsp+192], r10            ; save->v24; load->v24
              and     r10            , 255            
              mov     qword [rsp+192], r10            ; save->v24
_text__merge_if1_check:
              mov     r10            , qword [rsp+192]; load->v24
              cmp     r10b           , 0              
              mov     qword [rsp+192], r10            ; save->v24
              je      _text__merge_if1_else                 
;----------------------------------]
;[----------------------------------
_text__merge_if1_start:
_text__merge_call0:
              mov     rdi            , rbp            ; load->v6; null
              mov     rsi            , rbx            ; load->v15; null
              call    _text__swap                     
              mov     qword [rsp+200], rax            ; load->v25; null; save->v25
_text__merge_for1_break0:
              jmp     _text__merge_for1_end                 
;----------------------------------]
;[----------------------------------
_text__merge_if1_else:
_text__merge_if1_end:
_text__merge_for1_continue:
              mov     qword [rsp+208], 1              ; load->v26; null; save->v26
              mov     r10            , qword [rsp+216]; load->v27
              mov     qword [rsp+216], rbx            ; load->v15; null; save->v27
              mov     r10            , qword [rsp+216]; load->v27
              mov     r11            , qword [rsp+208]; load->v26
              add     r10            , r11            
              mov     qword [rsp+216], r10            ; save->v27
              mov     r10            , rbx            ; load->v15
              mov     rbx            , qword [rsp+216]; load->v27; assign->j; save->v15
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , rbx            ; load->v15
              mov     r11            , qword [rsp+224]; load->v28
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v15
              mov     r10            , qword [rsp+232]; load->v29
              setl    r10b                            
              mov     qword [rsp+232], r10            ; save->v29; load->v29
              and     r10            , 255            
              mov     qword [rsp+232], r10            ; save->v29; load->v29
              cmp     r10b           , 0              
              mov     qword [rsp+232], r10            ; save->v29
              jne     _text__merge_for1_start                 
;----------------------------------]
;[----------------------------------
_text__merge_for1_end:
              jmp     _text__merge_if0_end                 
;----------------------------------]
;[----------------------------------
_text__merge_if0_else:
_text__merge_if0_end:
_text__merge_for0_continue:
              mov     qword [rsp+240], 1              ; load->v30; null; save->v30
              mov     r10            , qword [rsp+248]; load->v31
              mov     qword [rsp+248], rbp            ; load->v6; null; save->v31
              mov     r10            , qword [rsp+248]; load->v31
              mov     r11            , qword [rsp+240]; load->v30
              add     r10            , r11            
              mov     qword [rsp+248], r10            ; save->v31
              mov     r10            , rbp            ; load->v6
              mov     rbp            , qword [rsp+248]; load->v31; assign->i; save->v6
              mov     r10            , qword [rsp+256]; load->v32
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , rbp            ; load->v6
              mov     r11            , qword [rsp+256]; load->v32
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v6
              mov     r10            , qword [rsp+264]; load->v33
              setl    r10b                            
              mov     qword [rsp+264], r10            ; save->v33; load->v33
              and     r10            , 255            
              mov     qword [rsp+264], r10            ; save->v33; load->v33
              cmp     r10b           , 0              
              mov     qword [rsp+264], r10            ; save->v33
              jne     _text__merge_for0_start                 
;----------------------------------]
;[----------------------------------
_text__merge_for0_end:
_text__merge_for2_init:
              mov     rbx            , 0              ; load->v34; null; save->v34
              mov     r10            , rbp            ; load->v6
              mov     rbp            , rbx            ; load->v34; assign->i; save->v6
              mov     r10            , r12            ; load->v35
              mov     r12            , [_data_bss_now]; null; save->v35
              mov     r10            , rbp            ; load->v6
              mov     r11            , r12            ; load->v35
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v6
              mov     r10            , r13            ; load->v36
              setl    r10b                            
              mov     r13            , r10            ; save->v36; load->v36
              and     r10            , 255            
              mov     r13            , r10            ; save->v36
_text__merge_for2_init_check:
              mov     r10            , r13            ; load->v36
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v36
              je      _text__merge_for2_end                 
;----------------------------------]
;[----------------------------------
_text__merge_for2_start:
_text__merge_if2_init:
              mov     r10            , r14            ; load->v37
              mov     r14            , [_data_bss_a]  ; null; save->v37
              mov     r10            , r15            ; load->v38
              mov     r15            , rbp            ; load->v6; null; save->v38
              mov     r10            , r15            ; load->v38
              imul    r10            , 8              
              mov     r15            , r10            ; save->v38; load->v38
              add     r10            , 8              
              mov     r15            , r10            ; save->v38; load->v38
              mov     r11            , r14            ; load->v37
              add     r10            , r11            
              mov     r15            , r10            ; save->v38
              mov     r10            , qword [rsp+312]; load->v39
              mov     r11            , r15            ; translate->qword [v38]
              mov     r10            , qword [r11]    
              mov     qword [rsp+312], r10            ; save->v39
              mov     qword [rsp+320], 0              ; load->v40; null; save->v40
              mov     r10            , qword [rsp+312]; load->v39
              mov     r11            , qword [rsp+320]; load->v40
              cmp     r10d           , r11d           
              mov     qword [rsp+312], r10            ; save->v39
              mov     r10            , qword [rsp+328]; load->v41
              sete    r10b                            
              mov     qword [rsp+328], r10            ; save->v41; load->v41
              and     r10            , 255            
              mov     qword [rsp+328], r10            ; save->v41
_text__merge_if2_check:
              mov     r10            , qword [rsp+328]; load->v41
              cmp     r10b           , 0              
              mov     qword [rsp+328], r10            ; save->v41
              je      _text__merge_if2_else                 
;----------------------------------]
;[----------------------------------
_text__merge_if2_start:
              mov     [_data_bss_now], rbp            ; load->v6; null
_text__merge_for2_break1:
              jmp     _text__merge_for2_end                 
;----------------------------------]
;[----------------------------------
_text__merge_if2_else:
_text__merge_if2_end:
_text__merge_for2_continue:
              mov     qword [rsp+336], 1              ; load->v42; null; save->v42
              mov     r10            , qword [rsp+344]; load->v43
              mov     qword [rsp+344], rbp            ; load->v6; null; save->v43
              mov     r10            , qword [rsp+344]; load->v43
              mov     r11            , qword [rsp+336]; load->v42
              add     r10            , r11            
              mov     qword [rsp+344], r10            ; save->v43
              mov     r10            , rbp            ; load->v6
              mov     rbp            , qword [rsp+344]; load->v43; assign->i; save->v6
              mov     r10            , qword [rsp+352]; load->v44
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+352], r10            ; save->v44
              mov     r10            , rbp            ; load->v6
              mov     r11            , qword [rsp+352]; load->v44
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v6
              mov     r10            , qword [rsp+360]; load->v45
              setl    r10b                            
              mov     qword [rsp+360], r10            ; save->v45; load->v45
              and     r10            , 255            
              mov     qword [rsp+360], r10            ; save->v45; load->v45
              cmp     r10b           , 0              
              mov     qword [rsp+360], r10            ; save->v45
              jne     _text__merge_for2_start                 
;----------------------------------]
;[----------------------------------
_text__merge_for2_end:
_text__merge_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 376            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__move ] ---
;[----------------------------------
_text__move:
              sub     rsp            , 280            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbp            , 0              ; load->v6; null; save->v6
              mov     r10            , rbx            ; load->v7
              mov     rbx            , rbp            ; load->v6; init->i; save->v7
_text__move_for0_init:
              mov     r10            , rbp            ; load->v8
              mov     rbp            , [_data_bss_now]; null; save->v8
              mov     r10            , rbx            ; load->v7
              mov     r11            , rbp            ; load->v8
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v7
              mov     r10            , r12            ; load->v9
              setl    r10b                            
              mov     r12            , r10            ; save->v9; load->v9
              and     r10            , 255            
              mov     r12            , r10            ; save->v9
_text__move_for0_init_check:
              mov     r10            , r12            ; load->v9
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v9
              je      _text__move_for0_end                 
;----------------------------------]
;[----------------------------------
_text__move_for0_start:
              mov     r10            , r13            ; load->v10
              mov     r13            , [_data_bss_a]  ; null; save->v10
              mov     r10            , r14            ; load->v11
              mov     r14            , rbx            ; load->v7; null; save->v11
              mov     r10            , r14            ; load->v11
              imul    r10            , 8              
              mov     r14            , r10            ; save->v11; load->v11
              add     r10            , 8              
              mov     r14            , r10            ; save->v11; load->v11
              mov     r11            , r13            ; load->v10
              add     r10            , r11            
              mov     r14            , r10            ; save->v11
              mov     r10            , r15            ; load->v12
              mov     r11            , r14            ; translate->qword [v11]
              mov     r15            , qword [r11]    ; null; save->v12
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+112]; load->v14
              mov     qword [rsp+112], rbx            ; load->v7; null; save->v14
              mov     r10            , qword [rsp+112]; load->v14
              imul    r10            , 8              
              mov     qword [rsp+112], r10            ; save->v14; load->v14
              add     r10            , 8              
              mov     qword [rsp+112], r10            ; save->v14; load->v14
              mov     r11            , qword [rsp+104]; load->v13
              add     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+112]; translate->qword [v14]
              mov     r10            , qword [r11]    
              mov     qword [rsp+120], r10            ; save->v15
              mov     qword [rsp+128], 1              ; load->v16; null; save->v16
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , qword [rsp+120]; load->v15; null
              mov     qword [rsp+136], r10            ; save->v17; load->v17
              mov     r11            , qword [rsp+128]; load->v16
              sub     r10            , r11            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     qword [rsp+152], rbx            ; load->v7; null; save->v19
              mov     r10            , qword [rsp+152]; load->v19
              imul    r10            , 8              
              mov     qword [rsp+152], r10            ; save->v19; load->v19
              add     r10            , 8              
              mov     qword [rsp+152], r10            ; save->v19; load->v19
              mov     r11            , qword [rsp+144]; load->v18
              add     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+152]; translate->qword [v19]
              mov     r10            , qword [r11]    
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+152]; translate->qword [v19]
              mov     r11            , qword [rsp+136]; load->v17
              mov     qword [r10]    , r11            ; assign->a[i]
              mov     qword [rsp+168], 1              ; load->v21; null; save->v21
              mov     r10            , qword [rsp+176]; load->v22
              mov     qword [rsp+176], rbx            ; load->v7; null; save->v22
              mov     r10            , qword [rsp+176]; load->v22
              mov     r11            , qword [rsp+168]; load->v21
              add     r10            , r11            
              mov     qword [rsp+176], r10            ; save->v22
              mov     r10            , rbx            ; load->v7
              mov     rbx            , qword [rsp+176]; load->v22; assign->i; save->v7
_text__move_for0_continue:
              mov     r10            , qword [rsp+184]; load->v23
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , rbx            ; load->v7
              mov     r11            , qword [rsp+184]; load->v23
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v7
              mov     r10            , qword [rsp+192]; load->v24
              setl    r10b                            
              mov     qword [rsp+192], r10            ; save->v24; load->v24
              and     r10            , 255            
              mov     qword [rsp+192], r10            ; save->v24; load->v24
              cmp     r10b           , 0              
              mov     qword [rsp+192], r10            ; save->v24
              jne     _text__move_for0_start                 
;----------------------------------]
;[----------------------------------
_text__move_for0_end:
              mov     r10            , rbp            ; load->v25
              mov     rbp            , [_data_bss_now]; null; save->v25
              mov     r10            , rbx            ; load->v26
              mov     rbx            , [_data_bss_a]  ; null; save->v26
              mov     r10            , r12            ; load->v27
              mov     r12            , [_data_bss_now]; null; save->v27
              mov     r10            , r13            ; load->v28
              mov     r13            , r12            ; load->v27; null; save->v28
              mov     r10            , r13            ; load->v28
              imul    r10            , 8              
              mov     r13            , r10            ; save->v28; load->v28
              add     r10            , 8              
              mov     r13            , r10            ; save->v28; load->v28
              mov     r11            , rbx            ; load->v26
              add     r10            , r11            
              mov     r13            , r10            ; save->v28
              mov     r10            , rbx            ; load->v29
              mov     r11            , r13            ; translate->qword [v28]
              mov     rbx            , qword [r11]    ; null; save->v29
              mov     r10            , r13            ; translate->qword [v28]
              mov     qword [r10]    , rbp            ; load->v25; assign->a[now]
              mov     r10            , rbp            ; load->v30
              mov     rbp            , [_data_bss_now]; null; save->v30
              mov     r10            , rbx            ; load->v31
              mov     rbx            , rbp            ; load->v30; null; save->v31
              mov     r10            , rbp            ; load->v32
              mov     rbp            , [_data_bss_now]; null; save->v32
              mov     rbx            , 1              ; load->v33; null; save->v33
              mov     r10            , r12            ; load->v34
              mov     r12            , rbp            ; load->v32; null; save->v34
              mov     r10            , r12            ; load->v34
              mov     r11            , rbx            ; load->v33
              add     r10            , r11            
              mov     r12            , r10            ; save->v34
              mov     [_data_bss_now], r12            ; load->v34; null
_text__move_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 280            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 1064           
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
              mov     rbp            , 0              ; load->v6; null; save->v6
              mov     r10            , qword [rsp+56] ; load->v7
              mov     qword [rsp+56] , rbp            ; load->v6; init->T; save->v7
_text__main_call0:
              call    _text__getInt                   
              mov     rbp            , rax            ; load->v8; null; save->v8
              mov     r10            , qword [rsp+72] ; load->v9
              mov     qword [rsp+72] , rbp            ; load->v8; init->times; save->v9
_text__main_for0_init:
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+72] ; load->v9
              cmp     r10d           , r11d           
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+80] ; load->v10
              setl    r10b                            
              mov     qword [rsp+80] , r10            ; save->v10; load->v10
              and     r10            , 255            
              mov     qword [rsp+80] , r10            ; save->v10
_text__main_for0_init_check:
              mov     r10            , qword [rsp+80] ; load->v10
              cmp     r10b           , 0              
              mov     qword [rsp+80] , r10            ; save->v10
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
              mov     qword [rsp+88] , 0              ; load->v11; null; save->v11
              mov     r10            , r14            ; load->v12
              mov     r14            , qword [rsp+88] ; load->v11; init->i; save->v12
              mov     qword [rsp+104], 0              ; load->v13; null; save->v13
              mov     r10            , r12            ; load->v14
              mov     r12            , qword [rsp+104]; load->v13; init->temp; save->v14
              mov     qword [rsp+120], 0              ; load->v15; null; save->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , qword [rsp+120]; load->v15; init->count
              mov     qword [rsp+128], r10            ; save->v16
              mov     qword [rsp+136], 5050           ; load->v17; null; save->v17
              mov     r11            , qword [rsp+136]; load->v17
              mov     [_data_bss_n]  , r11            
              mov     qword [rsp+144], 0              ; load->v18; null; save->v18
              mov     r11            , qword [rsp+144]; load->v18
              mov     [_data_bss_h]  , r11            
              mov     qword [rsp+152], 101            ; load->v19; null; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , qword [rsp+152]; load->v19; null
              mov     qword [rsp+160], r10            ; save->v20; load->v20
              imul    r10            , 8              
              mov     qword [rsp+160], r10            ; save->v20; load->v20
              add     r10            , 8              
              mov     qword [rsp+160], r10            ; save->v20
              mov     rdi            , qword [rsp+160]; load->v20; null
              call    malloc                          
              mov     qword [rsp+168], rax            ; load->v21; null; save->v21
              mov     r11            , qword [rsp+152]; load->v19
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+168]; load->v21
              mov     [_data_bss_a]  , r11            
              mov     r10            , qword [rsp+176]; load->v22
              mov     r10            , [_data_bss_M]  
              mov     qword [rsp+176], r10            ; save->v22
              mov     r10            , qword [rsp+184]; load->v23
              mov     r10            , [_data_bss_A]  
              mov     qword [rsp+184], r10            ; save->v23
              mov     qword [rsp+200], rdx            ; load->v25; null; save->v25
              mov     qword [rsp+208], rax            ; load->v26; null; save->v26
              mov     rax            , qword [rsp+176]; load->v22; null
              and     rax            , -1             
              mov     r10            , qword [rsp+184]; load->v23
              and     r10d           , -1             
              mov     qword [rsp+184], r10            ; save->v23
              cqo                                     
              mov     r10            , qword [rsp+184]; load->v23
              idiv    r10d                            
              mov     qword [rsp+184], r10            ; save->v23
              mov     qword [rsp+192], rax            ; load->v24; null; save->v24
              mov     rdx            , qword [rsp+200]; load->v25; null
              mov     rax            , qword [rsp+208]; load->v26; null
              mov     r11            , qword [rsp+192]; load->v24
              mov     [_data_bss_Q]  , r11            
              mov     r10            , qword [rsp+216]; load->v27
              mov     r10            , [_data_bss_M]  
              mov     qword [rsp+216], r10            ; save->v27
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , [_data_bss_A]  
              mov     qword [rsp+224], r10            ; save->v28
              mov     qword [rsp+240], rdx            ; load->v30; null; save->v30
              mov     qword [rsp+248], rax            ; load->v31; null; save->v31
              mov     rax            , qword [rsp+216]; load->v27; null
              and     rax            , -1             
              mov     r10            , qword [rsp+224]; load->v28
              and     r10d           , -1             
              mov     qword [rsp+224], r10            ; save->v28
              cqo                                     
              mov     r10            , qword [rsp+224]; load->v28
              idiv    r10d                            
              mov     qword [rsp+224], r10            ; save->v28
              mov     qword [rsp+232], rdx            ; load->v29; null; save->v29
              mov     rdx            , qword [rsp+240]; load->v30; null
              mov     rax            , qword [rsp+248]; load->v31; null
              mov     r11            , qword [rsp+232]; load->v29
              mov     [_data_bss_R]  , r11            
_text__main_if0_init:
              mov     r10            , qword [rsp+256]; load->v32
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+256], r10            ; save->v32
_text__main_call1:
              mov     rdi            , qword [rsp+256]; load->v32; null
              call    _text__pd                       
              mov     qword [rsp+264], rax            ; load->v33; null; save->v33
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , qword [rsp+264]; load->v33; null
              mov     qword [rsp+272], r10            ; save->v34; load->v34
              not     r10                             
              mov     qword [rsp+272], r10            ; save->v34; load->v34
              and     r10            , -1             
              mov     qword [rsp+272], r10            ; save->v34
_text__main_if0_check:
              mov     r10            , qword [rsp+272]; load->v34
              cmp     r10b           , 0              
              mov     qword [rsp+272], r10            ; save->v34
              je      _text__main_if0_else                 
;----------------------------------]
;[----------------------------------
_text__main_if0_start:
              mov     qword [rsp+280], _data_s4       ; load->v35; null; save->v35
_text__main_call2:
              mov     rdi            , qword [rsp+280]; load->v35; null
              call    _text__println                  
              mov     qword [rsp+288], rax            ; load->v36; null; save->v36
              mov     qword [rsp+296], 1              ; load->v37; null; save->v37
_text__main_ret0:
              mov     rax            , qword [rsp+296]; load->v37; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 1064           
              ret                                     
;----------------------------------]
;[----------------------------------
_text__main_if0_else:
_text__main_if0_end:
              mov     qword [rsp+304], _data_s5       ; load->v38; null; save->v38
_text__main_call3:
              mov     rdi            , qword [rsp+304]; load->v38; null
              call    _text__println                  
              mov     qword [rsp+312], rax            ; load->v39; null; save->v39
_text__main_call4:
              call    _text__random                   
              mov     qword [rsp+320], rax            ; load->v40; null; save->v40
_text__main_call5:
              mov     rdi            , qword [rsp+320]; load->v40; null
              call    _text__initialize                 
              mov     qword [rsp+328], rax            ; load->v41; null; save->v41
_text__main_call6:
              call    _text__random                   
              mov     qword [rsp+336], rax            ; load->v42; null; save->v42
              mov     qword [rsp+344], 10             ; load->v43; null; save->v43
              mov     qword [rsp+360], rdx            ; load->v45; null; save->v45
              mov     qword [rsp+368], rax            ; load->v46; null; save->v46
              mov     rax            , qword [rsp+336]; load->v42; null
              and     rax            , -1             
              mov     r10            , qword [rsp+344]; load->v43
              and     r10d           , -1             
              mov     qword [rsp+344], r10            ; save->v43
              cqo                                     
              mov     r10            , qword [rsp+344]; load->v43
              idiv    r10d                            
              mov     qword [rsp+344], r10            ; save->v43
              mov     qword [rsp+352], rdx            ; load->v44; null; save->v44
              mov     rdx            , qword [rsp+360]; load->v45; null
              mov     rax            , qword [rsp+368]; load->v46; null
              mov     qword [rsp+376], 1              ; load->v47; null; save->v47
              mov     r10            , qword [rsp+384]; load->v48
              mov     r10            , qword [rsp+352]; load->v44; null
              mov     qword [rsp+384], r10            ; save->v48; load->v48
              mov     r11            , qword [rsp+376]; load->v47
              add     r10            , r11            
              mov     qword [rsp+384], r10            ; save->v48
              mov     r11            , qword [rsp+384]; load->v48
              mov     [_data_bss_now], r11            
              mov     r10            , qword [rsp+392]; load->v49
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+392], r10            ; save->v49
_text__main_call7:
              mov     rdi            , qword [rsp+392]; load->v49; null
              call    _text__toString                 
              mov     qword [rsp+400], rax            ; load->v50; null; save->v50
_text__main_call8:
              mov     rdi            , qword [rsp+400]; load->v50; null
              call    _text__println                  
              mov     qword [rsp+408], rax            ; load->v51; null; save->v51
_text__main_for1_init:
              mov     r10            , qword [rsp+416]; load->v52
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+416], r10            ; save->v52
              mov     qword [rsp+424], 1              ; load->v53; null; save->v53
              mov     r10            , qword [rsp+432]; load->v54
              mov     r10            , qword [rsp+416]; load->v52; null
              mov     qword [rsp+432], r10            ; save->v54; load->v54
              mov     r11            , qword [rsp+424]; load->v53
              sub     r10            , r11            
              mov     qword [rsp+432], r10            ; save->v54
              mov     r10            , r14            ; load->v12
              mov     r11            , qword [rsp+432]; load->v54
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v12
              mov     r10            , qword [rsp+440]; load->v55
              setl    r10b                            
              mov     qword [rsp+440], r10            ; save->v55; load->v55
              and     r10            , 255            
              mov     qword [rsp+440], r10            ; save->v55
_text__main_for1_init_check:
              mov     r10            , qword [rsp+440]; load->v55
              cmp     r10b           , 0              
              mov     qword [rsp+440], r10            ; save->v55
              je      _text__main_for1_end                 
;----------------------------------]
;[----------------------------------
_text__main_for1_start:
_text__main_call9:
              call    _text__random                   
              mov     qword [rsp+448], rax            ; load->v56; null; save->v56
              mov     qword [rsp+456], 10             ; load->v57; null; save->v57
              mov     qword [rsp+472], rdx            ; load->v59; null; save->v59
              mov     qword [rsp+480], rax            ; load->v60; null; save->v60
              mov     rax            , qword [rsp+448]; load->v56; null
              and     rax            , -1             
              mov     r10            , qword [rsp+456]; load->v57
              and     r10d           , -1             
              mov     qword [rsp+456], r10            ; save->v57
              cqo                                     
              mov     r10            , qword [rsp+456]; load->v57
              idiv    r10d                            
              mov     qword [rsp+456], r10            ; save->v57
              mov     qword [rsp+464], rdx            ; load->v58; null; save->v58
              mov     rdx            , qword [rsp+472]; load->v59; null
              mov     rax            , qword [rsp+480]; load->v60; null
              mov     qword [rsp+488], 1              ; load->v61; null; save->v61
              mov     r10            , qword [rsp+496]; load->v62
              mov     r10            , qword [rsp+464]; load->v58; null
              mov     qword [rsp+496], r10            ; save->v62; load->v62
              mov     r11            , qword [rsp+488]; load->v61
              add     r10            , r11            
              mov     qword [rsp+496], r10            ; save->v62
              mov     r10            , qword [rsp+504]; load->v63
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+504], r10            ; save->v63
              mov     r10            , qword [rsp+512]; load->v64
              mov     qword [rsp+512], r14            ; load->v12; null; save->v64
              mov     r10            , qword [rsp+512]; load->v64
              imul    r10            , 8              
              mov     qword [rsp+512], r10            ; save->v64; load->v64
              add     r10            , 8              
              mov     qword [rsp+512], r10            ; save->v64; load->v64
              mov     r11            , qword [rsp+504]; load->v63
              add     r10            , r11            
              mov     qword [rsp+512], r10            ; save->v64
              mov     r10            , qword [rsp+520]; load->v65
              mov     r11            , qword [rsp+512]; translate->qword [v64]
              mov     r10            , qword [r11]    
              mov     qword [rsp+520], r10            ; save->v65
              mov     r10            , qword [rsp+512]; translate->qword [v64]
              mov     r11            , qword [rsp+496]; load->v62
              mov     qword [r10]    , r11            ; assign->a[i]
_text__main_for2_init:
              mov     r10            , r13            ; load->v66
              mov     r13            , [_data_bss_a]  ; null; save->v66
              mov     r10            , rbp            ; load->v67
              mov     rbp            , r14            ; load->v12; null; save->v67
              mov     r10            , rbp            ; load->v67
              imul    r10            , 8              
              mov     rbp            , r10            ; save->v67; load->v67
              add     r10            , 8              
              mov     rbp            , r10            ; save->v67; load->v67
              mov     r11            , r13            ; load->v66
              add     r10            , r11            
              mov     rbp            , r10            ; save->v67
              mov     r10            , rbx            ; load->v68
              mov     r11            , rbp            ; translate->qword [v67]
              mov     rbx            , qword [r11]    ; null; save->v68
              mov     r10            , r15            ; load->v69
              mov     r15            , rbx            ; load->v68; null; save->v69
              mov     r10            , r15            ; load->v69
              mov     r11            , r12            ; load->v14
              add     r10            , r11            
              mov     r15            , r10            ; save->v69
              mov     r10            , qword [rsp+560]; load->v70
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+560], r10            ; save->v70
              mov     r10            , r15            ; load->v69
              mov     r11            , qword [rsp+560]; load->v70
              cmp     r10d           , r11d           
              mov     r15            , r10            ; save->v69
              mov     r10            , qword [rsp+568]; load->v71
              setg    r10b                            
              mov     qword [rsp+568], r10            ; save->v71; load->v71
              and     r10            , 255            
              mov     qword [rsp+568], r10            ; save->v71
_text__main_for2_init_check:
              mov     r10            , qword [rsp+568]; load->v71
              cmp     r10b           , 0              
              mov     qword [rsp+568], r10            ; save->v71
              je      _text__main_for2_end                 
;----------------------------------]
;[----------------------------------
_text__main_for2_start:
_text__main_call10:
              call    _text__random                   
              mov     qword [rsp+576], rax            ; load->v72; null; save->v72
              mov     qword [rsp+584], 10             ; load->v73; null; save->v73
              mov     qword [rsp+600], rdx            ; load->v75; null; save->v75
              mov     qword [rsp+608], rax            ; load->v76; null; save->v76
              mov     rax            , qword [rsp+576]; load->v72; null
              and     rax            , -1             
              mov     r10            , qword [rsp+584]; load->v73
              and     r10d           , -1             
              mov     qword [rsp+584], r10            ; save->v73
              cqo                                     
              mov     r10            , qword [rsp+584]; load->v73
              idiv    r10d                            
              mov     qword [rsp+584], r10            ; save->v73
              mov     qword [rsp+592], rdx            ; load->v74; null; save->v74
              mov     rdx            , qword [rsp+600]; load->v75; null
              mov     rax            , qword [rsp+608]; load->v76; null
              mov     qword [rsp+616], 1              ; load->v77; null; save->v77
              mov     r10            , qword [rsp+624]; load->v78
              mov     r10            , qword [rsp+592]; load->v74; null
              mov     qword [rsp+624], r10            ; save->v78; load->v78
              mov     r11            , qword [rsp+616]; load->v77
              add     r10            , r11            
              mov     qword [rsp+624], r10            ; save->v78
              mov     r10            , qword [rsp+632]; load->v79
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+632], r10            ; save->v79
              mov     r10            , qword [rsp+640]; load->v80
              mov     qword [rsp+640], r14            ; load->v12; null; save->v80
              mov     r10            , qword [rsp+640]; load->v80
              imul    r10            , 8              
              mov     qword [rsp+640], r10            ; save->v80; load->v80
              add     r10            , 8              
              mov     qword [rsp+640], r10            ; save->v80; load->v80
              mov     r11            , qword [rsp+632]; load->v79
              add     r10            , r11            
              mov     qword [rsp+640], r10            ; save->v80
              mov     r10            , qword [rsp+648]; load->v81
              mov     r11            , qword [rsp+640]; translate->qword [v80]
              mov     r10            , qword [r11]    
              mov     qword [rsp+648], r10            ; save->v81
              mov     r10            , qword [rsp+640]; translate->qword [v80]
              mov     r11            , qword [rsp+624]; load->v78
              mov     qword [r10]    , r11            ; assign->a[i]
_text__main_for2_continue:
              mov     r10            , qword [rsp+656]; load->v82
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+656], r10            ; save->v82
              mov     r10            , qword [rsp+664]; load->v83
              mov     qword [rsp+664], r14            ; load->v12; null; save->v83
              mov     r10            , qword [rsp+664]; load->v83
              imul    r10            , 8              
              mov     qword [rsp+664], r10            ; save->v83; load->v83
              add     r10            , 8              
              mov     qword [rsp+664], r10            ; save->v83; load->v83
              mov     r11            , qword [rsp+656]; load->v82
              add     r10            , r11            
              mov     qword [rsp+664], r10            ; save->v83
              mov     r10            , qword [rsp+672]; load->v84
              mov     r11            , qword [rsp+664]; translate->qword [v83]
              mov     r10            , qword [r11]    
              mov     qword [rsp+672], r10            ; save->v84
              mov     r10            , qword [rsp+680]; load->v85
              mov     r10            , qword [rsp+672]; load->v84; null
              mov     qword [rsp+680], r10            ; save->v85; load->v85
              mov     r11            , r12            ; load->v14
              add     r10            , r11            
              mov     qword [rsp+680], r10            ; save->v85
              mov     r10            , qword [rsp+688]; load->v86
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+688], r10            ; save->v86
              mov     r10            , qword [rsp+680]; load->v85
              mov     r11            , qword [rsp+688]; load->v86
              cmp     r10d           , r11d           
              mov     qword [rsp+680], r10            ; save->v85
              mov     r10            , qword [rsp+696]; load->v87
              setg    r10b                            
              mov     qword [rsp+696], r10            ; save->v87; load->v87
              and     r10            , 255            
              mov     qword [rsp+696], r10            ; save->v87; load->v87
              cmp     r10b           , 0              
              mov     qword [rsp+696], r10            ; save->v87
              jne     _text__main_for2_start                 
;----------------------------------]
;[----------------------------------
_text__main_for2_end:
              mov     r10            , qword [rsp+704]; load->v88
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+704], r10            ; save->v88
              mov     r10            , qword [rsp+712]; load->v89
              mov     qword [rsp+712], r14            ; load->v12; null; save->v89
              mov     r10            , qword [rsp+712]; load->v89
              imul    r10            , 8              
              mov     qword [rsp+712], r10            ; save->v89; load->v89
              add     r10            , 8              
              mov     qword [rsp+712], r10            ; save->v89; load->v89
              mov     r11            , qword [rsp+704]; load->v88
              add     r10            , r11            
              mov     qword [rsp+712], r10            ; save->v89
              mov     r10            , qword [rsp+720]; load->v90
              mov     r11            , qword [rsp+712]; translate->qword [v89]
              mov     r10            , qword [r11]    
              mov     qword [rsp+720], r10            ; save->v90
              mov     r10            , qword [rsp+728]; load->v91
              mov     qword [rsp+728], r12            ; load->v14; null; save->v91
              mov     r10            , qword [rsp+728]; load->v91
              mov     r11            , qword [rsp+720]; load->v90
              add     r10            , r11            
              mov     qword [rsp+728], r10            ; save->v91
              mov     r10            , r12            ; load->v14
              mov     r12            , qword [rsp+728]; load->v91; assign->temp; save->v14
_text__main_for1_continue:
              mov     qword [rsp+736], 1              ; load->v92; null; save->v92
              mov     r10            , qword [rsp+744]; load->v93
              mov     qword [rsp+744], r14            ; load->v12; null; save->v93
              mov     r10            , qword [rsp+744]; load->v93
              mov     r11            , qword [rsp+736]; load->v92
              add     r10            , r11            
              mov     qword [rsp+744], r10            ; save->v93
              mov     r10            , r14            ; load->v12
              mov     r14            , qword [rsp+744]; load->v93; assign->i; save->v12
              mov     r10            , qword [rsp+752]; load->v94
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+752], r10            ; save->v94
              mov     qword [rsp+760], 1              ; load->v95; null; save->v95
              mov     r10            , qword [rsp+768]; load->v96
              mov     r10            , qword [rsp+752]; load->v94; null
              mov     qword [rsp+768], r10            ; save->v96; load->v96
              mov     r11            , qword [rsp+760]; load->v95
              sub     r10            , r11            
              mov     qword [rsp+768], r10            ; save->v96
              mov     r10            , r14            ; load->v12
              mov     r11            , qword [rsp+768]; load->v96
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v12
              mov     r10            , qword [rsp+776]; load->v97
              setl    r10b                            
              mov     qword [rsp+776], r10            ; save->v97; load->v97
              and     r10            , 255            
              mov     qword [rsp+776], r10            ; save->v97; load->v97
              cmp     r10b           , 0              
              mov     qword [rsp+776], r10            ; save->v97
              jne     _text__main_for1_start                 
;----------------------------------]
;[----------------------------------
_text__main_for1_end:
              mov     r10            , qword [rsp+784]; load->v98
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+784], r10            ; save->v98
              mov     r10            , qword [rsp+792]; load->v99
              mov     r10            , qword [rsp+784]; load->v98; null
              mov     qword [rsp+792], r10            ; save->v99; load->v99
              mov     r11            , r12            ; load->v14
              sub     r10            , r11            
              mov     qword [rsp+792], r10            ; save->v99
              mov     r10            , qword [rsp+800]; load->v100
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+800], r10            ; save->v100
              mov     r10            , qword [rsp+808]; load->v101
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+808], r10            ; save->v101
              mov     qword [rsp+816], 1              ; load->v102; null; save->v102
              mov     r10            , qword [rsp+824]; load->v103
              mov     r10            , qword [rsp+808]; load->v101; null
              mov     qword [rsp+824], r10            ; save->v103; load->v103
              mov     r11            , qword [rsp+816]; load->v102
              sub     r10            , r11            
              mov     qword [rsp+824], r10            ; save->v103
              mov     r10            , qword [rsp+832]; load->v104
              mov     r10            , qword [rsp+824]; load->v103; null
              mov     qword [rsp+832], r10            ; save->v104; load->v104
              imul    r10            , 8              
              mov     qword [rsp+832], r10            ; save->v104; load->v104
              add     r10            , 8              
              mov     qword [rsp+832], r10            ; save->v104; load->v104
              mov     r11            , qword [rsp+800]; load->v100
              add     r10            , r11            
              mov     qword [rsp+832], r10            ; save->v104
              mov     r10            , qword [rsp+840]; load->v105
              mov     r11            , qword [rsp+832]; translate->qword [v104]
              mov     r10            , qword [r11]    
              mov     qword [rsp+840], r10            ; save->v105
              mov     r10            , qword [rsp+832]; translate->qword [v104]
              mov     r11            , qword [rsp+792]; load->v99
              mov     qword [r10]    , r11            ; assign->a[now-1]
_text__main_call11:
              call    _text__show                     
              mov     qword [rsp+848], rax            ; load->v106; null; save->v106
_text__main_call12:
              call    _text__merge                    
              mov     qword [rsp+856], rax            ; load->v107; null; save->v107
_text__main_for3_init:
_text__main_call13:
              call    _text__win                      
              mov     rbp            , rax            ; load->v108; null; save->v108
              mov     r10            , rbx            ; load->v109
              mov     rbx            , rbp            ; load->v108; null; save->v109
              mov     r10            , rbx            ; load->v109
              not     r10                             
              mov     rbx            , r10            ; save->v109; load->v109
              and     r10            , -1             
              mov     rbx            , r10            ; save->v109
_text__main_for3_init_check:
              mov     r10            , rbx            ; load->v109
              cmp     r10b           , 0              
              mov     rbx            , r10            ; save->v109
              je      _text__main_for3_end                 
;----------------------------------]
;[----------------------------------
_text__main_for3_start:
              mov     r13            , 1              ; load->v110; null; save->v110
              mov     r10            , r15            ; load->v111
              mov     r15            , qword [rsp+128]; load->v16; null; save->v111
              mov     r10            , r15            ; load->v111
              mov     r11            , r13            ; load->v110
              add     r10            , r11            
              mov     r15            , r10            ; save->v111
              mov     r10            , qword [rsp+128]; load->v16
              mov     qword [rsp+128], r15            ; load->v111; assign->count; save->v16
_text__main_call14:
              call    _text__move                     
              mov     qword [rsp+896], rax            ; load->v112; null; save->v112
_text__main_call15:
              call    _text__merge                    
              mov     qword [rsp+904], rax            ; load->v113; null; save->v113
_text__main_for3_continue:
_text__main_call16:
              call    _text__win                      
              mov     qword [rsp+912], rax            ; load->v114; null; save->v114
              mov     r10            , qword [rsp+920]; load->v115
              mov     r10            , qword [rsp+912]; load->v114; null
              mov     qword [rsp+920], r10            ; save->v115; load->v115
              not     r10                             
              mov     qword [rsp+920], r10            ; save->v115; load->v115
              and     r10            , -1             
              mov     qword [rsp+920], r10            ; save->v115; load->v115
              cmp     r10b           , 0              
              mov     qword [rsp+920], r10            ; save->v115
              jne     _text__main_for3_start                 
;----------------------------------]
;[----------------------------------
_text__main_for3_end:
              mov     qword [rsp+960], _data_s6       ; load->v120; null; save->v120
_text__main_call20:
              mov     rdi            , qword [rsp+128]; load->v16; null
              call    _text__toString                 
              mov     qword [rsp+968], rax            ; load->v121; null; save->v121
              mov     rdi            , qword [rsp+960]; load->v120; null
              call    strlen                          
              mov     qword [rsp+976], rax            ; load->v122; null; save->v122
              mov     rdi            , qword [rsp+968]; load->v121; null
              call    strlen                          
              mov     qword [rsp+984], rax            ; load->v123; null; save->v123
              mov     r10            , qword [rsp+984]; load->v123
              mov     r11            , qword [rsp+976]; load->v122
              add     r10            , r11            
              mov     qword [rsp+984], r10            ; save->v123; load->v123
              add     r10            , 1              
              mov     qword [rsp+984], r10            ; save->v123
              mov     rdi            , qword [rsp+984]; load->v123; null
              call    malloc                          
              mov     qword [rsp+992], rax            ; load->v124; null; save->v124
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+960]; load->v120; null
              call    strcpy                          
              mov     rdi            , qword [rsp+992]; load->v124; null
              mov     r11            , qword [rsp+976]; load->v122
              add     rdi            , r11            
              mov     rsi            , qword [rsp+968]; load->v121; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
_text__main_call21:
              mov     rdi            , qword [rsp+992]; load->v124; null
              call    _text__print                    
              mov     qword [rsp+1000], rax            ; load->v125; null; save->v125
              mov     qword [rsp+1008], _data_s7       ; load->v126; null; save->v126
_text__main_call22:
              mov     rdi            , qword [rsp+1008]; load->v126; null
              call    _text__println                  
              mov     qword [rsp+1016], rax            ; load->v127; null; save->v127
_text__main_for0_continue:
              mov     qword [rsp+1024], 1              ; load->v128; null; save->v128
              mov     r10            , qword [rsp+1032]; load->v129
              mov     r10            , qword [rsp+56] ; load->v7; null
              mov     qword [rsp+1032], r10            ; save->v129; load->v129
              mov     r11            , qword [rsp+1024]; load->v128
              add     r10            , r11            
              mov     qword [rsp+1032], r10            ; save->v129
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , qword [rsp+1032]; load->v129; assign->T
              mov     qword [rsp+56] , r10            ; save->v7; load->v7
              mov     r11            , qword [rsp+72] ; load->v9
              cmp     r10d           , r11d           
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+1040]; load->v130
              setl    r10b                            
              mov     qword [rsp+1040], r10            ; save->v130; load->v130
              and     r10            , 255            
              mov     qword [rsp+1040], r10            ; save->v130; load->v130
              cmp     r10b           , 0              
              mov     qword [rsp+1040], r10            ; save->v130
              jne     _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
              mov     rbp            , 0              ; load->v131; null; save->v131
_text__main_ret1:
              mov     rax            , rbp            ; load->v131; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 1064           
              ret                                     
;----------------------------------]
                                                      
