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
              db      `A`                             
              db      0                               
_data_s1:
              db      `%s\n`                          
              db      0                               
_data_s3:
              db      `B`                             
              db      0                               
_data_s4:
              db      `C`                             
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
              sub     rsp            , 72             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbx            , rdi            ; load->v6; null; save->v6
              mov     r12            , _data_s0       ; load->v7; null; save->v7
_text__print_call0:
              mov     rdi            , r12            ; load->v7; null
              mov     rsi            , rbx            ; load->v6; null
              call    _text__printf                   
              mov     rbx            , rax            ; load->v8; null; save->v8
_text__print_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 72             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__println ] ---
;[----------------------------------
_text__println:
              sub     rsp            , 72             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbx            , rdi            ; load->v6; null; save->v6
              mov     r12            , _data_s1       ; load->v7; null; save->v7
_text__println_call0:
              mov     rdi            , r12            ; load->v7; null
              mov     rsi            , rbx            ; load->v6; null
              call    _text__printf                   
              mov     rbx            , rax            ; load->v8; null; save->v8
_text__println_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 72             
              ret                                     
;----------------------------------]
                                                      
; --- [ _datainit ] ---
;[----------------------------------
_datainit:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
_datainit_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__cd ] ---
;[----------------------------------
_text__cd:
              sub     rsp            , 200            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     qword [rsp+48] , rdi            ; load->v6; null; save->v6
              mov     r12            , rsi            ; load->v7; null; save->v7
              mov     r13            , rdx            ; load->v8; null; save->v8
              mov     r14            , rcx            ; load->v9; null; save->v9
              mov     r15            , r8             ; load->v10; null; save->v10
_text__cd_if0_init:
              mov     rbx            , 1              ; load->v11; null; save->v11
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r11            , rbx            ; load->v11
              cmp     r10d           , r11d           
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r10            , rbx            ; load->v12
              sete    r10b                            
              mov     rbx            , r10            ; save->v12; load->v12
              and     r10            , 255            
              mov     rbx            , r10            ; save->v12
_text__cd_if0_check:
              mov     r10            , rbx            ; load->v12
              cmp     r10b           , 0              
              mov     rbx            , r10            ; save->v12
              je      _text__cd_if0_else                 
;----------------------------------]
;[----------------------------------
_text__cd_if0_start:
              mov     r10            , rbx            ; load->v13
              mov     rbx            , 1              ; load->v10; null; save->v13; load->v14; null; save->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     qword [rsp+120], r15            ; load->v10; null; save->v15
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , rbx            ; load->v14
              add     r10            , r11            
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , r15            ; load->v10
              mov     r15            , qword [rsp+120]; load->v15; assign->sum; save->v10
              jmp     _text__cd_if0_end                 
;----------------------------------]
;[----------------------------------
_text__cd_if0_else:
              mov     rbx            , 1              ; load->v16; null; save->v16
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , qword [rsp+48] ; load->v6; null
              mov     qword [rsp+136], r10            ; save->v17; load->v17
              mov     r11            , rbx            ; load->v16
              sub     r10            , r11            
              mov     qword [rsp+136], r10            ; save->v17
_text__cd_call0:
              mov     rdi            , qword [rsp+136]; load->v17; null
              mov     rsi            , r12            ; load->v7; null
              mov     rdx            , r14            ; load->v9; null
              mov     rcx            , r13            ; load->v8; null
              mov     r8             , r15            ; load->v10; null
              call    _text__cd                       
              mov     rbx            , rax            ; load->v18; null; save->v18
              mov     r10            , r15            ; load->v10
              mov     r15            , rbx            ; load->v18; assign->sum; save->v10
              mov     rbx            , 1              ; load->v19; null; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r10            , qword [rsp+48] ; load->v6; null
              mov     qword [rsp+160], r10            ; save->v20; load->v20
              mov     r11            , rbx            ; load->v19
              sub     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
_text__cd_call1:
              mov     rdi            , qword [rsp+160]; load->v20; null
              mov     rsi            , r13            ; load->v8; null
              mov     rdx            , r12            ; load->v7; null
              mov     rcx            , r14            ; load->v9; null
              mov     r8             , r15            ; load->v10; null
              call    _text__cd                       
              mov     rbx            , rax            ; load->v21; null; save->v21
              mov     r10            , r15            ; load->v10
              mov     r15            , rbx            ; load->v21; assign->sum; save->v10
              mov     r10            , rbx            ; load->v22
              mov     rbx            , 1              ; load->v10; null; save->v22; load->v23; null; save->v23
              mov     r10            , r12            ; load->v24
              mov     r12            , r15            ; load->v10; null; save->v24
              mov     r10            , r12            ; load->v24
              mov     r11            , rbx            ; load->v23
              add     r10            , r11            
              mov     r12            , r10            ; save->v24
              mov     r10            , r15            ; load->v10
              mov     r15            , r12            ; load->v24; assign->sum; save->v10
_text__cd_if0_end:
_text__cd_ret0:
              mov     rax            , r15            ; load->v10; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 200            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__cd_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 200            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 168            
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
              mov     rbx            , _data_s2       ; load->v6; null; save->v6
              mov     r10            , r12            ; load->v7
              mov     r12            , rbx            ; load->v6; init->a; save->v7
              mov     rbx            , _data_s3       ; load->v8; null; save->v8
              mov     r10            , r13            ; load->v9
              mov     r13            , rbx            ; load->v8; init->b; save->v9
              mov     rbx            , _data_s4       ; load->v10; null; save->v10
              mov     r10            , r14            ; load->v11
              mov     r14            , rbx            ; load->v10; init->c; save->v11
_text__main_call0:
              call    _text__getInt                   
              mov     rbx            , rax            ; load->v12; null; save->v12
              mov     r10            , r15            ; load->v13
              mov     r15            , rbx            ; load->v12; init->d; save->v13
              mov     rbx            , 0              ; load->v14; null; save->v14
_text__main_call1:
              mov     rdi            , r15            ; load->v13; null
              mov     rsi            , r12            ; load->v7; null
              mov     rdx            , r13            ; load->v9; null
              mov     rcx            , r14            ; load->v11; null
              mov     r8             , rbx            ; load->v14; null
              call    _text__cd                       
              mov     rbx            , rax            ; load->v15; null; save->v15
              mov     r10            , r12            ; load->v16
              mov     r12            , rbx            ; load->v15; init->sum; save->v16
_text__main_call2:
              mov     rdi            , r12            ; load->v16; null
              call    _text__toString                 
              mov     rbx            , rax            ; load->v17; null; save->v17
_text__main_call3:
              mov     rdi            , rbx            ; load->v17; null
              call    _text__println                  
              mov     rbx            , 0              ; load->v18; null; save->v18; load->v19; null; save->v19
_text__main_ret0:
              mov     rax            , rbx            ; load->v19; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 168            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__main_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 168            
              ret                                     
;----------------------------------]
                                                      
