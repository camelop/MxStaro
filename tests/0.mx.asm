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
              db      `too young too simple.`                 
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
              mov     qword [rsp]    , rbp            
              mov     qword [rsp+8]  , rbx            
              mov     qword [rsp+16] , r12            
              mov     qword [rsp+24] , r13            
              mov     qword [rsp+32] , r14            
              mov     qword [rsp+40] , r15            
              mov     qword [rsp+48] , rdi            
              mov     qword [rsp+56] , _data_s0       
_text__print_call0:
              mov     qword [rsp+64] , rax            
              mov     qword [rsp+8]  , rbx            
              mov     qword [rsp]    , rbp            
              mov     qword [rsp+16] , r12            
              mov     qword [rsp+24] , r13            
              mov     qword [rsp+32] , r14            
              mov     qword [rsp+40] , r15            
              mov     rdi            , qword [rsp+56] ; load->v7
              mov     rsi            , qword [rsp+48] ; load->v6
              call    _text__printf                   
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     rbp            , qword [rsp]    ; load->v0
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
_text__print_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 104            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__println ] ---
;[----------------------------------
_text__println:
              sub     rsp            , 104            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            
              mov     qword [rsp+8]  , rbx            
              mov     qword [rsp+16] , r12            
              mov     qword [rsp+24] , r13            
              mov     qword [rsp+32] , r14            
              mov     qword [rsp+40] , r15            
              mov     qword [rsp+48] , rdi            
              mov     qword [rsp+56] , _data_s1       
_text__println_call0:
              mov     qword [rsp+64] , rax            
              mov     qword [rsp+8]  , rbx            
              mov     qword [rsp]    , rbp            
              mov     qword [rsp+16] , r12            
              mov     qword [rsp+24] , r13            
              mov     qword [rsp+32] , r14            
              mov     qword [rsp+40] , r15            
              mov     rdi            , qword [rsp+56] ; load->v7
              mov     rsi            , qword [rsp+48] ; load->v6
              call    _text__printf                   
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     rbp            , qword [rsp]    ; load->v0
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
_text__println_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 104            
              ret                                     
;----------------------------------]
                                                      
; --- [ _datainit ] ---
;[----------------------------------
_datainit:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            
              mov     qword [rsp+8]  , rbx            
              mov     qword [rsp+16] , r12            
              mov     qword [rsp+24] , r13            
              mov     qword [rsp+32] , r14            
              mov     qword [rsp+40] , r15            
_datainit_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 104            
;----------------------------------]
;[----------------------------------
_text__main_built_in_call_data_init:
              call    _datainit                       ; protocol required, built_in
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            
              mov     qword [rsp+8]  , rbx            
              mov     qword [rsp+16] , r12            
              mov     qword [rsp+24] , r13            
              mov     qword [rsp+32] , r14            
              mov     qword [rsp+40] , r15            
              mov     qword [rsp+48] , _data_s2       
_text__main_call0:
              mov     qword [rsp+56] , rax            
              mov     qword [rsp+8]  , rbx            
              mov     qword [rsp]    , rbp            
              mov     qword [rsp+16] , r12            
              mov     qword [rsp+24] , r13            
              mov     qword [rsp+32] , r14            
              mov     qword [rsp+40] , r15            
              mov     rdi            , qword [rsp+48] ; load->v6
              call    _text__println                  
              mov     rax            , qword [rsp+56] ; load->v7
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     rbp            , qword [rsp]    ; load->v0
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              mov     qword [rsp+88] , 123            
_text__main_ret0:
              mov     rax            , qword [rsp+88] ; load->v11
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 104            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__main_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 104            
              ret                                     
;----------------------------------]
                                                      
