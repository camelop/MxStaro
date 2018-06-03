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
_data_s1:
              db      `%s\n`                          
              db      0                               
_data_s3:
              db      `\n`                            
              db      0                               
_data_s0:
              db      `%s`                            
              db      0                               

              section .bss                            
_data_bss_n:
              resb    8                               
_data_bss_a:
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
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     rbp            , rdi            ; null; save->v6
              mov     rbx            , _data_s0       ; null; save->v7
_text__print_call0:
              mov     rdi            , rbx            ; load->v7; null
              mov     rsi            , rbp            ; load->v6; null
              call    _text__printf                   
              mov     rbp            , rax            ; null; save->v8
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
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     rbp            , rdi            ; null; save->v6
              mov     rbx            , _data_s1       ; null; save->v7
_text__println_call0:
              mov     rdi            , rbx            ; load->v7; null
              mov     rsi            , rbp            ; load->v6; null
              call    _text__printf                   
              mov     rbp            , rax            ; null; save->v8
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
_datainit_inexplicit_return_void:
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__exchange ] ---
;[----------------------------------
_text__exchange:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     rbp            , rdi            ; null; save->v6
              mov     rbx            , rsi            ; null; save->v7
              mov     r12            , [_data_bss_a]  ; null; save->v8
              mov     r13            , rbp            ; load->v6; null; save->v9
              mov     r10            , r13            ; load->v9
              sal     r10            , 3              ; from imul              mov     r13            , r10            ; save->v9; load->v9
              add     r10            , 8              
              mov     r13            , r10            ; save->v9; load->v9
              mov     r11            , r12            ; load->v8
              add     r10            , r11            
              mov     r13            , r10            ; save->v9
              mov     r11            , r13            ; translate->qword [v9]
              mov     r12            , qword [r11]    ; null; save->v10
              mov     r13            , r12            ; load->v10; init->t; save->v11
              mov     r12            , [_data_bss_a]  ; null; save->v12
              mov     r14            , rbx            ; load->v7; null; save->v13
              mov     r10            , r14            ; load->v13
              sal     r10            , 3              ; from imul              mov     r14            , r10            ; save->v13; load->v13
              add     r10            , 8              
              mov     r14            , r10            ; save->v13; load->v13
              mov     r11            , r12            ; load->v12
              add     r10            , r11            
              mov     r14            , r10            ; save->v13
              mov     r11            , r14            ; translate->qword [v13]
              mov     r12            , qword [r11]    ; null; save->v14
              mov     r14            , [_data_bss_a]  ; null; save->v15
              mov     r15            , rbp            ; load->v6; null; save->v16
              mov     r10            , r15            ; load->v16
              sal     r10            , 3              ; from imul              mov     r15            , r10            ; save->v16; load->v16
              add     r10            , 8              
              mov     r15            , r10            ; save->v16; load->v16
              mov     r11            , r14            ; load->v15
              add     r10            , r11            
              mov     r15            , r10            ; save->v16
              mov     r11            , r15            ; translate->qword [v16]
              mov     rbp            , qword [r11]    ; null; save->v17
              mov     r10            , r15            ; translate->qword [v16]
              mov     qword [r10]    , r12            ; load->v14; assign->a[x]
              mov     rbp            , [_data_bss_a]  ; null; save->v18
              mov     r12            , rbx            ; load->v7; null; save->v19
              mov     r10            , r12            ; load->v19
              sal     r10            , 3              ; from imul              mov     r12            , r10            ; save->v19; load->v19
              add     r10            , 8              
              mov     r12            , r10            ; save->v19; load->v19
              mov     r11            , rbp            ; load->v18
              add     r10            , r11            
              mov     r12            , r10            ; save->v19
              mov     r11            , r12            ; translate->qword [v19]
              mov     rbp            , qword [r11]    ; null; save->v20
              mov     r10            , r12            ; translate->qword [v19]
              mov     qword [r10]    , r13            ; load->v11; assign->a[y]
_text__exchange_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__makeHeap ] ---
;[----------------------------------
_text__makeHeap:
              sub     rsp            , 328            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     rbp            , [_data_bss_n]  ; null; save->v9
              mov     rbx            , 1              ; null; save->v10
              mov     r12            , rbp            ; load->v9; null; save->v11
              mov     r10            , r12            ; load->v11
              mov     r11            , rbx            ; load->v10
              sub     r10            , r11            
              mov     r12            , r10            ; save->v11
              mov     rbp            , 2              ; null; save->v12
              mov     rbx            , rdx            ; null; save->v14
              mov     r13            , rax            ; null; save->v15
              mov     rax            , r12            ; load->v11; null
              and     rax            , -1             
              mov     r10            , rbp            ; load->v12
              and     r10d           , -1             
              mov     rbp            , r10            ; save->v12
              cqo                                     
              mov     r10            , rbp            ; load->v12
              idiv    r10d                            
              mov     rbp            , rax            ; save->v12; null; save->v13
              mov     rdx            , rbx            ; load->v14; null
              mov     rax            , r13            ; load->v15; null
              mov     rbx            , rbp            ; load->v13; assign->i; save->v6
              mov     rbp            , 0              ; null; save->v16
              mov     r12            , rbp            ; load->v16; assign->t; save->v7
              mov     rbp            , 0              ; null; save->v17
              mov     r12            , rbp            ; load->v17; assign->j; save->v8
_text__makeHeap_for0_init:
              mov     rbp            , 0              ; null; save->v18
              mov     r10            , rbx            ; load->v6
              mov     r11            , rbp            ; load->v18
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , r13            ; load->v19
              setge   r10b                            
              mov     r13            , r10            ; save->v19; load->v19
              and     r10            , 255            
              mov     r13            , r10            ; save->v19
_text__makeHeap_for0_init_check:
              mov     r10            , r13            ; load->v19
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v19
              je      _text__makeHeap_for0_end                 
;----------------------------------]
;[----------------------------------
_text__makeHeap_for0_start:
              mov     r14            , 2              ; null; save->v20
              mov     r15            , rbx            ; load->v6; null; save->v21
              mov     r10            , r15            ; load->v21
              mov     r11            , r14            ; load->v20
              imul    r10            , r11            
              mov     r15            , r10            ; save->v21; load->v21
              and     r10            , -1             
              mov     r15            , r10            ; save->v21
              mov     r12            , r15            ; load->v21; assign->j; save->v8
_text__makeHeap_if0_init:
_text__makeHeap_and0_lvalue:
              mov     qword [rsp+48] , 0              ; null; save->v22
              mov     qword [rsp+56] , 2              ; null; save->v23
              mov     qword [rsp+64] , rbx            ; load->v6; null; save->v24
              mov     r10            , qword [rsp+64] ; load->v24
              mov     r11            , qword [rsp+56] ; load->v23
              imul    r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v24; load->v24
              and     r10            , -1             
              mov     qword [rsp+64] , r10            ; save->v24
              mov     qword [rsp+72] , 1              ; null; save->v25
              mov     r10            , qword [rsp+64] ; load->v24; null
              mov     qword [rsp+80] , r10            ; save->v26; load->v26
              mov     r11            , qword [rsp+72] ; load->v25
              add     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v26
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+88] , r10            ; save->v27
              mov     r10            , qword [rsp+80] ; load->v26
              mov     r11            , qword [rsp+88] ; load->v27
              cmp     r10d           , r11d           
              mov     qword [rsp+80] , r10            ; save->v26
              mov     r10            , qword [rsp+96] ; load->v28
              setl    r10b                            
              mov     qword [rsp+96] , r10            ; save->v28; load->v28
              and     r10            , 255            
              mov     qword [rsp+96] , r10            ; save->v28; load->v28
              cmp     r10            , 0              
              mov     qword [rsp+96] , r10            ; save->v28
              je      _text__makeHeap_and0_end                 
;----------------------------------]
;[----------------------------------
_text__makeHeap_and0_rvalue:
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+104], r10            ; save->v29
              mov     qword [rsp+112], 2              ; null; save->v30
              mov     qword [rsp+120], rbx            ; load->v6; null; save->v31
              mov     r10            , qword [rsp+120]; load->v31
              mov     r11            , qword [rsp+112]; load->v30
              imul    r10            , r11            
              mov     qword [rsp+120], r10            ; save->v31; load->v31
              and     r10            , -1             
              mov     qword [rsp+120], r10            ; save->v31
              mov     qword [rsp+128], 1              ; null; save->v32
              mov     r10            , qword [rsp+120]; load->v31; null
              mov     qword [rsp+136], r10            ; save->v33; load->v33
              mov     r11            , qword [rsp+128]; load->v32
              add     r10            , r11            
              mov     qword [rsp+136], r10            ; save->v33; load->v33; null
              mov     qword [rsp+144], r10            ; save->v34; load->v34
              sal     r10            , 3              ; from imul              mov     qword [rsp+144], r10            ; save->v34; load->v34
              add     r10            , 8              
              mov     qword [rsp+144], r10            ; save->v34; load->v34
              mov     r11            , qword [rsp+104]; load->v29
              add     r10            , r11            
              mov     qword [rsp+144], r10            ; save->v34
              mov     r11            , qword [rsp+144]; translate->qword [v34]
              mov     r10            , qword [r11]    
              mov     qword [rsp+152], r10            ; save->v35
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+160], r10            ; save->v36
              mov     qword [rsp+168], 2              ; null; save->v37
              mov     qword [rsp+176], rbx            ; load->v6; null; save->v38
              mov     r10            , qword [rsp+176]; load->v38
              mov     r11            , qword [rsp+168]; load->v37
              imul    r10            , r11            
              mov     qword [rsp+176], r10            ; save->v38; load->v38
              and     r10            , -1             
              mov     qword [rsp+176], r10            ; save->v38; load->v38; null
              mov     qword [rsp+184], r10            ; save->v39; load->v39
              sal     r10            , 3              ; from imul              mov     qword [rsp+184], r10            ; save->v39; load->v39
              add     r10            , 8              
              mov     qword [rsp+184], r10            ; save->v39; load->v39
              mov     r11            , qword [rsp+160]; load->v36
              add     r10            , r11            
              mov     qword [rsp+184], r10            ; save->v39
              mov     r11            , qword [rsp+184]; translate->qword [v39]
              mov     r10            , qword [r11]    
              mov     qword [rsp+192], r10            ; save->v40
              mov     r10            , qword [rsp+152]; load->v35
              mov     r11            , qword [rsp+192]; load->v40
              cmp     r10d           , r11d           
              mov     qword [rsp+152], r10            ; save->v35
              mov     r10            , qword [rsp+200]; load->v41
              setl    r10b                            
              mov     qword [rsp+200], r10            ; save->v41; load->v41
              and     r10            , 255            
              mov     qword [rsp+200], r10            ; save->v41; load->v41
              cmp     r10            , 0              
              mov     qword [rsp+200], r10            ; save->v41
              je      _text__makeHeap_and0_end                 
              mov     qword [rsp+48] , 255            ; null; save->v22
_text__makeHeap_and0_end:
_text__makeHeap_if0_check:
              mov     r10            , qword [rsp+48] ; load->v22
              cmp     r10b           , 0              
              mov     qword [rsp+48] , r10            ; save->v22
              je      _text__makeHeap_if0_else                 
;----------------------------------]
;[----------------------------------
_text__makeHeap_if0_start:
              mov     qword [rsp+208], 2              ; null; save->v42
              mov     qword [rsp+216], rbx            ; load->v6; null; save->v43
              mov     r10            , qword [rsp+216]; load->v43
              mov     r11            , qword [rsp+208]; load->v42
              imul    r10            , r11            
              mov     qword [rsp+216], r10            ; save->v43; load->v43
              and     r10            , -1             
              mov     qword [rsp+216], r10            ; save->v43
              mov     qword [rsp+224], 1              ; null; save->v44
              mov     r10            , qword [rsp+216]; load->v43; null
              mov     qword [rsp+232], r10            ; save->v45; load->v45
              mov     r11            , qword [rsp+224]; load->v44
              add     r10            , r11            
              mov     qword [rsp+232], r10            ; save->v45
              mov     r12            , qword [rsp+232]; load->v45; assign->j; save->v8
              jmp     _text__makeHeap_if0_end                 
;----------------------------------]
;[----------------------------------
_text__makeHeap_if0_else:
_text__makeHeap_if0_end:
_text__makeHeap_if1_init:
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+240], r10            ; save->v46
              mov     qword [rsp+248], rbx            ; load->v6; null; save->v47
              mov     r10            , qword [rsp+248]; load->v47
              sal     r10            , 3              ; from imul              mov     qword [rsp+248], r10            ; save->v47; load->v47
              add     r10            , 8              
              mov     qword [rsp+248], r10            ; save->v47; load->v47
              mov     r11            , qword [rsp+240]; load->v46
              add     r10            , r11            
              mov     qword [rsp+248], r10            ; save->v47
              mov     r11            , qword [rsp+248]; translate->qword [v47]
              mov     r10            , qword [r11]    
              mov     qword [rsp+256], r10            ; save->v48
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+264], r10            ; save->v49
              mov     qword [rsp+272], r12            ; load->v8; null; save->v50
              mov     r10            , qword [rsp+272]; load->v50
              sal     r10            , 3              ; from imul              mov     qword [rsp+272], r10            ; save->v50; load->v50
              add     r10            , 8              
              mov     qword [rsp+272], r10            ; save->v50; load->v50
              mov     r11            , qword [rsp+264]; load->v49
              add     r10            , r11            
              mov     qword [rsp+272], r10            ; save->v50
              mov     r11            , qword [rsp+272]; translate->qword [v50]
              mov     r10            , qword [r11]    
              mov     qword [rsp+280], r10            ; save->v51
_text__makeHeap_if1_check:
              mov     r10            , qword [rsp+256]; load->v48
              mov     r11            , qword [rsp+280]; load->v51
              cmp     r10d           , r11d           
              mov     qword [rsp+256], r10            ; save->v48
              jle     _text__makeHeap_if1_else                 
;----------------------------------]
;[----------------------------------
_text__makeHeap_if1_start:
_text__makeHeap_call0:
              mov     rdi            , rbx            ; load->v6; null
              mov     rsi            , r12            ; load->v8; null
              call    _text__exchange                 
              mov     qword [rsp+288], rax            ; null; save->v52
              jmp     _text__makeHeap_if1_end                 
;----------------------------------]
;[----------------------------------
_text__makeHeap_if1_else:
_text__makeHeap_if1_end:
              mov     qword [rsp+296], 1              ; null; save->v53
              mov     qword [rsp+304], rbx            ; load->v6; null; save->v54
              mov     r10            , qword [rsp+304]; load->v54
              mov     r11            , qword [rsp+296]; load->v53
              sub     r10            , r11            
              mov     qword [rsp+304], r10            ; save->v54
              mov     rbx            , qword [rsp+304]; load->v54; assign->i; save->v6
_text__makeHeap_for0_continue:
              mov     qword [rsp+312], 0              ; null; save->v55
              mov     r10            , rbx            ; load->v6
              mov     r11            , qword [rsp+312]; load->v55
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              jge     _text__makeHeap_for0_start                 
;----------------------------------]
;[----------------------------------
_text__makeHeap_for0_end:
              mov     rbp            , 0              ; null; save->v56
_text__makeHeap_ret0:
              mov     rax            , rbp            ; load->v56; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 328            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__adjustHeap ] ---
;[----------------------------------
_text__adjustHeap:
              sub     rsp            , 424            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     rbp            , rdi            ; null; save->v6
              mov     rbx            , 0              ; null; save->v10
              mov     r12            , rbx            ; load->v10; assign->i; save->v7
              mov     rbx            , 0              ; null; save->v11
              mov     r13            , rbx            ; load->v11; assign->j; save->v8
              mov     rbx            , 0              ; null; save->v12
              mov     r14            , rbx            ; load->v12; assign->t; save->v9
_text__adjustHeap_for0_init:
              mov     rbx            , 2              ; null; save->v13
              mov     r14            , r12            ; load->v7; null; save->v14
              mov     r10            , r14            ; load->v14
              mov     r11            , rbx            ; load->v13
              imul    r10            , r11            
              mov     r14            , r10            ; save->v14; load->v14
              and     r10            , -1             
              mov     r14            , r10            ; save->v14; load->v14
              mov     r11            , rbp            ; load->v6
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v14
              mov     r10            , r15            ; load->v15
              setl    r10b                            
              mov     r15            , r10            ; save->v15; load->v15
              and     r10            , 255            
              mov     r15            , r10            ; save->v15
_text__adjustHeap_for0_init_check:
              mov     r10            , r15            ; load->v15
              cmp     r10b           , 0              
              mov     r15            , r10            ; save->v15
              je      _text__adjustHeap_for0_end                 
;----------------------------------]
;[----------------------------------
_text__adjustHeap_for0_start:
              mov     qword [rsp+48] , 2              ; null; save->v16
              mov     qword [rsp+56] , r12            ; load->v7; null; save->v17
              mov     r10            , qword [rsp+56] ; load->v17
              mov     r11            , qword [rsp+48] ; load->v16
              imul    r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v17; load->v17
              and     r10            , -1             
              mov     qword [rsp+56] , r10            ; save->v17
              mov     r13            , qword [rsp+56] ; load->v17; assign->j; save->v8
_text__adjustHeap_if0_init:
_text__adjustHeap_and0_lvalue:
              mov     qword [rsp+64] , 0              ; null; save->v18
              mov     qword [rsp+72] , 2              ; null; save->v19
              mov     qword [rsp+80] , r12            ; load->v7; null; save->v20
              mov     r10            , qword [rsp+80] ; load->v20
              mov     r11            , qword [rsp+72] ; load->v19
              imul    r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v20; load->v20
              and     r10            , -1             
              mov     qword [rsp+80] , r10            ; save->v20
              mov     qword [rsp+88] , 1              ; null; save->v21
              mov     r10            , qword [rsp+80] ; load->v20; null
              mov     qword [rsp+96] , r10            ; save->v22; load->v22
              mov     r11            , qword [rsp+88] ; load->v21
              add     r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v22; load->v22
              mov     r11            , rbp            ; load->v6
              cmp     r10d           , r11d           
              mov     qword [rsp+96] , r10            ; save->v22
              mov     r10            , qword [rsp+104]; load->v23
              setl    r10b                            
              mov     qword [rsp+104], r10            ; save->v23; load->v23
              and     r10            , 255            
              mov     qword [rsp+104], r10            ; save->v23; load->v23
              cmp     r10            , 0              
              mov     qword [rsp+104], r10            ; save->v23
              je      _text__adjustHeap_and0_end                 
;----------------------------------]
;[----------------------------------
_text__adjustHeap_and0_rvalue:
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+112], r10            ; save->v24
              mov     qword [rsp+120], 2              ; null; save->v25
              mov     qword [rsp+128], r12            ; load->v7; null; save->v26
              mov     r10            , qword [rsp+128]; load->v26
              mov     r11            , qword [rsp+120]; load->v25
              imul    r10            , r11            
              mov     qword [rsp+128], r10            ; save->v26; load->v26
              and     r10            , -1             
              mov     qword [rsp+128], r10            ; save->v26
              mov     qword [rsp+136], 1              ; null; save->v27
              mov     r10            , qword [rsp+128]; load->v26; null
              mov     qword [rsp+144], r10            ; save->v28; load->v28
              mov     r11            , qword [rsp+136]; load->v27
              add     r10            , r11            
              mov     qword [rsp+144], r10            ; save->v28; load->v28; null
              mov     qword [rsp+152], r10            ; save->v29; load->v29
              sal     r10            , 3              ; from imul              mov     qword [rsp+152], r10            ; save->v29; load->v29
              add     r10            , 8              
              mov     qword [rsp+152], r10            ; save->v29; load->v29
              mov     r11            , qword [rsp+112]; load->v24
              add     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v29
              mov     r11            , qword [rsp+152]; translate->qword [v29]
              mov     r10            , qword [r11]    
              mov     qword [rsp+160], r10            ; save->v30
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+168], r10            ; save->v31
              mov     qword [rsp+176], 2              ; null; save->v32
              mov     qword [rsp+184], r12            ; load->v7; null; save->v33
              mov     r10            , qword [rsp+184]; load->v33
              mov     r11            , qword [rsp+176]; load->v32
              imul    r10            , r11            
              mov     qword [rsp+184], r10            ; save->v33; load->v33
              and     r10            , -1             
              mov     qword [rsp+184], r10            ; save->v33; load->v33; null
              mov     qword [rsp+192], r10            ; save->v34; load->v34
              sal     r10            , 3              ; from imul              mov     qword [rsp+192], r10            ; save->v34; load->v34
              add     r10            , 8              
              mov     qword [rsp+192], r10            ; save->v34; load->v34
              mov     r11            , qword [rsp+168]; load->v31
              add     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v34
              mov     r11            , qword [rsp+192]; translate->qword [v34]
              mov     r10            , qword [r11]    
              mov     qword [rsp+200], r10            ; save->v35
              mov     r10            , qword [rsp+160]; load->v30
              mov     r11            , qword [rsp+200]; load->v35
              cmp     r10d           , r11d           
              mov     qword [rsp+160], r10            ; save->v30
              mov     r10            , qword [rsp+208]; load->v36
              setl    r10b                            
              mov     qword [rsp+208], r10            ; save->v36; load->v36
              and     r10            , 255            
              mov     qword [rsp+208], r10            ; save->v36; load->v36
              cmp     r10            , 0              
              mov     qword [rsp+208], r10            ; save->v36
              je      _text__adjustHeap_and0_end                 
              mov     qword [rsp+64] , 255            ; null; save->v18
_text__adjustHeap_and0_end:
_text__adjustHeap_if0_check:
              mov     r10            , qword [rsp+64] ; load->v18
              cmp     r10b           , 0              
              mov     qword [rsp+64] , r10            ; save->v18
              je      _text__adjustHeap_if0_else                 
;----------------------------------]
;[----------------------------------
_text__adjustHeap_if0_start:
              mov     qword [rsp+216], 2              ; null; save->v37
              mov     qword [rsp+224], r12            ; load->v7; null; save->v38
              mov     r10            , qword [rsp+224]; load->v38
              mov     r11            , qword [rsp+216]; load->v37
              imul    r10            , r11            
              mov     qword [rsp+224], r10            ; save->v38; load->v38
              and     r10            , -1             
              mov     qword [rsp+224], r10            ; save->v38
              mov     qword [rsp+232], 1              ; null; save->v39
              mov     r10            , qword [rsp+224]; load->v38; null
              mov     qword [rsp+240], r10            ; save->v40; load->v40
              mov     r11            , qword [rsp+232]; load->v39
              add     r10            , r11            
              mov     qword [rsp+240], r10            ; save->v40
              mov     r13            , qword [rsp+240]; load->v40; assign->j; save->v8
              jmp     _text__adjustHeap_if0_end                 
;----------------------------------]
;[----------------------------------
_text__adjustHeap_if0_else:
_text__adjustHeap_if0_end:
_text__adjustHeap_if1_init:
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+248], r10            ; save->v41
              mov     qword [rsp+256], r12            ; load->v7; null; save->v42
              mov     r10            , qword [rsp+256]; load->v42
              sal     r10            , 3              ; from imul              mov     qword [rsp+256], r10            ; save->v42; load->v42
              add     r10            , 8              
              mov     qword [rsp+256], r10            ; save->v42; load->v42
              mov     r11            , qword [rsp+248]; load->v41
              add     r10            , r11            
              mov     qword [rsp+256], r10            ; save->v42
              mov     r11            , qword [rsp+256]; translate->qword [v42]
              mov     r10            , qword [r11]    
              mov     qword [rsp+264], r10            ; save->v43
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+272], r10            ; save->v44
              mov     qword [rsp+280], r13            ; load->v8; null; save->v45
              mov     r10            , qword [rsp+280]; load->v45
              sal     r10            , 3              ; from imul              mov     qword [rsp+280], r10            ; save->v45; load->v45
              add     r10            , 8              
              mov     qword [rsp+280], r10            ; save->v45; load->v45
              mov     r11            , qword [rsp+272]; load->v44
              add     r10            , r11            
              mov     qword [rsp+280], r10            ; save->v45
              mov     r11            , qword [rsp+280]; translate->qword [v45]
              mov     r10            , qword [r11]    
              mov     qword [rsp+288], r10            ; save->v46
_text__adjustHeap_if1_check:
              mov     r10            , qword [rsp+264]; load->v43
              mov     r11            , qword [rsp+288]; load->v46
              cmp     r10d           , r11d           
              mov     qword [rsp+264], r10            ; save->v43
              jle     _text__adjustHeap_if1_else                 
;----------------------------------]
;[----------------------------------
_text__adjustHeap_if1_start:
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+296], r10            ; save->v47
              mov     qword [rsp+304], r12            ; load->v7; null; save->v48
              mov     r10            , qword [rsp+304]; load->v48
              sal     r10            , 3              ; from imul              mov     qword [rsp+304], r10            ; save->v48; load->v48
              add     r10            , 8              
              mov     qword [rsp+304], r10            ; save->v48; load->v48
              mov     r11            , qword [rsp+296]; load->v47
              add     r10            , r11            
              mov     qword [rsp+304], r10            ; save->v48
              mov     r11            , qword [rsp+304]; translate->qword [v48]
              mov     r10            , qword [r11]    
              mov     qword [rsp+312], r10            ; save->v49; load->v49; init->t
              mov     qword [rsp+320], r10            ; save->v50
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+328], r10            ; save->v51
              mov     qword [rsp+336], r13            ; load->v8; null; save->v52
              mov     r10            , qword [rsp+336]; load->v52
              sal     r10            , 3              ; from imul              mov     qword [rsp+336], r10            ; save->v52; load->v52
              add     r10            , 8              
              mov     qword [rsp+336], r10            ; save->v52; load->v52
              mov     r11            , qword [rsp+328]; load->v51
              add     r10            , r11            
              mov     qword [rsp+336], r10            ; save->v52
              mov     r11            , qword [rsp+336]; translate->qword [v52]
              mov     r10            , qword [r11]    
              mov     qword [rsp+344], r10            ; save->v53
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+352], r10            ; save->v54
              mov     qword [rsp+360], r12            ; load->v7; null; save->v55
              mov     r10            , qword [rsp+360]; load->v55
              sal     r10            , 3              ; from imul              mov     qword [rsp+360], r10            ; save->v55; load->v55
              add     r10            , 8              
              mov     qword [rsp+360], r10            ; save->v55; load->v55
              mov     r11            , qword [rsp+352]; load->v54
              add     r10            , r11            
              mov     qword [rsp+360], r10            ; save->v55
              mov     r11            , qword [rsp+360]; translate->qword [v55]
              mov     r10            , qword [r11]    
              mov     qword [rsp+368], r10            ; save->v56
              mov     r10            , qword [rsp+360]; translate->qword [v55]
              mov     r11            , qword [rsp+344]; load->v53
              mov     qword [r10]    , r11            ; assign->a[i]
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+376], r10            ; save->v57
              mov     qword [rsp+384], r13            ; load->v8; null; save->v58
              mov     r10            , qword [rsp+384]; load->v58
              sal     r10            , 3              ; from imul              mov     qword [rsp+384], r10            ; save->v58; load->v58
              add     r10            , 8              
              mov     qword [rsp+384], r10            ; save->v58; load->v58
              mov     r11            , qword [rsp+376]; load->v57
              add     r10            , r11            
              mov     qword [rsp+384], r10            ; save->v58
              mov     r11            , qword [rsp+384]; translate->qword [v58]
              mov     r10            , qword [r11]    
              mov     qword [rsp+392], r10            ; save->v59
              mov     r10            , qword [rsp+384]; translate->qword [v58]
              mov     r11            , qword [rsp+320]; load->v50
              mov     qword [r10]    , r11            ; assign->a[j]
              mov     r12            , r13            ; load->v8; assign->i; save->v7
              jmp     _text__adjustHeap_if1_end                 
;----------------------------------]
;[----------------------------------
_text__adjustHeap_if1_else:
_text__adjustHeap_for0_break0:
              jmp     _text__adjustHeap_for0_end                 
;----------------------------------]
;[----------------------------------
_text__adjustHeap_if1_end:
_text__adjustHeap_for0_continue:
              mov     qword [rsp+400], 2              ; null; save->v60
              mov     qword [rsp+408], r12            ; load->v7; null; save->v61
              mov     r10            , qword [rsp+408]; load->v61
              mov     r11            , qword [rsp+400]; load->v60
              imul    r10            , r11            
              mov     qword [rsp+408], r10            ; save->v61; load->v61
              and     r10            , -1             
              mov     qword [rsp+408], r10            ; save->v61; load->v61
              mov     r11            , rbp            ; load->v6
              cmp     r10d           , r11d           
              mov     qword [rsp+408], r10            ; save->v61
              jl      _text__adjustHeap_for0_start                 
;----------------------------------]
;[----------------------------------
_text__adjustHeap_for0_end:
              mov     rbp            , 0              ; null; save->v62
_text__adjustHeap_ret0:
              mov     rax            , rbp            ; load->v62; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 424            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__heapSort ] ---
;[----------------------------------
_text__heapSort:
              sub     rsp            , 280            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     rbp            , 0              ; null; save->v8
              mov     rbx            , rbp            ; load->v8; assign->t; save->v6
_text__heapSort_for0_init:
              mov     r12            , 0              ; null; save->v9
              mov     rbp            , r12            ; load->v9; assign->k; save->v7
              mov     r13            , [_data_bss_n]  ; null; save->v10
              mov     r10            , rbp            ; load->v7
              mov     r11            , r13            ; load->v10
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v7
              mov     r10            , r14            ; load->v11
              setl    r10b                            
              mov     r14            , r10            ; save->v11; load->v11
              and     r10            , 255            
              mov     r14            , r10            ; save->v11
_text__heapSort_for0_init_check:
              mov     r10            , r14            ; load->v11
              cmp     r10b           , 0              
              mov     r14            , r10            ; save->v11
              je      _text__heapSort_for0_end                 
;----------------------------------]
;[----------------------------------
_text__heapSort_for0_start:
              mov     r15            , [_data_bss_a]  ; null; save->v12
              mov     qword [rsp+48] , 0              ; null; save->v13
              mov     r10            , qword [rsp+48] ; load->v13; null
              mov     qword [rsp+56] , r10            ; save->v14; load->v14
              sal     r10            , 3              ; from imul              mov     qword [rsp+56] , r10            ; save->v14; load->v14
              add     r10            , 8              
              mov     qword [rsp+56] , r10            ; save->v14; load->v14
              mov     r11            , r15            ; load->v12
              add     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v14
              mov     r11            , qword [rsp+56] ; translate->qword [v14]
              mov     r10            , qword [r11]    
              mov     qword [rsp+64] , r10            ; save->v15
              mov     rbx            , qword [rsp+64] ; load->v15; assign->t; save->v6
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+72] , r10            ; save->v16
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+80] , r10            ; save->v17; load->v17; null
              mov     qword [rsp+88] , r10            ; save->v18; load->v18
              mov     r11            , rbp            ; load->v7
              sub     r10            , r11            
              mov     qword [rsp+88] , r10            ; save->v18
              mov     qword [rsp+96] , 1              ; null; save->v19
              mov     r10            , qword [rsp+88] ; load->v18; null
              mov     qword [rsp+104], r10            ; save->v20; load->v20
              mov     r11            , qword [rsp+96] ; load->v19
              sub     r10            , r11            
              mov     qword [rsp+104], r10            ; save->v20; load->v20; null
              mov     qword [rsp+112], r10            ; save->v21; load->v21
              sal     r10            , 3              ; from imul              mov     qword [rsp+112], r10            ; save->v21; load->v21
              add     r10            , 8              
              mov     qword [rsp+112], r10            ; save->v21; load->v21
              mov     r11            , qword [rsp+72] ; load->v16
              add     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v21
              mov     r11            , qword [rsp+112]; translate->qword [v21]
              mov     r10            , qword [r11]    
              mov     qword [rsp+120], r10            ; save->v22
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+128], r10            ; save->v23
              mov     qword [rsp+136], 0              ; null; save->v24
              mov     r10            , qword [rsp+136]; load->v24; null
              mov     qword [rsp+144], r10            ; save->v25; load->v25
              sal     r10            , 3              ; from imul              mov     qword [rsp+144], r10            ; save->v25; load->v25
              add     r10            , 8              
              mov     qword [rsp+144], r10            ; save->v25; load->v25
              mov     r11            , qword [rsp+128]; load->v23
              add     r10            , r11            
              mov     qword [rsp+144], r10            ; save->v25
              mov     r11            , qword [rsp+144]; translate->qword [v25]
              mov     r10            , qword [r11]    
              mov     qword [rsp+152], r10            ; save->v26
              mov     r10            , qword [rsp+144]; translate->qword [v25]
              mov     r11            , qword [rsp+120]; load->v22
              mov     qword [r10]    , r11            ; assign->a[0]
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+160], r10            ; save->v27
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+168], r10            ; save->v28; load->v28; null
              mov     qword [rsp+176], r10            ; save->v29; load->v29
              mov     r11            , rbp            ; load->v7
              sub     r10            , r11            
              mov     qword [rsp+176], r10            ; save->v29
              mov     qword [rsp+184], 1              ; null; save->v30
              mov     r10            , qword [rsp+176]; load->v29; null
              mov     qword [rsp+192], r10            ; save->v31; load->v31
              mov     r11            , qword [rsp+184]; load->v30
              sub     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v31; load->v31; null
              mov     qword [rsp+200], r10            ; save->v32; load->v32
              sal     r10            , 3              ; from imul              mov     qword [rsp+200], r10            ; save->v32; load->v32
              add     r10            , 8              
              mov     qword [rsp+200], r10            ; save->v32; load->v32
              mov     r11            , qword [rsp+160]; load->v27
              add     r10            , r11            
              mov     qword [rsp+200], r10            ; save->v32
              mov     r11            , qword [rsp+200]; translate->qword [v32]
              mov     r10            , qword [r11]    
              mov     qword [rsp+208], r10            ; save->v33
              mov     r10            , qword [rsp+200]; translate->qword [v32]
              mov     qword [r10]    , rbx            ; load->v6; assign->a[n-k-1]
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+216], r10            ; save->v34; load->v34; null
              mov     qword [rsp+224], r10            ; save->v35; load->v35
              mov     r11            , rbp            ; load->v7
              sub     r10            , r11            
              mov     qword [rsp+224], r10            ; save->v35
              mov     qword [rsp+232], 1              ; null; save->v36
              mov     r10            , qword [rsp+224]; load->v35; null
              mov     qword [rsp+240], r10            ; save->v37; load->v37
              mov     r11            , qword [rsp+232]; load->v36
              sub     r10            , r11            
              mov     qword [rsp+240], r10            ; save->v37
_text__heapSort_call0:
              mov     rdi            , qword [rsp+240]; load->v37; null
              call    _text__adjustHeap                 
              mov     qword [rsp+248], rax            ; null; save->v38
_text__heapSort_for0_continue:
              mov     qword [rsp+256], 1              ; null; save->v39
              mov     qword [rsp+264], rbp            ; load->v7; null; save->v40
              mov     r10            , qword [rsp+264]; load->v40
              mov     r11            , qword [rsp+256]; load->v39
              add     r10            , r11            
              mov     qword [rsp+264], r10            ; save->v40
              mov     rbp            , qword [rsp+264]; load->v40; assign->k; save->v7
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+272], r10            ; save->v41
              mov     r10            , rbp            ; load->v7
              mov     r11            , qword [rsp+272]; load->v41
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v7
              jl      _text__heapSort_for0_start                 
;----------------------------------]
;[----------------------------------
_text__heapSort_for0_end:
              mov     rbp            , 0              ; null; save->v42
_text__heapSort_ret0:
              mov     rax            , rbp            ; load->v42; null
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
              sub     rsp            , 280            
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
              call    _text__getString                 
              mov     rbp            , rax            ; null; save->v7
_text__main_call1:
              mov     rdi            , rbp            ; load->v7; null
              call    _text_built_in_string_parseInt                 
              mov     qword [rsp+56] , rax            ; null; save->v8
              mov     r11            , qword [rsp+56] ; load->v8
              mov     [_data_bss_n]  , r11            
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+64] , r10            ; save->v9; load->v9; null
              mov     qword [rsp+72] , r10            ; save->v10; load->v10
              sal     r10            , 3              ; from imul              mov     qword [rsp+72] , r10            ; save->v10; load->v10
              add     r10            , 8              
              mov     qword [rsp+72] , r10            ; save->v10
              mov     rdi            , qword [rsp+72] ; load->v10; null
              call    malloc                          
              mov     qword [rsp+80] , rax            ; null; save->v11
              mov     r11            , qword [rsp+64] ; load->v9
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+80] ; load->v11
              mov     [_data_bss_a]  , r11            
_text__main_for0_init:
              mov     rbx            , 0              ; null; save->v12
              mov     qword [rsp+48] , rbx            ; load->v12; assign->i; save->v6
              mov     r12            , [_data_bss_a]  ; null; save->v13
_text__main_call2:
              mov     rdi            , r12            ; load->v13; null
              call    _text_built_in_array_size                 
              mov     qword [rsp+88] , rax            ; null; save->v14
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r11            , qword [rsp+88] ; load->v14
              cmp     r10d           , r11d           
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , r13            ; load->v15
              setl    r10b                            
              mov     r13            , r10            ; save->v15; load->v15
              and     r10            , 255            
              mov     r13            , r10            ; save->v15
_text__main_for0_init_check:
              mov     r10            , r13            ; load->v15
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v15
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
              mov     r14            , [_data_bss_a]  ; null; save->v16
              mov     r15            , qword [rsp+48] ; load->v6; null; save->v17
              mov     r10            , r15            ; load->v17
              sal     r10            , 3              ; from imul              mov     r15            , r10            ; save->v17; load->v17
              add     r10            , 8              
              mov     r15            , r10            ; save->v17; load->v17
              mov     r11            , r14            ; load->v16
              add     r10            , r11            
              mov     r15            , r10            ; save->v17
              mov     r11            , r15            ; translate->qword [v17]
              mov     rbp            , qword [r11]    ; null; save->v18
              mov     r10            , r15            ; translate->qword [v17]
              mov     r11            , qword [rsp+48] ; load->v6
              mov     qword [r10]    , r11            ; assign->a[i]
_text__main_for0_continue:
              mov     qword [rsp+96] , 1              ; null; save->v19
              mov     r10            , qword [rsp+48] ; load->v6; null
              mov     qword [rsp+104], r10            ; save->v20; load->v20
              mov     r11            , qword [rsp+96] ; load->v19
              add     r10            , r11            
              mov     qword [rsp+104], r10            ; save->v20; load->v20; assign->i
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+112], r10            ; save->v21
_text__main_call3:
              mov     rdi            , qword [rsp+112]; load->v21; null
              call    _text_built_in_array_size                 
              mov     qword [rsp+120], rax            ; null; save->v22
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r11            , qword [rsp+120]; load->v22
              cmp     r10d           , r11d           
              mov     qword [rsp+48] , r10            ; save->v6
              jl      _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
_text__main_call4:
              call    _text__makeHeap                 
              mov     rbp            , rax            ; null; save->v23
_text__main_call5:
              call    _text__heapSort                 
              mov     rbp            , rax            ; null; save->v24
_text__main_for1_init:
              mov     rbp            , 0              ; null; save->v25
              mov     qword [rsp+48] , rbp            ; load->v25; assign->i; save->v6
              mov     rbx            , [_data_bss_a]  ; null; save->v26
_text__main_call6:
              mov     rdi            , rbx            ; load->v26; null
              call    _text_built_in_array_size                 
              mov     qword [rsp+128], rax            ; null; save->v27
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r11            , qword [rsp+128]; load->v27
              cmp     r10d           , r11d           
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , r12            ; load->v28
              setl    r10b                            
              mov     r12            , r10            ; save->v28; load->v28
              and     r10            , 255            
              mov     r12            , r10            ; save->v28
_text__main_for1_init_check:
              mov     r10            , r12            ; load->v28
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v28
              je      _text__main_for1_end                 
;----------------------------------]
;[----------------------------------
_text__main_for1_start:
              mov     r13            , [_data_bss_a]  ; null; save->v36
              mov     r14            , qword [rsp+48] ; load->v6; null; save->v37
              mov     r10            , r14            ; load->v37
              sal     r10            , 3              ; from imul              mov     r14            , r10            ; save->v37; load->v37
              add     r10            , 8              
              mov     r14            , r10            ; save->v37; load->v37
              mov     r11            , r13            ; load->v36
              add     r10            , r11            
              mov     r14            , r10            ; save->v37
              mov     r11            , r14            ; translate->qword [v37]
              mov     r15            , qword [r11]    ; null; save->v38
_text__main_call10:
              mov     rdi            , r15            ; load->v38; null
              call    _text__toString                 
              mov     qword [rsp+192], rax            ; null; save->v39
              mov     qword [rsp+200], _data_s2       ; null; save->v40
              mov     rdi            , qword [rsp+192]; load->v39; null
              call    strlen                          
              mov     qword [rsp+208], rax            ; null; save->v41
              mov     rdi            , qword [rsp+200]; load->v40; null
              call    strlen                          
              mov     qword [rsp+216], rax            ; null; save->v42
              mov     r10            , qword [rsp+216]; load->v42
              mov     r11            , qword [rsp+208]; load->v41
              add     r10            , r11            
              mov     qword [rsp+216], r10            ; save->v42; load->v42
              add     r10            , 1              
              mov     qword [rsp+216], r10            ; save->v42
              mov     rdi            , qword [rsp+216]; load->v42; null
              call    malloc                          
              mov     qword [rsp+224], rax            ; null; save->v43
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+192]; load->v39; null
              call    strcpy                          
              mov     rdi            , qword [rsp+224]; load->v43; null
              mov     r11            , qword [rsp+208]; load->v41
              add     rdi            , r11            
              mov     rsi            , qword [rsp+200]; load->v40; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
_text__main_call11:
              mov     rdi            , qword [rsp+224]; load->v43; null
              call    _text__print                    
              mov     qword [rsp+232], rax            ; null; save->v44
_text__main_for1_continue:
              mov     qword [rsp+240], 39997          ; null; save->v45
              mov     r10            , qword [rsp+48] ; load->v6; null
              mov     qword [rsp+248], r10            ; save->v46; load->v46
              mov     r11            , qword [rsp+240]; load->v45
              add     r10            , r11            
              mov     qword [rsp+248], r10            ; save->v46; load->v46; assign->i
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+256], r10            ; save->v47
_text__main_call12:
              mov     rdi            , qword [rsp+256]; load->v47; null
              call    _text_built_in_array_size                 
              mov     qword [rsp+264], rax            ; null; save->v48
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r11            , qword [rsp+264]; load->v48
              cmp     r10d           , r11d           
              mov     qword [rsp+48] , r10            ; save->v6
              jl      _text__main_for1_start                 
;----------------------------------]
;[----------------------------------
_text__main_for1_end:
              mov     rbp            , _data_s3       ; null; save->v49
_text__main_call13:
              mov     rdi            , rbp            ; load->v49; null
              call    _text__print                    
              mov     rbp            , 0              ; null; save->v50; null; save->v51
_text__main_ret0:
              mov     rax            , rbp            ; load->v51; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 280            
              ret                                     
;----------------------------------]
                                                      
