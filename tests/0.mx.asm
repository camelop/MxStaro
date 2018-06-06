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
_data_s2:
              db      `gzotpa`                        
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
_datainit_inexplicit_return_void:
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__add ] ---
;[----------------------------------
_text__add:
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
              mov     rbp            , qword [rsp+48] ; load->v6; null; save->v8
              mov     r10            , rbp            ; load->v8
              mov     r11            , qword [rsp+56] ; load->v7
              add     r10            , r11            
              mov     rbp            , r10            ; save->v8
              mov     rbx            , 233            ; null; save->v9
              mov     r12            , rdx            ; null; save->v11
              mov     r13            , rax            ; null; save->v12
              mov     rax            , rbp            ; load->v8; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v9
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v9
              cqo                                     
              mov     r10            , rbx            ; load->v9
              idiv    r10d                            
              mov     rbx            , r10            ; save->v9
              mov     rbp            , rdx            ; null; save->v10
              mov     rdx            , r12            ; load->v11; null
              mov     rax            , r13            ; load->v12; null
_text__add_ret0:
              mov     rax            , rbp            ; load->v10; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 72             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__dp ] ---
;[----------------------------------
_text__dp:
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
_text__dp_if0_init:
              mov     rbp            , 1              ; null; save->v7
_text__dp_if0_check:
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r11            , rbp            ; load->v7
              cmp     r10d           , r11d           
              mov     qword [rsp+48] , r10            ; save->v6
              jg      _text__dp_if0_else                 
;----------------------------------]
;[----------------------------------
_text__dp_if0_start:
              mov     rbp            , 36             ; null; save->v8
              mov     qword [rsp+56] , rbp            ; load->v8; init->tmp; save->v9
_text__dp_ret0:
              mov     rax            , qword [rsp+56] ; load->v9; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 88             
              ret                                     
;----------------------------------]
;[----------------------------------
_text__dp_if0_else:
_text__dp_if0_end:
              mov     rbp            , 0              ; null; save->v10
              mov     qword [rsp+64] , rbp            ; load->v10; init->sum; save->v11
_text__dp_for0_init:
              mov     rbp            , 2              ; null; save->v13
              mov     qword [rsp+72] , rbp            ; load->v13; assign->i; save->v12
              mov     r10            , qword [rsp+72] ; load->v12
              mov     r11            , qword [rsp+48] ; load->v6
              cmp     r10d           , r11d           
              mov     qword [rsp+72] , r10            ; save->v12
              mov     r10            , rbp            ; load->v14
              setle   r10b                            
              mov     rbp            , r10            ; save->v14; load->v14
              and     r10            , 255            
              mov     rbp            , r10            ; save->v14
_text__dp_for0_init_check:
              mov     r10            , rbp            ; load->v14
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v14
              je      _text__dp_for0_end                 
;----------------------------------]
;[----------------------------------
_text__dp_for0_start:
_text__dp_if1_init:
              mov     rbp            , qword [rsp+48] ; load->v6; null; save->v15
              mov     r10            , rbp            ; load->v15
              mov     r11            , qword [rsp+72] ; load->v12
              xor     r10            , r11            
              mov     rbp            , r10            ; save->v15; load->v15
              and     r10            , -1             
              mov     rbp            , r10            ; save->v15
_text__dp_if1_check:
              mov     r10            , rbp            ; load->v15
              mov     r11            , qword [rsp+48] ; load->v6
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v15
              jge     _text__dp_if1_else                 
;----------------------------------]
;[----------------------------------
_text__dp_if1_start:
              mov     rbp            , qword [rsp+48] ; load->v6; null; save->v16
              mov     r10            , rbp            ; load->v16
              mov     r11            , qword [rsp+72] ; load->v12
              xor     r10            , r11            
              mov     rbp            , r10            ; save->v16; load->v16
              and     r10            , -1             
              mov     rbp            , r10            ; save->v16
_text__dp_call0:
              mov     rdi            , rbp            ; load->v16; null
              call    _text__dp                       
              mov     rbp            , rax            ; null; save->v17
              mov     rbx            , qword [rsp+64] ; load->v11; null; save->v18
              mov     r10            , rbx            ; load->v18
              mov     r11            , rbp            ; load->v17
              add     r10            , r11            
              mov     rbx            , r10            ; save->v18
              mov     rbp            , 233            ; null; save->v19
              mov     r12            , rdx            ; null; save->v21
              mov     r13            , rax            ; null; save->v22
              mov     rax            , rbx            ; load->v18; null
              and     rax            , -1             
              mov     r10            , rbp            ; load->v19
              and     r10d           , -1             
              mov     rbp            , r10            ; save->v19
              cqo                                     
              mov     r10            , rbp            ; load->v19
              idiv    r10d                            
              mov     rbp            , rdx            ; save->v19; null; save->v20
              mov     rdx            , r12            ; load->v21; null
              mov     rax            , r13            ; load->v22; null
              mov     qword [rsp+64] , rbp            ; load->v20; assign->sum; save->v11
              jmp     _text__dp_if1_end                 
;----------------------------------]
;[----------------------------------
_text__dp_if1_else:
_text__dp_if1_end:
_text__dp_for0_continue:
              mov     rbp            , qword [rsp+72] ; load->v12; null; save->v23
              mov     rbp            , qword [rsp+72] ; load->v12; null; save->v24
              mov     r10            , rbp            ; load->v24
              add     r10            , 1              
              mov     rbp            , r10            ; save->v24
              mov     qword [rsp+72] , rbp            ; load->v24; assign->i; save->v12
              mov     r10            , qword [rsp+72] ; load->v12
              mov     r11            , qword [rsp+48] ; load->v6
              cmp     r10d           , r11d           
              mov     qword [rsp+72] , r10            ; save->v12
              jle     _text__dp_for0_start                 
;----------------------------------]
;[----------------------------------
_text__dp_for0_end:
_text__dp_ret1:
              mov     rax            , qword [rsp+64] ; load->v11; null
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
              sub     rsp            , 72             
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
              mov     rbp            , rax            ; null; save->v7
              mov     qword [rsp+56] , rbp            ; load->v7; init->n; save->v8
_text__main_for0_init:
              mov     rbp            , 1              ; null; save->v9
              mov     qword [rsp+48] , rbp            ; load->v9; assign->i; save->v6
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r11            , qword [rsp+56] ; load->v8
              cmp     r10d           , r11d           
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , rbp            ; load->v10
              setle   r10b                            
              mov     rbp            , r10            ; save->v10; load->v10
              and     r10            , 255            
              mov     rbp            , r10            ; save->v10
_text__main_for0_init_check:
              mov     r10            , rbp            ; load->v10
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v10
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
_text__main_call1:
              mov     rdi            , qword [rsp+48] ; load->v6; null
              call    _text__dp                       
              mov     rbp            , rax            ; null; save->v11
_text__main_call2:
              mov     rdi            , rbp            ; load->v11; null
              call    _text__toString                 
              mov     rbp            , rax            ; null; save->v12
_text__main_call3:
              mov     rdi            , rbp            ; load->v12; null
              call    _text__print                    
              mov     rbp            , _data_s2       ; null; save->v13; null; save->v14
_text__main_call4:
              mov     rdi            , rbp            ; load->v14; null
              call    _text__println                  
              mov     rbp            , rax            ; null; save->v15
_text__main_for0_continue:
              mov     rbp            , qword [rsp+48] ; load->v6; null; save->v16
              mov     rbp            , qword [rsp+48] ; load->v6; null; save->v17
              mov     r10            , rbp            ; load->v17
              add     r10            , 1              
              mov     rbp            , r10            ; save->v17
              mov     qword [rsp+48] , rbp            ; load->v17; assign->i; save->v6
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r11            , qword [rsp+56] ; load->v8
              cmp     r10d           , r11d           
              mov     qword [rsp+48] , r10            ; save->v6
              jle     _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
              mov     rbp            , 0              ; null; save->v18
_text__main_ret0:
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
                                                      
