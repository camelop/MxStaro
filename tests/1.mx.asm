              global  main                            
              extern  strlen                          
              extern  malloc                          
              extern  strncpy                         
              extern  strtol                          
              extern  printf                          
              extern  scanf                           
              extern  sprintf                         

              section .data                           
_data_s1:
              db      '%s'                            
              db      10                              
              db      0                               
_data_s2:
              db      'too young too simple.'                 
              db      0                               
_data_s0:
              db      '%s'                            
              db      0                               

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
              sub     rsp            , 96             
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
              mov     r10            , _data_s2       
              mov     qword [rsp+48] , r10            ; save->v6
_text__main_call0:
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , rax            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , r10            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+16] ; load->v2
              mov     r10            , r12            
              mov     qword [rsp+16] , r10            ; save->v2
              mov     r10            , qword [rsp+24] ; load->v3
              mov     r10            , r13            
              mov     qword [rsp+24] , r10            ; save->v3
              mov     r10            , qword [rsp+40] ; load->v5
              mov     r10            , r15            
              mov     qword [rsp+40] , r10            ; save->v5
              mov     r11            , qword [rsp+48] ; load->v6
              mov     rdi            , r11            
              mov     qword [rsp+48] , r11            ; save->v6
              call    _text__println                  
              mov     r11            , qword [rsp+56] ; load->v7
              mov     rax            , r11            
              mov     qword [rsp+56] , r11            ; save->v7
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     qword [rsp+8]  , r11            ; save->v1
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     qword [rsp]    , r11            ; save->v0
              mov     r11            , qword [rsp+64] ; load->v8
              mov     r10            , r11            
              mov     qword [rsp+64] , r11            ; save->v8
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r11            , r11            
              mov     qword [rsp+72] , r11            ; save->v9
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     qword [rsp+16] , r11            ; save->v2
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     qword [rsp+24] , r11            ; save->v3
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     qword [rsp+40] , r11            ; save->v5
_text__main_ret0:
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
              add     rsp            , 96             
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
              add     rsp            , 96             
              ret                                     
;----------------------------------]
                                                      
