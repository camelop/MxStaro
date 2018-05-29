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
_data_s1:
              db      `%s\n`                          
              db      0                               
_data_s0:
              db      `%s`                            
              db      0                               

              section .bss                            
_data_bss_N:
              resb    8                               
_data_bss_h:
              resb    8                               
_data_bss_i:
              resb    8                               
_data_bss_j:
              resb    8                               
_data_bss_k:
              resb    8                               
_data_bss_total:
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
              sub     rsp            , 88             
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
              mov     r10            , 99             
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r11            , qword [rsp+48] ; load->v6
              mov     [_data_bss_h]  , r11            
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r10            , 100            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r11            , qword [rsp+56] ; load->v7
              mov     [_data_bss_i]  , r11            
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , 101            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r11            , qword [rsp+64] ; load->v8
              mov     [_data_bss_j]  , r11            
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r10            , 102            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r11            , qword [rsp+72] ; load->v9
              mov     [_data_bss_k]  , r11            
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , 0              
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r11            , qword [rsp+80] ; load->v10
              mov     [_data_bss_total], r11            
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
              add     rsp            , 88             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 1320           
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
              mov     r10            , qword [rsp+96] ; load->v12
              mov     r10            , 6              
              mov     qword [rsp+96] , r10            ; save->v12
              mov     r11            , qword [rsp+96] ; load->v12
              mov     [_data_bss_N]  , r11            
_text__main_for0_init:
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+104]; load->v13
              mov     r10            , r11            ; assign->a
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+120]; load->v15
              cmp     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+128]; load->v16
              setle   r10b                            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+128]; load->v16
              and     r10            , 15             
              mov     qword [rsp+128], r10            ; save->v16
_text__main_for0_init_check:
              mov     r10            , qword [rsp+128]; load->v16
              cmp     r10b           , 0              
              mov     qword [rsp+128], r10            ; save->v16
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
_text__main_for1_init:
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+104]; load->v13
              mov     r10            , r11            ; assign->b
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+136]; load->v17
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+144]; load->v18
              setle   r10b                            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+144]; load->v18
              and     r10            , 15             
              mov     qword [rsp+144], r10            ; save->v18
_text__main_for1_init_check:
              mov     r10            , qword [rsp+144]; load->v18
              cmp     r10b           , 0              
              mov     qword [rsp+144], r10            ; save->v18
              je      _text__main_for1_end                 
;----------------------------------]
;[----------------------------------
_text__main_for1_start:
_text__main_for2_init:
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+104]; load->v13
              mov     r10            , r11            ; assign->c
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+152]; load->v19
              cmp     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+160]; load->v20
              setle   r10b                            
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+160]; load->v20
              and     r10            , 15             
              mov     qword [rsp+160], r10            ; save->v20
_text__main_for2_init_check:
              mov     r10            , qword [rsp+160]; load->v20
              cmp     r10b           , 0              
              mov     qword [rsp+160], r10            ; save->v20
              je      _text__main_for2_end                 
;----------------------------------]
;[----------------------------------
_text__main_for2_start:
_text__main_for3_init:
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+104]; load->v13
              mov     r10            , r11            ; assign->d
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+168]; load->v21
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+168]; load->v21
              cmp     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+176]; load->v22
              setle   r10b                            
              mov     qword [rsp+176], r10            ; save->v22
              mov     r10            , qword [rsp+176]; load->v22
              and     r10            , 15             
              mov     qword [rsp+176], r10            ; save->v22
_text__main_for3_init_check:
              mov     r10            , qword [rsp+176]; load->v22
              cmp     r10b           , 0              
              mov     qword [rsp+176], r10            ; save->v22
              je      _text__main_for3_end                 
;----------------------------------]
;[----------------------------------
_text__main_for3_start:
_text__main_for4_init:
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r11            , qword [rsp+104]; load->v13
              mov     r10            , r11            ; assign->e
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+184]; load->v23
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r11            , qword [rsp+184]; load->v23
              cmp     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+192]; load->v24
              setle   r10b                            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+192]; load->v24
              and     r10            , 15             
              mov     qword [rsp+192], r10            ; save->v24
_text__main_for4_init_check:
              mov     r10            , qword [rsp+192]; load->v24
              cmp     r10b           , 0              
              mov     qword [rsp+192], r10            ; save->v24
              je      _text__main_for4_end                 
;----------------------------------]
;[----------------------------------
_text__main_for4_start:
_text__main_for5_init:
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r11            , qword [rsp+104]; load->v13
              mov     r10            , r11            ; assign->f
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+200]; load->v25
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r11            , qword [rsp+200]; load->v25
              cmp     r10            , r11            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+208]; load->v26
              setle   r10b                            
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+208]; load->v26
              and     r10            , 15             
              mov     qword [rsp+208], r10            ; save->v26
_text__main_for5_init_check:
              mov     r10            , qword [rsp+208]; load->v26
              cmp     r10b           , 0              
              mov     qword [rsp+208], r10            ; save->v26
              je      _text__main_for5_end                 
;----------------------------------]
;[----------------------------------
_text__main_for5_start:
_text__main_if0_init:
_text__main_and0_lvalue:
              mov     r10            , qword [rsp+216]; load->v27
              mov     r10            , 0              
              mov     qword [rsp+216], r10            ; save->v27
_text__main_and1_lvalue:
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , 0              
              mov     qword [rsp+224], r10            ; save->v28
_text__main_and2_lvalue:
              mov     r10            , qword [rsp+232]; load->v29
              mov     r10            , 0              
              mov     qword [rsp+232], r10            ; save->v29
_text__main_and3_lvalue:
              mov     r10            , qword [rsp+240]; load->v30
              mov     r10            , 0              
              mov     qword [rsp+240], r10            ; save->v30
_text__main_and4_lvalue:
              mov     r10            , qword [rsp+248]; load->v31
              mov     r10            , 0              
              mov     qword [rsp+248], r10            ; save->v31
_text__main_and5_lvalue:
              mov     r10            , qword [rsp+256]; load->v32
              mov     r10            , 0              
              mov     qword [rsp+256], r10            ; save->v32
_text__main_and6_lvalue:
              mov     r10            , qword [rsp+264]; load->v33
              mov     r10            , 0              
              mov     qword [rsp+264], r10            ; save->v33
_text__main_and7_lvalue:
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , 0              
              mov     qword [rsp+272], r10            ; save->v34
_text__main_and8_lvalue:
              mov     r10            , qword [rsp+280]; load->v35
              mov     r10            , 0              
              mov     qword [rsp+280], r10            ; save->v35
_text__main_and9_lvalue:
              mov     r10            , qword [rsp+288]; load->v36
              mov     r10            , 0              
              mov     qword [rsp+288], r10            ; save->v36
_text__main_and10_lvalue:
              mov     r10            , qword [rsp+296]; load->v37
              mov     r10            , 0              
              mov     qword [rsp+296], r10            ; save->v37
_text__main_and11_lvalue:
              mov     r10            , qword [rsp+304]; load->v38
              mov     r10            , 0              
              mov     qword [rsp+304], r10            ; save->v38
_text__main_and12_lvalue:
              mov     r10            , qword [rsp+312]; load->v39
              mov     r10            , 0              
              mov     qword [rsp+312], r10            ; save->v39
_text__main_and13_lvalue:
              mov     r10            , qword [rsp+320]; load->v40
              mov     r10            , 0              
              mov     qword [rsp+320], r10            ; save->v40
_text__main_and14_lvalue:
              mov     r10            , qword [rsp+328]; load->v41
              mov     r10            , 0              
              mov     qword [rsp+328], r10            ; save->v41
_text__main_and15_lvalue:
              mov     r10            , qword [rsp+336]; load->v42
              mov     r10            , 0              
              mov     qword [rsp+336], r10            ; save->v42
_text__main_and16_lvalue:
              mov     r10            , qword [rsp+344]; load->v43
              mov     r10            , 0              
              mov     qword [rsp+344], r10            ; save->v43
_text__main_and17_lvalue:
              mov     r10            , qword [rsp+352]; load->v44
              mov     r10            , 0              
              mov     qword [rsp+352], r10            ; save->v44
_text__main_and18_lvalue:
              mov     r10            , qword [rsp+360]; load->v45
              mov     r10            , 0              
              mov     qword [rsp+360], r10            ; save->v45
_text__main_and19_lvalue:
              mov     r10            , qword [rsp+368]; load->v46
              mov     r10            , 0              
              mov     qword [rsp+368], r10            ; save->v46
_text__main_and20_lvalue:
              mov     r10            , qword [rsp+376]; load->v47
              mov     r10            , 0              
              mov     qword [rsp+376], r10            ; save->v47
_text__main_and21_lvalue:
              mov     r10            , qword [rsp+384]; load->v48
              mov     r10            , 0              
              mov     qword [rsp+384], r10            ; save->v48
_text__main_and22_lvalue:
              mov     r10            , qword [rsp+392]; load->v49
              mov     r10            , 0              
              mov     qword [rsp+392], r10            ; save->v49
_text__main_and23_lvalue:
              mov     r10            , qword [rsp+400]; load->v50
              mov     r10            , 0              
              mov     qword [rsp+400], r10            ; save->v50
_text__main_and24_lvalue:
              mov     r10            , qword [rsp+408]; load->v51
              mov     r10            , 0              
              mov     qword [rsp+408], r10            ; save->v51
_text__main_and25_lvalue:
              mov     r10            , qword [rsp+416]; load->v52
              mov     r10            , 0              
              mov     qword [rsp+416], r10            ; save->v52
_text__main_and26_lvalue:
              mov     r10            , qword [rsp+424]; load->v53
              mov     r10            , 0              
              mov     qword [rsp+424], r10            ; save->v53
_text__main_and27_lvalue:
              mov     r10            , qword [rsp+432]; load->v54
              mov     r10            , 0              
              mov     qword [rsp+432], r10            ; save->v54
_text__main_and28_lvalue:
              mov     r10            , qword [rsp+440]; load->v55
              mov     r10            , 0              
              mov     qword [rsp+440], r10            ; save->v55
_text__main_and29_lvalue:
              mov     r10            , qword [rsp+448]; load->v56
              mov     r10            , 0              
              mov     qword [rsp+448], r10            ; save->v56
_text__main_and30_lvalue:
              mov     r10            , qword [rsp+456]; load->v57
              mov     r10            , 0              
              mov     qword [rsp+456], r10            ; save->v57
_text__main_and31_lvalue:
              mov     r10            , qword [rsp+464]; load->v58
              mov     r10            , 0              
              mov     qword [rsp+464], r10            ; save->v58
_text__main_and32_lvalue:
              mov     r10            , qword [rsp+472]; load->v59
              mov     r10            , 0              
              mov     qword [rsp+472], r10            ; save->v59
_text__main_and33_lvalue:
              mov     r10            , qword [rsp+480]; load->v60
              mov     r10            , 0              
              mov     qword [rsp+480], r10            ; save->v60
_text__main_and34_lvalue:
              mov     r10            , qword [rsp+488]; load->v61
              mov     r10            , 0              
              mov     qword [rsp+488], r10            ; save->v61
_text__main_and35_lvalue:
              mov     r10            , qword [rsp+496]; load->v62
              mov     r10            , 0              
              mov     qword [rsp+496], r10            ; save->v62
_text__main_and36_lvalue:
              mov     r10            , qword [rsp+504]; load->v63
              mov     r10            , 0              
              mov     qword [rsp+504], r10            ; save->v63
_text__main_and37_lvalue:
              mov     r10            , qword [rsp+512]; load->v64
              mov     r10            , 0              
              mov     qword [rsp+512], r10            ; save->v64
_text__main_and38_lvalue:
              mov     r10            , qword [rsp+520]; load->v65
              mov     r10            , 0              
              mov     qword [rsp+520], r10            ; save->v65
_text__main_and39_lvalue:
              mov     r10            , qword [rsp+528]; load->v66
              mov     r10            , 0              
              mov     qword [rsp+528], r10            ; save->v66
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+536]; load->v67
              setne   r10b                            
              mov     qword [rsp+536], r10            ; save->v67
              mov     r10            , qword [rsp+536]; load->v67
              and     r10            , 15             
              mov     qword [rsp+536], r10            ; save->v67
              mov     r10            , qword [rsp+536]; load->v67
              cmp     r10            , 0              
              mov     qword [rsp+536], r10            ; save->v67
              je      _text__main_and39_end                 
;----------------------------------]
;[----------------------------------
_text__main_and39_rvalue:
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+64] ; load->v8
              cmp     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+544]; load->v68
              setne   r10b                            
              mov     qword [rsp+544], r10            ; save->v68
              mov     r10            , qword [rsp+544]; load->v68
              and     r10            , 15             
              mov     qword [rsp+544], r10            ; save->v68
              mov     r10            , qword [rsp+544]; load->v68
              cmp     r10            , 0              
              mov     qword [rsp+544], r10            ; save->v68
              je      _text__main_and39_end                 
              mov     r10            , qword [rsp+528]; load->v66
              mov     r10            , 255            
              mov     qword [rsp+528], r10            ; save->v66
_text__main_and39_end:
              mov     r10            , qword [rsp+528]; load->v66
              cmp     r10            , 0              
              mov     qword [rsp+528], r10            ; save->v66
              je      _text__main_and38_end                 
;----------------------------------]
;[----------------------------------
_text__main_and38_rvalue:
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+72] ; load->v9
              cmp     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+552]; load->v69
              setne   r10b                            
              mov     qword [rsp+552], r10            ; save->v69
              mov     r10            , qword [rsp+552]; load->v69
              and     r10            , 15             
              mov     qword [rsp+552], r10            ; save->v69
              mov     r10            , qword [rsp+552]; load->v69
              cmp     r10            , 0              
              mov     qword [rsp+552], r10            ; save->v69
              je      _text__main_and38_end                 
              mov     r10            , qword [rsp+520]; load->v65
              mov     r10            , 255            
              mov     qword [rsp+520], r10            ; save->v65
_text__main_and38_end:
              mov     r10            , qword [rsp+520]; load->v65
              cmp     r10            , 0              
              mov     qword [rsp+520], r10            ; save->v65
              je      _text__main_and37_end                 
;----------------------------------]
;[----------------------------------
_text__main_and37_rvalue:
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+80] ; load->v10
              cmp     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+560]; load->v70
              setne   r10b                            
              mov     qword [rsp+560], r10            ; save->v70
              mov     r10            , qword [rsp+560]; load->v70
              and     r10            , 15             
              mov     qword [rsp+560], r10            ; save->v70
              mov     r10            , qword [rsp+560]; load->v70
              cmp     r10            , 0              
              mov     qword [rsp+560], r10            ; save->v70
              je      _text__main_and37_end                 
              mov     r10            , qword [rsp+512]; load->v64
              mov     r10            , 255            
              mov     qword [rsp+512], r10            ; save->v64
_text__main_and37_end:
              mov     r10            , qword [rsp+512]; load->v64
              cmp     r10            , 0              
              mov     qword [rsp+512], r10            ; save->v64
              je      _text__main_and36_end                 
;----------------------------------]
;[----------------------------------
_text__main_and36_rvalue:
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+88] ; load->v11
              cmp     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+568]; load->v71
              setne   r10b                            
              mov     qword [rsp+568], r10            ; save->v71
              mov     r10            , qword [rsp+568]; load->v71
              and     r10            , 15             
              mov     qword [rsp+568], r10            ; save->v71
              mov     r10            , qword [rsp+568]; load->v71
              cmp     r10            , 0              
              mov     qword [rsp+568], r10            ; save->v71
              je      _text__main_and36_end                 
              mov     r10            , qword [rsp+504]; load->v63
              mov     r10            , 255            
              mov     qword [rsp+504], r10            ; save->v63
_text__main_and36_end:
              mov     r10            , qword [rsp+504]; load->v63
              cmp     r10            , 0              
              mov     qword [rsp+504], r10            ; save->v63
              je      _text__main_and35_end                 
;----------------------------------]
;[----------------------------------
_text__main_and35_rvalue:
              mov     r10            , qword [rsp+576]; load->v72
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+576], r10            ; save->v72
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+576]; load->v72
              cmp     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+584]; load->v73
              setne   r10b                            
              mov     qword [rsp+584], r10            ; save->v73
              mov     r10            , qword [rsp+584]; load->v73
              and     r10            , 15             
              mov     qword [rsp+584], r10            ; save->v73
              mov     r10            , qword [rsp+584]; load->v73
              cmp     r10            , 0              
              mov     qword [rsp+584], r10            ; save->v73
              je      _text__main_and35_end                 
              mov     r10            , qword [rsp+496]; load->v62
              mov     r10            , 255            
              mov     qword [rsp+496], r10            ; save->v62
_text__main_and35_end:
              mov     r10            , qword [rsp+496]; load->v62
              cmp     r10            , 0              
              mov     qword [rsp+496], r10            ; save->v62
              je      _text__main_and34_end                 
;----------------------------------]
;[----------------------------------
_text__main_and34_rvalue:
              mov     r10            , qword [rsp+592]; load->v74
              mov     r10            , [_data_bss_i]  
              mov     qword [rsp+592], r10            ; save->v74
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+592]; load->v74
              cmp     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+600]; load->v75
              setne   r10b                            
              mov     qword [rsp+600], r10            ; save->v75
              mov     r10            , qword [rsp+600]; load->v75
              and     r10            , 15             
              mov     qword [rsp+600], r10            ; save->v75
              mov     r10            , qword [rsp+600]; load->v75
              cmp     r10            , 0              
              mov     qword [rsp+600], r10            ; save->v75
              je      _text__main_and34_end                 
              mov     r10            , qword [rsp+488]; load->v61
              mov     r10            , 255            
              mov     qword [rsp+488], r10            ; save->v61
_text__main_and34_end:
              mov     r10            , qword [rsp+488]; load->v61
              cmp     r10            , 0              
              mov     qword [rsp+488], r10            ; save->v61
              je      _text__main_and33_end                 
;----------------------------------]
;[----------------------------------
_text__main_and33_rvalue:
              mov     r10            , qword [rsp+608]; load->v76
              mov     r10            , [_data_bss_j]  
              mov     qword [rsp+608], r10            ; save->v76
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+608]; load->v76
              cmp     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+616]; load->v77
              setne   r10b                            
              mov     qword [rsp+616], r10            ; save->v77
              mov     r10            , qword [rsp+616]; load->v77
              and     r10            , 15             
              mov     qword [rsp+616], r10            ; save->v77
              mov     r10            , qword [rsp+616]; load->v77
              cmp     r10            , 0              
              mov     qword [rsp+616], r10            ; save->v77
              je      _text__main_and33_end                 
              mov     r10            , qword [rsp+480]; load->v60
              mov     r10            , 255            
              mov     qword [rsp+480], r10            ; save->v60
_text__main_and33_end:
              mov     r10            , qword [rsp+480]; load->v60
              cmp     r10            , 0              
              mov     qword [rsp+480], r10            ; save->v60
              je      _text__main_and32_end                 
;----------------------------------]
;[----------------------------------
_text__main_and32_rvalue:
              mov     r10            , qword [rsp+624]; load->v78
              mov     r10            , [_data_bss_k]  
              mov     qword [rsp+624], r10            ; save->v78
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+624]; load->v78
              cmp     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+632]; load->v79
              setne   r10b                            
              mov     qword [rsp+632], r10            ; save->v79
              mov     r10            , qword [rsp+632]; load->v79
              and     r10            , 15             
              mov     qword [rsp+632], r10            ; save->v79
              mov     r10            , qword [rsp+632]; load->v79
              cmp     r10            , 0              
              mov     qword [rsp+632], r10            ; save->v79
              je      _text__main_and32_end                 
              mov     r10            , qword [rsp+472]; load->v59
              mov     r10            , 255            
              mov     qword [rsp+472], r10            ; save->v59
_text__main_and32_end:
              mov     r10            , qword [rsp+472]; load->v59
              cmp     r10            , 0              
              mov     qword [rsp+472], r10            ; save->v59
              je      _text__main_and31_end                 
;----------------------------------]
;[----------------------------------
_text__main_and31_rvalue:
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+64] ; load->v8
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+640]; load->v80
              setne   r10b                            
              mov     qword [rsp+640], r10            ; save->v80
              mov     r10            , qword [rsp+640]; load->v80
              and     r10            , 15             
              mov     qword [rsp+640], r10            ; save->v80
              mov     r10            , qword [rsp+640]; load->v80
              cmp     r10            , 0              
              mov     qword [rsp+640], r10            ; save->v80
              je      _text__main_and31_end                 
              mov     r10            , qword [rsp+464]; load->v58
              mov     r10            , 255            
              mov     qword [rsp+464], r10            ; save->v58
_text__main_and31_end:
              mov     r10            , qword [rsp+464]; load->v58
              cmp     r10            , 0              
              mov     qword [rsp+464], r10            ; save->v58
              je      _text__main_and30_end                 
;----------------------------------]
;[----------------------------------
_text__main_and30_rvalue:
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+72] ; load->v9
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+648]; load->v81
              setne   r10b                            
              mov     qword [rsp+648], r10            ; save->v81
              mov     r10            , qword [rsp+648]; load->v81
              and     r10            , 15             
              mov     qword [rsp+648], r10            ; save->v81
              mov     r10            , qword [rsp+648]; load->v81
              cmp     r10            , 0              
              mov     qword [rsp+648], r10            ; save->v81
              je      _text__main_and30_end                 
              mov     r10            , qword [rsp+456]; load->v57
              mov     r10            , 255            
              mov     qword [rsp+456], r10            ; save->v57
_text__main_and30_end:
              mov     r10            , qword [rsp+456]; load->v57
              cmp     r10            , 0              
              mov     qword [rsp+456], r10            ; save->v57
              je      _text__main_and29_end                 
;----------------------------------]
;[----------------------------------
_text__main_and29_rvalue:
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+80] ; load->v10
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+656]; load->v82
              setne   r10b                            
              mov     qword [rsp+656], r10            ; save->v82
              mov     r10            , qword [rsp+656]; load->v82
              and     r10            , 15             
              mov     qword [rsp+656], r10            ; save->v82
              mov     r10            , qword [rsp+656]; load->v82
              cmp     r10            , 0              
              mov     qword [rsp+656], r10            ; save->v82
              je      _text__main_and29_end                 
              mov     r10            , qword [rsp+448]; load->v56
              mov     r10            , 255            
              mov     qword [rsp+448], r10            ; save->v56
_text__main_and29_end:
              mov     r10            , qword [rsp+448]; load->v56
              cmp     r10            , 0              
              mov     qword [rsp+448], r10            ; save->v56
              je      _text__main_and28_end                 
;----------------------------------]
;[----------------------------------
_text__main_and28_rvalue:
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+88] ; load->v11
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+664]; load->v83
              setne   r10b                            
              mov     qword [rsp+664], r10            ; save->v83
              mov     r10            , qword [rsp+664]; load->v83
              and     r10            , 15             
              mov     qword [rsp+664], r10            ; save->v83
              mov     r10            , qword [rsp+664]; load->v83
              cmp     r10            , 0              
              mov     qword [rsp+664], r10            ; save->v83
              je      _text__main_and28_end                 
              mov     r10            , qword [rsp+440]; load->v55
              mov     r10            , 255            
              mov     qword [rsp+440], r10            ; save->v55
_text__main_and28_end:
              mov     r10            , qword [rsp+440]; load->v55
              cmp     r10            , 0              
              mov     qword [rsp+440], r10            ; save->v55
              je      _text__main_and27_end                 
;----------------------------------]
;[----------------------------------
_text__main_and27_rvalue:
              mov     r10            , qword [rsp+672]; load->v84
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+672], r10            ; save->v84
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+672]; load->v84
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+680]; load->v85
              setne   r10b                            
              mov     qword [rsp+680], r10            ; save->v85
              mov     r10            , qword [rsp+680]; load->v85
              and     r10            , 15             
              mov     qword [rsp+680], r10            ; save->v85
              mov     r10            , qword [rsp+680]; load->v85
              cmp     r10            , 0              
              mov     qword [rsp+680], r10            ; save->v85
              je      _text__main_and27_end                 
              mov     r10            , qword [rsp+432]; load->v54
              mov     r10            , 255            
              mov     qword [rsp+432], r10            ; save->v54
_text__main_and27_end:
              mov     r10            , qword [rsp+432]; load->v54
              cmp     r10            , 0              
              mov     qword [rsp+432], r10            ; save->v54
              je      _text__main_and26_end                 
;----------------------------------]
;[----------------------------------
_text__main_and26_rvalue:
              mov     r10            , qword [rsp+688]; load->v86
              mov     r10            , [_data_bss_i]  
              mov     qword [rsp+688], r10            ; save->v86
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+688]; load->v86
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+696]; load->v87
              setne   r10b                            
              mov     qword [rsp+696], r10            ; save->v87
              mov     r10            , qword [rsp+696]; load->v87
              and     r10            , 15             
              mov     qword [rsp+696], r10            ; save->v87
              mov     r10            , qword [rsp+696]; load->v87
              cmp     r10            , 0              
              mov     qword [rsp+696], r10            ; save->v87
              je      _text__main_and26_end                 
              mov     r10            , qword [rsp+424]; load->v53
              mov     r10            , 255            
              mov     qword [rsp+424], r10            ; save->v53
_text__main_and26_end:
              mov     r10            , qword [rsp+424]; load->v53
              cmp     r10            , 0              
              mov     qword [rsp+424], r10            ; save->v53
              je      _text__main_and25_end                 
;----------------------------------]
;[----------------------------------
_text__main_and25_rvalue:
              mov     r10            , qword [rsp+704]; load->v88
              mov     r10            , [_data_bss_j]  
              mov     qword [rsp+704], r10            ; save->v88
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+704]; load->v88
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+712]; load->v89
              setne   r10b                            
              mov     qword [rsp+712], r10            ; save->v89
              mov     r10            , qword [rsp+712]; load->v89
              and     r10            , 15             
              mov     qword [rsp+712], r10            ; save->v89
              mov     r10            , qword [rsp+712]; load->v89
              cmp     r10            , 0              
              mov     qword [rsp+712], r10            ; save->v89
              je      _text__main_and25_end                 
              mov     r10            , qword [rsp+416]; load->v52
              mov     r10            , 255            
              mov     qword [rsp+416], r10            ; save->v52
_text__main_and25_end:
              mov     r10            , qword [rsp+416]; load->v52
              cmp     r10            , 0              
              mov     qword [rsp+416], r10            ; save->v52
              je      _text__main_and24_end                 
;----------------------------------]
;[----------------------------------
_text__main_and24_rvalue:
              mov     r10            , qword [rsp+720]; load->v90
              mov     r10            , [_data_bss_k]  
              mov     qword [rsp+720], r10            ; save->v90
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+720]; load->v90
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+728]; load->v91
              setne   r10b                            
              mov     qword [rsp+728], r10            ; save->v91
              mov     r10            , qword [rsp+728]; load->v91
              and     r10            , 15             
              mov     qword [rsp+728], r10            ; save->v91
              mov     r10            , qword [rsp+728]; load->v91
              cmp     r10            , 0              
              mov     qword [rsp+728], r10            ; save->v91
              je      _text__main_and24_end                 
              mov     r10            , qword [rsp+408]; load->v51
              mov     r10            , 255            
              mov     qword [rsp+408], r10            ; save->v51
_text__main_and24_end:
              mov     r10            , qword [rsp+408]; load->v51
              cmp     r10            , 0              
              mov     qword [rsp+408], r10            ; save->v51
              je      _text__main_and23_end                 
;----------------------------------]
;[----------------------------------
_text__main_and23_rvalue:
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+72] ; load->v9
              cmp     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+736]; load->v92
              setne   r10b                            
              mov     qword [rsp+736], r10            ; save->v92
              mov     r10            , qword [rsp+736]; load->v92
              and     r10            , 15             
              mov     qword [rsp+736], r10            ; save->v92
              mov     r10            , qword [rsp+736]; load->v92
              cmp     r10            , 0              
              mov     qword [rsp+736], r10            ; save->v92
              je      _text__main_and23_end                 
              mov     r10            , qword [rsp+400]; load->v50
              mov     r10            , 255            
              mov     qword [rsp+400], r10            ; save->v50
_text__main_and23_end:
              mov     r10            , qword [rsp+400]; load->v50
              cmp     r10            , 0              
              mov     qword [rsp+400], r10            ; save->v50
              je      _text__main_and22_end                 
;----------------------------------]
;[----------------------------------
_text__main_and22_rvalue:
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+80] ; load->v10
              cmp     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+744]; load->v93
              setne   r10b                            
              mov     qword [rsp+744], r10            ; save->v93
              mov     r10            , qword [rsp+744]; load->v93
              and     r10            , 15             
              mov     qword [rsp+744], r10            ; save->v93
              mov     r10            , qword [rsp+744]; load->v93
              cmp     r10            , 0              
              mov     qword [rsp+744], r10            ; save->v93
              je      _text__main_and22_end                 
              mov     r10            , qword [rsp+392]; load->v49
              mov     r10            , 255            
              mov     qword [rsp+392], r10            ; save->v49
_text__main_and22_end:
              mov     r10            , qword [rsp+392]; load->v49
              cmp     r10            , 0              
              mov     qword [rsp+392], r10            ; save->v49
              je      _text__main_and21_end                 
;----------------------------------]
;[----------------------------------
_text__main_and21_rvalue:
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+88] ; load->v11
              cmp     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+752]; load->v94
              setne   r10b                            
              mov     qword [rsp+752], r10            ; save->v94
              mov     r10            , qword [rsp+752]; load->v94
              and     r10            , 15             
              mov     qword [rsp+752], r10            ; save->v94
              mov     r10            , qword [rsp+752]; load->v94
              cmp     r10            , 0              
              mov     qword [rsp+752], r10            ; save->v94
              je      _text__main_and21_end                 
              mov     r10            , qword [rsp+384]; load->v48
              mov     r10            , 255            
              mov     qword [rsp+384], r10            ; save->v48
_text__main_and21_end:
              mov     r10            , qword [rsp+384]; load->v48
              cmp     r10            , 0              
              mov     qword [rsp+384], r10            ; save->v48
              je      _text__main_and20_end                 
;----------------------------------]
;[----------------------------------
_text__main_and20_rvalue:
              mov     r10            , qword [rsp+760]; load->v95
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+760], r10            ; save->v95
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+760]; load->v95
              cmp     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+768]; load->v96
              setne   r10b                            
              mov     qword [rsp+768], r10            ; save->v96
              mov     r10            , qword [rsp+768]; load->v96
              and     r10            , 15             
              mov     qword [rsp+768], r10            ; save->v96
              mov     r10            , qword [rsp+768]; load->v96
              cmp     r10            , 0              
              mov     qword [rsp+768], r10            ; save->v96
              je      _text__main_and20_end                 
              mov     r10            , qword [rsp+376]; load->v47
              mov     r10            , 255            
              mov     qword [rsp+376], r10            ; save->v47
_text__main_and20_end:
              mov     r10            , qword [rsp+376]; load->v47
              cmp     r10            , 0              
              mov     qword [rsp+376], r10            ; save->v47
              je      _text__main_and19_end                 
;----------------------------------]
;[----------------------------------
_text__main_and19_rvalue:
              mov     r10            , qword [rsp+776]; load->v97
              mov     r10            , [_data_bss_i]  
              mov     qword [rsp+776], r10            ; save->v97
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+776]; load->v97
              cmp     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+784]; load->v98
              setne   r10b                            
              mov     qword [rsp+784], r10            ; save->v98
              mov     r10            , qword [rsp+784]; load->v98
              and     r10            , 15             
              mov     qword [rsp+784], r10            ; save->v98
              mov     r10            , qword [rsp+784]; load->v98
              cmp     r10            , 0              
              mov     qword [rsp+784], r10            ; save->v98
              je      _text__main_and19_end                 
              mov     r10            , qword [rsp+368]; load->v46
              mov     r10            , 255            
              mov     qword [rsp+368], r10            ; save->v46
_text__main_and19_end:
              mov     r10            , qword [rsp+368]; load->v46
              cmp     r10            , 0              
              mov     qword [rsp+368], r10            ; save->v46
              je      _text__main_and18_end                 
;----------------------------------]
;[----------------------------------
_text__main_and18_rvalue:
              mov     r10            , qword [rsp+792]; load->v99
              mov     r10            , [_data_bss_j]  
              mov     qword [rsp+792], r10            ; save->v99
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+792]; load->v99
              cmp     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+800]; load->v100
              setne   r10b                            
              mov     qword [rsp+800], r10            ; save->v100
              mov     r10            , qword [rsp+800]; load->v100
              and     r10            , 15             
              mov     qword [rsp+800], r10            ; save->v100
              mov     r10            , qword [rsp+800]; load->v100
              cmp     r10            , 0              
              mov     qword [rsp+800], r10            ; save->v100
              je      _text__main_and18_end                 
              mov     r10            , qword [rsp+360]; load->v45
              mov     r10            , 255            
              mov     qword [rsp+360], r10            ; save->v45
_text__main_and18_end:
              mov     r10            , qword [rsp+360]; load->v45
              cmp     r10            , 0              
              mov     qword [rsp+360], r10            ; save->v45
              je      _text__main_and17_end                 
;----------------------------------]
;[----------------------------------
_text__main_and17_rvalue:
              mov     r10            , qword [rsp+808]; load->v101
              mov     r10            , [_data_bss_k]  
              mov     qword [rsp+808], r10            ; save->v101
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+808]; load->v101
              cmp     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+816]; load->v102
              setne   r10b                            
              mov     qword [rsp+816], r10            ; save->v102
              mov     r10            , qword [rsp+816]; load->v102
              and     r10            , 15             
              mov     qword [rsp+816], r10            ; save->v102
              mov     r10            , qword [rsp+816]; load->v102
              cmp     r10            , 0              
              mov     qword [rsp+816], r10            ; save->v102
              je      _text__main_and17_end                 
              mov     r10            , qword [rsp+352]; load->v44
              mov     r10            , 255            
              mov     qword [rsp+352], r10            ; save->v44
_text__main_and17_end:
              mov     r10            , qword [rsp+352]; load->v44
              cmp     r10            , 0              
              mov     qword [rsp+352], r10            ; save->v44
              je      _text__main_and16_end                 
;----------------------------------]
;[----------------------------------
_text__main_and16_rvalue:
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+80] ; load->v10
              cmp     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+824]; load->v103
              setne   r10b                            
              mov     qword [rsp+824], r10            ; save->v103
              mov     r10            , qword [rsp+824]; load->v103
              and     r10            , 15             
              mov     qword [rsp+824], r10            ; save->v103
              mov     r10            , qword [rsp+824]; load->v103
              cmp     r10            , 0              
              mov     qword [rsp+824], r10            ; save->v103
              je      _text__main_and16_end                 
              mov     r10            , qword [rsp+344]; load->v43
              mov     r10            , 255            
              mov     qword [rsp+344], r10            ; save->v43
_text__main_and16_end:
              mov     r10            , qword [rsp+344]; load->v43
              cmp     r10            , 0              
              mov     qword [rsp+344], r10            ; save->v43
              je      _text__main_and15_end                 
;----------------------------------]
;[----------------------------------
_text__main_and15_rvalue:
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+88] ; load->v11
              cmp     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+832]; load->v104
              setne   r10b                            
              mov     qword [rsp+832], r10            ; save->v104
              mov     r10            , qword [rsp+832]; load->v104
              and     r10            , 15             
              mov     qword [rsp+832], r10            ; save->v104
              mov     r10            , qword [rsp+832]; load->v104
              cmp     r10            , 0              
              mov     qword [rsp+832], r10            ; save->v104
              je      _text__main_and15_end                 
              mov     r10            , qword [rsp+336]; load->v42
              mov     r10            , 255            
              mov     qword [rsp+336], r10            ; save->v42
_text__main_and15_end:
              mov     r10            , qword [rsp+336]; load->v42
              cmp     r10            , 0              
              mov     qword [rsp+336], r10            ; save->v42
              je      _text__main_and14_end                 
;----------------------------------]
;[----------------------------------
_text__main_and14_rvalue:
              mov     r10            , qword [rsp+840]; load->v105
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+840], r10            ; save->v105
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+840]; load->v105
              cmp     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+848]; load->v106
              setne   r10b                            
              mov     qword [rsp+848], r10            ; save->v106
              mov     r10            , qword [rsp+848]; load->v106
              and     r10            , 15             
              mov     qword [rsp+848], r10            ; save->v106
              mov     r10            , qword [rsp+848]; load->v106
              cmp     r10            , 0              
              mov     qword [rsp+848], r10            ; save->v106
              je      _text__main_and14_end                 
              mov     r10            , qword [rsp+328]; load->v41
              mov     r10            , 255            
              mov     qword [rsp+328], r10            ; save->v41
_text__main_and14_end:
              mov     r10            , qword [rsp+328]; load->v41
              cmp     r10            , 0              
              mov     qword [rsp+328], r10            ; save->v41
              je      _text__main_and13_end                 
;----------------------------------]
;[----------------------------------
_text__main_and13_rvalue:
              mov     r10            , qword [rsp+856]; load->v107
              mov     r10            , [_data_bss_i]  
              mov     qword [rsp+856], r10            ; save->v107
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+856]; load->v107
              cmp     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+864]; load->v108
              setne   r10b                            
              mov     qword [rsp+864], r10            ; save->v108
              mov     r10            , qword [rsp+864]; load->v108
              and     r10            , 15             
              mov     qword [rsp+864], r10            ; save->v108
              mov     r10            , qword [rsp+864]; load->v108
              cmp     r10            , 0              
              mov     qword [rsp+864], r10            ; save->v108
              je      _text__main_and13_end                 
              mov     r10            , qword [rsp+320]; load->v40
              mov     r10            , 255            
              mov     qword [rsp+320], r10            ; save->v40
_text__main_and13_end:
              mov     r10            , qword [rsp+320]; load->v40
              cmp     r10            , 0              
              mov     qword [rsp+320], r10            ; save->v40
              je      _text__main_and12_end                 
;----------------------------------]
;[----------------------------------
_text__main_and12_rvalue:
              mov     r10            , qword [rsp+872]; load->v109
              mov     r10            , [_data_bss_j]  
              mov     qword [rsp+872], r10            ; save->v109
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+872]; load->v109
              cmp     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+880]; load->v110
              setne   r10b                            
              mov     qword [rsp+880], r10            ; save->v110
              mov     r10            , qword [rsp+880]; load->v110
              and     r10            , 15             
              mov     qword [rsp+880], r10            ; save->v110
              mov     r10            , qword [rsp+880]; load->v110
              cmp     r10            , 0              
              mov     qword [rsp+880], r10            ; save->v110
              je      _text__main_and12_end                 
              mov     r10            , qword [rsp+312]; load->v39
              mov     r10            , 255            
              mov     qword [rsp+312], r10            ; save->v39
_text__main_and12_end:
              mov     r10            , qword [rsp+312]; load->v39
              cmp     r10            , 0              
              mov     qword [rsp+312], r10            ; save->v39
              je      _text__main_and11_end                 
;----------------------------------]
;[----------------------------------
_text__main_and11_rvalue:
              mov     r10            , qword [rsp+888]; load->v111
              mov     r10            , [_data_bss_k]  
              mov     qword [rsp+888], r10            ; save->v111
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+888]; load->v111
              cmp     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+896]; load->v112
              setne   r10b                            
              mov     qword [rsp+896], r10            ; save->v112
              mov     r10            , qword [rsp+896]; load->v112
              and     r10            , 15             
              mov     qword [rsp+896], r10            ; save->v112
              mov     r10            , qword [rsp+896]; load->v112
              cmp     r10            , 0              
              mov     qword [rsp+896], r10            ; save->v112
              je      _text__main_and11_end                 
              mov     r10            , qword [rsp+304]; load->v38
              mov     r10            , 255            
              mov     qword [rsp+304], r10            ; save->v38
_text__main_and11_end:
              mov     r10            , qword [rsp+304]; load->v38
              cmp     r10            , 0              
              mov     qword [rsp+304], r10            ; save->v38
              je      _text__main_and10_end                 
;----------------------------------]
;[----------------------------------
_text__main_and10_rvalue:
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r11            , qword [rsp+88] ; load->v11
              cmp     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+904]; load->v113
              setne   r10b                            
              mov     qword [rsp+904], r10            ; save->v113
              mov     r10            , qword [rsp+904]; load->v113
              and     r10            , 15             
              mov     qword [rsp+904], r10            ; save->v113
              mov     r10            , qword [rsp+904]; load->v113
              cmp     r10            , 0              
              mov     qword [rsp+904], r10            ; save->v113
              je      _text__main_and10_end                 
              mov     r10            , qword [rsp+296]; load->v37
              mov     r10            , 255            
              mov     qword [rsp+296], r10            ; save->v37
_text__main_and10_end:
              mov     r10            , qword [rsp+296]; load->v37
              cmp     r10            , 0              
              mov     qword [rsp+296], r10            ; save->v37
              je      _text__main_and9_end                 
;----------------------------------]
;[----------------------------------
_text__main_and9_rvalue:
              mov     r10            , qword [rsp+912]; load->v114
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+912], r10            ; save->v114
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r11            , qword [rsp+912]; load->v114
              cmp     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+920]; load->v115
              setne   r10b                            
              mov     qword [rsp+920], r10            ; save->v115
              mov     r10            , qword [rsp+920]; load->v115
              and     r10            , 15             
              mov     qword [rsp+920], r10            ; save->v115
              mov     r10            , qword [rsp+920]; load->v115
              cmp     r10            , 0              
              mov     qword [rsp+920], r10            ; save->v115
              je      _text__main_and9_end                 
              mov     r10            , qword [rsp+288]; load->v36
              mov     r10            , 255            
              mov     qword [rsp+288], r10            ; save->v36
_text__main_and9_end:
              mov     r10            , qword [rsp+288]; load->v36
              cmp     r10            , 0              
              mov     qword [rsp+288], r10            ; save->v36
              je      _text__main_and8_end                 
;----------------------------------]
;[----------------------------------
_text__main_and8_rvalue:
              mov     r10            , qword [rsp+928]; load->v116
              mov     r10            , [_data_bss_i]  
              mov     qword [rsp+928], r10            ; save->v116
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r11            , qword [rsp+928]; load->v116
              cmp     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+936]; load->v117
              setne   r10b                            
              mov     qword [rsp+936], r10            ; save->v117
              mov     r10            , qword [rsp+936]; load->v117
              and     r10            , 15             
              mov     qword [rsp+936], r10            ; save->v117
              mov     r10            , qword [rsp+936]; load->v117
              cmp     r10            , 0              
              mov     qword [rsp+936], r10            ; save->v117
              je      _text__main_and8_end                 
              mov     r10            , qword [rsp+280]; load->v35
              mov     r10            , 255            
              mov     qword [rsp+280], r10            ; save->v35
_text__main_and8_end:
              mov     r10            , qword [rsp+280]; load->v35
              cmp     r10            , 0              
              mov     qword [rsp+280], r10            ; save->v35
              je      _text__main_and7_end                 
;----------------------------------]
;[----------------------------------
_text__main_and7_rvalue:
              mov     r10            , qword [rsp+944]; load->v118
              mov     r10            , [_data_bss_j]  
              mov     qword [rsp+944], r10            ; save->v118
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r11            , qword [rsp+944]; load->v118
              cmp     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+952]; load->v119
              setne   r10b                            
              mov     qword [rsp+952], r10            ; save->v119
              mov     r10            , qword [rsp+952]; load->v119
              and     r10            , 15             
              mov     qword [rsp+952], r10            ; save->v119
              mov     r10            , qword [rsp+952]; load->v119
              cmp     r10            , 0              
              mov     qword [rsp+952], r10            ; save->v119
              je      _text__main_and7_end                 
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , 255            
              mov     qword [rsp+272], r10            ; save->v34
_text__main_and7_end:
              mov     r10            , qword [rsp+272]; load->v34
              cmp     r10            , 0              
              mov     qword [rsp+272], r10            ; save->v34
              je      _text__main_and6_end                 
;----------------------------------]
;[----------------------------------
_text__main_and6_rvalue:
              mov     r10            , qword [rsp+960]; load->v120
              mov     r10            , [_data_bss_k]  
              mov     qword [rsp+960], r10            ; save->v120
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r11            , qword [rsp+960]; load->v120
              cmp     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+968]; load->v121
              setne   r10b                            
              mov     qword [rsp+968], r10            ; save->v121
              mov     r10            , qword [rsp+968]; load->v121
              and     r10            , 15             
              mov     qword [rsp+968], r10            ; save->v121
              mov     r10            , qword [rsp+968]; load->v121
              cmp     r10            , 0              
              mov     qword [rsp+968], r10            ; save->v121
              je      _text__main_and6_end                 
              mov     r10            , qword [rsp+264]; load->v33
              mov     r10            , 255            
              mov     qword [rsp+264], r10            ; save->v33
_text__main_and6_end:
              mov     r10            , qword [rsp+264]; load->v33
              cmp     r10            , 0              
              mov     qword [rsp+264], r10            ; save->v33
              je      _text__main_and5_end                 
;----------------------------------]
;[----------------------------------
_text__main_and5_rvalue:
              mov     r10            , qword [rsp+976]; load->v122
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+976], r10            ; save->v122
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r11            , qword [rsp+976]; load->v122
              cmp     r10            , r11            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+984]; load->v123
              setne   r10b                            
              mov     qword [rsp+984], r10            ; save->v123
              mov     r10            , qword [rsp+984]; load->v123
              and     r10            , 15             
              mov     qword [rsp+984], r10            ; save->v123
              mov     r10            , qword [rsp+984]; load->v123
              cmp     r10            , 0              
              mov     qword [rsp+984], r10            ; save->v123
              je      _text__main_and5_end                 
              mov     r10            , qword [rsp+256]; load->v32
              mov     r10            , 255            
              mov     qword [rsp+256], r10            ; save->v32
_text__main_and5_end:
              mov     r10            , qword [rsp+256]; load->v32
              cmp     r10            , 0              
              mov     qword [rsp+256], r10            ; save->v32
              je      _text__main_and4_end                 
;----------------------------------]
;[----------------------------------
_text__main_and4_rvalue:
              mov     r10            , qword [rsp+992]; load->v124
              mov     r10            , [_data_bss_i]  
              mov     qword [rsp+992], r10            ; save->v124
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r11            , qword [rsp+992]; load->v124
              cmp     r10            , r11            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+1000]; load->v125
              setne   r10b                            
              mov     qword [rsp+1000], r10            ; save->v125
              mov     r10            , qword [rsp+1000]; load->v125
              and     r10            , 15             
              mov     qword [rsp+1000], r10            ; save->v125
              mov     r10            , qword [rsp+1000]; load->v125
              cmp     r10            , 0              
              mov     qword [rsp+1000], r10            ; save->v125
              je      _text__main_and4_end                 
              mov     r10            , qword [rsp+248]; load->v31
              mov     r10            , 255            
              mov     qword [rsp+248], r10            ; save->v31
_text__main_and4_end:
              mov     r10            , qword [rsp+248]; load->v31
              cmp     r10            , 0              
              mov     qword [rsp+248], r10            ; save->v31
              je      _text__main_and3_end                 
;----------------------------------]
;[----------------------------------
_text__main_and3_rvalue:
              mov     r10            , qword [rsp+1008]; load->v126
              mov     r10            , [_data_bss_j]  
              mov     qword [rsp+1008], r10            ; save->v126
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r11            , qword [rsp+1008]; load->v126
              cmp     r10            , r11            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+1016]; load->v127
              setne   r10b                            
              mov     qword [rsp+1016], r10            ; save->v127
              mov     r10            , qword [rsp+1016]; load->v127
              and     r10            , 15             
              mov     qword [rsp+1016], r10            ; save->v127
              mov     r10            , qword [rsp+1016]; load->v127
              cmp     r10            , 0              
              mov     qword [rsp+1016], r10            ; save->v127
              je      _text__main_and3_end                 
              mov     r10            , qword [rsp+240]; load->v30
              mov     r10            , 255            
              mov     qword [rsp+240], r10            ; save->v30
_text__main_and3_end:
              mov     r10            , qword [rsp+240]; load->v30
              cmp     r10            , 0              
              mov     qword [rsp+240], r10            ; save->v30
              je      _text__main_and2_end                 
;----------------------------------]
;[----------------------------------
_text__main_and2_rvalue:
              mov     r10            , qword [rsp+1024]; load->v128
              mov     r10            , [_data_bss_k]  
              mov     qword [rsp+1024], r10            ; save->v128
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r11            , qword [rsp+1024]; load->v128
              cmp     r10            , r11            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+1032]; load->v129
              setne   r10b                            
              mov     qword [rsp+1032], r10            ; save->v129
              mov     r10            , qword [rsp+1032]; load->v129
              and     r10            , 15             
              mov     qword [rsp+1032], r10            ; save->v129
              mov     r10            , qword [rsp+1032]; load->v129
              cmp     r10            , 0              
              mov     qword [rsp+1032], r10            ; save->v129
              je      _text__main_and2_end                 
              mov     r10            , qword [rsp+232]; load->v29
              mov     r10            , 255            
              mov     qword [rsp+232], r10            ; save->v29
_text__main_and2_end:
              mov     r10            , qword [rsp+232]; load->v29
              cmp     r10            , 0              
              mov     qword [rsp+232], r10            ; save->v29
              je      _text__main_and1_end                 
;----------------------------------]
;[----------------------------------
_text__main_and1_rvalue:
              mov     r10            , qword [rsp+1040]; load->v130
              mov     r10            , [_data_bss_i]  
              mov     qword [rsp+1040], r10            ; save->v130
              mov     r10            , qword [rsp+1048]; load->v131
              mov     r10            , [_data_bss_j]  
              mov     qword [rsp+1048], r10            ; save->v131
              mov     r10            , qword [rsp+1040]; load->v130
              mov     r11            , qword [rsp+1048]; load->v131
              cmp     r10            , r11            
              mov     qword [rsp+1040], r10            ; save->v130
              mov     r10            , qword [rsp+1056]; load->v132
              setne   r10b                            
              mov     qword [rsp+1056], r10            ; save->v132
              mov     r10            , qword [rsp+1056]; load->v132
              and     r10            , 15             
              mov     qword [rsp+1056], r10            ; save->v132
              mov     r10            , qword [rsp+1056]; load->v132
              cmp     r10            , 0              
              mov     qword [rsp+1056], r10            ; save->v132
              je      _text__main_and1_end                 
              mov     r10            , qword [rsp+224]; load->v28
              mov     r10            , 255            
              mov     qword [rsp+224], r10            ; save->v28
_text__main_and1_end:
              mov     r10            , qword [rsp+224]; load->v28
              cmp     r10            , 0              
              mov     qword [rsp+224], r10            ; save->v28
              je      _text__main_and0_end                 
;----------------------------------]
;[----------------------------------
_text__main_and0_rvalue:
              mov     r10            , qword [rsp+1064]; load->v133
              mov     r10            , [_data_bss_h]  
              mov     qword [rsp+1064], r10            ; save->v133
              mov     r10            , qword [rsp+1072]; load->v134
              mov     r10            , [_data_bss_k]  
              mov     qword [rsp+1072], r10            ; save->v134
              mov     r10            , qword [rsp+1064]; load->v133
              mov     r11            , qword [rsp+1072]; load->v134
              cmp     r10            , r11            
              mov     qword [rsp+1064], r10            ; save->v133
              mov     r10            , qword [rsp+1080]; load->v135
              setne   r10b                            
              mov     qword [rsp+1080], r10            ; save->v135
              mov     r10            , qword [rsp+1080]; load->v135
              and     r10            , 15             
              mov     qword [rsp+1080], r10            ; save->v135
              mov     r10            , qword [rsp+1080]; load->v135
              cmp     r10            , 0              
              mov     qword [rsp+1080], r10            ; save->v135
              je      _text__main_and0_end                 
              mov     r10            , qword [rsp+216]; load->v27
              mov     r10            , 255            
              mov     qword [rsp+216], r10            ; save->v27
_text__main_and0_end:
_text__main_if0_check:
              mov     r10            , qword [rsp+216]; load->v27
              cmp     r10b           , 0              
              mov     qword [rsp+216], r10            ; save->v27
              je      _text__main_if0_else                 
;----------------------------------]
;[----------------------------------
_text__main_if0_start:
              mov     r10            , qword [rsp+1088]; load->v136
              mov     r10            , [_data_bss_total]
              mov     qword [rsp+1088], r10            ; save->v136
              mov     r10            , qword [rsp+1096]; load->v137
              mov     r10            , [_data_bss_total]
              mov     qword [rsp+1096], r10            ; save->v137
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+1104]; load->v138
              mov     r11            , qword [rsp+1096]; load->v137
              mov     r10            , r11            
              mov     qword [rsp+1104], r10            ; save->v138
              mov     r10            , qword [rsp+1104]; load->v138
              mov     r11            , qword [rsp+104]; load->v13
              add     r10            , r11            
              mov     qword [rsp+1104], r10            ; save->v138
              mov     r11            , qword [rsp+1104]; load->v138
              mov     [_data_bss_total], r11            
              jmp     _text__main_if0_end                 
;----------------------------------]
;[----------------------------------
_text__main_if0_else:
_text__main_if0_end:
_text__main_for5_continue:
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+1112]; load->v139
              mov     r11            , qword [rsp+88] ; load->v11
              mov     r10            , r11            
              mov     qword [rsp+1112], r10            ; save->v139
              mov     r10            , qword [rsp+1112]; load->v139
              mov     r11            , qword [rsp+104]; load->v13
              add     r10            , r11            
              mov     qword [rsp+1112], r10            ; save->v139
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r11            , qword [rsp+1112]; load->v139
              mov     r10            , r11            ; assign->f
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+1120]; load->v140
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+1120], r10            ; save->v140
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r11            , qword [rsp+1120]; load->v140
              cmp     r10            , r11            
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+1128]; load->v141
              setle   r10b                            
              mov     qword [rsp+1128], r10            ; save->v141
              mov     r10            , qword [rsp+1128]; load->v141
              and     r10            , 15             
              mov     qword [rsp+1128], r10            ; save->v141
              mov     r10            , qword [rsp+1128]; load->v141
              cmp     r10b           , 0              
              mov     qword [rsp+1128], r10            ; save->v141
              jne     _text__main_for5_start                 
;----------------------------------]
;[----------------------------------
_text__main_for5_end:
_text__main_for4_continue:
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+1136]; load->v142
              mov     r11            , qword [rsp+80] ; load->v10
              mov     r10            , r11            
              mov     qword [rsp+1136], r10            ; save->v142
              mov     r10            , qword [rsp+1136]; load->v142
              mov     r11            , qword [rsp+104]; load->v13
              add     r10            , r11            
              mov     qword [rsp+1136], r10            ; save->v142
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r11            , qword [rsp+1136]; load->v142
              mov     r10            , r11            ; assign->e
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+1144]; load->v143
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+1144], r10            ; save->v143
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r11            , qword [rsp+1144]; load->v143
              cmp     r10            , r11            
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+1152]; load->v144
              setle   r10b                            
              mov     qword [rsp+1152], r10            ; save->v144
              mov     r10            , qword [rsp+1152]; load->v144
              and     r10            , 15             
              mov     qword [rsp+1152], r10            ; save->v144
              mov     r10            , qword [rsp+1152]; load->v144
              cmp     r10b           , 0              
              mov     qword [rsp+1152], r10            ; save->v144
              jne     _text__main_for4_start                 
;----------------------------------]
;[----------------------------------
_text__main_for4_end:
_text__main_for3_continue:
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+1160]; load->v145
              mov     r11            , qword [rsp+72] ; load->v9
              mov     r10            , r11            
              mov     qword [rsp+1160], r10            ; save->v145
              mov     r10            , qword [rsp+1160]; load->v145
              mov     r11            , qword [rsp+104]; load->v13
              add     r10            , r11            
              mov     qword [rsp+1160], r10            ; save->v145
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+1160]; load->v145
              mov     r10            , r11            ; assign->d
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+1168]; load->v146
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+1168], r10            ; save->v146
              mov     r10            , qword [rsp+72] ; load->v9
              mov     r11            , qword [rsp+1168]; load->v146
              cmp     r10            , r11            
              mov     qword [rsp+72] , r10            ; save->v9
              mov     r10            , qword [rsp+1176]; load->v147
              setle   r10b                            
              mov     qword [rsp+1176], r10            ; save->v147
              mov     r10            , qword [rsp+1176]; load->v147
              and     r10            , 15             
              mov     qword [rsp+1176], r10            ; save->v147
              mov     r10            , qword [rsp+1176]; load->v147
              cmp     r10b           , 0              
              mov     qword [rsp+1176], r10            ; save->v147
              jne     _text__main_for3_start                 
;----------------------------------]
;[----------------------------------
_text__main_for3_end:
_text__main_for2_continue:
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+1184]; load->v148
              mov     r11            , qword [rsp+64] ; load->v8
              mov     r10            , r11            
              mov     qword [rsp+1184], r10            ; save->v148
              mov     r10            , qword [rsp+1184]; load->v148
              mov     r11            , qword [rsp+104]; load->v13
              add     r10            , r11            
              mov     qword [rsp+1184], r10            ; save->v148
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+1184]; load->v148
              mov     r10            , r11            ; assign->c
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+1192]; load->v149
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+1192], r10            ; save->v149
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+1192]; load->v149
              cmp     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , qword [rsp+1200]; load->v150
              setle   r10b                            
              mov     qword [rsp+1200], r10            ; save->v150
              mov     r10            , qword [rsp+1200]; load->v150
              and     r10            , 15             
              mov     qword [rsp+1200], r10            ; save->v150
              mov     r10            , qword [rsp+1200]; load->v150
              cmp     r10b           , 0              
              mov     qword [rsp+1200], r10            ; save->v150
              jne     _text__main_for2_start                 
;----------------------------------]
;[----------------------------------
_text__main_for2_end:
_text__main_for1_continue:
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+1208]; load->v151
              mov     r11            , qword [rsp+56] ; load->v7
              mov     r10            , r11            
              mov     qword [rsp+1208], r10            ; save->v151
              mov     r10            , qword [rsp+1208]; load->v151
              mov     r11            , qword [rsp+104]; load->v13
              add     r10            , r11            
              mov     qword [rsp+1208], r10            ; save->v151
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+1208]; load->v151
              mov     r10            , r11            ; assign->b
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+1216]; load->v152
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+1216], r10            ; save->v152
              mov     r10            , qword [rsp+56] ; load->v7
              mov     r11            , qword [rsp+1216]; load->v152
              cmp     r10            , r11            
              mov     qword [rsp+56] , r10            ; save->v7
              mov     r10            , qword [rsp+1224]; load->v153
              setle   r10b                            
              mov     qword [rsp+1224], r10            ; save->v153
              mov     r10            , qword [rsp+1224]; load->v153
              and     r10            , 15             
              mov     qword [rsp+1224], r10            ; save->v153
              mov     r10            , qword [rsp+1224]; load->v153
              cmp     r10b           , 0              
              mov     qword [rsp+1224], r10            ; save->v153
              jne     _text__main_for1_start                 
;----------------------------------]
;[----------------------------------
_text__main_for1_end:
_text__main_for0_continue:
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , 1              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+1232]; load->v154
              mov     r11            , qword [rsp+112]; load->v14
              mov     r10            , r11            
              mov     qword [rsp+1232], r10            ; save->v154
              mov     r10            , qword [rsp+1232]; load->v154
              mov     r11            , qword [rsp+104]; load->v13
              add     r10            , r11            
              mov     qword [rsp+1232], r10            ; save->v154
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+1232]; load->v154
              mov     r10            , r11            ; assign->a
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+1240]; load->v155
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+1240], r10            ; save->v155
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+1240]; load->v155
              cmp     r10            , r11            
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+1248]; load->v156
              setle   r10b                            
              mov     qword [rsp+1248], r10            ; save->v156
              mov     r10            , qword [rsp+1248]; load->v156
              and     r10            , 15             
              mov     qword [rsp+1248], r10            ; save->v156
              mov     r10            , qword [rsp+1248]; load->v156
              cmp     r10b           , 0              
              mov     qword [rsp+1248], r10            ; save->v156
              jne     _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
              mov     r10            , qword [rsp+1256]; load->v157
              mov     r10            , [_data_bss_total]
              mov     qword [rsp+1256], r10            ; save->v157
_text__main_call0:
              mov     r10            , qword [rsp+1264]; load->v158
              mov     r10            , rax            
              mov     qword [rsp+1264], r10            ; save->v158
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+1272]; load->v159
              mov     r10            , r10            
              mov     qword [rsp+1272], r10            ; save->v159
              mov     r10            , qword [rsp+1280]; load->v160
              mov     r10            , r11            
              mov     qword [rsp+1280], r10            ; save->v160
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
              mov     r11            , qword [rsp+1256]; load->v157
              mov     rdi            , r11            
              call    _text__toString                 
              mov     r10            , qword [rsp+1288]; load->v161
              mov     r10            , rax            
              mov     qword [rsp+1288], r10            ; save->v161
              mov     r11            , qword [rsp+1264]; load->v158
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+1272]; load->v159
              mov     r10            , r11            
              mov     r11            , qword [rsp+1280]; load->v160
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
              mov     r10            , qword [rsp+1264]; load->v158
              mov     r10            , rax            
              mov     qword [rsp+1264], r10            ; save->v158
              mov     r10            , qword [rsp+8]  ; load->v1
              mov     r10            , rbx            
              mov     qword [rsp+8]  , r10            ; save->v1
              mov     r10            , qword [rsp]    ; load->v0
              mov     r10            , rbp            
              mov     qword [rsp]    , r10            ; save->v0
              mov     r10            , qword [rsp+1272]; load->v159
              mov     r10            , r10            
              mov     qword [rsp+1272], r10            ; save->v159
              mov     r10            , qword [rsp+1280]; load->v160
              mov     r10            , r11            
              mov     qword [rsp+1280], r10            ; save->v160
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
              mov     r11            , qword [rsp+1288]; load->v161
              mov     rdi            , r11            
              call    _text__println                  
              mov     r10            , qword [rsp+1296]; load->v162
              mov     r10            , rax            
              mov     qword [rsp+1296], r10            ; save->v162
              mov     r11            , qword [rsp+1264]; load->v158
              mov     rax            , r11            
              mov     r11            , qword [rsp+8]  ; load->v1
              mov     rbx            , r11            
              mov     r11            , qword [rsp]    ; load->v0
              mov     rbp            , r11            
              mov     r11            , qword [rsp+1272]; load->v159
              mov     r10            , r11            
              mov     r11            , qword [rsp+1280]; load->v160
              mov     r11            , r11            
              mov     r11            , qword [rsp+16] ; load->v2
              mov     r12            , r11            
              mov     r11            , qword [rsp+24] ; load->v3
              mov     r13            , r11            
              mov     r11            , qword [rsp+32] ; load->v4
              mov     r14            , r11            
              mov     r11            , qword [rsp+40] ; load->v5
              mov     r15            , r11            
              mov     r10            , qword [rsp+1304]; load->v163
              mov     r10            , 0              
              mov     qword [rsp+1304], r10            ; save->v163
_text__main_ret0:
              mov     r11            , qword [rsp+1304]; load->v163
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
              add     rsp            , 1320           
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
              add     rsp            , 1320           
              ret                                     
;----------------------------------]
                                                      
