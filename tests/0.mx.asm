              global  main                            
              extern  strlen                          
              extern  malloc                          
              extern  strncpy                         
              extern  strtol                          
              extern  printf                          
              extern  scanf                           
              extern  sprintf                         

              section .data                           
_data_s1:     db      '%s\n'         , 0              
_data_s0:     db      '%s'           , 0              

              section .bss                            

              section .text                           
_text_built_in_string_length:
              call    strlen                          
              ret                                     
                                                      
_text_built_in_string_substring:
              push    rbp                             
              push    rbx                             
              push    r12                             
              mov     r12            , rdi            
              mov     rbp            , rdx            
              mov     rbx            , rsi            
              sub     rbp            , rbx            
              add     rbp            , 1              
              mov     rdi            , rbp            
              call    malloc                          
              mov     rdi            , rax            
              mov     rsi            , r12            
              add     rsi            , rbx            
              mov     rdx            , rbp            
              mov     r12            , rax            
              call    strncpy                         
              add     qword [r12+rbp], ' '            
              pop     r12                             
              pop     rbx                             
              pop     rbp                             
              ret                                     
                                                      
_text_built_in_string_parseInt:
              push    rbp                             
              mov     rbp            , rdi            
              mov     rdi            , 8              
              call    malloc                          
              mov     rdi            , rbp            
              mov     rsi            , rax            
              mov     rdx            , 10             
              call    strtol                          
              pop     rbp                             
              ret                                     
                                                      
_text_built_in_string_ord:
              mov     rax            , qword [rdi+rsi]
              ret                                     
                                                      
_text_built_in_array_size:
              mov     rax            , qword [rdi]    
              ret                                     
                                                      
_text__printf:
              xor     rax            , rax            
              call    printf                          
              ret                                     
                                                      
_text__getString:
_text__getString_format:
              db      '%s'           , 0              
              push    rbp                             
              mov     rdi            , 1024           
              call    malloc                          
              mov     rbp            , rax            
              mov     rdi            , _text__getString_format
              mov     rsi            , rax            
              xor     rdx            , rdx            
              call    scanf                           
              mov     rax            , rbp            
              pop     rbp                             
              ret                                     
                                                      
_text__getInt:
_text__getInt_format:
              db      '%lld'         , 0              
              push    rbp                             
              mov     rdi            , 8              
              call    malloc                          
              mov     rbp            , rax            
              mov     rdi            , _text__getInt_format
              mov     rsi            , rax            
              xor     rdx            , rdx            
              call    scanf                           
              mov     rax            , qword [rbp]    
              pop     rbp                             
              ret                                     
                                                      
_text__toString:
_text__toString_format:
              db      '%d'           , 0              
              push    rbp                             
              mov     rdx            , rdi            
              mov     rdi            , 1024           
              call    malloc                          
              mov     rbp            , rax            
              mov     rdi            , rax            
              mov     rsi            , _text__toString_format
              xor     rcx            , rcx            
              call    sprintf                         
              mov     rax            , rbp            
              pop     rbp                             
              ret                                     
                                                      
; --- [ _text__print ] ---
;[----------------------------------
_text__print:
              sub     rsp            , 96             
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
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r12            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r14            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , r15            
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r11            , qword [rsp+56] ; load->v7
              mov     rdi            , r11            
              mov     qword [rsp+56] , r11            ; save->v7
              mov     r11            , qword [rsp]    ; load->v0
              mov     rsi            , r11            
              mov     qword [rsp]    , r11            ; save->v0
              call    _text__printf                   
              mov     r11            , qword [rsp+64] ; load->v8
              mov     rax            , r11            
              mov     qword [rsp+64] , r11            ; save->v8
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbx            , r11            
              mov     qword [rsp+16] , r11            ; save->v2
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbp            , r11            
              mov     qword [rsp+8]  , r11            ; save->v1
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     qword [rsp+72] , r11            ; save->v9
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r12            , r11            
              mov     qword [rsp+24] , r11            ; save->v3
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r14            , r11            
              mov     qword [rsp+40] , r11            ; save->v5
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r15            , r11            
              mov     qword [rsp+48] , r11            ; save->v6
_text__print_inexplicit_return_void:
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbp            , r11            
              mov     qword [rsp+8]  , r11            ; save->v1
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbx            , r11            
              mov     qword [rsp+16] , r11            ; save->v2
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r12            , r11            
              mov     qword [rsp+24] , r11            ; save->v3
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r14            , r11            
              mov     qword [rsp+40] , r11            ; save->v5
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r15            , r11            
              mov     qword [rsp+48] , r11            ; save->v6
              add     rsp            , 96             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__println ] ---
;[----------------------------------
_text__println:
              sub     rsp            , 96             
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
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r12            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r14            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , r15            
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r11            , qword [rsp+56] ; load->v7
              mov     rdi            , r11            
              mov     qword [rsp+56] , r11            ; save->v7
              mov     r11            , qword [rsp]    ; load->v0
              mov     rsi            , r11            
              mov     qword [rsp]    , r11            ; save->v0
              call    _text__printf                   
              mov     r11            , qword [rsp+64] ; load->v8
              mov     rax            , r11            
              mov     qword [rsp+64] , r11            ; save->v8
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbx            , r11            
              mov     qword [rsp+16] , r11            ; save->v2
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbp            , r11            
              mov     qword [rsp+8]  , r11            ; save->v1
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     qword [rsp+72] , r11            ; save->v9
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r12            , r11            
              mov     qword [rsp+24] , r11            ; save->v3
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r14            , r11            
              mov     qword [rsp+40] , r11            ; save->v5
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r15            , r11            
              mov     qword [rsp+48] , r11            ; save->v6
_text__println_inexplicit_return_void:
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbp            , r11            
              mov     qword [rsp+8]  , r11            ; save->v1
              mov     r11            , qword [rsp+16] ; load->v2
              mov     rbx            , r11            
              mov     qword [rsp+16] , r11            ; save->v2
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r12            , r11            
              mov     qword [rsp+24] , r11            ; save->v3
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r14            , r11            
              mov     qword [rsp+40] , r11            ; save->v5
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r15            , r11            
              mov     qword [rsp+48] , r11            ; save->v6
              add     rsp            , 96             
              ret                                     
;----------------------------------]
                                                      
; --- [ _datainit ] ---
;[----------------------------------
_datainit:
              sub     rsp            , 48             
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
_datainit_inexplicit_return_void:
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     qword [rsp]    , r11            ; save->v0
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     qword [rsp+24] , r11            ; save->v3
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     qword [rsp+40] , r11            ; save->v5
              add     rsp            , 48             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 152            
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
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , 5              
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+48] ; load->v6
              mov     r10            , r11            ; init->n
              mov     qword [rsp+48] , r11            ; save->v6
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , 0              
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+64] ; load->v8
              mov     r10            , r11            ; init->sum
              mov     qword [rsp+64] , r11            ; save->v8
              mov     qword [rsp+72] , r10            ; save->v9
_text__main_for0_init:
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r10            , 1              
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+104]; load->v13
              mov     r11            , qword [rsp+96] ; load->v12
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+96] , r11            ; save->v12
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+104]; load->v13
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10            , r11            
              mov     qword [rsp+56] , r11            ; save->v7
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+112]; load->v14
              xor     r10b           , r11b           
              mov     qword [rsp+112], r11            ; save->v14
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+112]; load->v14
              setbe   r10b                            
              mov     qword [rsp+112], r10            ; save->v14
_text__main_for0_init_check:
              mov     r10            , qword [rsp+112]; load->v14
              cmp     r10            , 0              
              mov     qword [rsp+112], r10            ; save->v14
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
_text__main_for1_init:
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r10            , 1              
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+120]; load->v15
              xor     r10b           , r11b           
              mov     qword [rsp+120], r11            ; save->v15
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+120]; load->v15
              setbe   r10b                            
              mov     qword [rsp+120], r10            ; save->v15
_text__main_for1_init_check:
              mov     r10            , qword [rsp+120]; load->v15
              cmp     r10            , 0              
              mov     qword [rsp+120], r10            ; save->v15
              je      _text__main_for1_end                 
;----------------------------------]
;[----------------------------------
_text__main_for1_start:
              mov     r10            , qword [rsp+128]; load->v16
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     qword [rsp+72] , r11            ; save->v9
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+128]; load->v16
              mov     r11            , qword [rsp+104]; load->v13
              add     r10            , r11            
              mov     qword [rsp+104], r11            ; save->v13
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+128]; load->v16
              mov     r10            , r11            ; assign->sum
              mov     qword [rsp+128], r11            ; save->v16
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+136]; load->v17
              mov     r11            , qword [rsp+136]; load->v17
              xor     r10b           , r11b           
              mov     qword [rsp+136], r11            ; save->v17
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+136]; load->v17
              setbe   r10b                            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+136]; load->v17
              cmp     r10            , 0              
              mov     qword [rsp+136], r10            ; save->v17
              jne     _text__main_for1_start                 
;----------------------------------]
;[----------------------------------
_text__main_for1_end:
              mov     r10            , qword [rsp+104]; load->v13
              add     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+104]; load->v13
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10            , r11            
              mov     qword [rsp+56] , r11            ; save->v7
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+144]; load->v18
              mov     r11            , qword [rsp+144]; load->v18
              xor     r10b           , r11b           
              mov     qword [rsp+144], r11            ; save->v18
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+144]; load->v18
              setbe   r10b                            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+144]; load->v18
              cmp     r10            , 0              
              mov     qword [rsp+144], r10            ; save->v18
              jne     _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
_text__main_ret0:
              mov     r11            , qword [rsp+72] ; load->v9
              mov     rax            , r11            
              mov     qword [rsp+72] , r11            ; save->v9
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     qword [rsp]    , r11            ; save->v0
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     qword [rsp+8]  , r11            ; save->v1
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     qword [rsp+16] , r11            ; save->v2
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     qword [rsp+24] , r11            ; save->v3
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     qword [rsp+40] , r11            ; save->v5
              add     rsp            , 152            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__main_inexplicit_return_void:
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     qword [rsp]    , r11            ; save->v0
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     qword [rsp+8]  , r11            ; save->v1
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     qword [rsp+16] , r11            ; save->v2
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     qword [rsp+24] , r11            ; save->v3
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     qword [rsp+40] , r11            ; save->v5
              add     rsp            , 152            
              ret                                     
;----------------------------------]
                                                      
