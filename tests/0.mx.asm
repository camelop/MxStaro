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
_data_s3:
              db      `gzotpa`                        
              db      0                               
_data_s2:
              db      `A's `                          
              db      0                               
_data_s0:
              db      `%s`                            
              db      0                               

              section .bss                            

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
              sub     rsp            , 56             
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
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text_A_print ] ---
;[----------------------------------
_text_A_print:
              sub     rsp            , 136            
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
              mov     r10            , _data_s2       
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , rax            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , rbx            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , rbp            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , r10            
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r10            , r11            
              mov     qword [rsp+88] , r10            ; save->v11
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
              mov     r11            , qword [rsp+64] ; load->v8
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r10            , rax            
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rdi            , r11            
              call    strlen                          
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , rax            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+104]; load->v13
              mov     r11            , qword [rsp+96] ; load->v12
              add     r10            , r11            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+104]; load->v13
              add     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r11            , qword [rsp+104]; load->v13
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+112]; load->v14
              mov     r10            , rax            
              mov     qword [rsp+112], r10            ; save->v14
              mov     rdi            , rax            
              mov     r11            , qword [rsp+64] ; load->v8
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+112]; load->v14
              mov     rdi            , r11            
              mov     r11            , qword [rsp+96] ; load->v12
              add     rdi            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rsi            , r11            
              call    strcpy                          
              mov     r11            , qword [rsp+72] ; load->v9
              mov     rax            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbp            , r11            
              mov     r11            , qword [rsp+80] ; load->v10
              mov     r10            , r11            
              mov     r11            , qword [rsp+88] ; load->v11
              mov     r11            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r12            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r13            , r11            
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r14            , r11            
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r15            , r11            
_text_A_print_call0:
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , rax            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , rbx            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , rbp            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , r10            
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r10            , r11            
              mov     qword [rsp+88] , r10            ; save->v11
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
              mov     r11            , qword [rsp+112]; load->v14
              mov     rdi            , r11            
              call    _text__println                  
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , rax            
              mov     qword [rsp+120], r10            ; save->v15
              mov     r11            , qword [rsp+72] ; load->v9
              mov     rax            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbp            , r11            
              mov     r11            , qword [rsp+80] ; load->v10
              mov     r10            , r11            
              mov     r11            , qword [rsp+88] ; load->v11
              mov     r11            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r12            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r13            , r11            
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r14            , r11            
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r15            , r11            
_text_A_print_inexplicit_return_void:
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
              add     rsp            , 136            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text_A_try_print ] ---
;[----------------------------------
_text_A_try_print:
              sub     rsp            , 104            
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
_text_A_try_print_call0:
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , rax            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , rbx            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , rbp            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , r10            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v10
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
              mov     r11            , qword [rsp]    ; load->v0
              mov     rdi            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rsi            , r11            
              call    _text_A_print                   
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r10            , rax            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r11            , qword [rsp+64] ; load->v8
              mov     rax            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     rbx            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbp            , r11            
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     r11            , qword [rsp+80] ; load->v10
              mov     r11            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r12            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r13            , r11            
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r14            , r11            
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r15            , r11            
_text_A_try_print_inexplicit_return_void:
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
              add     rsp            , 104            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 136            
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
              mov     r10            , 1              
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+56] ; load->v7
              imul    r10            , 0              
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
              mov     r11            , qword [rsp+88] ; load->v11
              mov     r10            , r11            ; init->a
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , _data_s3       
              mov     qword [rsp+104], r10            ; save->v13
_text__main_call0:
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
              mov     r11            , qword [rsp+96] ; load->v12
              mov     rdi            , r11            
              mov     r11            , qword [rsp+104]; load->v13
              mov     rsi            , r11            
              call    _text_A_try_print                 
              mov     r10            , qword [rsp+112]; load->v14
              mov     r10            , rax            
              mov     qword [rsp+112], r10            ; save->v14
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
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , 0              
              mov     qword [rsp+120], r10            ; save->v15
_text__main_ret0:
              mov     r11            , qword [rsp+120]; load->v15
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
              add     rsp            , 136            
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
              add     rsp            , 136            
              ret                                     
;----------------------------------]
                                                      
