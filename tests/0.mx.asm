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
              db      `Never Ever!`                   
              db      0                               
_data_s1:
              db      `%s\n`                          
              db      0                               
_data_s3:
              db      `length error!`                 
              db      0                               
_data_s0:
              db      `%s`                            
              db      0                               

              section .bss                            
_data_bss_A:
              resb    8                               
_data_bss_B:
              resb    8                               
_data_bss_C:
              resb    8                               
_data_bss_N:
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
_datainit_inexplicit_return_void:
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__calc ] ---
;[----------------------------------
_text__calc:
              sub     rsp            , 232            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbp            , rdi            ; load->v6; null; save->v6
_text__calc_call0:
              mov     rdi            , rbp            ; load->v6; null
              call    _text_built_in_string_length                 
              mov     qword [rsp+48] , rax            ; load->v7; null; save->v7
              mov     r10            , rbx            ; load->v8
              mov     rbx            , qword [rsp+48] ; load->v7; init->len; save->v8
_text__calc_if0_init:
              mov     r12            , 1              ; load->v9; null; save->v9
              mov     r10            , r12            ; load->v9
              mov     r11            , rbx            ; load->v8
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v9; load->v10
              sete    r10b                            
              mov     r12            , r10            ; save->v10; load->v10
              and     r10            , 255            
              mov     r12            , r10            ; save->v10
_text__calc_if0_check:
              mov     r10            , r12            ; load->v10
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v10
              je      _text__calc_if0_else                 
;----------------------------------]
;[----------------------------------
_text__calc_if0_start:
_text__calc_ret0:
              mov     rax            , rbp            ; load->v6; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 232            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__calc_if0_else:
_text__calc_if0_end:
              mov     r12            , 2              ; load->v11; null; save->v11
              mov     r13            , rdx            ; load->v13; null; save->v13
              mov     r14            , rax            ; load->v14; null; save->v14
              mov     rax            , rbx            ; load->v8; null
              and     rax            , -1             
              mov     r10            , r12            ; load->v11
              and     r10d           , -1             
              mov     r12            , r10            ; save->v11
              cqo                                     
              mov     r10            , r12            ; load->v11
              idiv    r10d                            
              mov     r12            , rax            ; save->v11; load->v12; null; save->v12
              mov     rdx            , r13            ; load->v13; null
              mov     rax            , r14            ; load->v14; null
              mov     r10            , r13            ; load->v15
              mov     r13            , r12            ; load->v12; init->mid; save->v15
              mov     r12            , 0              ; load->v16; null; save->v16
              mov     r14            , 1              ; load->v17; null; save->v17
              mov     r10            , r15            ; load->v18
              mov     r15            , r13            ; load->v15; null; save->v18
              mov     r10            , r15            ; load->v18
              mov     r11            , r14            ; load->v17
              sub     r10            , r11            
              mov     r15            , r10            ; save->v18
_text__calc_call1:
              mov     rdi            , rbp            ; load->v6; null
              mov     rsi            , r12            ; load->v16; null
              mov     rdx            , r15            ; load->v18; null
              call    _text_built_in_string_substring                 
              mov     qword [rsp+56] , rax            ; load->v19; null; save->v19
_text__calc_call2:
              mov     rdi            , qword [rsp+56] ; load->v19; null
              call    _text__calc                     
              mov     r12            , rax            ; load->v20; null; save->v20
              mov     r10            , qword [rsp+64] ; load->v21
              mov     qword [rsp+64] , r12            ; load->v20; init->L; save->v21
              mov     r12            , 1              ; load->v22; null; save->v22
              mov     r10            , r14            ; load->v23
              mov     r14            , rbx            ; load->v8; null; save->v23
              mov     r10            , r14            ; load->v23
              mov     r11            , r12            ; load->v22
              sub     r10            , r11            
              mov     r14            , r10            ; save->v23
_text__calc_call3:
              mov     rdi            , rbp            ; load->v6; null
              mov     rsi            , r13            ; load->v15; null
              mov     rdx            , r14            ; load->v23; null
              call    _text_built_in_string_substring                 
              mov     qword [rsp+72] , rax            ; load->v24; null; save->v24
_text__calc_call4:
              mov     rdi            , qword [rsp+72] ; load->v24; null
              call    _text__calc                     
              mov     rbp            , rax            ; load->v25; null; save->v25
              mov     r10            , qword [rsp+80] ; load->v26
              mov     qword [rsp+80] , rbp            ; load->v25; init->R; save->v26
_text__calc_if1_init:
              mov     r10            , qword [rsp+64] ; load->v21
              mov     r11            , qword [rsp+80] ; load->v26
              cmp     r10d           , r11d           
              mov     qword [rsp+64] , r10            ; save->v21
              mov     rdi            , qword [rsp+64] ; load->v21; null
              mov     rsi            , qword [rsp+80] ; load->v26; null
              call    strcmp                          
              cmp     rax            , 0              
              mov     r10            , qword [rsp+88] ; load->v27
              setl    r10b                            
              mov     qword [rsp+88] , r10            ; save->v27; load->v27
              and     r10            , 255            
              mov     qword [rsp+88] , r10            ; save->v27
_text__calc_if1_check:
              mov     r10            , qword [rsp+88] ; load->v27
              cmp     r10b           , 0              
              mov     qword [rsp+88] , r10            ; save->v27
              je      _text__calc_if1_else                 
;----------------------------------]
;[----------------------------------
_text__calc_if1_start:
              mov     rdi            , qword [rsp+64] ; load->v21; null
              call    strlen                          
              mov     qword [rsp+96] , rax            ; load->v28; null; save->v28
              mov     rdi            , qword [rsp+80] ; load->v26; null
              call    strlen                          
              mov     qword [rsp+104], rax            ; load->v29; null; save->v29
              mov     r10            , qword [rsp+104]; load->v29
              mov     r11            , qword [rsp+96] ; load->v28
              add     r10            , r11            
              mov     qword [rsp+104], r10            ; save->v29; load->v29
              add     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v29
              mov     rdi            , qword [rsp+104]; load->v29; null
              call    malloc                          
              mov     qword [rsp+112], rax            ; load->v30; null; save->v30
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+64] ; load->v21; null
              call    strcpy                          
              mov     rdi            , qword [rsp+112]; load->v30; null
              mov     r11            , qword [rsp+96] ; load->v28
              add     rdi            , r11            
              mov     rsi            , qword [rsp+80] ; load->v26; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
_text__calc_ret1:
              mov     rax            , qword [rsp+112]; load->v30; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 232            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__calc_if1_else:
_text__calc_if2_init:
              mov     r10            , qword [rsp+64] ; load->v21
              mov     r11            , qword [rsp+80] ; load->v26
              cmp     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v21
              mov     rdi            , qword [rsp+64] ; load->v21; null
              mov     rsi            , qword [rsp+80] ; load->v26; null
              call    strcmp                          
              cmp     rax            , 0              
              mov     r10            , qword [rsp+120]; load->v31
              sete    r10b                            
              mov     qword [rsp+120], r10            ; save->v31; load->v31
              and     r10            , 255            
              mov     qword [rsp+120], r10            ; save->v31
_text__calc_if2_check:
              mov     r10            , qword [rsp+120]; load->v31
              cmp     r10b           , 0              
              mov     qword [rsp+120], r10            ; save->v31
              je      _text__calc_if2_else                 
;----------------------------------]
;[----------------------------------
_text__calc_if2_start:
              mov     rbp            , 0              ; load->v32; null; save->v32
_text__calc_call5:
              mov     rdi            , qword [rsp+64] ; load->v21; null
              mov     rsi            , rbp            ; load->v32; null
              call    _text_built_in_string_ord                 
              mov     qword [rsp+128], rax            ; load->v33; null; save->v33
              mov     r10            , rbp            ; load->v34
              mov     rbp            , qword [rsp+128]; load->v33; init->l; save->v34
              mov     rbx            , 0              ; load->v35; null; save->v35
_text__calc_call6:
              mov     rdi            , qword [rsp+80] ; load->v26; null
              mov     rsi            , rbx            ; load->v35; null
              call    _text_built_in_string_ord                 
              mov     qword [rsp+136], rax            ; load->v36; null; save->v36
              mov     r10            , rbx            ; load->v37
              mov     rbx            , qword [rsp+136]; load->v36; init->r; save->v37
_text__calc_if3_init:
_text__calc_if3_check:
              mov     r10            , rbp            ; load->v34
              mov     r11            , rbx            ; load->v37
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v34
              jge     _text__calc_if3_else                 
;----------------------------------]
;[----------------------------------
_text__calc_if3_start:
              mov     rdi            , qword [rsp+64] ; load->v21; null
              call    strlen                          
              mov     qword [rsp+144], rax            ; load->v38; null; save->v38
              mov     rdi            , qword [rsp+80] ; load->v26; null
              call    strlen                          
              mov     qword [rsp+152], rax            ; load->v39; null; save->v39
              mov     r10            , qword [rsp+152]; load->v39
              mov     r11            , qword [rsp+144]; load->v38
              add     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v39; load->v39
              add     r10            , 1              
              mov     qword [rsp+152], r10            ; save->v39
              mov     rdi            , qword [rsp+152]; load->v39; null
              call    malloc                          
              mov     qword [rsp+160], rax            ; load->v40; null; save->v40
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+64] ; load->v21; null
              call    strcpy                          
              mov     rdi            , qword [rsp+160]; load->v40; null
              mov     r11            , qword [rsp+144]; load->v38
              add     rdi            , r11            
              mov     rsi            , qword [rsp+80] ; load->v26; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
_text__calc_ret2:
              mov     rax            , qword [rsp+160]; load->v40; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 232            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__calc_if3_else:
_text__calc_if3_end:
              mov     rdi            , qword [rsp+80] ; load->v26; null
              call    strlen                          
              mov     qword [rsp+168], rax            ; load->v41; null; save->v41
              mov     rdi            , qword [rsp+64] ; load->v21; null
              call    strlen                          
              mov     qword [rsp+176], rax            ; load->v42; null; save->v42
              mov     r10            , qword [rsp+176]; load->v42
              mov     r11            , qword [rsp+168]; load->v41
              add     r10            , r11            
              mov     qword [rsp+176], r10            ; save->v42; load->v42
              add     r10            , 1              
              mov     qword [rsp+176], r10            ; save->v42
              mov     rdi            , qword [rsp+176]; load->v42; null
              call    malloc                          
              mov     qword [rsp+184], rax            ; load->v43; null; save->v43
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+80] ; load->v26; null
              call    strcpy                          
              mov     rdi            , qword [rsp+184]; load->v43; null
              mov     r11            , qword [rsp+168]; load->v41
              add     rdi            , r11            
              mov     rsi            , qword [rsp+64] ; load->v21; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
_text__calc_ret3:
              mov     rax            , qword [rsp+184]; load->v43; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 232            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__calc_if2_else:
_text__calc_if4_init:
              mov     r10            , qword [rsp+64] ; load->v21
              mov     r11            , qword [rsp+80] ; load->v26
              cmp     r10d           , r11d           
              mov     qword [rsp+64] , r10            ; save->v21
              mov     rdi            , qword [rsp+64] ; load->v21; null
              mov     rsi            , qword [rsp+80] ; load->v26; null
              call    strcmp                          
              cmp     rax            , 0              
              mov     r10            , qword [rsp+192]; load->v44
              setg    r10b                            
              mov     qword [rsp+192], r10            ; save->v44; load->v44
              and     r10            , 255            
              mov     qword [rsp+192], r10            ; save->v44
_text__calc_if4_check:
              mov     r10            , qword [rsp+192]; load->v44
              cmp     r10b           , 0              
              mov     qword [rsp+192], r10            ; save->v44
              je      _text__calc_if4_else                 
;----------------------------------]
;[----------------------------------
_text__calc_if4_start:
              mov     rdi            , qword [rsp+80] ; load->v26; null
              call    strlen                          
              mov     qword [rsp+200], rax            ; load->v45; null; save->v45
              mov     rdi            , qword [rsp+64] ; load->v21; null
              call    strlen                          
              mov     qword [rsp+208], rax            ; load->v46; null; save->v46
              mov     r10            , qword [rsp+208]; load->v46
              mov     r11            , qword [rsp+200]; load->v45
              add     r10            , r11            
              mov     qword [rsp+208], r10            ; save->v46; load->v46
              add     r10            , 1              
              mov     qword [rsp+208], r10            ; save->v46
              mov     rdi            , qword [rsp+208]; load->v46; null
              call    malloc                          
              mov     qword [rsp+216], rax            ; load->v47; null; save->v47
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+80] ; load->v26; null
              call    strcpy                          
              mov     rdi            , qword [rsp+216]; load->v47; null
              mov     r11            , qword [rsp+200]; load->v45
              add     rdi            , r11            
              mov     rsi            , qword [rsp+64] ; load->v21; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
_text__calc_ret4:
              mov     rax            , qword [rsp+216]; load->v47; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 232            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__calc_if4_else:
_text__calc_if4_end:
_text__calc_if2_end:
_text__calc_if1_end:
              mov     rbp            , _data_s2       ; load->v48; null; save->v48
_text__calc_call7:
              mov     rdi            , rbp            ; load->v48; null
              call    _text__println                  
              mov     rbp            , rax            ; load->v49; null; save->v49
_text__calc_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 232            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 72             
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
              call    _text__getString                 
              mov     rbp            , rax            ; load->v6; null; save->v6
              mov     [_data_bss_A]  , rbp            ; load->v6; null
_text__main_call1:
              call    _text__getString                 
              mov     rbp            , rax            ; load->v7; null; save->v7
              mov     [_data_bss_B]  , rbp            ; load->v7; null
              mov     r10            , rbp            ; load->v8
              mov     rbp            , [_data_bss_B]  ; null; save->v8
_text__main_call2:
              mov     rdi            , rbp            ; load->v8; null
              call    _text_built_in_string_parseInt                 
              mov     qword [rsp+48] , rax            ; load->v9; null; save->v9
              mov     r11            , qword [rsp+48] ; load->v9
              mov     [_data_bss_N]  , r11            
_text__main_if0_init:
              mov     r10            , rbp            ; load->v10
              mov     rbp            , [_data_bss_A]  ; null; save->v10
_text__main_call3:
              mov     rdi            , rbp            ; load->v10; null
              call    _text_built_in_string_length                 
              mov     qword [rsp+56] , rax            ; load->v11; null; save->v11
              mov     r10            , rbp            ; load->v12
              mov     rbp            , [_data_bss_N]  ; null; save->v12
_text__main_if0_check:
              mov     r10            , qword [rsp+56] ; load->v11
              mov     r11            , rbp            ; load->v12
              cmp     r10d           , r11d           
              mov     qword [rsp+56] , r10            ; save->v11
              jge     _text__main_if0_else                 
;----------------------------------]
;[----------------------------------
_text__main_if0_start:
              mov     rbp            , _data_s3       ; load->v13; null; save->v13
_text__main_call4:
              mov     rdi            , rbp            ; load->v13; null
              call    _text__println                  
              mov     rbp            , 0              ; load->v14; null; save->v14; load->v15; null; save->v15
_text__main_ret0:
              mov     rax            , rbp            ; load->v15; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 72             
              ret                                     
;----------------------------------]
;[----------------------------------
_text__main_if0_else:
_text__main_if0_end:
              mov     rbp            , 0              ; load->v16; null; save->v16
              mov     r10            , rbx            ; load->v17
              mov     rbx            , [_data_bss_N]  ; null; save->v17
              mov     r12            , 1              ; load->v18; null; save->v18
              mov     r10            , r13            ; load->v19
              mov     r13            , rbx            ; load->v17; null; save->v19
              mov     r10            , r13            ; load->v19
              mov     r11            , r12            ; load->v18
              sub     r10            , r11            
              mov     r13            , r10            ; save->v19
              mov     r10            , rbx            ; load->v20
              mov     rbx            , [_data_bss_A]  ; null; save->v20
_text__main_call5:
              mov     rdi            , rbx            ; load->v20; null
              mov     rsi            , rbp            ; load->v16; null
              mov     rdx            , r13            ; load->v19; null
              call    _text_built_in_string_substring                 
              mov     qword [rsp+64] , rax            ; load->v21; null; save->v21
_text__main_call6:
              mov     rdi            , qword [rsp+64] ; load->v21; null
              call    _text__calc                     
              mov     rbp            , rax            ; load->v22; null; save->v22
              mov     [_data_bss_C]  , rbp            ; load->v22; null
              mov     r10            , rbp            ; load->v23
              mov     rbp            , [_data_bss_C]  ; null; save->v23
_text__main_call7:
              mov     rdi            , rbp            ; load->v23; null
              call    _text__println                  
              mov     rbp            , 0              ; load->v24; null; save->v24; load->v25; null; save->v25
_text__main_ret1:
              mov     rax            , rbp            ; load->v25; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 72             
              ret                                     
;----------------------------------]
                                                      
