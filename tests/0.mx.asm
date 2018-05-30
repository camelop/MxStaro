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
_data_s8:
              db      `str7`                          
              db      0                               
_data_s9:
              db      `str8`                          
              db      0                               
_data_s1:
              db      `%s\n`                          
              db      0                               
_data_s6:
              db      `str5`                          
              db      0                               
_data_s7:
              db      `str6`                          
              db      0                               
_data_s4:
              db      `str3`                          
              db      0                               
_data_s5:
              db      `str4`                          
              db      0                               
_data_s2:
              db      `str1`                          
              db      0                               
_data_s3:
              db      `str2`                          
              db      0                               
_data_s11:
              db      `str10`                         
              db      0                               
_data_s0:
              db      `%s`                            
              db      0                               
_data_s10:
              db      `str9`                          
              db      0                               

              section .bss                            
_data_bss_a:
              resb    8                               
_data_bss_str:
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
              sub     rsp            , 152            
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
              mov     r10            , 30             
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+56] ; load->v7
              imul    r10            , 8              
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+56] ; load->v7
              add     r10            , 8              
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , rax            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , r10            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v10
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
              mov     r11            , qword [rsp+56] ; load->v7
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r10            , rax            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r11            , qword [rsp+48] ; load->v6
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+64] ; load->v8
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     r11            , qword [rsp+80] ; load->v10
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+104]; load->v13
              mov     r11            , qword [rsp+88] ; load->v11
              mov     r10            , r11            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+104]; load->v13
              add     r10            , 8              
              mov     qword [rsp+104], r10            ; save->v13
_datainit_new0_expand_start:
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , 30             
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+112]; load->v14
              imul    r10            , 8              
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+112]; load->v14
              add     r10            , 8              
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , rax            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , r10            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v10
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
              mov     r11            , qword [rsp+112]; load->v14
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , rax            
              mov     qword [rsp+120], r10            ; save->v15
              mov     r11            , qword [rsp+48] ; load->v6
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+64] ; load->v8
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     r11            , qword [rsp+80] ; load->v10
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+104]; translate->qword [v13]
              mov     r11            , qword [rsp+120]; load->v15
              mov     qword [r10]    , r11            
              mov     r10            , qword [rsp+104]; load->v13
              add     r10            , 8              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+96] ; load->v12
              sub     r10            , 1              
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+96] ; load->v12
              cmp     r10            , 0              
              mov     qword [rsp+96] , r10            ; save->v12
              jne     _datainit_new0_expand_start                 
_datainit_new0_expand_end:
              mov     r11            , qword [rsp+88] ; load->v11
              mov     [_data_bss_a]  , r11            
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , 30             
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , qword [rsp+128]; load->v16
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+128]; load->v16
              imul    r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+128]; load->v16
              add     r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , rax            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , r10            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v10
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
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , rax            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r11            , qword [rsp+48] ; load->v6
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+64] ; load->v8
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     r11            , qword [rsp+80] ; load->v10
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r11            , qword [rsp+136]; load->v17
              mov     [_data_bss_str], r11            
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
              add     rsp            , 152            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 696            
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
_text__main_for0_init:
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , 0              
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+64] ; load->v8
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , 29             
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+80] ; load->v10
              cmp     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+88] ; load->v11
              setle   r10b                            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+88] ; load->v11
              and     r10            , 15             
              mov     qword [rsp+88] , r10            ; save->v11
_text__main_for0_init_check:
              mov     r10            , qword [rsp+88] ; load->v11
              cmp     r10b           , 0              
              mov     qword [rsp+88] , r10            ; save->v11
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , 0              
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+64] ; load->v8
              mov     r10            , r11            ; init->sum
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+72] ; load->v9
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
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , 0              
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+128]; load->v16
              mov     r11            , qword [rsp+64] ; load->v8
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
_text__main_call0:
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , rax            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r10            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
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
              call    _text__toString                 
              mov     r10            , qword [rsp+168]; load->v21
              mov     r10            , rax            
              mov     qword [rsp+168], r10            ; save->v21
              mov     r11            , qword [rsp+144]; load->v18
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     r11            , qword [rsp+160]; load->v20
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+176]; load->v22
              mov     r10            , [_data_bss_str]
              mov     qword [rsp+176], r10            ; save->v22
              mov     r10            , qword [rsp+184]; load->v23
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , qword [rsp+184]; load->v23
              imul    r10            , 8              
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , qword [rsp+184]; load->v23
              add     r10            , 8              
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , qword [rsp+184]; load->v23
              mov     r11            , qword [rsp+176]; load->v22
              add     r10            , r11            
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , qword [rsp+192]; load->v24
              mov     r11            , qword [rsp+184]; translate->qword [v23]
              mov     r10            , qword [r11]    
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+184]; translate->qword [v23]
              mov     r11            , qword [rsp+168]; load->v21
              mov     qword [r10]    , r11            ; assign->str[i]
_text__main_for1_init:
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , 0              
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+64] ; load->v8
              mov     r10            , r11            ; assign->j
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+72] ; load->v9
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+200]; load->v25
              setl    r10b                            
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+200]; load->v25
              and     r10            , 15             
              mov     qword [rsp+200], r10            ; save->v25
_text__main_for1_init_check:
              mov     r10            , qword [rsp+200]; load->v25
              cmp     r10b           , 0              
              mov     qword [rsp+200], r10            ; save->v25
              je      _text__main_for1_end                 
;----------------------------------]
;[----------------------------------
_text__main_for1_start:
_text__main_if0_init:
              mov     r10            , qword [rsp+208]; load->v26
              mov     r10            , 1              
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+216]; load->v27
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+216], r10            ; save->v27
              mov     r10            , qword [rsp+216]; load->v27
              mov     r11            , qword [rsp+208]; load->v26
              and     r10            , r11            
              mov     qword [rsp+216], r10            ; save->v27
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , 0              
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+216]; load->v27
              mov     r11            , qword [rsp+64] ; load->v8
              cmp     r10            , r11            
              mov     qword [rsp+216], r10            ; save->v27
              mov     r10            , qword [rsp+224]; load->v28
              sete    r10b                            
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+224]; load->v28
              and     r10            , 15             
              mov     qword [rsp+224], r10            ; save->v28
_text__main_if0_check:
              mov     r10            , qword [rsp+224]; load->v28
              cmp     r10b           , 0              
              mov     qword [rsp+224], r10            ; save->v28
              je      _text__main_if0_else                 
;----------------------------------]
;[----------------------------------
_text__main_if0_start:
              mov     r10            , qword [rsp+232]; load->v29
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+232], r10            ; save->v29
              mov     r10            , qword [rsp+240]; load->v30
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     qword [rsp+240], r10            ; save->v30
              mov     r10            , qword [rsp+240]; load->v30
              imul    r10            , 8              
              mov     qword [rsp+240], r10            ; save->v30
              mov     r10            , qword [rsp+240]; load->v30
              add     r10            , 8              
              mov     qword [rsp+240], r10            ; save->v30
              mov     r10            , qword [rsp+240]; load->v30
              mov     r11            , qword [rsp+232]; load->v29
              add     r10            , r11            
              mov     qword [rsp+240], r10            ; save->v30
              mov     r10            , qword [rsp+248]; load->v31
              mov     r11            , qword [rsp+240]; translate->qword [v30]
              mov     r10            , qword [r11]    
              mov     qword [rsp+248], r10            ; save->v31
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , 0              
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+256]; load->v32
              mov     r11            , qword [rsp+64] ; load->v8
              mov     r10            , r11            
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+256]; load->v32
              imul    r10            , 8              
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+256]; load->v32
              add     r10            , 8              
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+256]; load->v32
              mov     r11            , qword [rsp+248]; load->v31
              add     r10            , r11            
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+264]; load->v33
              mov     r11            , qword [rsp+256]; translate->qword [v32]
              mov     r10            , qword [r11]    
              mov     qword [rsp+264], r10            ; save->v33
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+96] ; load->v12
              mov     r10            , r11            
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+264]; load->v33
              add     r10            , r11            
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+272]; load->v34
              mov     r10            , r11            ; assign->sum
              mov     qword [rsp+96] , r10            ; save->v12
              jmp     _text__main_if0_end                 
;----------------------------------]
;[----------------------------------
_text__main_if0_else:
_text__main_if0_end:
_text__main_if1_init:
              mov     r10            , qword [rsp+208]; load->v26
              mov     r10            , 1              
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+280]; load->v35
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+280], r10            ; save->v35
              mov     r10            , qword [rsp+280]; load->v35
              mov     r11            , qword [rsp+208]; load->v26
              and     r10            , r11            
              mov     qword [rsp+280], r10            ; save->v35
              mov     r10            , qword [rsp+208]; load->v26
              mov     r10            , 1              
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+280]; load->v35
              mov     r11            , qword [rsp+208]; load->v26
              cmp     r10            , r11            
              mov     qword [rsp+280], r10            ; save->v35
              mov     r10            , qword [rsp+288]; load->v36
              sete    r10b                            
              mov     qword [rsp+288], r10            ; save->v36
              mov     r10            , qword [rsp+288]; load->v36
              and     r10            , 15             
              mov     qword [rsp+288], r10            ; save->v36
_text__main_if1_check:
              mov     r10            , qword [rsp+288]; load->v36
              cmp     r10b           , 0              
              mov     qword [rsp+288], r10            ; save->v36
              je      _text__main_if1_else                 
;----------------------------------]
;[----------------------------------
_text__main_if1_start:
              mov     r10            , qword [rsp+296]; load->v37
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+296], r10            ; save->v37
              mov     r10            , qword [rsp+304]; load->v38
              mov     r11            , qword [rsp+72] ; load->v9
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
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , 29             
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+320]; load->v40
              mov     r11            , qword [rsp+80] ; load->v10
              mov     r10            , r11            
              mov     qword [rsp+320], r10            ; save->v40
              mov     r10            , qword [rsp+320]; load->v40
              imul    r10            , 8              
              mov     qword [rsp+320], r10            ; save->v40
              mov     r10            , qword [rsp+320]; load->v40
              add     r10            , 8              
              mov     qword [rsp+320], r10            ; save->v40
              mov     r10            , qword [rsp+320]; load->v40
              mov     r11            , qword [rsp+312]; load->v39
              add     r10            , r11            
              mov     qword [rsp+320], r10            ; save->v40
              mov     r10            , qword [rsp+328]; load->v41
              mov     r11            , qword [rsp+320]; translate->qword [v40]
              mov     r10            , qword [r11]    
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+336]; load->v42
              mov     r11            , qword [rsp+96] ; load->v12
              mov     r10            , r11            
              mov     qword [rsp+336], r10            ; save->v42
              mov     r10            , qword [rsp+336]; load->v42
              mov     r11            , qword [rsp+328]; load->v41
              add     r10            , r11            
              mov     qword [rsp+336], r10            ; save->v42
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r11            , qword [rsp+336]; load->v42
              mov     r10            , r11            ; assign->sum
              mov     qword [rsp+96] , r10            ; save->v12
              jmp     _text__main_if1_end                 
;----------------------------------]
;[----------------------------------
_text__main_if1_else:
_text__main_if1_end:
_text__main_for1_continue:
              mov     r10            , qword [rsp+344]; load->v43
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+344], r10            ; save->v43
              mov     r10            , qword [rsp+208]; load->v26
              mov     r10            , 1              
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+352]; load->v44
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+352], r10            ; save->v44
              mov     r10            , qword [rsp+352]; load->v44
              mov     r11            , qword [rsp+208]; load->v26
              add     r10            , r11            
              mov     qword [rsp+352], r10            ; save->v44
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+352]; load->v44
              mov     r10            , r11            ; assign->j
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+72] ; load->v9
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+360]; load->v45
              setl    r10b                            
              mov     qword [rsp+360], r10            ; save->v45
              mov     r10            , qword [rsp+360]; load->v45
              and     r10            , 15             
              mov     qword [rsp+360], r10            ; save->v45
              mov     r10            , qword [rsp+360]; load->v45
              cmp     r10b           , 0              
              mov     qword [rsp+360], r10            ; save->v45
              jne     _text__main_for1_start                 
;----------------------------------]
;[----------------------------------
_text__main_for1_end:
              mov     r10            , qword [rsp+368]; load->v46
              mov     r10            , _data_s2       
              mov     qword [rsp+368], r10            ; save->v46
              mov     r10            , qword [rsp+376]; load->v47
              mov     r10            , _data_s3       
              mov     qword [rsp+376], r10            ; save->v47
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , rax            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r10            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
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
              mov     r11            , qword [rsp+368]; load->v46
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+384]; load->v48
              mov     r10            , rax            
              mov     qword [rsp+384], r10            ; save->v48
              mov     r11            , qword [rsp+376]; load->v47
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+392]; load->v49
              mov     r10            , rax            
              mov     qword [rsp+392], r10            ; save->v49
              mov     r10            , qword [rsp+392]; load->v49
              mov     r11            , qword [rsp+384]; load->v48
              add     r10            , r11            
              mov     qword [rsp+392], r10            ; save->v49
              mov     r10            , qword [rsp+392]; load->v49
              add     r10            , 1              
              mov     qword [rsp+392], r10            ; save->v49
              mov     r11            , qword [rsp+392]; load->v49
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+400]; load->v50
              mov     r10            , rax            
              mov     qword [rsp+400], r10            ; save->v50
              mov     rdi            , rax            
              mov     r11            , qword [rsp+368]; load->v46
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+400]; load->v50
              mov     rdi            , r11            
              mov     r11            , qword [rsp+384]; load->v48
              add     rdi            , r11            
              mov     r11            , qword [rsp+376]; load->v47
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+144]; load->v18
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     r11            , qword [rsp+160]; load->v20
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+408]; load->v51
              mov     r10            , _data_s4       
              mov     qword [rsp+408], r10            ; save->v51
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , rax            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r10            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
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
              mov     r11            , qword [rsp+400]; load->v50
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+416]; load->v52
              mov     r10            , rax            
              mov     qword [rsp+416], r10            ; save->v52
              mov     r11            , qword [rsp+408]; load->v51
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+424]; load->v53
              mov     r10            , rax            
              mov     qword [rsp+424], r10            ; save->v53
              mov     r10            , qword [rsp+424]; load->v53
              mov     r11            , qword [rsp+416]; load->v52
              add     r10            , r11            
              mov     qword [rsp+424], r10            ; save->v53
              mov     r10            , qword [rsp+424]; load->v53
              add     r10            , 1              
              mov     qword [rsp+424], r10            ; save->v53
              mov     r11            , qword [rsp+424]; load->v53
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+432]; load->v54
              mov     r10            , rax            
              mov     qword [rsp+432], r10            ; save->v54
              mov     rdi            , rax            
              mov     r11            , qword [rsp+400]; load->v50
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+432]; load->v54
              mov     rdi            , r11            
              mov     r11            , qword [rsp+416]; load->v52
              add     rdi            , r11            
              mov     r11            , qword [rsp+408]; load->v51
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+144]; load->v18
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     r11            , qword [rsp+160]; load->v20
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+440]; load->v55
              mov     r10            , _data_s5       
              mov     qword [rsp+440], r10            ; save->v55
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , rax            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r10            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
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
              mov     r11            , qword [rsp+432]; load->v54
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+448]; load->v56
              mov     r10            , rax            
              mov     qword [rsp+448], r10            ; save->v56
              mov     r11            , qword [rsp+440]; load->v55
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+456]; load->v57
              mov     r10            , rax            
              mov     qword [rsp+456], r10            ; save->v57
              mov     r10            , qword [rsp+456]; load->v57
              mov     r11            , qword [rsp+448]; load->v56
              add     r10            , r11            
              mov     qword [rsp+456], r10            ; save->v57
              mov     r10            , qword [rsp+456]; load->v57
              add     r10            , 1              
              mov     qword [rsp+456], r10            ; save->v57
              mov     r11            , qword [rsp+456]; load->v57
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+464]; load->v58
              mov     r10            , rax            
              mov     qword [rsp+464], r10            ; save->v58
              mov     rdi            , rax            
              mov     r11            , qword [rsp+432]; load->v54
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+464]; load->v58
              mov     rdi            , r11            
              mov     r11            , qword [rsp+448]; load->v56
              add     rdi            , r11            
              mov     r11            , qword [rsp+440]; load->v55
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+144]; load->v18
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     r11            , qword [rsp+160]; load->v20
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+472]; load->v59
              mov     r10            , _data_s6       
              mov     qword [rsp+472], r10            ; save->v59
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , rax            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r10            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
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
              mov     r11            , qword [rsp+464]; load->v58
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+480]; load->v60
              mov     r10            , rax            
              mov     qword [rsp+480], r10            ; save->v60
              mov     r11            , qword [rsp+472]; load->v59
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+488]; load->v61
              mov     r10            , rax            
              mov     qword [rsp+488], r10            ; save->v61
              mov     r10            , qword [rsp+488]; load->v61
              mov     r11            , qword [rsp+480]; load->v60
              add     r10            , r11            
              mov     qword [rsp+488], r10            ; save->v61
              mov     r10            , qword [rsp+488]; load->v61
              add     r10            , 1              
              mov     qword [rsp+488], r10            ; save->v61
              mov     r11            , qword [rsp+488]; load->v61
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+496]; load->v62
              mov     r10            , rax            
              mov     qword [rsp+496], r10            ; save->v62
              mov     rdi            , rax            
              mov     r11            , qword [rsp+464]; load->v58
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+496]; load->v62
              mov     rdi            , r11            
              mov     r11            , qword [rsp+480]; load->v60
              add     rdi            , r11            
              mov     r11            , qword [rsp+472]; load->v59
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+144]; load->v18
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     r11            , qword [rsp+160]; load->v20
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+504]; load->v63
              mov     r10            , _data_s7       
              mov     qword [rsp+504], r10            ; save->v63
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , rax            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r10            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
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
              mov     r11            , qword [rsp+496]; load->v62
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+512]; load->v64
              mov     r10            , rax            
              mov     qword [rsp+512], r10            ; save->v64
              mov     r11            , qword [rsp+504]; load->v63
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+520]; load->v65
              mov     r10            , rax            
              mov     qword [rsp+520], r10            ; save->v65
              mov     r10            , qword [rsp+520]; load->v65
              mov     r11            , qword [rsp+512]; load->v64
              add     r10            , r11            
              mov     qword [rsp+520], r10            ; save->v65
              mov     r10            , qword [rsp+520]; load->v65
              add     r10            , 1              
              mov     qword [rsp+520], r10            ; save->v65
              mov     r11            , qword [rsp+520]; load->v65
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+528]; load->v66
              mov     r10            , rax            
              mov     qword [rsp+528], r10            ; save->v66
              mov     rdi            , rax            
              mov     r11            , qword [rsp+496]; load->v62
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+528]; load->v66
              mov     rdi            , r11            
              mov     r11            , qword [rsp+512]; load->v64
              add     rdi            , r11            
              mov     r11            , qword [rsp+504]; load->v63
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+144]; load->v18
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     r11            , qword [rsp+160]; load->v20
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+536]; load->v67
              mov     r10            , _data_s8       
              mov     qword [rsp+536], r10            ; save->v67
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , rax            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r10            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
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
              mov     r11            , qword [rsp+528]; load->v66
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+544]; load->v68
              mov     r10            , rax            
              mov     qword [rsp+544], r10            ; save->v68
              mov     r11            , qword [rsp+536]; load->v67
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+552]; load->v69
              mov     r10            , rax            
              mov     qword [rsp+552], r10            ; save->v69
              mov     r10            , qword [rsp+552]; load->v69
              mov     r11            , qword [rsp+544]; load->v68
              add     r10            , r11            
              mov     qword [rsp+552], r10            ; save->v69
              mov     r10            , qword [rsp+552]; load->v69
              add     r10            , 1              
              mov     qword [rsp+552], r10            ; save->v69
              mov     r11            , qword [rsp+552]; load->v69
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+560]; load->v70
              mov     r10            , rax            
              mov     qword [rsp+560], r10            ; save->v70
              mov     rdi            , rax            
              mov     r11            , qword [rsp+528]; load->v66
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+560]; load->v70
              mov     rdi            , r11            
              mov     r11            , qword [rsp+544]; load->v68
              add     rdi            , r11            
              mov     r11            , qword [rsp+536]; load->v67
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+144]; load->v18
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     r11            , qword [rsp+160]; load->v20
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+568]; load->v71
              mov     r10            , _data_s9       
              mov     qword [rsp+568], r10            ; save->v71
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , rax            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r10            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
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
              mov     r11            , qword [rsp+560]; load->v70
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+576]; load->v72
              mov     r10            , rax            
              mov     qword [rsp+576], r10            ; save->v72
              mov     r11            , qword [rsp+568]; load->v71
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+584]; load->v73
              mov     r10            , rax            
              mov     qword [rsp+584], r10            ; save->v73
              mov     r10            , qword [rsp+584]; load->v73
              mov     r11            , qword [rsp+576]; load->v72
              add     r10            , r11            
              mov     qword [rsp+584], r10            ; save->v73
              mov     r10            , qword [rsp+584]; load->v73
              add     r10            , 1              
              mov     qword [rsp+584], r10            ; save->v73
              mov     r11            , qword [rsp+584]; load->v73
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+592]; load->v74
              mov     r10            , rax            
              mov     qword [rsp+592], r10            ; save->v74
              mov     rdi            , rax            
              mov     r11            , qword [rsp+560]; load->v70
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+592]; load->v74
              mov     rdi            , r11            
              mov     r11            , qword [rsp+576]; load->v72
              add     rdi            , r11            
              mov     r11            , qword [rsp+568]; load->v71
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+144]; load->v18
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     r11            , qword [rsp+160]; load->v20
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+600]; load->v75
              mov     r10            , _data_s10      
              mov     qword [rsp+600], r10            ; save->v75
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , rax            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r10            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
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
              mov     r11            , qword [rsp+592]; load->v74
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+608]; load->v76
              mov     r10            , rax            
              mov     qword [rsp+608], r10            ; save->v76
              mov     r11            , qword [rsp+600]; load->v75
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+616]; load->v77
              mov     r10            , rax            
              mov     qword [rsp+616], r10            ; save->v77
              mov     r10            , qword [rsp+616]; load->v77
              mov     r11            , qword [rsp+608]; load->v76
              add     r10            , r11            
              mov     qword [rsp+616], r10            ; save->v77
              mov     r10            , qword [rsp+616]; load->v77
              add     r10            , 1              
              mov     qword [rsp+616], r10            ; save->v77
              mov     r11            , qword [rsp+616]; load->v77
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+624]; load->v78
              mov     r10            , rax            
              mov     qword [rsp+624], r10            ; save->v78
              mov     rdi            , rax            
              mov     r11            , qword [rsp+592]; load->v74
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+624]; load->v78
              mov     rdi            , r11            
              mov     r11            , qword [rsp+608]; load->v76
              add     rdi            , r11            
              mov     r11            , qword [rsp+600]; load->v75
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+144]; load->v18
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     r11            , qword [rsp+160]; load->v20
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+632]; load->v79
              mov     r10            , _data_s11      
              mov     qword [rsp+632], r10            ; save->v79
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , rax            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r10            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
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
              mov     r11            , qword [rsp+624]; load->v78
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+640]; load->v80
              mov     r10            , rax            
              mov     qword [rsp+640], r10            ; save->v80
              mov     r11            , qword [rsp+632]; load->v79
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+648]; load->v81
              mov     r10            , rax            
              mov     qword [rsp+648], r10            ; save->v81
              mov     r10            , qword [rsp+648]; load->v81
              mov     r11            , qword [rsp+640]; load->v80
              add     r10            , r11            
              mov     qword [rsp+648], r10            ; save->v81
              mov     r10            , qword [rsp+648]; load->v81
              add     r10            , 1              
              mov     qword [rsp+648], r10            ; save->v81
              mov     r11            , qword [rsp+648]; load->v81
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+656]; load->v82
              mov     r10            , rax            
              mov     qword [rsp+656], r10            ; save->v82
              mov     rdi            , rax            
              mov     r11            , qword [rsp+624]; load->v78
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+656]; load->v82
              mov     rdi            , r11            
              mov     r11            , qword [rsp+640]; load->v80
              add     rdi            , r11            
              mov     r11            , qword [rsp+632]; load->v79
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+144]; load->v18
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     r11            , qword [rsp+160]; load->v20
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__main_call1:
              mov     r10            , qword [rsp+144]; load->v18
              mov     r10            , rax            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , r10            
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
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
              mov     r11            , qword [rsp+656]; load->v82
              mov     rdi            , r11            
              call    _text__println                  
              mov     r10            , qword [rsp+664]; load->v83
              mov     r10            , rax            
              mov     qword [rsp+664], r10            ; save->v83
              mov     r11            , qword [rsp+144]; load->v18
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     r11            , qword [rsp+160]; load->v20
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
_text__main_for0_continue:
              mov     r10            , qword [rsp+672]; load->v84
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     qword [rsp+672], r10            ; save->v84
              mov     r10            , qword [rsp+208]; load->v26
              mov     r10            , 1              
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+680]; load->v85
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     qword [rsp+680], r10            ; save->v85
              mov     r10            , qword [rsp+680]; load->v85
              mov     r11            , qword [rsp+208]; load->v26
              add     r10            , r11            
              mov     qword [rsp+680], r10            ; save->v85
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+680]; load->v85
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , 29             
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+80] ; load->v10
              cmp     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+688]; load->v86
              setle   r10b                            
              mov     qword [rsp+688], r10            ; save->v86
              mov     r10            , qword [rsp+688]; load->v86
              and     r10            , 15             
              mov     qword [rsp+688], r10            ; save->v86
              mov     r10            , qword [rsp+688]; load->v86
              cmp     r10b           , 0              
              mov     qword [rsp+688], r10            ; save->v86
              jne     _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , 0              
              mov     qword [rsp+64] , r10            ; save->v8
_text__main_ret0:
              mov     r11            , qword [rsp+64] ; load->v8
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
              add     rsp            , 696            
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
              add     rsp            , 696            
              ret                                     
;----------------------------------]
                                                      
