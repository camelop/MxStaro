              global  main                            
              extern  strlen                          
              extern  malloc                          
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
_data_s9:
              db      ` step(s)`                      
              db      0                               
_data_s7:
              db      `:`                             
              db      0                               
_data_s4:
              db      `Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i`                 
              db      0                               
_data_s0:
              db      `%s`                            
              db      0                               
_data_s6:
              db      `step `                         
              db      0                               
_data_s8:
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
              add     qword [r12+r13], ' '            
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
              ret                                     
                                                      
_text_built_in_array_size:
              mov     rax            , qword [rdi]    
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
              sub     rsp            , 104            
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rdi            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbp            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , rbx            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r12            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r13            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r14            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , r15            
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , _data_s0       
              mov     qword [rsp+56] , r10            ; save->v7
_text__print_call0:
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , rax            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , rbx            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbp            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , r10            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r12            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r13            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r14            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , r15            
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r11            , qword [rsp+56] ; load->v7
              mov     rdi            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rsi            , r11            
              call    _text__printf                   
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r10            , rax            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r11            , qword [rsp+64] ; load->v8
              mov     rax            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbx            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbp            , r11            
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     r11            , qword [rsp+80] ; load->v10
              mov     r11            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r12            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r13            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r14            , r11            
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r15            , r11            
_text__print_inexplicit_return_void:
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbp            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbx            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r12            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r13            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r14            , r11            
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r15            , r11            
              add     rsp            , 104            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__println ] ---
;[----------------------------------
_text__println:
              sub     rsp            , 104            
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rdi            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbp            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , rbx            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r12            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r13            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r14            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , r15            
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , _data_s1       
              mov     qword [rsp+56] , r10            ; save->v7
_text__println_call0:
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , rax            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , rbx            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbp            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , r10            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r12            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r13            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r14            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , r15            
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r11            , qword [rsp+56] ; load->v7
              mov     rdi            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rsi            , r11            
              call    _text__printf                   
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r10            , rax            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r11            , qword [rsp+64] ; load->v8
              mov     rax            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbx            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbp            , r11            
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     r11            , qword [rsp+80] ; load->v10
              mov     r11            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r12            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r13            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r14            , r11            
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r15            , r11            
_text__println_inexplicit_return_void:
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbp            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbx            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r12            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r13            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r14            , r11            
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r15            , r11            
              add     rsp            , 104            
              ret                                     
;----------------------------------]
                                                      
; --- [ _datainit ] ---
;[----------------------------------
_datainit:
              sub     rsp            , 72             
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , 48271          
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r11            , qword [rsp+48] ; load->v6
              mov     [_data_bss_A]  , r11            
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , 2147483647     
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r11            , qword [rsp+56] ; load->v7
              mov     [_data_bss_M]  , r11            
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , 1              
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r11            , qword [rsp+64] ; load->v8
              mov     [_data_bss_seed], r11            
_datainit_inexplicit_return_void:
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              add     rsp            , 72             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__random ] ---
;[----------------------------------
_text__random:
              sub     rsp            , 216            
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , [_data_bss_A]  
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , [_data_bss_seed]
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , [_data_bss_Q]  
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , rdx            
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r10            , rax            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r11            , qword [rsp+56] ; load->v7
              mov     rax            , r11            
              mov     r11            , qword [rsp+56] ; load->v7
              mov     rdx            , r11            
              sar     rdx            , 32             
              mov     r10            , qword [rsp+64] ; load->v8
              idiv    r10d                            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , rdx            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r11            , qword [rsp+80] ; load->v10
              mov     rdx            , r11            
              mov     r11            , qword [rsp+88] ; load->v11
              mov     rax            , r11            
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+72] ; load->v9
              imul    r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , [_data_bss_R]  
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+112]; load->v14
              mov     r10            , [_data_bss_seed]
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , [_data_bss_Q]  
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , rdx            
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r11            , qword [rsp+112]; load->v14
              mov     rax            , r11            
              mov     r11            , qword [rsp+112]; load->v14
              mov     rdx            , r11            
              sar     rdx            , 32             
              mov     r10            , qword [rsp+120]; load->v15
              idiv    r10d                            
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , rax            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r11            , qword [rsp+80] ; load->v10
              mov     rdx            , r11            
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r10            , qword [rsp+144]; load->v18
              mov     r11            , qword [rsp+104]; load->v13
              mov     r10            , r11            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+144]; load->v18
              mov     r11            , qword [rsp+128]; load->v16
              imul    r10            , r11            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r11            , qword [rsp+96] ; load->v12
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+152]; load->v19
              mov     r11            , qword [rsp+144]; load->v18
              sub     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            ; init->tempseed
              mov     qword [rsp+160], r10            ; save->v20
_text__random_if0_init:
              mov     r10            , qword [rsp+168]; load->v21
              mov     r10            , 0              
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+168]; load->v21
              cmp     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+176]; load->v22
              setge   r10b                            
              mov     qword [rsp+176], r10            ; save->v22
_text__random_if0_check:
              mov     r10            , qword [rsp+176]; load->v22
              cmp     r10b           , 0              
              mov     qword [rsp+176], r10            ; save->v22
              je      _text__random_if0_else                 
;----------------------------------]
;[----------------------------------
_text__random_if0_start:
              mov     r11            , qword [rsp+160]; load->v20
              mov     [_data_bss_seed], r11            
              jmp     _text__random_if0_end                 
;----------------------------------]
;[----------------------------------
_text__random_if0_else:
              mov     r10            , qword [rsp+184]; load->v23
              mov     r10            , [_data_bss_M]  
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , qword [rsp+192]; load->v24
              mov     r11            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+192]; load->v24
              mov     r11            , qword [rsp+184]; load->v23
              add     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r11            , qword [rsp+192]; load->v24
              mov     [_data_bss_seed], r11            
_text__random_if0_end:
              mov     r10            , qword [rsp+200]; load->v25
              mov     r10            , [_data_bss_seed]
              mov     qword [rsp+200], r10            ; save->v25
_text__random_ret0:
              mov     r11            , qword [rsp+200]; load->v25
              mov     rax            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              add     rsp            , 216            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__random_inexplicit_return_void:
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              add     rsp            , 216            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__initialize ] ---
;[----------------------------------
_text__initialize:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rdi            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbp            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , rbx            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r12            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r13            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r14            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , r15            
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r11            , qword [rsp]    ; load->v0
              mov     [_data_bss_seed], r11            
_text__initialize_inexplicit_return_void:
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbp            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbx            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r12            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r13            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r14            , r11            
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r15            , r11            
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__swap ] ---
;[----------------------------------
_text__swap:
              sub     rsp            , 168            
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rdi            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rsi            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , rbp            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , rbx            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r12            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r13            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , r14            
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , r15            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp]    ; load->v0
              mov     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+72] ; load->v9
              imul    r10            , 8              
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+72] ; load->v9
              add     r10            , 8              
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+64] ; load->v8
              add     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r11            , qword [rsp+72] ; translate->qword [v9]
              mov     r10            , qword [r11]    
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r11            , qword [rsp+80] ; load->v10
              mov     r10            , r11            ; init->temp
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+104]; load->v13
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     r10            , r11            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+104]; load->v13
              imul    r10            , 8              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+104]; load->v13
              add     r10            , 8              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+104]; load->v13
              mov     r11            , qword [rsp+96] ; load->v12
              add     r10            , r11            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+104]; translate->qword [v13]
              mov     r10            , qword [r11]    
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r11            , qword [rsp]    ; load->v0
              mov     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+128]; load->v16
              imul    r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+128]; load->v16
              add     r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+128]; load->v16
              mov     r11            , qword [rsp+120]; load->v15
              add     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+136]; load->v17
              mov     r11            , qword [rsp+128]; translate->qword [v16]
              mov     r10            , qword [r11]    
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+128]; translate->qword [v16]
              mov     r11            , qword [rsp+112]; load->v14
              mov     qword [r10]    , r11            ; assign->a[x]
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+152]; load->v19
              imul    r10            , 8              
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+152]; load->v19
              add     r10            , 8              
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+152]; load->v19
              mov     r11            , qword [rsp+144]; load->v18
              add     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+152]; translate->qword [v19]
              mov     r10            , qword [r11]    
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+152]; translate->qword [v19]
              mov     r11            , qword [rsp+88] ; load->v11
              mov     qword [r10]    , r11            ; assign->a[y]
_text__swap_inexplicit_return_void:
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbp            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     rbx            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r12            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r13            , r11            
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r14            , r11            
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r15            , r11            
              add     rsp            , 168            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__pd ] ---
;[----------------------------------
_text__pd:
              sub     rsp            , 216            
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rdi            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbp            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , rbx            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r12            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r13            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r14            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , r15            
              mov     qword [rsp+48] , r10            ; save->v6
_text__pd_for0_init:
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp]    ; load->v0
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+64] ; load->v8
              setle   r10b                            
              mov     qword [rsp+64] , r10            ; save->v8
_text__pd_for0_init_check:
              mov     r10            , qword [rsp+64] ; load->v8
              cmp     r10b           , 0              
              mov     qword [rsp+64] , r10            ; save->v8
              je      _text__pd_for0_end                 
;----------------------------------]
;[----------------------------------
_text__pd_for0_start:
_text__pd_if0_init:
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r10            , 1              
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+80] ; load->v10
              mov     r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+88] ; load->v11
              add     r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+104]; load->v13
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+104]; load->v13
              mov     r11            , qword [rsp+96] ; load->v12
              imul    r10            , r11            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+112]; load->v14
              mov     r10            , 2              
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , rdx            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r11            , qword [rsp+104]; load->v13
              mov     rax            , r11            
              mov     r11            , qword [rsp+104]; load->v13
              mov     rdx            , r11            
              sar     rdx            , 32             
              mov     r10            , qword [rsp+112]; load->v14
              idiv    r10d                            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , rax            
              mov     qword [rsp+120], r10            ; save->v15
              mov     r11            , qword [rsp+128]; load->v16
              mov     rdx            , r11            
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r10            , qword [rsp]    ; load->v0
              mov     r11            , qword [rsp+120]; load->v15
              cmp     r10            , r11            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              sete    r10b                            
              mov     qword [rsp+144], r10            ; save->v18
_text__pd_if0_check:
              mov     r10            , qword [rsp+144]; load->v18
              cmp     r10b           , 0              
              mov     qword [rsp+144], r10            ; save->v18
              je      _text__pd_if0_else                 
;----------------------------------]
;[----------------------------------
_text__pd_if0_start:
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , 255            
              mov     qword [rsp+152], r10            ; save->v19
_text__pd_ret0:
              mov     r11            , qword [rsp+152]; load->v19
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbp            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbx            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r12            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r13            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r14            , r11            
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r15            , r11            
              add     rsp            , 216            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__pd_if0_end                 
;----------------------------------]
;[----------------------------------
_text__pd_if0_else:
_text__pd_if0_end:
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+168]; load->v21
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r10            , 1              
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+176]; load->v22
              mov     r11            , qword [rsp+168]; load->v21
              mov     r10            , r11            
              mov     qword [rsp+176], r10            ; save->v22
              mov     r10            , qword [rsp+176]; load->v22
              mov     r11            , qword [rsp+88] ; load->v11
              add     r10            , r11            
              mov     qword [rsp+176], r10            ; save->v22
              mov     r11            , qword [rsp+176]; load->v22
              mov     [_data_bss_h]  , r11            
              mov     r10            , qword [rsp+184]; load->v23
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , qword [rsp+184]; load->v23
              mov     r11            , qword [rsp]    ; load->v0
              cmp     r10            , r11            
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , qword [rsp+192]; load->v24
              setle   r10b                            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+192]; load->v24
              cmp     r10b           , 0              
              mov     qword [rsp+192], r10            ; save->v24
              jne     _text__pd_for0_start                 
;----------------------------------]
;[----------------------------------
_text__pd_for0_end:
              mov     r10            , qword [rsp+200]; load->v25
              mov     r10            , 0              
              mov     qword [rsp+200], r10            ; save->v25
_text__pd_ret1:
              mov     r11            , qword [rsp+200]; load->v25
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbp            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbx            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r12            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r13            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r14            , r11            
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r15            , r11            
              add     rsp            , 216            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__pd_inexplicit_return_void:
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbp            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbx            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r12            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r13            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r14            , r11            
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r15            , r11            
              add     rsp            , 216            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__show ] ---
;[----------------------------------
_text__show:
              sub     rsp            , 232            
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
_text__show_for0_init:
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , 0              
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+72] ; load->v9
              cmp     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+80] ; load->v10
              setl    r10b                            
              mov     qword [rsp+80] , r10            ; save->v10
_text__show_for0_init_check:
              mov     r10            , qword [rsp+80] ; load->v10
              cmp     r10b           , 0              
              mov     qword [rsp+80] , r10            ; save->v10
              je      _text__show_for0_end                 
;----------------------------------]
;[----------------------------------
_text__show_for0_start:
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+64] ; load->v8
              mov     r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+96] ; load->v12
              imul    r10            , 8              
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+96] ; load->v12
              add     r10            , 8              
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+88] ; load->v11
              add     r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+104]; load->v13
              mov     r11            , qword [rsp+96] ; translate->qword [v12]
              mov     r10            , qword [r11]    
              mov     qword [rsp+104], r10            ; save->v13
_text__show_call0:
              mov     r10            , qword [rsp+112]; load->v14
              mov     r10            , rax            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , r10            
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+104]; load->v13
              mov     rdi            , r11            
              call    _text__toString                 
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r11            , qword [rsp+112]; load->v14
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+120]; load->v15
              mov     r10            , r11            
              mov     r11            , qword [rsp+128]; load->v16
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , _data_s2       
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+112]; load->v14
              mov     r10            , rax            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , r10            
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+136]; load->v17
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , rax            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r11            , qword [rsp+144]; load->v18
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , rax            
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+152]; load->v19
              add     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+160]; load->v20
              add     r10            , 1              
              mov     qword [rsp+160], r10            ; save->v20
              mov     r11            , qword [rsp+160]; load->v20
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+168]; load->v21
              mov     r10            , rax            
              mov     qword [rsp+168], r10            ; save->v21
              mov     rdi            , rax            
              mov     r11            , qword [rsp+136]; load->v17
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+168]; load->v21
              mov     rdi            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              add     rdi            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+112]; load->v14
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+120]; load->v15
              mov     r10            , r11            
              mov     r11            , qword [rsp+128]; load->v16
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__show_call1:
              mov     r10            , qword [rsp+112]; load->v14
              mov     r10            , rax            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , r10            
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+168]; load->v21
              mov     rdi            , r11            
              call    _text__print                    
              mov     r10            , qword [rsp+176]; load->v22
              mov     r10            , rax            
              mov     qword [rsp+176], r10            ; save->v22
              mov     r11            , qword [rsp+112]; load->v14
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+120]; load->v15
              mov     r10            , r11            
              mov     r11            , qword [rsp+128]; load->v16
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+184]; load->v23
              mov     r10            , 1              
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , qword [rsp+192]; load->v24
              mov     r11            , qword [rsp+64] ; load->v8
              mov     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+192]; load->v24
              mov     r11            , qword [rsp+184]; load->v23
              add     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+192]; load->v24
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+200]; load->v25
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+200]; load->v25
              cmp     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+208]; load->v26
              setl    r10b                            
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+208]; load->v26
              cmp     r10b           , 0              
              mov     qword [rsp+208], r10            ; save->v26
              jne     _text__show_for0_start                 
;----------------------------------]
;[----------------------------------
_text__show_for0_end:
              mov     r10            , qword [rsp+216]; load->v27
              mov     r10            , _data_s3       
              mov     qword [rsp+216], r10            ; save->v27
_text__show_call2:
              mov     r10            , qword [rsp+112]; load->v14
              mov     r10            , rax            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , r10            
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+216]; load->v27
              mov     rdi            , r11            
              call    _text__println                  
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , rax            
              mov     qword [rsp+224], r10            ; save->v28
              mov     r11            , qword [rsp+112]; load->v14
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+120]; load->v15
              mov     r10            , r11            
              mov     r11            , qword [rsp+128]; load->v16
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__show_inexplicit_return_void:
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              add     rsp            , 232            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__win ] ---
;[----------------------------------
_text__win:
              sub     rsp            , 568            
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , 100            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+64] ; load->v8
              mov     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+72] ; load->v9
              imul    r10            , 8              
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+72] ; load->v9
              add     r10            , 8              
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , rax            
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r10            , r10            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+72] ; load->v9
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , rax            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r11            , qword [rsp+64] ; load->v8
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+80] ; load->v10
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+88] ; load->v11
              mov     r10            , r11            
              mov     r11            , qword [rsp+96] ; load->v12
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+104]; load->v13
              mov     r10            , r11            ; init->b
              mov     qword [rsp+112], r10            ; save->v14
_text__win_if0_init:
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+128]; load->v16
              mov     r11            , qword [rsp+136]; load->v17
              cmp     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+144]; load->v18
              setne   r10b                            
              mov     qword [rsp+144], r10            ; save->v18
_text__win_if0_check:
              mov     r10            , qword [rsp+144]; load->v18
              cmp     r10b           , 0              
              mov     qword [rsp+144], r10            ; save->v18
              je      _text__win_if0_else                 
;----------------------------------]
;[----------------------------------
_text__win_if0_start:
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , 0              
              mov     qword [rsp+152], r10            ; save->v19
_text__win_ret0:
              mov     r11            , qword [rsp+152]; load->v19
              mov     rax            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              add     rsp            , 568            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__win_if0_end                 
;----------------------------------]
;[----------------------------------
_text__win_if0_else:
_text__win_if0_end:
_text__win_for0_init:
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , 0              
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            ; assign->j
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+168]; load->v21
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+168]; load->v21
              cmp     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+176]; load->v22
              setl    r10b                            
              mov     qword [rsp+176], r10            ; save->v22
_text__win_for0_init_check:
              mov     r10            , qword [rsp+176]; load->v22
              cmp     r10b           , 0              
              mov     qword [rsp+176], r10            ; save->v22
              je      _text__win_for0_end                 
;----------------------------------]
;[----------------------------------
_text__win_for0_start:
              mov     r10            , qword [rsp+184]; load->v23
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , qword [rsp+192]; load->v24
              mov     r11            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+192]; load->v24
              imul    r10            , 8              
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+192]; load->v24
              add     r10            , 8              
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+192]; load->v24
              mov     r11            , qword [rsp+184]; load->v23
              add     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+200]; load->v25
              mov     r11            , qword [rsp+192]; translate->qword [v24]
              mov     r10            , qword [r11]    
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+208]; load->v26
              mov     r11            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+208]; load->v26
              imul    r10            , 8              
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+208]; load->v26
              add     r10            , 8              
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+208]; load->v26
              mov     r11            , qword [rsp+112]; load->v14
              add     r10            , r11            
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+216]; load->v27
              mov     r11            , qword [rsp+208]; translate->qword [v26]
              mov     r10            , qword [r11]    
              mov     qword [rsp+216], r10            ; save->v27
              mov     r10            , qword [rsp+208]; translate->qword [v26]
              mov     r11            , qword [rsp+200]; load->v25
              mov     qword [r10]    , r11            ; assign->b[j]
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , 1              
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+232]; load->v29
              mov     r11            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+232], r10            ; save->v29
              mov     r10            , qword [rsp+232]; load->v29
              mov     r11            , qword [rsp+224]; load->v28
              add     r10            , r11            
              mov     qword [rsp+232], r10            ; save->v29
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+232]; load->v29
              mov     r10            , r11            ; assign->j
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+240]; load->v30
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+240], r10            ; save->v30
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+240]; load->v30
              cmp     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+248]; load->v31
              setl    r10b                            
              mov     qword [rsp+248], r10            ; save->v31
              mov     r10            , qword [rsp+248]; load->v31
              cmp     r10b           , 0              
              mov     qword [rsp+248], r10            ; save->v31
              jne     _text__win_for0_start                 
;----------------------------------]
;[----------------------------------
_text__win_for0_end:
_text__win_for1_init:
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , 0              
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+256]; load->v32
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+264]; load->v33
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+264], r10            ; save->v33
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , 1              
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+264]; load->v33
              mov     r10            , r11            
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+224]; load->v28
              sub     r10            , r11            
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+256]; load->v32
              mov     r11            , qword [rsp+272]; load->v34
              cmp     r10            , r11            
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+280]; load->v35
              setl    r10b                            
              mov     qword [rsp+280], r10            ; save->v35
_text__win_for1_init_check:
              mov     r10            , qword [rsp+280]; load->v35
              cmp     r10b           , 0              
              mov     qword [rsp+280], r10            ; save->v35
              je      _text__win_for1_end                 
;----------------------------------]
;[----------------------------------
_text__win_for1_start:
_text__win_for2_init:
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , 1              
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+288]; load->v36
              mov     r11            , qword [rsp+256]; load->v32
              mov     r10            , r11            
              mov     qword [rsp+288], r10            ; save->v36
              mov     r10            , qword [rsp+288]; load->v36
              mov     r11            , qword [rsp+224]; load->v28
              add     r10            , r11            
              mov     qword [rsp+288], r10            ; save->v36
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+288]; load->v36
              mov     r10            , r11            ; assign->j
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+296]; load->v37
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+296], r10            ; save->v37
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+296]; load->v37
              cmp     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+304]; load->v38
              setl    r10b                            
              mov     qword [rsp+304], r10            ; save->v38
_text__win_for2_init_check:
              mov     r10            , qword [rsp+304]; load->v38
              cmp     r10b           , 0              
              mov     qword [rsp+304], r10            ; save->v38
              je      _text__win_for2_end                 
;----------------------------------]
;[----------------------------------
_text__win_for2_start:
_text__win_if1_init:
              mov     r10            , qword [rsp+312]; load->v39
              mov     r11            , qword [rsp+256]; load->v32
              mov     r10            , r11            
              mov     qword [rsp+312], r10            ; save->v39
              mov     r10            , qword [rsp+312]; load->v39
              imul    r10            , 8              
              mov     qword [rsp+312], r10            ; save->v39
              mov     r10            , qword [rsp+312]; load->v39
              add     r10            , 8              
              mov     qword [rsp+312], r10            ; save->v39
              mov     r10            , qword [rsp+312]; load->v39
              mov     r11            , qword [rsp+112]; load->v14
              add     r10            , r11            
              mov     qword [rsp+312], r10            ; save->v39
              mov     r10            , qword [rsp+320]; load->v40
              mov     r11            , qword [rsp+312]; translate->qword [v39]
              mov     r10            , qword [r11]    
              mov     qword [rsp+320], r10            ; save->v40
              mov     r10            , qword [rsp+328]; load->v41
              mov     r11            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+328]; load->v41
              imul    r10            , 8              
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+328]; load->v41
              add     r10            , 8              
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+328]; load->v41
              mov     r11            , qword [rsp+112]; load->v14
              add     r10            , r11            
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+336]; load->v42
              mov     r11            , qword [rsp+328]; translate->qword [v41]
              mov     r10            , qword [r11]    
              mov     qword [rsp+336], r10            ; save->v42
              mov     r10            , qword [rsp+320]; load->v40
              mov     r11            , qword [rsp+336]; load->v42
              cmp     r10            , r11            
              mov     qword [rsp+320], r10            ; save->v40
              mov     r10            , qword [rsp+344]; load->v43
              setg    r10b                            
              mov     qword [rsp+344], r10            ; save->v43
_text__win_if1_check:
              mov     r10            , qword [rsp+344]; load->v43
              cmp     r10b           , 0              
              mov     qword [rsp+344], r10            ; save->v43
              je      _text__win_if1_else                 
;----------------------------------]
;[----------------------------------
_text__win_if1_start:
              mov     r10            , qword [rsp+352]; load->v44
              mov     r11            , qword [rsp+256]; load->v32
              mov     r10            , r11            
              mov     qword [rsp+352], r10            ; save->v44
              mov     r10            , qword [rsp+352]; load->v44
              imul    r10            , 8              
              mov     qword [rsp+352], r10            ; save->v44
              mov     r10            , qword [rsp+352]; load->v44
              add     r10            , 8              
              mov     qword [rsp+352], r10            ; save->v44
              mov     r10            , qword [rsp+352]; load->v44
              mov     r11            , qword [rsp+112]; load->v14
              add     r10            , r11            
              mov     qword [rsp+352], r10            ; save->v44
              mov     r10            , qword [rsp+360]; load->v45
              mov     r11            , qword [rsp+352]; translate->qword [v44]
              mov     r10            , qword [r11]    
              mov     qword [rsp+360], r10            ; save->v45
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+360]; load->v45
              mov     r10            , r11            ; assign->temp
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+368]; load->v46
              mov     r11            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+368], r10            ; save->v46
              mov     r10            , qword [rsp+368]; load->v46
              imul    r10            , 8              
              mov     qword [rsp+368], r10            ; save->v46
              mov     r10            , qword [rsp+368]; load->v46
              add     r10            , 8              
              mov     qword [rsp+368], r10            ; save->v46
              mov     r10            , qword [rsp+368]; load->v46
              mov     r11            , qword [rsp+112]; load->v14
              add     r10            , r11            
              mov     qword [rsp+368], r10            ; save->v46
              mov     r10            , qword [rsp+376]; load->v47
              mov     r11            , qword [rsp+368]; translate->qword [v46]
              mov     r10            , qword [r11]    
              mov     qword [rsp+376], r10            ; save->v47
              mov     r10            , qword [rsp+384]; load->v48
              mov     r11            , qword [rsp+256]; load->v32
              mov     r10            , r11            
              mov     qword [rsp+384], r10            ; save->v48
              mov     r10            , qword [rsp+384]; load->v48
              imul    r10            , 8              
              mov     qword [rsp+384], r10            ; save->v48
              mov     r10            , qword [rsp+384]; load->v48
              add     r10            , 8              
              mov     qword [rsp+384], r10            ; save->v48
              mov     r10            , qword [rsp+384]; load->v48
              mov     r11            , qword [rsp+112]; load->v14
              add     r10            , r11            
              mov     qword [rsp+384], r10            ; save->v48
              mov     r10            , qword [rsp+392]; load->v49
              mov     r11            , qword [rsp+384]; translate->qword [v48]
              mov     r10            , qword [r11]    
              mov     qword [rsp+392], r10            ; save->v49
              mov     r10            , qword [rsp+384]; translate->qword [v48]
              mov     r11            , qword [rsp+376]; load->v47
              mov     qword [r10]    , r11            ; assign->b[i]
              mov     r10            , qword [rsp+400]; load->v50
              mov     r11            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+400], r10            ; save->v50
              mov     r10            , qword [rsp+400]; load->v50
              imul    r10            , 8              
              mov     qword [rsp+400], r10            ; save->v50
              mov     r10            , qword [rsp+400]; load->v50
              add     r10            , 8              
              mov     qword [rsp+400], r10            ; save->v50
              mov     r10            , qword [rsp+400]; load->v50
              mov     r11            , qword [rsp+112]; load->v14
              add     r10            , r11            
              mov     qword [rsp+400], r10            ; save->v50
              mov     r10            , qword [rsp+408]; load->v51
              mov     r11            , qword [rsp+400]; translate->qword [v50]
              mov     r10            , qword [r11]    
              mov     qword [rsp+408], r10            ; save->v51
              mov     r10            , qword [rsp+400]; translate->qword [v50]
              mov     r11            , qword [rsp+120]; load->v15
              mov     qword [r10]    , r11            ; assign->b[j]
              jmp     _text__win_if1_end                 
;----------------------------------]
;[----------------------------------
_text__win_if1_else:
_text__win_if1_end:
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , 1              
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+416]; load->v52
              mov     r11            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+416], r10            ; save->v52
              mov     r10            , qword [rsp+416]; load->v52
              mov     r11            , qword [rsp+224]; load->v28
              add     r10            , r11            
              mov     qword [rsp+416], r10            ; save->v52
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+416]; load->v52
              mov     r10            , r11            ; assign->j
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+424]; load->v53
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+424], r10            ; save->v53
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+424]; load->v53
              cmp     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+432]; load->v54
              setl    r10b                            
              mov     qword [rsp+432], r10            ; save->v54
              mov     r10            , qword [rsp+432]; load->v54
              cmp     r10b           , 0              
              mov     qword [rsp+432], r10            ; save->v54
              jne     _text__win_for2_start                 
;----------------------------------]
;[----------------------------------
_text__win_for2_end:
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , 1              
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+440]; load->v55
              mov     r11            , qword [rsp+256]; load->v32
              mov     r10            , r11            
              mov     qword [rsp+440], r10            ; save->v55
              mov     r10            , qword [rsp+440]; load->v55
              mov     r11            , qword [rsp+224]; load->v28
              add     r10            , r11            
              mov     qword [rsp+440], r10            ; save->v55
              mov     r10            , qword [rsp+256]; load->v32
              mov     r11            , qword [rsp+440]; load->v55
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+448]; load->v56
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+448], r10            ; save->v56
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , 1              
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+456]; load->v57
              mov     r11            , qword [rsp+448]; load->v56
              mov     r10            , r11            
              mov     qword [rsp+456], r10            ; save->v57
              mov     r10            , qword [rsp+456]; load->v57
              mov     r11            , qword [rsp+224]; load->v28
              sub     r10            , r11            
              mov     qword [rsp+456], r10            ; save->v57
              mov     r10            , qword [rsp+256]; load->v32
              mov     r11            , qword [rsp+456]; load->v57
              cmp     r10            , r11            
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+464]; load->v58
              setl    r10b                            
              mov     qword [rsp+464], r10            ; save->v58
              mov     r10            , qword [rsp+464]; load->v58
              cmp     r10b           , 0              
              mov     qword [rsp+464], r10            ; save->v58
              jne     _text__win_for1_start                 
;----------------------------------]
;[----------------------------------
_text__win_for1_end:
_text__win_for3_init:
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , 0              
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+472]; load->v59
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+472], r10            ; save->v59
              mov     r10            , qword [rsp+480]; load->v60
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+480], r10            ; save->v60
              mov     r10            , qword [rsp+472]; load->v59
              mov     r11            , qword [rsp+480]; load->v60
              cmp     r10            , r11            
              mov     qword [rsp+472], r10            ; save->v59
              mov     r10            , qword [rsp+488]; load->v61
              setl    r10b                            
              mov     qword [rsp+488], r10            ; save->v61
_text__win_for3_init_check:
              mov     r10            , qword [rsp+488]; load->v61
              cmp     r10b           , 0              
              mov     qword [rsp+488], r10            ; save->v61
              je      _text__win_for3_end                 
;----------------------------------]
;[----------------------------------
_text__win_for3_start:
_text__win_if2_init:
              mov     r10            , qword [rsp+496]; load->v62
              mov     r11            , qword [rsp+472]; load->v59
              mov     r10            , r11            
              mov     qword [rsp+496], r10            ; save->v62
              mov     r10            , qword [rsp+496]; load->v62
              imul    r10            , 8              
              mov     qword [rsp+496], r10            ; save->v62
              mov     r10            , qword [rsp+496]; load->v62
              add     r10            , 8              
              mov     qword [rsp+496], r10            ; save->v62
              mov     r10            , qword [rsp+496]; load->v62
              mov     r11            , qword [rsp+112]; load->v14
              add     r10            , r11            
              mov     qword [rsp+496], r10            ; save->v62
              mov     r10            , qword [rsp+504]; load->v63
              mov     r11            , qword [rsp+496]; translate->qword [v62]
              mov     r10            , qword [r11]    
              mov     qword [rsp+504], r10            ; save->v63
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , 1              
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+512]; load->v64
              mov     r11            , qword [rsp+472]; load->v59
              mov     r10            , r11            
              mov     qword [rsp+512], r10            ; save->v64
              mov     r10            , qword [rsp+512]; load->v64
              mov     r11            , qword [rsp+224]; load->v28
              add     r10            , r11            
              mov     qword [rsp+512], r10            ; save->v64
              mov     r10            , qword [rsp+504]; load->v63
              mov     r11            , qword [rsp+512]; load->v64
              cmp     r10            , r11            
              mov     qword [rsp+504], r10            ; save->v63
              mov     r10            , qword [rsp+520]; load->v65
              setne   r10b                            
              mov     qword [rsp+520], r10            ; save->v65
_text__win_if2_check:
              mov     r10            , qword [rsp+520]; load->v65
              cmp     r10b           , 0              
              mov     qword [rsp+520], r10            ; save->v65
              je      _text__win_if2_else                 
;----------------------------------]
;[----------------------------------
_text__win_if2_start:
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , 0              
              mov     qword [rsp+152], r10            ; save->v19
_text__win_ret1:
              mov     r11            , qword [rsp+152]; load->v19
              mov     rax            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              add     rsp            , 568            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__win_if2_end                 
;----------------------------------]
;[----------------------------------
_text__win_if2_else:
_text__win_if2_end:
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , 1              
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+528]; load->v66
              mov     r11            , qword [rsp+472]; load->v59
              mov     r10            , r11            
              mov     qword [rsp+528], r10            ; save->v66
              mov     r10            , qword [rsp+528]; load->v66
              mov     r11            , qword [rsp+224]; load->v28
              add     r10            , r11            
              mov     qword [rsp+528], r10            ; save->v66
              mov     r10            , qword [rsp+472]; load->v59
              mov     r11            , qword [rsp+528]; load->v66
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+472], r10            ; save->v59
              mov     r10            , qword [rsp+536]; load->v67
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+536], r10            ; save->v67
              mov     r10            , qword [rsp+472]; load->v59
              mov     r11            , qword [rsp+536]; load->v67
              cmp     r10            , r11            
              mov     qword [rsp+472], r10            ; save->v59
              mov     r10            , qword [rsp+544]; load->v68
              setl    r10b                            
              mov     qword [rsp+544], r10            ; save->v68
              mov     r10            , qword [rsp+544]; load->v68
              cmp     r10b           , 0              
              mov     qword [rsp+544], r10            ; save->v68
              jne     _text__win_for3_start                 
;----------------------------------]
;[----------------------------------
_text__win_for3_end:
              mov     r10            , qword [rsp+552]; load->v69
              mov     r10            , 255            
              mov     qword [rsp+552], r10            ; save->v69
_text__win_ret2:
              mov     r11            , qword [rsp+552]; load->v69
              mov     rax            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              add     rsp            , 568            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__win_inexplicit_return_void:
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              add     rsp            , 568            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__merge ] ---
;[----------------------------------
_text__merge:
              sub     rsp            , 360            
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
_text__merge_for0_init:
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , 0              
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+72] ; load->v9
              cmp     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+80] ; load->v10
              setl    r10b                            
              mov     qword [rsp+80] , r10            ; save->v10
_text__merge_for0_init_check:
              mov     r10            , qword [rsp+80] ; load->v10
              cmp     r10b           , 0              
              mov     qword [rsp+80] , r10            ; save->v10
              je      _text__merge_for0_end                 
;----------------------------------]
;[----------------------------------
_text__merge_for0_start:
_text__merge_if0_init:
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+64] ; load->v8
              mov     r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+96] ; load->v12
              imul    r10            , 8              
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+96] ; load->v12
              add     r10            , 8              
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+88] ; load->v11
              add     r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+104]; load->v13
              mov     r11            , qword [rsp+96] ; translate->qword [v12]
              mov     r10            , qword [r11]    
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , 0              
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+104]; load->v13
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10            , r11            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+112]; load->v14
              sete    r10b                            
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
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , 1              
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+136]; load->v17
              mov     r11            , qword [rsp+64] ; load->v8
              mov     r10            , r11            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+136]; load->v17
              mov     r11            , qword [rsp+128]; load->v16
              add     r10            , r11            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+136]; load->v17
              mov     r10            , r11            ; assign->j
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+144]; load->v18
              cmp     r10            , r11            
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+152]; load->v19
              setl    r10b                            
              mov     qword [rsp+152], r10            ; save->v19
_text__merge_for1_init_check:
              mov     r10            , qword [rsp+152]; load->v19
              cmp     r10b           , 0              
              mov     qword [rsp+152], r10            ; save->v19
              je      _text__merge_for1_end                 
;----------------------------------]
;[----------------------------------
_text__merge_for1_start:
_text__merge_if1_init:
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+168]; load->v21
              mov     r11            , qword [rsp+120]; load->v15
              mov     r10            , r11            
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+168]; load->v21
              imul    r10            , 8              
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+168]; load->v21
              add     r10            , 8              
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+168]; load->v21
              mov     r11            , qword [rsp+160]; load->v20
              add     r10            , r11            
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+176]; load->v22
              mov     r11            , qword [rsp+168]; translate->qword [v21]
              mov     r10            , qword [r11]    
              mov     qword [rsp+176], r10            ; save->v22
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , 0              
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+176]; load->v22
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10            , r11            
              mov     qword [rsp+176], r10            ; save->v22
              mov     r10            , qword [rsp+184]; load->v23
              setne   r10b                            
              mov     qword [rsp+184], r10            ; save->v23
_text__merge_if1_check:
              mov     r10            , qword [rsp+184]; load->v23
              cmp     r10b           , 0              
              mov     qword [rsp+184], r10            ; save->v23
              je      _text__merge_if1_else                 
;----------------------------------]
;[----------------------------------
_text__merge_if1_start:
_text__merge_call0:
              mov     r10            , qword [rsp+192]; load->v24
              mov     r10            , rax            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+200]; load->v25
              mov     r10            , r10            
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+208]; load->v26
              mov     r10            , r11            
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+64] ; load->v8
              mov     rdi            , r11            
              mov     r11            , qword [rsp+120]; load->v15
              mov     rsi            , r11            
              call    _text__swap                     
              mov     r10            , qword [rsp+216]; load->v27
              mov     r10            , rax            
              mov     qword [rsp+216], r10            ; save->v27
              mov     r11            , qword [rsp+192]; load->v24
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+200]; load->v25
              mov     r10            , r11            
              mov     r11            , qword [rsp+208]; load->v26
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              jmp     _text__merge_if1_end                 
;----------------------------------]
;[----------------------------------
_text__merge_if1_else:
_text__merge_if1_end:
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , 1              
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+224]; load->v28
              mov     r11            , qword [rsp+120]; load->v15
              mov     r10            , r11            
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+224]; load->v28
              mov     r11            , qword [rsp+128]; load->v16
              add     r10            , r11            
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+224]; load->v28
              mov     r10            , r11            ; assign->j
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+232]; load->v29
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+232], r10            ; save->v29
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+232]; load->v29
              cmp     r10            , r11            
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+240]; load->v30
              setl    r10b                            
              mov     qword [rsp+240], r10            ; save->v30
              mov     r10            , qword [rsp+240]; load->v30
              cmp     r10b           , 0              
              mov     qword [rsp+240], r10            ; save->v30
              jne     _text__merge_for1_start                 
;----------------------------------]
;[----------------------------------
_text__merge_for1_end:
              jmp     _text__merge_if0_end                 
;----------------------------------]
;[----------------------------------
_text__merge_if0_else:
_text__merge_if0_end:
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , 1              
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+248]; load->v31
              mov     r11            , qword [rsp+64] ; load->v8
              mov     r10            , r11            
              mov     qword [rsp+248], r10            ; save->v31
              mov     r10            , qword [rsp+248]; load->v31
              mov     r11            , qword [rsp+128]; load->v16
              add     r10            , r11            
              mov     qword [rsp+248], r10            ; save->v31
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+248]; load->v31
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+256]; load->v32
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+256]; load->v32
              cmp     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+264]; load->v33
              setl    r10b                            
              mov     qword [rsp+264], r10            ; save->v33
              mov     r10            , qword [rsp+264]; load->v33
              cmp     r10b           , 0              
              mov     qword [rsp+264], r10            ; save->v33
              jne     _text__merge_for0_start                 
;----------------------------------]
;[----------------------------------
_text__merge_for0_end:
_text__merge_for2_init:
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , 0              
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+280]; load->v35
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+280], r10            ; save->v35
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+280]; load->v35
              cmp     r10            , r11            
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+288]; load->v36
              setl    r10b                            
              mov     qword [rsp+288], r10            ; save->v36
_text__merge_for2_init_check:
              mov     r10            , qword [rsp+288]; load->v36
              cmp     r10b           , 0              
              mov     qword [rsp+288], r10            ; save->v36
              je      _text__merge_for2_end                 
;----------------------------------]
;[----------------------------------
_text__merge_for2_start:
_text__merge_if2_init:
              mov     r10            , qword [rsp+296]; load->v37
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+296], r10            ; save->v37
              mov     r10            , qword [rsp+304]; load->v38
              mov     r11            , qword [rsp+272]; load->v34
              mov     r10            , r11            
              mov     qword [rsp+304], r10            ; save->v38
              mov     r10            , qword [rsp+304]; load->v38
              imul    r10            , 8              
              mov     qword [rsp+304], r10            ; save->v38
              mov     r10            , qword [rsp+304]; load->v38
              add     r10            , 8              
              mov     qword [rsp+304], r10            ; save->v38
              mov     r10            , qword [rsp+304]; load->v38
              mov     r11            , qword [rsp+296]; load->v37
              add     r10            , r11            
              mov     qword [rsp+304], r10            ; save->v38
              mov     r10            , qword [rsp+312]; load->v39
              mov     r11            , qword [rsp+304]; translate->qword [v38]
              mov     r10            , qword [r11]    
              mov     qword [rsp+312], r10            ; save->v39
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , 0              
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+312]; load->v39
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10            , r11            
              mov     qword [rsp+312], r10            ; save->v39
              mov     r10            , qword [rsp+320]; load->v40
              sete    r10b                            
              mov     qword [rsp+320], r10            ; save->v40
_text__merge_if2_check:
              mov     r10            , qword [rsp+320]; load->v40
              cmp     r10b           , 0              
              mov     qword [rsp+320], r10            ; save->v40
              je      _text__merge_if2_else                 
;----------------------------------]
;[----------------------------------
_text__merge_if2_start:
              mov     r11            , qword [rsp+272]; load->v34
              mov     [_data_bss_now], r11            
              jmp     _text__merge_if2_end                 
;----------------------------------]
;[----------------------------------
_text__merge_if2_else:
_text__merge_if2_end:
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , 1              
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+328]; load->v41
              mov     r11            , qword [rsp+272]; load->v34
              mov     r10            , r11            
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+328]; load->v41
              mov     r11            , qword [rsp+128]; load->v16
              add     r10            , r11            
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+328]; load->v41
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+336]; load->v42
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+336], r10            ; save->v42
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+336]; load->v42
              cmp     r10            , r11            
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+344]; load->v43
              setl    r10b                            
              mov     qword [rsp+344], r10            ; save->v43
              mov     r10            , qword [rsp+344]; load->v43
              cmp     r10b           , 0              
              mov     qword [rsp+344], r10            ; save->v43
              jne     _text__merge_for2_start                 
;----------------------------------]
;[----------------------------------
_text__merge_for2_end:
_text__merge_inexplicit_return_void:
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              add     rsp            , 360            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__move ] ---
;[----------------------------------
_text__move:
              sub     rsp            , 264            
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , 0              
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r10            , r11            ; init->i
              mov     qword [rsp+56] , r10            ; save->v7
_text__move_for0_init:
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+64] ; load->v8
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+72] ; load->v9
              setl    r10b                            
              mov     qword [rsp+72] , r10            ; save->v9
_text__move_for0_init_check:
              mov     r10            , qword [rsp+72] ; load->v9
              cmp     r10b           , 0              
              mov     qword [rsp+72] , r10            ; save->v9
              je      _text__move_for0_end                 
;----------------------------------]
;[----------------------------------
_text__move_for0_start:
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+88] ; load->v11
              imul    r10            , 8              
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+88] ; load->v11
              add     r10            , 8              
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r11            , qword [rsp+80] ; load->v10
              add     r10            , r11            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+88] ; translate->qword [v11]
              mov     r10            , qword [r11]    
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+112]; load->v14
              imul    r10            , 8              
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+112]; load->v14
              add     r10            , 8              
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+104]; load->v13
              add     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+112]; translate->qword [v14]
              mov     r10            , qword [r11]    
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , 1              
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+136]; load->v17
              mov     r11            , qword [rsp+120]; load->v15
              mov     r10            , r11            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+136]; load->v17
              mov     r11            , qword [rsp+128]; load->v16
              sub     r10            , r11            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+152]; load->v19
              imul    r10            , 8              
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+152]; load->v19
              add     r10            , 8              
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+152]; load->v19
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
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , 1              
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+168]; load->v21
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+168]; load->v21
              mov     r11            , qword [rsp+128]; load->v16
              add     r10            , r11            
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+168]; load->v21
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+176]; load->v22
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+176], r10            ; save->v22
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+176]; load->v22
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+184]; load->v23
              setl    r10b                            
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , qword [rsp+184]; load->v23
              cmp     r10b           , 0              
              mov     qword [rsp+184], r10            ; save->v23
              jne     _text__move_for0_start                 
;----------------------------------]
;[----------------------------------
_text__move_for0_end:
              mov     r10            , qword [rsp+192]; load->v24
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+200]; load->v25
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+208]; load->v26
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+216]; load->v27
              mov     r11            , qword [rsp+208]; load->v26
              mov     r10            , r11            
              mov     qword [rsp+216], r10            ; save->v27
              mov     r10            , qword [rsp+216]; load->v27
              imul    r10            , 8              
              mov     qword [rsp+216], r10            ; save->v27
              mov     r10            , qword [rsp+216]; load->v27
              add     r10            , 8              
              mov     qword [rsp+216], r10            ; save->v27
              mov     r10            , qword [rsp+216]; load->v27
              mov     r11            , qword [rsp+200]; load->v25
              add     r10            , r11            
              mov     qword [rsp+216], r10            ; save->v27
              mov     r10            , qword [rsp+224]; load->v28
              mov     r11            , qword [rsp+216]; translate->qword [v27]
              mov     r10            , qword [r11]    
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+216]; translate->qword [v27]
              mov     r11            , qword [rsp+192]; load->v24
              mov     qword [r10]    , r11            ; assign->a[now]
              mov     r10            , qword [rsp+232]; load->v29
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+232], r10            ; save->v29
              mov     r10            , qword [rsp+240]; load->v30
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+240], r10            ; save->v30
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , 1              
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+248]; load->v31
              mov     r11            , qword [rsp+240]; load->v30
              mov     r10            , r11            
              mov     qword [rsp+248], r10            ; save->v31
              mov     r10            , qword [rsp+248]; load->v31
              mov     r11            , qword [rsp+128]; load->v16
              add     r10            , r11            
              mov     qword [rsp+248], r10            ; save->v31
              mov     r11            , qword [rsp+248]; load->v31
              mov     [_data_bss_now], r11            
_text__move_inexplicit_return_void:
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              add     rsp            , 264            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 936            
;----------------------------------]
;[----------------------------------
_text__main_built_in_call_data_init:
              call    _datainit                       ; protocol required, built_in
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , 0              
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r10            , r11            ; init->i
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , 0              
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r10            , r11            ; init->temp
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , 0              
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r10            , r11            ; init->count
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , 3              
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r10            , 7              
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+80] ; load->v10
              mov     r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+88] ; load->v11
              imul    r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 10             
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+96] ; load->v12
              mov     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+104]; load->v13
              imul    r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r11            , qword [rsp+112]; load->v14
              mov     [_data_bss_n]  , r11            
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , 0              
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r11            , qword [rsp+48] ; load->v6
              mov     [_data_bss_h]  , r11            
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , 100            
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r11            , qword [rsp+120]; load->v15
              mov     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+128]; load->v16
              imul    r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+128]; load->v16
              add     r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+128]; load->v16
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , rax            
              mov     qword [rsp+160], r10            ; save->v20
              mov     r11            , qword [rsp+120]; load->v15
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r11            , qword [rsp+160]; load->v20
              mov     [_data_bss_a]  , r11            
              mov     r10            , qword [rsp+168]; load->v21
              mov     r10            , [_data_bss_M]  
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+176]; load->v22
              mov     r10            , [_data_bss_A]  
              mov     qword [rsp+176], r10            ; save->v22
              mov     r10            , qword [rsp+192]; load->v24
              mov     r10            , rdx            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r11            , qword [rsp+168]; load->v21
              mov     rax            , r11            
              mov     r11            , qword [rsp+168]; load->v21
              mov     rdx            , r11            
              sar     rdx            , 32             
              mov     r10            , qword [rsp+176]; load->v22
              idiv    r10d                            
              mov     qword [rsp+176], r10            ; save->v22
              mov     r10            , qword [rsp+184]; load->v23
              mov     r10            , rax            
              mov     qword [rsp+184], r10            ; save->v23
              mov     r11            , qword [rsp+192]; load->v24
              mov     rdx            , r11            
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+184]; load->v23
              mov     [_data_bss_Q]  , r11            
              mov     r10            , qword [rsp+200]; load->v25
              mov     r10            , [_data_bss_M]  
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+208]; load->v26
              mov     r10            , [_data_bss_A]  
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+192]; load->v24
              mov     r10            , rdx            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , rax            
              mov     qword [rsp+224], r10            ; save->v28
              mov     r11            , qword [rsp+200]; load->v25
              mov     rax            , r11            
              mov     r11            , qword [rsp+200]; load->v25
              mov     rdx            , r11            
              sar     rdx            , 32             
              mov     r10            , qword [rsp+208]; load->v26
              idiv    r10d                            
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+216]; load->v27
              mov     r10            , rdx            
              mov     qword [rsp+216], r10            ; save->v27
              mov     r11            , qword [rsp+192]; load->v24
              mov     rdx            , r11            
              mov     r11            , qword [rsp+224]; load->v28
              mov     rax            , r11            
              mov     r11            , qword [rsp+216]; load->v27
              mov     [_data_bss_R]  , r11            
_text__main_if0_init:
              mov     r10            , qword [rsp+232]; load->v29
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+232], r10            ; save->v29
_text__main_call0:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+232]; load->v29
              mov     rdi            , r11            
              call    _text__pd                       
              mov     r10            , qword [rsp+240]; load->v30
              mov     r10            , rax            
              mov     qword [rsp+240], r10            ; save->v30
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+248]; load->v31
              mov     r11            , qword [rsp+240]; load->v30
              mov     r10            , r11            
              mov     qword [rsp+248], r10            ; save->v31
              mov     r10            , qword [rsp+248]; load->v31
              not     r10                             
              mov     qword [rsp+248], r10            ; save->v31
_text__main_if0_check:
              mov     r10            , qword [rsp+248]; load->v31
              cmp     r10b           , 0              
              mov     qword [rsp+248], r10            ; save->v31
              je      _text__main_if0_else                 
;----------------------------------]
;[----------------------------------
_text__main_if0_start:
              mov     r10            , qword [rsp+256]; load->v32
              mov     r10            , _data_s4       
              mov     qword [rsp+256], r10            ; save->v32
_text__main_call1:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+256]; load->v32
              mov     rdi            , r11            
              call    _text__println                  
              mov     r10            , qword [rsp+264]; load->v33
              mov     r10            , rax            
              mov     qword [rsp+264], r10            ; save->v33
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , 1              
              mov     qword [rsp+272], r10            ; save->v34
_text__main_ret0:
              mov     r11            , qword [rsp+272]; load->v34
              mov     rax            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              add     rsp            , 936            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__main_if0_end                 
;----------------------------------]
;[----------------------------------
_text__main_if0_else:
_text__main_if0_end:
              mov     r10            , qword [rsp+280]; load->v35
              mov     r10            , _data_s5       
              mov     qword [rsp+280], r10            ; save->v35
_text__main_call2:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+280]; load->v35
              mov     rdi            , r11            
              call    _text__println                  
              mov     r10            , qword [rsp+288]; load->v36
              mov     r10            , rax            
              mov     qword [rsp+288], r10            ; save->v36
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+296]; load->v37
              mov     r10            , 3654898        
              mov     qword [rsp+296], r10            ; save->v37
_text__main_call3:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+296]; load->v37
              mov     rdi            , r11            
              call    _text__initialize                 
              mov     r10            , qword [rsp+304]; load->v38
              mov     r10            , rax            
              mov     qword [rsp+304], r10            ; save->v38
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__main_call4:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              call    _text__random                   
              mov     r10            , qword [rsp+312]; load->v39
              mov     r10            , rax            
              mov     qword [rsp+312], r10            ; save->v39
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 10             
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+192]; load->v24
              mov     r10            , rdx            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , rax            
              mov     qword [rsp+224], r10            ; save->v28
              mov     r11            , qword [rsp+312]; load->v39
              mov     rax            , r11            
              mov     r11            , qword [rsp+312]; load->v39
              mov     rdx            , r11            
              sar     rdx            , 32             
              mov     r10            , qword [rsp+104]; load->v13
              idiv    r10d                            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+320]; load->v40
              mov     r10            , rdx            
              mov     qword [rsp+320], r10            ; save->v40
              mov     r11            , qword [rsp+192]; load->v24
              mov     rdx            , r11            
              mov     r11            , qword [rsp+224]; load->v28
              mov     rax            , r11            
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , 1              
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+328]; load->v41
              mov     r11            , qword [rsp+320]; load->v40
              mov     r10            , r11            
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+328]; load->v41
              mov     r11            , qword [rsp+272]; load->v34
              add     r10            , r11            
              mov     qword [rsp+328], r10            ; save->v41
              mov     r11            , qword [rsp+328]; load->v41
              mov     [_data_bss_now], r11            
              mov     r10            , qword [rsp+336]; load->v42
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+336], r10            ; save->v42
_text__main_call5:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+336]; load->v42
              mov     rdi            , r11            
              call    _text__toString                 
              mov     r10            , qword [rsp+344]; load->v43
              mov     r10            , rax            
              mov     qword [rsp+344], r10            ; save->v43
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__main_call6:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+344]; load->v43
              mov     rdi            , r11            
              call    _text__println                  
              mov     r10            , qword [rsp+352]; load->v44
              mov     r10            , rax            
              mov     qword [rsp+352], r10            ; save->v44
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__main_for0_init:
              mov     r10            , qword [rsp+360]; load->v45
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+360], r10            ; save->v45
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , 1              
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+368]; load->v46
              mov     r11            , qword [rsp+360]; load->v45
              mov     r10            , r11            
              mov     qword [rsp+368], r10            ; save->v46
              mov     r10            , qword [rsp+368]; load->v46
              mov     r11            , qword [rsp+272]; load->v34
              sub     r10            , r11            
              mov     qword [rsp+368], r10            ; save->v46
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+368]; load->v46
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+376]; load->v47
              setl    r10b                            
              mov     qword [rsp+376], r10            ; save->v47
_text__main_for0_init_check:
              mov     r10            , qword [rsp+376]; load->v47
              cmp     r10b           , 0              
              mov     qword [rsp+376], r10            ; save->v47
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
_text__main_call7:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              call    _text__random                   
              mov     r10            , qword [rsp+384]; load->v48
              mov     r10            , rax            
              mov     qword [rsp+384], r10            ; save->v48
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 10             
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+192]; load->v24
              mov     r10            , rdx            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , rax            
              mov     qword [rsp+224], r10            ; save->v28
              mov     r11            , qword [rsp+384]; load->v48
              mov     rax            , r11            
              mov     r11            , qword [rsp+384]; load->v48
              mov     rdx            , r11            
              sar     rdx            , 32             
              mov     r10            , qword [rsp+104]; load->v13
              idiv    r10d                            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+392]; load->v49
              mov     r10            , rdx            
              mov     qword [rsp+392], r10            ; save->v49
              mov     r11            , qword [rsp+192]; load->v24
              mov     rdx            , r11            
              mov     r11            , qword [rsp+224]; load->v28
              mov     rax            , r11            
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , 1              
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+400]; load->v50
              mov     r11            , qword [rsp+392]; load->v49
              mov     r10            , r11            
              mov     qword [rsp+400], r10            ; save->v50
              mov     r10            , qword [rsp+400]; load->v50
              mov     r11            , qword [rsp+272]; load->v34
              add     r10            , r11            
              mov     qword [rsp+400], r10            ; save->v50
              mov     r10            , qword [rsp+408]; load->v51
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+408], r10            ; save->v51
              mov     r10            , qword [rsp+416]; load->v52
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+416], r10            ; save->v52
              mov     r10            , qword [rsp+416]; load->v52
              imul    r10            , 8              
              mov     qword [rsp+416], r10            ; save->v52
              mov     r10            , qword [rsp+416]; load->v52
              add     r10            , 8              
              mov     qword [rsp+416], r10            ; save->v52
              mov     r10            , qword [rsp+416]; load->v52
              mov     r11            , qword [rsp+408]; load->v51
              add     r10            , r11            
              mov     qword [rsp+416], r10            ; save->v52
              mov     r10            , qword [rsp+424]; load->v53
              mov     r11            , qword [rsp+416]; translate->qword [v52]
              mov     r10            , qword [r11]    
              mov     qword [rsp+424], r10            ; save->v53
              mov     r10            , qword [rsp+416]; translate->qword [v52]
              mov     r11            , qword [rsp+400]; load->v50
              mov     qword [r10]    , r11            ; assign->a[i]
_text__main_for1_init:
              mov     r10            , qword [rsp+432]; load->v54
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+432], r10            ; save->v54
              mov     r10            , qword [rsp+440]; load->v55
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+440], r10            ; save->v55
              mov     r10            , qword [rsp+440]; load->v55
              imul    r10            , 8              
              mov     qword [rsp+440], r10            ; save->v55
              mov     r10            , qword [rsp+440]; load->v55
              add     r10            , 8              
              mov     qword [rsp+440], r10            ; save->v55
              mov     r10            , qword [rsp+440]; load->v55
              mov     r11            , qword [rsp+432]; load->v54
              add     r10            , r11            
              mov     qword [rsp+440], r10            ; save->v55
              mov     r10            , qword [rsp+448]; load->v56
              mov     r11            , qword [rsp+440]; translate->qword [v55]
              mov     r10            , qword [r11]    
              mov     qword [rsp+448], r10            ; save->v56
              mov     r10            , qword [rsp+456]; load->v57
              mov     r11            , qword [rsp+448]; load->v56
              mov     r10            , r11            
              mov     qword [rsp+456], r10            ; save->v57
              mov     r10            , qword [rsp+456]; load->v57
              mov     r11            , qword [rsp+64] ; load->v8
              add     r10            , r11            
              mov     qword [rsp+456], r10            ; save->v57
              mov     r10            , qword [rsp+464]; load->v58
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+464], r10            ; save->v58
              mov     r10            , qword [rsp+456]; load->v57
              mov     r11            , qword [rsp+464]; load->v58
              cmp     r10            , r11            
              mov     qword [rsp+456], r10            ; save->v57
              mov     r10            , qword [rsp+472]; load->v59
              setg    r10b                            
              mov     qword [rsp+472], r10            ; save->v59
_text__main_for1_init_check:
              mov     r10            , qword [rsp+472]; load->v59
              cmp     r10b           , 0              
              mov     qword [rsp+472], r10            ; save->v59
              je      _text__main_for1_end                 
;----------------------------------]
;[----------------------------------
_text__main_for1_start:
_text__main_call8:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              call    _text__random                   
              mov     r10            , qword [rsp+480]; load->v60
              mov     r10            , rax            
              mov     qword [rsp+480], r10            ; save->v60
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 10             
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+192]; load->v24
              mov     r10            , rdx            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , rax            
              mov     qword [rsp+224], r10            ; save->v28
              mov     r11            , qword [rsp+480]; load->v60
              mov     rax            , r11            
              mov     r11            , qword [rsp+480]; load->v60
              mov     rdx            , r11            
              sar     rdx            , 32             
              mov     r10            , qword [rsp+104]; load->v13
              idiv    r10d                            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+488]; load->v61
              mov     r10            , rdx            
              mov     qword [rsp+488], r10            ; save->v61
              mov     r11            , qword [rsp+192]; load->v24
              mov     rdx            , r11            
              mov     r11            , qword [rsp+224]; load->v28
              mov     rax            , r11            
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , 1              
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+496]; load->v62
              mov     r11            , qword [rsp+488]; load->v61
              mov     r10            , r11            
              mov     qword [rsp+496], r10            ; save->v62
              mov     r10            , qword [rsp+496]; load->v62
              mov     r11            , qword [rsp+272]; load->v34
              add     r10            , r11            
              mov     qword [rsp+496], r10            ; save->v62
              mov     r10            , qword [rsp+504]; load->v63
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+504], r10            ; save->v63
              mov     r10            , qword [rsp+512]; load->v64
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+512], r10            ; save->v64
              mov     r10            , qword [rsp+512]; load->v64
              imul    r10            , 8              
              mov     qword [rsp+512], r10            ; save->v64
              mov     r10            , qword [rsp+512]; load->v64
              add     r10            , 8              
              mov     qword [rsp+512], r10            ; save->v64
              mov     r10            , qword [rsp+512]; load->v64
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
              mov     r10            , qword [rsp+528]; load->v66
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+528], r10            ; save->v66
              mov     r10            , qword [rsp+536]; load->v67
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+536], r10            ; save->v67
              mov     r10            , qword [rsp+536]; load->v67
              imul    r10            , 8              
              mov     qword [rsp+536], r10            ; save->v67
              mov     r10            , qword [rsp+536]; load->v67
              add     r10            , 8              
              mov     qword [rsp+536], r10            ; save->v67
              mov     r10            , qword [rsp+536]; load->v67
              mov     r11            , qword [rsp+528]; load->v66
              add     r10            , r11            
              mov     qword [rsp+536], r10            ; save->v67
              mov     r10            , qword [rsp+544]; load->v68
              mov     r11            , qword [rsp+536]; translate->qword [v67]
              mov     r10            , qword [r11]    
              mov     qword [rsp+544], r10            ; save->v68
              mov     r10            , qword [rsp+552]; load->v69
              mov     r11            , qword [rsp+544]; load->v68
              mov     r10            , r11            
              mov     qword [rsp+552], r10            ; save->v69
              mov     r10            , qword [rsp+552]; load->v69
              mov     r11            , qword [rsp+64] ; load->v8
              add     r10            , r11            
              mov     qword [rsp+552], r10            ; save->v69
              mov     r10            , qword [rsp+560]; load->v70
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+560], r10            ; save->v70
              mov     r10            , qword [rsp+552]; load->v69
              mov     r11            , qword [rsp+560]; load->v70
              cmp     r10            , r11            
              mov     qword [rsp+552], r10            ; save->v69
              mov     r10            , qword [rsp+568]; load->v71
              setg    r10b                            
              mov     qword [rsp+568], r10            ; save->v71
              mov     r10            , qword [rsp+568]; load->v71
              cmp     r10b           , 0              
              mov     qword [rsp+568], r10            ; save->v71
              jne     _text__main_for1_start                 
;----------------------------------]
;[----------------------------------
_text__main_for1_end:
              mov     r10            , qword [rsp+576]; load->v72
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+576], r10            ; save->v72
              mov     r10            , qword [rsp+584]; load->v73
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+584], r10            ; save->v73
              mov     r10            , qword [rsp+584]; load->v73
              imul    r10            , 8              
              mov     qword [rsp+584], r10            ; save->v73
              mov     r10            , qword [rsp+584]; load->v73
              add     r10            , 8              
              mov     qword [rsp+584], r10            ; save->v73
              mov     r10            , qword [rsp+584]; load->v73
              mov     r11            , qword [rsp+576]; load->v72
              add     r10            , r11            
              mov     qword [rsp+584], r10            ; save->v73
              mov     r10            , qword [rsp+592]; load->v74
              mov     r11            , qword [rsp+584]; translate->qword [v73]
              mov     r10            , qword [r11]    
              mov     qword [rsp+592], r10            ; save->v74
              mov     r10            , qword [rsp+600]; load->v75
              mov     r11            , qword [rsp+64] ; load->v8
              mov     r10            , r11            
              mov     qword [rsp+600], r10            ; save->v75
              mov     r10            , qword [rsp+600]; load->v75
              mov     r11            , qword [rsp+592]; load->v74
              add     r10            , r11            
              mov     qword [rsp+600], r10            ; save->v75
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+600]; load->v75
              mov     r10            , r11            ; assign->temp
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , 1              
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+608]; load->v76
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+608], r10            ; save->v76
              mov     r10            , qword [rsp+608]; load->v76
              mov     r11            , qword [rsp+272]; load->v34
              add     r10            , r11            
              mov     qword [rsp+608], r10            ; save->v76
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+608]; load->v76
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+616]; load->v77
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+616], r10            ; save->v77
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , 1              
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+624]; load->v78
              mov     r11            , qword [rsp+616]; load->v77
              mov     r10            , r11            
              mov     qword [rsp+624], r10            ; save->v78
              mov     r10            , qword [rsp+624]; load->v78
              mov     r11            , qword [rsp+272]; load->v34
              sub     r10            , r11            
              mov     qword [rsp+624], r10            ; save->v78
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+624]; load->v78
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+632]; load->v79
              setl    r10b                            
              mov     qword [rsp+632], r10            ; save->v79
              mov     r10            , qword [rsp+632]; load->v79
              cmp     r10b           , 0              
              mov     qword [rsp+632], r10            ; save->v79
              jne     _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
              mov     r10            , qword [rsp+640]; load->v80
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+640], r10            ; save->v80
              mov     r10            , qword [rsp+648]; load->v81
              mov     r11            , qword [rsp+640]; load->v80
              mov     r10            , r11            
              mov     qword [rsp+648], r10            ; save->v81
              mov     r10            , qword [rsp+648]; load->v81
              mov     r11            , qword [rsp+64] ; load->v8
              sub     r10            , r11            
              mov     qword [rsp+648], r10            ; save->v81
              mov     r10            , qword [rsp+656]; load->v82
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+656], r10            ; save->v82
              mov     r10            , qword [rsp+664]; load->v83
              mov     r10            , [_data_bss_now]
              mov     qword [rsp+664], r10            ; save->v83
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , 1              
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+672]; load->v84
              mov     r11            , qword [rsp+664]; load->v83
              mov     r10            , r11            
              mov     qword [rsp+672], r10            ; save->v84
              mov     r10            , qword [rsp+672]; load->v84
              mov     r11            , qword [rsp+272]; load->v34
              sub     r10            , r11            
              mov     qword [rsp+672], r10            ; save->v84
              mov     r10            , qword [rsp+680]; load->v85
              mov     r11            , qword [rsp+672]; load->v84
              mov     r10            , r11            
              mov     qword [rsp+680], r10            ; save->v85
              mov     r10            , qword [rsp+680]; load->v85
              imul    r10            , 8              
              mov     qword [rsp+680], r10            ; save->v85
              mov     r10            , qword [rsp+680]; load->v85
              add     r10            , 8              
              mov     qword [rsp+680], r10            ; save->v85
              mov     r10            , qword [rsp+680]; load->v85
              mov     r11            , qword [rsp+656]; load->v82
              add     r10            , r11            
              mov     qword [rsp+680], r10            ; save->v85
              mov     r10            , qword [rsp+688]; load->v86
              mov     r11            , qword [rsp+680]; translate->qword [v85]
              mov     r10            , qword [r11]    
              mov     qword [rsp+688], r10            ; save->v86
              mov     r10            , qword [rsp+680]; translate->qword [v85]
              mov     r11            , qword [rsp+648]; load->v81
              mov     qword [r10]    , r11            ; assign->a[now-1]
_text__main_call9:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              call    _text__show                     
              mov     r10            , qword [rsp+696]; load->v87
              mov     r10            , rax            
              mov     qword [rsp+696], r10            ; save->v87
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__main_call10:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              call    _text__merge                    
              mov     r10            , qword [rsp+704]; load->v88
              mov     r10            , rax            
              mov     qword [rsp+704], r10            ; save->v88
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__main_for2_init:
_text__main_call11:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              call    _text__win                      
              mov     r10            , qword [rsp+712]; load->v89
              mov     r10            , rax            
              mov     qword [rsp+712], r10            ; save->v89
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+720]; load->v90
              mov     r11            , qword [rsp+712]; load->v89
              mov     r10            , r11            
              mov     qword [rsp+720], r10            ; save->v90
              mov     r10            , qword [rsp+720]; load->v90
              not     r10                             
              mov     qword [rsp+720], r10            ; save->v90
_text__main_for2_init_check:
              mov     r10            , qword [rsp+720]; load->v90
              cmp     r10b           , 0              
              mov     qword [rsp+720], r10            ; save->v90
              je      _text__main_for2_end                 
;----------------------------------]
;[----------------------------------
_text__main_for2_start:
              mov     r10            , qword [rsp+728]; load->v91
              mov     r10            , _data_s6       
              mov     qword [rsp+728], r10            ; save->v91
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , 1              
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+736]; load->v92
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     qword [rsp+736], r10            ; save->v92
              mov     r10            , qword [rsp+736]; load->v92
              mov     r11            , qword [rsp+272]; load->v34
              add     r10            , r11            
              mov     qword [rsp+736], r10            ; save->v92
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+736]; load->v92
              mov     r10            , r11            ; assign->count
              mov     qword [rsp+72] , r10            ; save->v9
_text__main_call12:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+72] ; load->v9
              mov     rdi            , r11            
              call    _text__toString                 
              mov     r10            , qword [rsp+744]; load->v93
              mov     r10            , rax            
              mov     qword [rsp+744], r10            ; save->v93
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+728]; load->v91
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+752]; load->v94
              mov     r10            , rax            
              mov     qword [rsp+752], r10            ; save->v94
              mov     r11            , qword [rsp+744]; load->v93
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+760]; load->v95
              mov     r10            , rax            
              mov     qword [rsp+760], r10            ; save->v95
              mov     r10            , qword [rsp+760]; load->v95
              mov     r11            , qword [rsp+752]; load->v94
              add     r10            , r11            
              mov     qword [rsp+760], r10            ; save->v95
              mov     r10            , qword [rsp+760]; load->v95
              add     r10            , 1              
              mov     qword [rsp+760], r10            ; save->v95
              mov     r11            , qword [rsp+760]; load->v95
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+768]; load->v96
              mov     r10            , rax            
              mov     qword [rsp+768], r10            ; save->v96
              mov     rdi            , rax            
              mov     r11            , qword [rsp+728]; load->v91
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+768]; load->v96
              mov     rdi            , r11            
              mov     r11            , qword [rsp+752]; load->v94
              add     rdi            , r11            
              mov     r11            , qword [rsp+744]; load->v93
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+776]; load->v97
              mov     r10            , _data_s7       
              mov     qword [rsp+776], r10            ; save->v97
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+768]; load->v96
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+784]; load->v98
              mov     r10            , rax            
              mov     qword [rsp+784], r10            ; save->v98
              mov     r11            , qword [rsp+776]; load->v97
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+792]; load->v99
              mov     r10            , rax            
              mov     qword [rsp+792], r10            ; save->v99
              mov     r10            , qword [rsp+792]; load->v99
              mov     r11            , qword [rsp+784]; load->v98
              add     r10            , r11            
              mov     qword [rsp+792], r10            ; save->v99
              mov     r10            , qword [rsp+792]; load->v99
              add     r10            , 1              
              mov     qword [rsp+792], r10            ; save->v99
              mov     r11            , qword [rsp+792]; load->v99
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+800]; load->v100
              mov     r10            , rax            
              mov     qword [rsp+800], r10            ; save->v100
              mov     rdi            , rax            
              mov     r11            , qword [rsp+768]; load->v96
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+800]; load->v100
              mov     rdi            , r11            
              mov     r11            , qword [rsp+784]; load->v98
              add     rdi            , r11            
              mov     r11            , qword [rsp+776]; load->v97
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__main_call13:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+800]; load->v100
              mov     rdi            , r11            
              call    _text__println                  
              mov     r10            , qword [rsp+808]; load->v101
              mov     r10            , rax            
              mov     qword [rsp+808], r10            ; save->v101
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__main_call14:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              call    _text__move                     
              mov     r10            , qword [rsp+816]; load->v102
              mov     r10            , rax            
              mov     qword [rsp+816], r10            ; save->v102
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__main_call15:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              call    _text__merge                    
              mov     r10            , qword [rsp+824]; load->v103
              mov     r10            , rax            
              mov     qword [rsp+824], r10            ; save->v103
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__main_call16:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              call    _text__show                     
              mov     r10            , qword [rsp+832]; load->v104
              mov     r10            , rax            
              mov     qword [rsp+832], r10            ; save->v104
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__main_call17:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              call    _text__win                      
              mov     r10            , qword [rsp+840]; load->v105
              mov     r10            , rax            
              mov     qword [rsp+840], r10            ; save->v105
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+848]; load->v106
              mov     r11            , qword [rsp+840]; load->v105
              mov     r10            , r11            
              mov     qword [rsp+848], r10            ; save->v106
              mov     r10            , qword [rsp+848]; load->v106
              not     r10                             
              mov     qword [rsp+848], r10            ; save->v106
              mov     r10            , qword [rsp+848]; load->v106
              cmp     r10b           , 0              
              mov     qword [rsp+848], r10            ; save->v106
              jne     _text__main_for2_start                 
;----------------------------------]
;[----------------------------------
_text__main_for2_end:
              mov     r10            , qword [rsp+856]; load->v107
              mov     r10            , _data_s8       
              mov     qword [rsp+856], r10            ; save->v107
_text__main_call18:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+72] ; load->v9
              mov     rdi            , r11            
              call    _text__toString                 
              mov     r10            , qword [rsp+864]; load->v108
              mov     r10            , rax            
              mov     qword [rsp+864], r10            ; save->v108
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+856]; load->v107
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+872]; load->v109
              mov     r10            , rax            
              mov     qword [rsp+872], r10            ; save->v109
              mov     r11            , qword [rsp+864]; load->v108
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+880]; load->v110
              mov     r10            , rax            
              mov     qword [rsp+880], r10            ; save->v110
              mov     r10            , qword [rsp+880]; load->v110
              mov     r11            , qword [rsp+872]; load->v109
              add     r10            , r11            
              mov     qword [rsp+880], r10            ; save->v110
              mov     r10            , qword [rsp+880]; load->v110
              add     r10            , 1              
              mov     qword [rsp+880], r10            ; save->v110
              mov     r11            , qword [rsp+880]; load->v110
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+888]; load->v111
              mov     r10            , rax            
              mov     qword [rsp+888], r10            ; save->v111
              mov     rdi            , rax            
              mov     r11            , qword [rsp+856]; load->v107
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+888]; load->v111
              mov     rdi            , r11            
              mov     r11            , qword [rsp+872]; load->v109
              add     rdi            , r11            
              mov     r11            , qword [rsp+864]; load->v108
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+896]; load->v112
              mov     r10            , _data_s9       
              mov     qword [rsp+896], r10            ; save->v112
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+888]; load->v111
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+904]; load->v113
              mov     r10            , rax            
              mov     qword [rsp+904], r10            ; save->v113
              mov     r11            , qword [rsp+896]; load->v112
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+912]; load->v114
              mov     r10            , rax            
              mov     qword [rsp+912], r10            ; save->v114
              mov     r10            , qword [rsp+912]; load->v114
              mov     r11            , qword [rsp+904]; load->v113
              add     r10            , r11            
              mov     qword [rsp+912], r10            ; save->v114
              mov     r10            , qword [rsp+912]; load->v114
              add     r10            , 1              
              mov     qword [rsp+912], r10            ; save->v114
              mov     r11            , qword [rsp+912]; load->v114
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+920]; load->v115
              mov     r10            , rax            
              mov     qword [rsp+920], r10            ; save->v115
              mov     rdi            , rax            
              mov     r11            , qword [rsp+888]; load->v111
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+920]; load->v115
              mov     rdi            , r11            
              mov     r11            , qword [rsp+904]; load->v113
              add     rdi            , r11            
              mov     r11            , qword [rsp+896]; load->v112
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__main_call19:
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , r10            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+32] ; load->v4
              mov     r10            , r14            
              mov     qword [rsp+32] , r10            ; save->v4
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+920]; load->v115
              mov     rdi            , r11            
              call    _text__println                  
              mov     r10            , qword [rsp+928]; load->v116
              mov     r10            , rax            
              mov     qword [rsp+928], r10            ; save->v116
              mov     r11            , qword [rsp+136]; load->v17
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+144]; load->v18
              mov     r10            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , 0              
              mov     qword [rsp+48] , r10            ; save->v6
_text__main_ret1:
              mov     r11            , qword [rsp+48] ; load->v6
              mov     rax            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              add     rsp            , 936            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__main_inexplicit_return_void:
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              add     rsp            , 936            
              ret                                     
;----------------------------------]
                                                      
