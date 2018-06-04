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
_data_s3:
              db      0                               
_data_s4:
              db      ` `                             
              db      0                               
_data_s1:
              db      `%s\n`                          
              db      0                               
_data_s2:
              db      ` !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_\`abcdefghijklmnopqrstuvwxyz{|}~`                 
              db      0                               
_data_s0:
              db      `%s`                            
              db      0                               

              section .bss                            
_data_bss_asciiTable:
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
              mov     rbp            , _data_s2       ; null; save->v6
              mov     [_data_bss_asciiTable], rbp            ; load->v6; null
_datainit_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__hilo ] ---
;[----------------------------------
_text__hilo:
              sub     rsp            , 72             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     qword [rsp+48] , rdi            ; null; save->v6
              mov     qword [rsp+56] , rsi            ; null; save->v7
              mov     rbp            , 16             ; null; save->v8
              mov     rbx            , rcx            ; null; save->v10
              mov     r12            , qword [rsp+48] ; load->v6; null; save->v9
              mov     rcx            , rbp            ; load->v8; null
              mov     r10            , r12            ; load->v9
              and     r10            , -1             
              mov     r12            , r10            ; save->v9; load->v9
              sal     r10d           , cl             
              mov     r12            , r10            ; save->v9
              mov     rcx            , rbx            ; load->v10; null
              mov     rbp            , qword [rsp+56] ; load->v7; null; save->v11
              mov     r10            , rbp            ; load->v11
              mov     r11            , r12            ; load->v9
              or      r10            , r11            
              mov     rbp            , r10            ; save->v11
_text__hilo_ret0:
              mov     rax            , rbp            ; load->v11; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 72             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__shift_l ] ---
;[----------------------------------
_text__shift_l:
              sub     rsp            , 72             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     qword [rsp+48] , rdi            ; null; save->v6
              mov     qword [rsp+56] , rsi            ; null; save->v7
              mov     rbp            , rcx            ; null; save->v9
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v8
              mov     rcx            , qword [rsp+56] ; load->v7; null
              mov     r10            , rbx            ; load->v8
              and     r10            , -1             
              mov     rbx            , r10            ; save->v8; load->v8
              sal     r10d           , cl             
              mov     rbx            , r10            ; save->v8
              mov     rcx            , rbp            ; load->v9; null
              mov     rbp            , 65535          ; null; save->v10
              mov     r12            , 32767          ; null; save->v11
              mov     r13            , 16             ; null; save->v12
              mov     r14            , rcx            ; null; save->v14
              mov     r15            , r12            ; load->v11; null; save->v13
              mov     rcx            , r13            ; load->v12; null
              mov     r10            , r15            ; load->v13
              and     r10            , -1             
              mov     r15            , r10            ; save->v13; load->v13
              sal     r10d           , cl             
              mov     r15            , r10            ; save->v13
              mov     rcx            , r14            ; load->v14; null
              mov     r12            , rbp            ; load->v10; null; save->v15
              mov     r10            , r12            ; load->v15
              mov     r11            , r15            ; load->v13
              or      r10            , r11            
              mov     r12            , r10            ; save->v15
              mov     rbp            , rbx            ; load->v8; null; save->v16
              mov     r10            , rbp            ; load->v16
              mov     r11            , r12            ; load->v15
              and     r10            , r11            
              mov     rbp            , r10            ; save->v16
_text__shift_l_ret0:
              mov     rax            , rbp            ; load->v16; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 72             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__shift_r ] ---
;[----------------------------------
_text__shift_r:
              sub     rsp            , 72             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     qword [rsp+48] , rdi            ; null; save->v6
              mov     qword [rsp+56] , rsi            ; null; save->v7
              mov     rbp            , 65535          ; null; save->v8
              mov     rbx            , 32767          ; null; save->v9
              mov     r12            , 16             ; null; save->v10
              mov     r13            , rcx            ; null; save->v12
              mov     r14            , rbx            ; load->v9; null; save->v11
              mov     rcx            , r12            ; load->v10; null
              mov     r10            , r14            ; load->v11
              and     r10            , -1             
              mov     r14            , r10            ; save->v11; load->v11
              sal     r10d           , cl             
              mov     r14            , r10            ; save->v11
              mov     rcx            , r13            ; load->v12; null
              mov     rbx            , rbp            ; load->v8; null; save->v13
              mov     r10            , rbx            ; load->v13
              mov     r11            , r14            ; load->v11
              or      r10            , r11            
              mov     rbx            , r10            ; save->v13
              mov     qword [rsp+64] , rbx            ; load->v13; init->tmp; save->v14
              mov     rbp            , rcx            ; null; save->v16
              mov     rbx            , qword [rsp+64] ; load->v14; null; save->v15
              mov     rcx            , qword [rsp+56] ; load->v7; null
              mov     r10            , rbx            ; load->v15
              and     r10            , -1             
              mov     rbx            , r10            ; save->v15; load->v15
              sar     r10d           , cl             
              mov     rbx            , r10            ; save->v15
              mov     rcx            , rbp            ; load->v16; null
              mov     rbp            , 1              ; null; save->v17
              mov     r12            , rcx            ; null; save->v19
              mov     r13            , rbx            ; load->v15; null; save->v18
              mov     rcx            , rbp            ; load->v17; null
              mov     r10            , r13            ; load->v18
              and     r10            , -1             
              mov     r13            , r10            ; save->v18; load->v18
              sal     r10d           , cl             
              mov     r13            , r10            ; save->v18
              mov     rcx            , r12            ; load->v19; null
              mov     rbp            , r13            ; load->v18; null; save->v20
              mov     r10            , rbp            ; load->v20
              add     r10            , 1              
              mov     rbp            , r10            ; save->v20
              mov     qword [rsp+64] , rbp            ; load->v20; assign->tmp; save->v14
              mov     rbp            , rcx            ; null; save->v22
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v21
              mov     rcx            , qword [rsp+56] ; load->v7; null
              mov     r10            , rbx            ; load->v21
              and     r10            , -1             
              mov     rbx            , r10            ; save->v21; load->v21
              sar     r10d           , cl             
              mov     rbx            , r10            ; save->v21
              mov     rcx            , rbp            ; load->v22; null
              mov     rbp            , qword [rsp+64] ; load->v14; null; save->v23
              mov     r10            , rbp            ; load->v23
              mov     r11            , rbx            ; load->v21
              and     r10            , r11            
              mov     rbp            , r10            ; save->v23
              mov     qword [rsp+64] , rbp            ; load->v23; assign->tmp; save->v14
              mov     rbp            , 65535          ; null; save->v24
              mov     rbx            , 32767          ; null; save->v25
              mov     r12            , 16             ; null; save->v26
              mov     r13            , rcx            ; null; save->v28
              mov     r14            , rbx            ; load->v25; null; save->v27
              mov     rcx            , r12            ; load->v26; null
              mov     r10            , r14            ; load->v27
              and     r10            , -1             
              mov     r14            , r10            ; save->v27; load->v27
              sal     r10d           , cl             
              mov     r14            , r10            ; save->v27
              mov     rcx            , r13            ; load->v28; null
              mov     rbx            , rbp            ; load->v24; null; save->v29
              mov     r10            , rbx            ; load->v29
              mov     r11            , r14            ; load->v27
              or      r10            , r11            
              mov     rbx            , r10            ; save->v29
              mov     rbp            , qword [rsp+64] ; load->v14; null; save->v30
              mov     r10            , rbp            ; load->v30
              mov     r11            , rbx            ; load->v29
              and     r10            , r11            
              mov     rbp            , r10            ; save->v30
_text__shift_r_ret0:
              mov     rax            , rbp            ; load->v30; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 72             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__xorshift ] ---
;[----------------------------------
_text__xorshift:
              sub     rsp            , 88             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     qword [rsp+48] , rdi            ; null; save->v6
              mov     qword [rsp+56] , rsi            ; null; save->v7
              mov     rbp            , qword [rsp+48] ; load->v6; null; save->v8
              mov     r10            , rbp            ; load->v8
              add     r10            , 1              
              mov     rbp            , r10            ; save->v8
              mov     qword [rsp+64] , rbp            ; load->v8; init->x; save->v9
_text__xorshift_for0_init:
              mov     rbp            , 0              ; null; save->v11
              mov     qword [rsp+72] , rbp            ; load->v11; assign->i; save->v10
              mov     rbp            , 10             ; null; save->v12
              mov     rbx            , qword [rsp+56] ; load->v7; null; save->v13
              mov     r10            , rbx            ; load->v13
              mov     r11            , rbp            ; load->v12
              imul    r10            , r11            
              mov     rbx            , r10            ; save->v13; load->v13
              and     r10            , -1             
              mov     rbx            , r10            ; save->v13
              mov     r10            , qword [rsp+72] ; load->v10
              mov     r11            , rbx            ; load->v13
              cmp     r10d           , r11d           
              mov     qword [rsp+72] , r10            ; save->v10
              mov     r10            , rbp            ; load->v14
              setl    r10b                            
              mov     rbp            , r10            ; save->v14; load->v14
              and     r10            , 255            
              mov     rbp            , r10            ; save->v14
_text__xorshift_for0_init_check:
              mov     r10            , rbp            ; load->v14
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v14
              je      _text__xorshift_for0_end                 
;----------------------------------]
;[----------------------------------
_text__xorshift_for0_start:
              mov     rbp            , 13             ; null; save->v15
              mov     rbx            , rcx            ; null; save->v17
              mov     r12            , qword [rsp+64] ; load->v9; null; save->v16
              mov     rcx            , rbp            ; load->v15; null
              mov     r10            , r12            ; load->v16
              and     r10            , -1             
              mov     r12            , r10            ; save->v16; load->v16
              sal     r10d           , cl             
              mov     r12            , r10            ; save->v16
              mov     rcx            , rbx            ; load->v17; null
              mov     rbp            , 65535          ; null; save->v18
              mov     rbx            , 32767          ; null; save->v19
              mov     r13            , 16             ; null; save->v20
              mov     r14            , rcx            ; null; save->v22
              mov     r15            , rbx            ; load->v19; null; save->v21
              mov     rcx            , r13            ; load->v20; null
              mov     r10            , r15            ; load->v21
              and     r10            , -1             
              mov     r15            , r10            ; save->v21; load->v21
              sal     r10d           , cl             
              mov     r15            , r10            ; save->v21
              mov     rcx            , r14            ; load->v22; null
              mov     rbx            , rbp            ; load->v18; null; save->v23
              mov     r10            , rbx            ; load->v23
              mov     r11            , r15            ; load->v21
              or      r10            , r11            
              mov     rbx            , r10            ; save->v23
              mov     rbp            , r12            ; load->v16; null; save->v24
              mov     r10            , rbp            ; load->v24
              mov     r11            , rbx            ; load->v23
              and     r10            , r11            
              mov     rbp            , r10            ; save->v24
              mov     rbx            , qword [rsp+64] ; load->v9; null; save->v25
              mov     r10            , rbx            ; load->v25
              mov     r11            , rbp            ; load->v24
              xor     r10            , r11            
              mov     rbx            , r10            ; save->v25; load->v25
              and     r10            , -1             
              mov     rbx            , r10            ; save->v25
              mov     qword [rsp+64] , rbx            ; load->v25; assign->x; save->v9
              mov     rbp            , 17             ; null; save->v26
_text__xorshift_call0:
              mov     rdi            , qword [rsp+64] ; load->v9; null
              mov     rsi            , rbp            ; load->v26; null
              call    _text__shift_r                  
              mov     rbp            , rax            ; null; save->v27
              mov     rbx            , qword [rsp+64] ; load->v9; null; save->v28
              mov     r10            , rbx            ; load->v28
              mov     r11            , rbp            ; load->v27
              xor     r10            , r11            
              mov     rbx            , r10            ; save->v28; load->v28
              and     r10            , -1             
              mov     rbx            , r10            ; save->v28
              mov     qword [rsp+64] , rbx            ; load->v28; assign->x; save->v9
              mov     rbp            , 5              ; null; save->v29
              mov     rbx            , rcx            ; null; save->v31
              mov     r12            , qword [rsp+64] ; load->v9; null; save->v30
              mov     rcx            , rbp            ; load->v29; null
              mov     r10            , r12            ; load->v30
              and     r10            , -1             
              mov     r12            , r10            ; save->v30; load->v30
              sal     r10d           , cl             
              mov     r12            , r10            ; save->v30
              mov     rcx            , rbx            ; load->v31; null
              mov     rbp            , 65535          ; null; save->v32
              mov     rbx            , 32767          ; null; save->v33
              mov     r13            , 16             ; null; save->v34
              mov     r14            , rcx            ; null; save->v36
              mov     r15            , rbx            ; load->v33; null; save->v35
              mov     rcx            , r13            ; load->v34; null
              mov     r10            , r15            ; load->v35
              and     r10            , -1             
              mov     r15            , r10            ; save->v35; load->v35
              sal     r10d           , cl             
              mov     r15            , r10            ; save->v35
              mov     rcx            , r14            ; load->v36; null
              mov     rbx            , rbp            ; load->v32; null; save->v37
              mov     r10            , rbx            ; load->v37
              mov     r11            , r15            ; load->v35
              or      r10            , r11            
              mov     rbx            , r10            ; save->v37
              mov     rbp            , r12            ; load->v30; null; save->v38
              mov     r10            , rbp            ; load->v38
              mov     r11            , rbx            ; load->v37
              and     r10            , r11            
              mov     rbp            , r10            ; save->v38
              mov     rbx            , qword [rsp+64] ; load->v9; null; save->v39
              mov     r10            , rbx            ; load->v39
              mov     r11            , rbp            ; load->v38
              xor     r10            , r11            
              mov     rbx            , r10            ; save->v39; load->v39
              and     r10            , -1             
              mov     rbx            , r10            ; save->v39
              mov     qword [rsp+64] , rbx            ; load->v39; assign->x; save->v9
_text__xorshift_for0_continue:
              mov     rbp            , qword [rsp+72] ; load->v10; null; save->v40
              mov     rbp            , qword [rsp+72] ; load->v10; null; save->v41
              mov     r10            , rbp            ; load->v41
              add     r10            , 1              
              mov     rbp            , r10            ; save->v41
              mov     qword [rsp+72] , rbp            ; load->v41; assign->i; save->v10
              mov     rbp            , 10             ; null; save->v42
              mov     rbx            , qword [rsp+56] ; load->v7; null; save->v43
              mov     r10            , rbx            ; load->v43
              mov     r11            , rbp            ; load->v42
              imul    r10            , r11            
              mov     rbx            , r10            ; save->v43; load->v43
              and     r10            , -1             
              mov     rbx            , r10            ; save->v43
              mov     r10            , qword [rsp+72] ; load->v10
              mov     r11            , rbx            ; load->v43
              cmp     r10d           , r11d           
              mov     qword [rsp+72] , r10            ; save->v10
              jl      _text__xorshift_for0_start                 
;----------------------------------]
;[----------------------------------
_text__xorshift_for0_end:
              mov     rbp            , 123456789      ; null; save->v44
              mov     rbx            , qword [rsp+64] ; load->v9; null; save->v45
              mov     r10            , rbx            ; load->v45
              mov     r11            , rbp            ; load->v44
              xor     r10            , r11            
              mov     rbx            , r10            ; save->v45; load->v45
              and     r10            , -1             
              mov     rbx            , r10            ; save->v45
_text__xorshift_ret0:
              mov     rax            , rbx            ; load->v45; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 88             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__int2chr ] ---
;[----------------------------------
_text__int2chr:
              sub     rsp            , 72             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     qword [rsp+48] , rdi            ; null; save->v6
_text__int2chr_if0_init:
_text__int2chr_and0_lvalue:
              mov     rbp            , 0              ; null; save->v7
              mov     rbx            , 32             ; null; save->v8
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r11            , rbx            ; load->v8
              cmp     r10d           , r11d           
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , rbx            ; load->v9
              setge   r10b                            
              mov     rbx            , r10            ; save->v9; load->v9
              and     r10            , 255            
              mov     rbx            , r10            ; save->v9; load->v9
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v9
              je      _text__int2chr_and0_end                 
;----------------------------------]
;[----------------------------------
_text__int2chr_and0_rvalue:
              mov     rbx            , 126            ; null; save->v10
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r11            , rbx            ; load->v10
              cmp     r10d           , r11d           
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , rbx            ; load->v11
              setle   r10b                            
              mov     rbx            , r10            ; save->v11; load->v11
              and     r10            , 255            
              mov     rbx            , r10            ; save->v11; load->v11
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v11
              je      _text__int2chr_and0_end                 
              mov     rbp            , 255            ; null; save->v7
_text__int2chr_and0_end:
_text__int2chr_if0_check:
              mov     r10            , rbp            ; load->v7
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v7
              je      _text__int2chr_if0_else                 
;----------------------------------]
;[----------------------------------
_text__int2chr_if0_start:
              mov     rbp            , 32             ; null; save->v12
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v13
              mov     r10            , rbx            ; load->v13
              mov     r11            , rbp            ; load->v12
              sub     r10            , r11            
              mov     rbx            , r10            ; save->v13
              mov     rbp            , 32             ; null; save->v14
              mov     r12            , qword [rsp+48] ; load->v6; null; save->v15
              mov     r10            , r12            ; load->v15
              mov     r11            , rbp            ; load->v14
              sub     r10            , r11            
              mov     r12            , r10            ; save->v15
              mov     rbp            , [_data_bss_asciiTable]; null; save->v16
_text__int2chr_call0:
              mov     rdi            , rbp            ; load->v16; null
              mov     rsi            , rbx            ; load->v13; null
              mov     rdx            , r12            ; load->v15; null
              call    _text_built_in_string_substring                 
              mov     qword [rsp+56] , rax            ; null; save->v17
_text__int2chr_ret0:
              mov     rax            , qword [rsp+56] ; load->v17; null
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
_text__int2chr_if0_else:
_text__int2chr_if0_end:
              mov     rbp            , _data_s3       ; null; save->v18
_text__int2chr_ret1:
              mov     rax            , rbp            ; load->v18; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 72             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__toStringHex ] ---
;[----------------------------------
_text__toStringHex:
              sub     rsp            , 152            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     qword [rsp+48] , rdi            ; null; save->v6
              mov     rbp            , _data_s3       ; null; save->v7
              mov     qword [rsp+56] , rbp            ; load->v7; init->ret; save->v8
_text__toStringHex_for0_init:
              mov     rbp            , 28             ; null; save->v10
              mov     qword [rsp+64] , rbp            ; load->v10; assign->i; save->v9
              mov     rbp            , 0              ; null; save->v11
              mov     r10            , qword [rsp+64] ; load->v9
              mov     r11            , rbp            ; load->v11
              cmp     r10d           , r11d           
              mov     qword [rsp+64] , r10            ; save->v9
              mov     r10            , rbp            ; load->v12
              setge   r10b                            
              mov     rbp            , r10            ; save->v12; load->v12
              and     r10            , 255            
              mov     rbp            , r10            ; save->v12
_text__toStringHex_for0_init_check:
              mov     r10            , rbp            ; load->v12
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v12
              je      _text__toStringHex_for0_end                 
;----------------------------------]
;[----------------------------------
_text__toStringHex_for0_start:
              mov     rbp            , rcx            ; null; save->v14
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v13
              mov     rcx            , qword [rsp+64] ; load->v9; null
              mov     r10            , rbx            ; load->v13
              and     r10            , -1             
              mov     rbx            , r10            ; save->v13; load->v13
              sar     r10d           , cl             
              mov     rbx            , r10            ; save->v13
              mov     rcx            , rbp            ; load->v14; null
              mov     rbp            , 15             ; null; save->v15
              mov     r12            , rbx            ; load->v13; null; save->v16
              mov     r10            , r12            ; load->v16
              mov     r11            , rbp            ; load->v15
              and     r10            , r11            
              mov     r12            , r10            ; save->v16
              mov     qword [rsp+72] , r12            ; load->v16; init->digit; save->v17
_text__toStringHex_if0_init:
              mov     rbp            , 10             ; null; save->v18
_text__toStringHex_if0_check:
              mov     r10            , qword [rsp+72] ; load->v17
              mov     r11            , rbp            ; load->v18
              cmp     r10d           , r11d           
              mov     qword [rsp+72] , r10            ; save->v17
              jge     _text__toStringHex_if0_else                 
;----------------------------------]
;[----------------------------------
_text__toStringHex_if0_start:
              mov     rbp            , qword [rsp+72] ; load->v17; null; save->v19
              mov     r10            , rbp            ; load->v19
              add     r10            , 48             
              mov     rbp            , r10            ; save->v19
_text__toStringHex_call0:
              mov     rdi            , rbp            ; load->v19; null
              call    _text__int2chr                  
              mov     qword [rsp+80] , rax            ; null; save->v20
              mov     rdi            , qword [rsp+56] ; load->v8; null
              call    strlen                          
              mov     qword [rsp+88] , rax            ; null; save->v21
              mov     rdi            , qword [rsp+80] ; load->v20; null
              call    strlen                          
              mov     qword [rsp+96] , rax            ; null; save->v22
              mov     r10            , qword [rsp+96] ; load->v22
              mov     r11            , qword [rsp+88] ; load->v21
              add     r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v22; load->v22
              add     r10            , 1              
              mov     qword [rsp+96] , r10            ; save->v22
              mov     rdi            , qword [rsp+96] ; load->v22; null
              call    malloc                          
              mov     qword [rsp+104], rax            ; null; save->v23
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+56] ; load->v8; null
              call    strcpy                          
              mov     rdi            , qword [rsp+104]; load->v23; null
              mov     r11            , qword [rsp+88] ; load->v21
              add     rdi            , r11            
              mov     rsi            , qword [rsp+80] ; load->v20; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp+104]; load->v23; assign->ret
              mov     qword [rsp+56] , r10            ; save->v8
              jmp     _text__toStringHex_if0_end                 
;----------------------------------]
;[----------------------------------
_text__toStringHex_if0_else:
              mov     rbp            , qword [rsp+72] ; load->v17; null; save->v24
              mov     r10            , rbp            ; load->v24
              add     r10            , 65             
              mov     rbp            , r10            ; save->v24
              mov     rbx            , 10             ; null; save->v25
              mov     r12            , rbp            ; load->v24; null; save->v26
              mov     r10            , r12            ; load->v26
              mov     r11            , rbx            ; load->v25
              sub     r10            , r11            
              mov     r12            , r10            ; save->v26
_text__toStringHex_call1:
              mov     rdi            , r12            ; load->v26; null
              call    _text__int2chr                  
              mov     qword [rsp+112], rax            ; null; save->v27
              mov     rdi            , qword [rsp+56] ; load->v8; null
              call    strlen                          
              mov     qword [rsp+120], rax            ; null; save->v28
              mov     rdi            , qword [rsp+112]; load->v27; null
              call    strlen                          
              mov     qword [rsp+128], rax            ; null; save->v29
              mov     r10            , qword [rsp+128]; load->v29
              mov     r11            , qword [rsp+120]; load->v28
              add     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v29; load->v29
              add     r10            , 1              
              mov     qword [rsp+128], r10            ; save->v29
              mov     rdi            , qword [rsp+128]; load->v29; null
              call    malloc                          
              mov     qword [rsp+136], rax            ; null; save->v30
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+56] ; load->v8; null
              call    strcpy                          
              mov     rdi            , qword [rsp+136]; load->v30; null
              mov     r11            , qword [rsp+120]; load->v28
              add     rdi            , r11            
              mov     rsi            , qword [rsp+112]; load->v27; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp+136]; load->v30; assign->ret
              mov     qword [rsp+56] , r10            ; save->v8
_text__toStringHex_if0_end:
_text__toStringHex_for0_continue:
              mov     rbp            , 4              ; null; save->v31
              mov     rbx            , qword [rsp+64] ; load->v9; null; save->v32
              mov     r10            , rbx            ; load->v32
              mov     r11            , rbp            ; load->v31
              sub     r10            , r11            
              mov     rbx            , r10            ; save->v32
              mov     qword [rsp+64] , rbx            ; load->v32; assign->i; save->v9
              mov     rbp            , 0              ; null; save->v33
              mov     r10            , qword [rsp+64] ; load->v9
              mov     r11            , rbp            ; load->v33
              cmp     r10d           , r11d           
              mov     qword [rsp+64] , r10            ; save->v9
              jge     _text__toStringHex_for0_start                 
;----------------------------------]
;[----------------------------------
_text__toStringHex_for0_end:
_text__toStringHex_ret0:
              mov     rax            , qword [rsp+56] ; load->v8; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 152            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__getnumber ] ---
;[----------------------------------
_text__getnumber:
              sub     rsp            , 88             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     qword [rsp+48] , rdi            ; null; save->v6
              mov     qword [rsp+56] , rsi            ; null; save->v7
              mov     qword [rsp+64] , rdx            ; null; save->v8
              mov     rbp            , 31             ; null; save->v9
              mov     rbx            , qword [rsp+64] ; load->v8; null; save->v10
              mov     r10            , rbx            ; load->v10
              mov     r11            , rbp            ; load->v9
              and     r10            , r11            
              mov     rbx            , r10            ; save->v10
              mov     qword [rsp+72] , rbx            ; load->v10; init->shift; save->v11
_text__getnumber_call0:
              mov     rdi            , qword [rsp+48] ; load->v6; null
              mov     rsi            , qword [rsp+56] ; load->v7; null
              call    _text__xorshift                 
              mov     rbp            , rax            ; null; save->v12
              mov     qword [rsp+80] , rbp            ; load->v12; init->val; save->v13
              mov     rbp            , rcx            ; null; save->v15
              mov     rbx            , qword [rsp+80] ; load->v13; null; save->v14
              mov     rcx            , qword [rsp+72] ; load->v11; null
              mov     r10            , rbx            ; load->v14
              and     r10            , -1             
              mov     rbx            , r10            ; save->v14; load->v14
              sal     r10d           , cl             
              mov     rbx            , r10            ; save->v14
              mov     rcx            , rbp            ; load->v15; null
              mov     rbp            , 65535          ; null; save->v16
              mov     r12            , 32767          ; null; save->v17
              mov     r13            , 16             ; null; save->v18
              mov     r14            , rcx            ; null; save->v20
              mov     r15            , r12            ; load->v17; null; save->v19
              mov     rcx            , r13            ; load->v18; null
              mov     r10            , r15            ; load->v19
              and     r10            , -1             
              mov     r15            , r10            ; save->v19; load->v19
              sal     r10d           , cl             
              mov     r15            , r10            ; save->v19
              mov     rcx            , r14            ; load->v20; null
              mov     r12            , rbp            ; load->v16; null; save->v21
              mov     r10            , r12            ; load->v21
              mov     r11            , r15            ; load->v19
              or      r10            , r11            
              mov     r12            , r10            ; save->v21
              mov     rbp            , rbx            ; load->v14; null; save->v22
              mov     r10            , rbp            ; load->v22
              mov     r11            , r12            ; load->v21
              and     r10            , r11            
              mov     rbp            , r10            ; save->v22
              mov     rbx            , 32             ; null; save->v23
              mov     r12            , rbx            ; load->v23; null; save->v24
              mov     r10            , r12            ; load->v24
              mov     r11            , qword [rsp+72] ; load->v11
              sub     r10            , r11            
              mov     r12            , r10            ; save->v24
_text__getnumber_call1:
              mov     rdi            , qword [rsp+80] ; load->v13; null
              mov     rsi            , r12            ; load->v24; null
              call    _text__shift_r                  
              mov     rbx            , rax            ; null; save->v25
              mov     r12            , rbp            ; load->v22; null; save->v26
              mov     r10            , r12            ; load->v26
              mov     r11            , rbx            ; load->v25
              or      r10            , r11            
              mov     r12            , r10            ; save->v26
_text__getnumber_ret0:
              mov     rax            , r12            ; load->v26; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 88             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 488            
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
              mov     rbp            , rax            ; null; save->v15
              mov     qword [rsp+48] , rbp            ; load->v15; assign->l1; save->v6
_text__main_call1:
              call    _text__getInt                   
              mov     rbp            , rax            ; null; save->v16
              mov     qword [rsp+56] , rbp            ; load->v16; assign->r1; save->v7
_text__main_call2:
              call    _text__getInt                   
              mov     rbp            , rax            ; null; save->v17
              mov     qword [rsp+64] , rbp            ; load->v17; assign->l2; save->v8
_text__main_call3:
              call    _text__getInt                   
              mov     rbp            , rax            ; null; save->v18
              mov     qword [rsp+72] , rbp            ; load->v18; assign->r2; save->v9
_text__main_call4:
              call    _text__getInt                   
              mov     rbp            , rax            ; null; save->v19
              mov     qword [rsp+80] , rbp            ; load->v19; assign->l3; save->v10
_text__main_call5:
              call    _text__getInt                   
              mov     rbp            , rax            ; null; save->v20
              mov     qword [rsp+88] , rbp            ; load->v20; assign->r3; save->v11
              mov     rbp            , 30             ; null; save->v21
              mov     qword [rsp+120], rbp            ; load->v21; init->round; save->v22
              mov     rbp            , 0              ; null; save->v23
              mov     qword [rsp+128], rbp            ; load->v23; init->ans0; save->v24
              mov     rbp            , 0              ; null; save->v25
              mov     qword [rsp+136], rbp            ; load->v25; init->ans1; save->v26
              mov     rbp            , 0              ; null; save->v27
              mov     qword [rsp+144], rbp            ; load->v27; init->ans2; save->v28
              mov     rbp            , 0              ; null; save->v29
              mov     qword [rsp+152], rbp            ; load->v29; init->ans3; save->v30
_text__main_for0_init:
              mov     r10            , qword [rsp+48] ; load->v6; assign->i
              mov     qword [rsp+96] , r10            ; save->v12; load->v12
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10d           , r11d           
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , rbp            ; load->v31
              setl    r10b                            
              mov     rbp            , r10            ; save->v31; load->v31
              and     r10            , 255            
              mov     rbp            , r10            ; save->v31
_text__main_for0_init_check:
              mov     r10            , rbp            ; load->v31
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v31
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
_text__main_for1_init:
              mov     r10            , qword [rsp+64] ; load->v8; assign->j
              mov     qword [rsp+104], r10            ; save->v13; load->v13
              mov     r11            , qword [rsp+72] ; load->v9
              cmp     r10d           , r11d           
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , rbp            ; load->v32
              setl    r10b                            
              mov     rbp            , r10            ; save->v32; load->v32
              and     r10            , 255            
              mov     rbp            , r10            ; save->v32
_text__main_for1_init_check:
              mov     r10            , rbp            ; load->v32
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v32
              je      _text__main_for1_end                 
;----------------------------------]
;[----------------------------------
_text__main_for1_start:
_text__main_for2_init:
              mov     r10            , qword [rsp+80] ; load->v10; assign->k
              mov     qword [rsp+112], r10            ; save->v14; load->v14
              mov     r11            , qword [rsp+88] ; load->v11
              cmp     r10d           , r11d           
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , rbp            ; load->v33
              setl    r10b                            
              mov     rbp            , r10            ; save->v33; load->v33
              and     r10            , 255            
              mov     rbp            , r10            ; save->v33
_text__main_for2_init_check:
              mov     r10            , rbp            ; load->v33
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v33
              je      _text__main_for2_end                 
;----------------------------------]
;[----------------------------------
_text__main_for2_start:
_text__main_call6:
              mov     rdi            , qword [rsp+48] ; load->v6; null
              mov     rsi            , qword [rsp+120]; load->v22; null
              mov     rdx            , qword [rsp+112]; load->v14; null
              call    _text__getnumber                 
              mov     rbp            , rax            ; null; save->v34
              mov     qword [rsp+160], rbp            ; load->v34; init->x0; save->v35
_text__main_call7:
              mov     rdi            , qword [rsp+96] ; load->v12; null
              mov     rsi            , qword [rsp+120]; load->v22; null
              mov     rdx            , qword [rsp+112]; load->v14; null
              call    _text__getnumber                 
              mov     rbp            , rax            ; null; save->v36
              mov     qword [rsp+168], rbp            ; load->v36; init->x1; save->v37
_text__main_call8:
              mov     rdi            , qword [rsp+104]; load->v13; null
              mov     rsi            , qword [rsp+120]; load->v22; null
              mov     rdx            , qword [rsp+112]; load->v14; null
              call    _text__getnumber                 
              mov     rbp            , rax            ; null; save->v38
              mov     qword [rsp+176], rbp            ; load->v38; init->x2; save->v39
              mov     rbp            , qword [rsp+96] ; load->v12; null; save->v40
              mov     r10            , rbp            ; load->v40
              mov     r11            , qword [rsp+104]; load->v13
              xor     r10            , r11            
              mov     rbp            , r10            ; save->v40; load->v40
              and     r10            , -1             
              mov     rbp            , r10            ; save->v40
_text__main_call9:
              mov     rdi            , rbp            ; load->v40; null
              mov     rsi            , qword [rsp+120]; load->v22; null
              mov     rdx            , qword [rsp+112]; load->v14; null
              call    _text__getnumber                 
              mov     rbp            , rax            ; null; save->v41
              mov     qword [rsp+184], rbp            ; load->v41; init->x3; save->v42
              mov     rbp            , 1              ; null; save->v43
_text__main_call10:
              mov     rdi            , qword [rsp+112]; load->v14; null
              mov     rsi            , rbp            ; load->v43; null
              call    _text__xorshift                 
              mov     rbp            , rax            ; null; save->v44
              mov     rbx            , 1              ; null; save->v45
_text__main_call11:
              mov     rdi            , qword [rsp+104]; load->v13; null
              mov     rsi            , rbx            ; load->v45; null
              call    _text__xorshift                 
              mov     rbx            , rax            ; null; save->v46
              mov     r12            , rbp            ; load->v44; null; save->v47
              mov     r10            , r12            ; load->v47
              mov     r11            , rbx            ; load->v46
              xor     r10            , r11            
              mov     r12            , r10            ; save->v47; load->v47
              and     r10            , -1             
              mov     r12            , r10            ; save->v47
              mov     rbp            , 1              ; null; save->v48
_text__main_call12:
              mov     rdi            , qword [rsp+96] ; load->v12; null
              mov     rsi            , rbp            ; load->v48; null
              call    _text__xorshift                 
              mov     rbp            , rax            ; null; save->v49
              mov     rbx            , r12            ; load->v47; null; save->v50
              mov     r10            , rbx            ; load->v50
              mov     r11            , rbp            ; load->v49
              xor     r10            , r11            
              mov     rbx            , r10            ; save->v50; load->v50
              and     r10            , -1             
              mov     rbx            , r10            ; save->v50
              mov     qword [rsp+192], rbx            ; load->v50; init->y; save->v51
              mov     rbp            , qword [rsp+160]; load->v35; null; save->v52
              mov     r10            , rbp            ; load->v52
              mov     r11            , qword [rsp+192]; load->v51
              xor     r10            , r11            
              mov     rbp            , r10            ; save->v52; load->v52
              and     r10            , -1             
              mov     rbp            , r10            ; save->v52
              mov     rbx            , 1              ; null; save->v53
_text__main_call13:
              mov     rdi            , rbp            ; load->v52; null
              mov     rsi            , rbx            ; load->v53; null
              call    _text__xorshift                 
              mov     rbp            , rax            ; null; save->v54
              mov     rbx            , qword [rsp+128]; load->v24; null; save->v55
              mov     r10            , rbx            ; load->v55
              mov     r11            , rbp            ; load->v54
              add     r10            , r11            
              mov     rbx            , r10            ; save->v55
              mov     qword [rsp+128], rbx            ; load->v55; assign->ans0; save->v24
              mov     rbp            , qword [rsp+168]; load->v37; null; save->v56
              mov     r10            , rbp            ; load->v56
              mov     r11            , qword [rsp+192]; load->v51
              xor     r10            , r11            
              mov     rbp            , r10            ; save->v56; load->v56
              and     r10            , -1             
              mov     rbp            , r10            ; save->v56
              mov     rbx            , 1              ; null; save->v57
_text__main_call14:
              mov     rdi            , rbp            ; load->v56; null
              mov     rsi            , rbx            ; load->v57; null
              call    _text__xorshift                 
              mov     rbp            , rax            ; null; save->v58
              mov     rbx            , qword [rsp+136]; load->v26; null; save->v59
              mov     r10            , rbx            ; load->v59
              mov     r11            , rbp            ; load->v58
              add     r10            , r11            
              mov     rbx            , r10            ; save->v59
              mov     qword [rsp+136], rbx            ; load->v59; assign->ans1; save->v26
              mov     rbp            , qword [rsp+176]; load->v39; null; save->v60
              mov     r10            , rbp            ; load->v60
              mov     r11            , qword [rsp+192]; load->v51
              xor     r10            , r11            
              mov     rbp            , r10            ; save->v60; load->v60
              and     r10            , -1             
              mov     rbp            , r10            ; save->v60
              mov     rbx            , 1              ; null; save->v61
_text__main_call15:
              mov     rdi            , rbp            ; load->v60; null
              mov     rsi            , rbx            ; load->v61; null
              call    _text__xorshift                 
              mov     rbp            , rax            ; null; save->v62
              mov     rbx            , qword [rsp+144]; load->v28; null; save->v63
              mov     r10            , rbx            ; load->v63
              mov     r11            , rbp            ; load->v62
              add     r10            , r11            
              mov     rbx            , r10            ; save->v63
              mov     qword [rsp+144], rbx            ; load->v63; assign->ans2; save->v28
              mov     rbp            , qword [rsp+184]; load->v42; null; save->v64
              mov     r10            , rbp            ; load->v64
              mov     r11            , qword [rsp+192]; load->v51
              xor     r10            , r11            
              mov     rbp            , r10            ; save->v64; load->v64
              and     r10            , -1             
              mov     rbp            , r10            ; save->v64
              mov     rbx            , 1              ; null; save->v65
_text__main_call16:
              mov     rdi            , rbp            ; load->v64; null
              mov     rsi            , rbx            ; load->v65; null
              call    _text__xorshift                 
              mov     rbp            , rax            ; null; save->v66
              mov     rbx            , qword [rsp+152]; load->v30; null; save->v67
              mov     r10            , rbx            ; load->v67
              mov     r11            , rbp            ; load->v66
              add     r10            , r11            
              mov     rbx            , r10            ; save->v67
              mov     qword [rsp+152], rbx            ; load->v67; assign->ans3; save->v30
_text__main_for2_continue:
              mov     rbp            , qword [rsp+112]; load->v14; null; save->v68
              mov     rbp            , qword [rsp+112]; load->v14; null; save->v69
              mov     r10            , rbp            ; load->v69
              add     r10            , 1              
              mov     rbp            , r10            ; save->v69
              mov     qword [rsp+112], rbp            ; load->v69; assign->k; save->v14
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+88] ; load->v11
              cmp     r10d           , r11d           
              mov     qword [rsp+112], r10            ; save->v14
              jl      _text__main_for2_start                 
;----------------------------------]
;[----------------------------------
_text__main_for2_end:
_text__main_for1_continue:
              mov     rbp            , qword [rsp+104]; load->v13; null; save->v70
              mov     rbp            , qword [rsp+104]; load->v13; null; save->v71
              mov     r10            , rbp            ; load->v71
              add     r10            , 1              
              mov     rbp            , r10            ; save->v71
              mov     qword [rsp+104], rbp            ; load->v71; assign->j; save->v13
              mov     r10            , qword [rsp+104]; load->v13
              mov     r11            , qword [rsp+72] ; load->v9
              cmp     r10d           , r11d           
              mov     qword [rsp+104], r10            ; save->v13
              jl      _text__main_for1_start                 
;----------------------------------]
;[----------------------------------
_text__main_for1_end:
_text__main_for0_continue:
              mov     rbp            , qword [rsp+96] ; load->v12; null; save->v72
              mov     rbp            , qword [rsp+96] ; load->v12; null; save->v73
              mov     r10            , rbp            ; load->v73
              add     r10            , 1              
              mov     rbp            , r10            ; save->v73
              mov     qword [rsp+96] , rbp            ; load->v73; assign->i; save->v12
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10d           , r11d           
              mov     qword [rsp+96] , r10            ; save->v12
              jl      _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
_text__main_call20:
              mov     rdi            , qword [rsp+128]; load->v24; null
              call    _text__toStringHex                 
              mov     qword [rsp+232], rax            ; null; save->v78
              mov     qword [rsp+240], _data_s4       ; null; save->v79
              mov     rdi            , qword [rsp+232]; load->v78; null
              call    strlen                          
              mov     qword [rsp+248], rax            ; null; save->v80
              mov     rdi            , qword [rsp+240]; load->v79; null
              call    strlen                          
              mov     qword [rsp+256], rax            ; null; save->v81
              mov     r10            , qword [rsp+256]; load->v81
              mov     r11            , qword [rsp+248]; load->v80
              add     r10            , r11            
              mov     qword [rsp+256], r10            ; save->v81; load->v81
              add     r10            , 1              
              mov     qword [rsp+256], r10            ; save->v81
              mov     rdi            , qword [rsp+256]; load->v81; null
              call    malloc                          
              mov     qword [rsp+264], rax            ; null; save->v82
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+232]; load->v78; null
              call    strcpy                          
              mov     rdi            , qword [rsp+264]; load->v82; null
              mov     r11            , qword [rsp+248]; load->v80
              add     rdi            , r11            
              mov     rsi            , qword [rsp+240]; load->v79; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
_text__main_call21:
              mov     rdi            , qword [rsp+264]; load->v82; null
              call    _text__print                    
              mov     rbp            , rax            ; null; save->v83
_text__main_call25:
              mov     rdi            , qword [rsp+136]; load->v26; null
              call    _text__toStringHex                 
              mov     qword [rsp+304], rax            ; null; save->v88
              mov     qword [rsp+312], _data_s4       ; null; save->v89
              mov     rdi            , qword [rsp+304]; load->v88; null
              call    strlen                          
              mov     qword [rsp+320], rax            ; null; save->v90
              mov     rdi            , qword [rsp+312]; load->v89; null
              call    strlen                          
              mov     qword [rsp+328], rax            ; null; save->v91
              mov     r10            , qword [rsp+328]; load->v91
              mov     r11            , qword [rsp+320]; load->v90
              add     r10            , r11            
              mov     qword [rsp+328], r10            ; save->v91; load->v91
              add     r10            , 1              
              mov     qword [rsp+328], r10            ; save->v91
              mov     rdi            , qword [rsp+328]; load->v91; null
              call    malloc                          
              mov     qword [rsp+336], rax            ; null; save->v92
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+304]; load->v88; null
              call    strcpy                          
              mov     rdi            , qword [rsp+336]; load->v92; null
              mov     r11            , qword [rsp+320]; load->v90
              add     rdi            , r11            
              mov     rsi            , qword [rsp+312]; load->v89; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
_text__main_call26:
              mov     rdi            , qword [rsp+336]; load->v92; null
              call    _text__print                    
              mov     rbp            , rax            ; null; save->v93
_text__main_call30:
              mov     rdi            , qword [rsp+144]; load->v28; null
              call    _text__toStringHex                 
              mov     qword [rsp+376], rax            ; null; save->v98
              mov     qword [rsp+384], _data_s4       ; null; save->v99
              mov     rdi            , qword [rsp+376]; load->v98; null
              call    strlen                          
              mov     qword [rsp+392], rax            ; null; save->v100
              mov     rdi            , qword [rsp+384]; load->v99; null
              call    strlen                          
              mov     qword [rsp+400], rax            ; null; save->v101
              mov     r10            , qword [rsp+400]; load->v101
              mov     r11            , qword [rsp+392]; load->v100
              add     r10            , r11            
              mov     qword [rsp+400], r10            ; save->v101; load->v101
              add     r10            , 1              
              mov     qword [rsp+400], r10            ; save->v101
              mov     rdi            , qword [rsp+400]; load->v101; null
              call    malloc                          
              mov     qword [rsp+408], rax            ; null; save->v102
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+376]; load->v98; null
              call    strcpy                          
              mov     rdi            , qword [rsp+408]; load->v102; null
              mov     r11            , qword [rsp+392]; load->v100
              add     rdi            , r11            
              mov     rsi            , qword [rsp+384]; load->v99; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
_text__main_call31:
              mov     rdi            , qword [rsp+408]; load->v102; null
              call    _text__print                    
              mov     rbp            , rax            ; null; save->v103
_text__main_call35:
              mov     rdi            , qword [rsp+152]; load->v30; null
              call    _text__toStringHex                 
              mov     qword [rsp+448], rax            ; null; save->v108
              mov     qword [rsp+456], _data_s4       ; null; save->v109
              mov     rdi            , qword [rsp+448]; load->v108; null
              call    strlen                          
              mov     qword [rsp+464], rax            ; null; save->v110
              mov     rdi            , qword [rsp+456]; load->v109; null
              call    strlen                          
              mov     qword [rsp+472], rax            ; null; save->v111
              mov     r10            , qword [rsp+472]; load->v111
              mov     r11            , qword [rsp+464]; load->v110
              add     r10            , r11            
              mov     qword [rsp+472], r10            ; save->v111; load->v111
              add     r10            , 1              
              mov     qword [rsp+472], r10            ; save->v111
              mov     rdi            , qword [rsp+472]; load->v111; null
              call    malloc                          
              mov     qword [rsp+480], rax            ; null; save->v112
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+448]; load->v108; null
              call    strcpy                          
              mov     rdi            , qword [rsp+480]; load->v112; null
              mov     r11            , qword [rsp+464]; load->v110
              add     rdi            , r11            
              mov     rsi            , qword [rsp+456]; load->v109; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
_text__main_call36:
              mov     rdi            , qword [rsp+480]; load->v112; null
              call    _text__print                    
              mov     rbp            , _data_s3       ; null; save->v113; null; save->v114
_text__main_call37:
              mov     rdi            , rbp            ; load->v114; null
              call    _text__println                  
              mov     rbp            , 0              ; null; save->v115; null; save->v116
_text__main_ret0:
              mov     rax            , rbp            ; load->v116; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 488            
              ret                                     
;----------------------------------]
                                                      
