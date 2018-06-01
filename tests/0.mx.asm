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
              sub     rsp            , 152            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     qword [rsp+48] , rdi            ; load->v6
              mov     qword [rsp+56] , _data_s0       ; load->v7
_text__print_call0:
              mov     rdi            , qword [rsp+56] ; load->v7
              mov     rsi            , qword [rsp+48] ; load->v6
_text__print_saveReg0_save:
              mov     qword [rsp+64] , rax            ; load->v8
              mov     qword [rsp+72] , rdi            ; load->v9
              mov     qword [rsp+80] , rsi            ; load->v10
              mov     qword [rsp+88] , rdx            ; load->v11
              mov     qword [rsp+96] , rcx            ; load->v12
              mov     qword [rsp+104], r8             ; load->v13
              mov     qword [rsp+112], r9             ; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     qword [rsp+128], r11            ; load->v16
              call    _text__printf                   
              mov     qword [rsp+136], rax            ; load->v17
_text__print_saveReg0_load:
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rdi            , qword [rsp+72] ; load->v9
              mov     rsi            , qword [rsp+80] ; load->v10
              mov     rdx            , qword [rsp+88] ; load->v11
              mov     rcx            , qword [rsp+96] ; load->v12
              mov     r8             , qword [rsp+104]; load->v13
              mov     r9             , qword [rsp+112]; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+128]; load->v16
_text__print_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 152            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__println ] ---
;[----------------------------------
_text__println:
              sub     rsp            , 152            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     qword [rsp+48] , rdi            ; load->v6
              mov     qword [rsp+56] , _data_s1       ; load->v7
_text__println_call0:
              mov     rdi            , qword [rsp+56] ; load->v7
              mov     rsi            , qword [rsp+48] ; load->v6
_text__println_saveReg0_save:
              mov     qword [rsp+64] , rax            ; load->v8
              mov     qword [rsp+72] , rdi            ; load->v9
              mov     qword [rsp+80] , rsi            ; load->v10
              mov     qword [rsp+88] , rdx            ; load->v11
              mov     qword [rsp+96] , rcx            ; load->v12
              mov     qword [rsp+104], r8             ; load->v13
              mov     qword [rsp+112], r9             ; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     qword [rsp+128], r11            ; load->v16
              call    _text__printf                   
              mov     qword [rsp+136], rax            ; load->v17
_text__println_saveReg0_load:
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rdi            , qword [rsp+72] ; load->v9
              mov     rsi            , qword [rsp+80] ; load->v10
              mov     rdx            , qword [rsp+88] ; load->v11
              mov     rcx            , qword [rsp+96] ; load->v12
              mov     r8             , qword [rsp+104]; load->v13
              mov     r9             , qword [rsp+112]; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+128]; load->v16
_text__println_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 152            
              ret                                     
;----------------------------------]
                                                      
; --- [ _datainit ] ---
;[----------------------------------
_datainit:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
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
              sub     rsp            , 264            
;----------------------------------]
;[----------------------------------
_text__main_built_in_call_data_init:
              call    _datainit                       ; protocol required, built_in
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     qword [rsp+48] , 1500           ; load->v6
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , qword [rsp+48] ; load->v6
              mov     qword [rsp+56] , r10            ; save->v7
              neg     r10                             
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , qword [rsp+56] ; load->v7
              mov     qword [rsp+64] , r10            ; save->v8
              mov     qword [rsp+72] , 4              ; load->v9
              mov     qword [rsp+88] , rcx            ; load->v11
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , qword [rsp+64] ; load->v8
              mov     qword [rsp+80] , r10            ; save->v10
              mov     rcx            , qword [rsp+72] ; load->v9
              mov     r10            , qword [rsp+80] ; load->v10
              and     r10            , -1             
              mov     qword [rsp+80] , r10            ; save->v10
              sar     r10d           , cl             
              mov     qword [rsp+80] , r10            ; save->v10
              mov     rcx            , qword [rsp+88] ; load->v11
_text__main_call0:
              mov     rdi            , qword [rsp+80] ; load->v10
_text__main_saveReg0_save:
              mov     qword [rsp+96] , rax            ; load->v12
              mov     qword [rsp+104], rdi            ; load->v13
              mov     qword [rsp+112], rsi            ; load->v14
              mov     qword [rsp+120], rdx            ; load->v15
              mov     qword [rsp+128], rcx            ; load->v16
              mov     qword [rsp+136], r8             ; load->v17
              mov     qword [rsp+144], r9             ; load->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     qword [rsp+160], r11            ; load->v20
              call    _text__toString                 
              mov     qword [rsp+168], rax            ; load->v21
_text__main_saveReg0_load:
              mov     rax            , qword [rsp+96] ; load->v12
              mov     rdi            , qword [rsp+104]; load->v13
              mov     rsi            , qword [rsp+112]; load->v14
              mov     rdx            , qword [rsp+120]; load->v15
              mov     rcx            , qword [rsp+128]; load->v16
              mov     r8             , qword [rsp+136]; load->v17
              mov     r9             , qword [rsp+144]; load->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r11            , qword [rsp+160]; load->v20
_text__main_call1:
              mov     rdi            , qword [rsp+168]; load->v21
_text__main_saveReg1_save:
              mov     qword [rsp+176], rax            ; load->v22
              mov     qword [rsp+184], rdi            ; load->v23
              mov     qword [rsp+192], rsi            ; load->v24
              mov     qword [rsp+200], rdx            ; load->v25
              mov     qword [rsp+208], rcx            ; load->v26
              mov     qword [rsp+216], r8             ; load->v27
              mov     qword [rsp+224], r9             ; load->v28
              mov     r10            , qword [rsp+232]; load->v29
              mov     qword [rsp+240], r11            ; load->v30
              call    _text__println                  
              mov     qword [rsp+248], rax            ; load->v31
_text__main_saveReg1_load:
              mov     rax            , qword [rsp+176]; load->v22
              mov     rdi            , qword [rsp+184]; load->v23
              mov     rsi            , qword [rsp+192]; load->v24
              mov     rdx            , qword [rsp+200]; load->v25
              mov     rcx            , qword [rsp+208]; load->v26
              mov     r8             , qword [rsp+216]; load->v27
              mov     r9             , qword [rsp+224]; load->v28
              mov     r10            , qword [rsp+232]; load->v29
              mov     r11            , qword [rsp+240]; load->v30
              mov     qword [rsp+256], 123            ; load->v32
_text__main_ret0:
              mov     rax            , qword [rsp+256]; load->v32
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 264            
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
              add     rsp            , 264            
              ret                                     
;----------------------------------]
                                                      
