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
_data_bss_MAXN:
              resb    8                               
_data_bss_MAXM:
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
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , 10005          
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r11            , qword [rsp+48] ; load->v6
              mov     [_data_bss_MAXN], r11            
              mov     r10            , qword [rsp+48] ; load->v6
              mov     r10            , 10005          
              mov     qword [rsp+48] , r10            ; save->v6
              mov     r11            , qword [rsp+48] ; load->v6
              mov     [_data_bss_MAXM], r11            
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
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 600            
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
              call    _text__getInt                   
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r10            , rax            
              mov     qword [rsp+88] , r10            ; save->v11
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
              mov     r10            , r11            ; assign->M
              mov     qword [rsp+96] , r10            ; save->v12
_text__main_call1:
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
              call    _text__getInt                   
              mov     r10            , qword [rsp+104]; load->v13
              mov     r10            , rax            
              mov     qword [rsp+104], r10            ; save->v13
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
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+104]; load->v13
              mov     r10            , r11            ; assign->N
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , [_data_bss_MAXN]
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r11            , qword [rsp+120]; load->v15
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
              mov     r11            , qword [rsp+120]; load->v15
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
              mov     r10            , qword [rsp+144]; load->v18
              mov     r11            , qword [rsp+136]; load->v17
              mov     r10            , r11            ; init->w
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , [_data_bss_MAXN]
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+160]; load->v20
              imul    r10            , 8              
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+160]; load->v20
              add     r10            , 8              
              mov     qword [rsp+160], r10            ; save->v20
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
              mov     r11            , qword [rsp+160]; load->v20
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+168]; load->v21
              mov     r10            , rax            
              mov     qword [rsp+168], r10            ; save->v21
              mov     r11            , qword [rsp+152]; load->v19
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
              mov     r10            , qword [rsp+176]; load->v22
              mov     r11            , qword [rsp+168]; load->v21
              mov     r10            , r11            ; init->t
              mov     qword [rsp+176], r10            ; save->v22
              mov     r10            , qword [rsp+184]; load->v23
              mov     r10            , [_data_bss_MAXN]
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , qword [rsp+192]; load->v24
              mov     r11            , qword [rsp+184]; load->v23
              mov     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+192]; load->v24
              imul    r10            , 8              
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+192]; load->v24
              add     r10            , 8              
              mov     qword [rsp+192], r10            ; save->v24
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
              mov     r11            , qword [rsp+192]; load->v24
              mov     rdi            , r11            
              call    malloc                          
              mov     r10            , qword [rsp+200]; load->v25
              mov     r10            , rax            
              mov     qword [rsp+200], r10            ; save->v25
              mov     r11            , qword [rsp+184]; load->v23
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
              mov     r10            , qword [rsp+208]; load->v26
              mov     r11            , qword [rsp+200]; load->v25
              mov     r10            , r11            ; init->DP
              mov     qword [rsp+208], r10            ; save->v26
_text__main_for0_init:
              mov     r10            , qword [rsp+232]; load->v29
              mov     r10            , 0              
              mov     qword [rsp+232], r10            ; save->v29
              mov     r10            , qword [rsp+240]; load->v30
              mov     r11            , qword [rsp+232]; load->v29
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+240], r10            ; save->v30
              mov     r10            , qword [rsp+240]; load->v30
              mov     r11            , qword [rsp+112]; load->v14
              cmp     r10            , r11            
              mov     qword [rsp+240], r10            ; save->v30
              mov     r10            , qword [rsp+248]; load->v31
              setl    r10b                            
              mov     qword [rsp+248], r10            ; save->v31
              mov     r10            , qword [rsp+248]; load->v31
              and     r10            , 15             
              mov     qword [rsp+248], r10            ; save->v31
_text__main_for0_init_check:
              mov     r10            , qword [rsp+248]; load->v31
              cmp     r10b           , 0              
              mov     qword [rsp+248], r10            ; save->v31
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
_text__main_call2:
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
              call    _text__getInt                   
              mov     r10            , qword [rsp+256]; load->v32
              mov     r10            , rax            
              mov     qword [rsp+256], r10            ; save->v32
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
              mov     r10            , qword [rsp+264]; load->v33
              mov     r11            , qword [rsp+240]; load->v30
              mov     r10            , r11            
              mov     qword [rsp+264], r10            ; save->v33
              mov     r10            , qword [rsp+264]; load->v33
              imul    r10            , 8              
              mov     qword [rsp+264], r10            ; save->v33
              mov     r10            , qword [rsp+264]; load->v33
              add     r10            , 8              
              mov     qword [rsp+264], r10            ; save->v33
              mov     r10            , qword [rsp+264]; load->v33
              mov     r11            , qword [rsp+144]; load->v18
              add     r10            , r11            
              mov     qword [rsp+264], r10            ; save->v33
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+264]; translate->qword [v33]
              mov     r10            , qword [r11]    
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+264]; translate->qword [v33]
              mov     r11            , qword [rsp+256]; load->v32
              mov     qword [r10]    , r11            ; assign->w[i]
_text__main_call3:
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
              call    _text__getInt                   
              mov     r10            , qword [rsp+280]; load->v35
              mov     r10            , rax            
              mov     qword [rsp+280], r10            ; save->v35
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
              mov     r10            , qword [rsp+288]; load->v36
              mov     r11            , qword [rsp+240]; load->v30
              mov     r10            , r11            
              mov     qword [rsp+288], r10            ; save->v36
              mov     r10            , qword [rsp+288]; load->v36
              imul    r10            , 8              
              mov     qword [rsp+288], r10            ; save->v36
              mov     r10            , qword [rsp+288]; load->v36
              add     r10            , 8              
              mov     qword [rsp+288], r10            ; save->v36
              mov     r10            , qword [rsp+288]; load->v36
              mov     r11            , qword [rsp+176]; load->v22
              add     r10            , r11            
              mov     qword [rsp+288], r10            ; save->v36
              mov     r10            , qword [rsp+296]; load->v37
              mov     r11            , qword [rsp+288]; translate->qword [v36]
              mov     r10            , qword [r11]    
              mov     qword [rsp+296], r10            ; save->v37
              mov     r10            , qword [rsp+288]; translate->qword [v36]
              mov     r11            , qword [rsp+280]; load->v35
              mov     qword [r10]    , r11            ; assign->t[i]
_text__main_for0_continue:
              mov     r10            , qword [rsp+304]; load->v38
              mov     r10            , 1              
              mov     qword [rsp+304], r10            ; save->v38
              mov     r10            , qword [rsp+312]; load->v39
              mov     r11            , qword [rsp+240]; load->v30
              mov     r10            , r11            
              mov     qword [rsp+312], r10            ; save->v39
              mov     r10            , qword [rsp+312]; load->v39
              mov     r11            , qword [rsp+304]; load->v38
              add     r10            , r11            
              mov     qword [rsp+312], r10            ; save->v39
              mov     r10            , qword [rsp+240]; load->v30
              mov     r11            , qword [rsp+312]; load->v39
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+240], r10            ; save->v30
              mov     r10            , qword [rsp+240]; load->v30
              mov     r11            , qword [rsp+112]; load->v14
              cmp     r10            , r11            
              mov     qword [rsp+240], r10            ; save->v30
              mov     r10            , qword [rsp+320]; load->v40
              setl    r10b                            
              mov     qword [rsp+320], r10            ; save->v40
              mov     r10            , qword [rsp+320]; load->v40
              and     r10            , 15             
              mov     qword [rsp+320], r10            ; save->v40
              mov     r10            , qword [rsp+320]; load->v40
              cmp     r10b           , 0              
              mov     qword [rsp+320], r10            ; save->v40
              jne     _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
_text__main_for1_init:
              mov     r10            , qword [rsp+232]; load->v29
              mov     r10            , 0              
              mov     qword [rsp+232], r10            ; save->v29
              mov     r10            , qword [rsp+328]; load->v41
              mov     r11            , qword [rsp+232]; load->v29
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+328]; load->v41
              mov     r11            , qword [rsp+112]; load->v14
              cmp     r10            , r11            
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+336]; load->v42
              setl    r10b                            
              mov     qword [rsp+336], r10            ; save->v42
              mov     r10            , qword [rsp+336]; load->v42
              and     r10            , 15             
              mov     qword [rsp+336], r10            ; save->v42
_text__main_for1_init_check:
              mov     r10            , qword [rsp+336]; load->v42
              cmp     r10b           , 0              
              mov     qword [rsp+336], r10            ; save->v42
              je      _text__main_for1_end                 
;----------------------------------]
;[----------------------------------
_text__main_for1_start:
_text__main_for2_init:
              mov     r10            , qword [rsp+344]; load->v43
              mov     r11            , qword [rsp+328]; load->v41
              mov     r10            , r11            
              mov     qword [rsp+344], r10            ; save->v43
              mov     r10            , qword [rsp+344]; load->v43
              imul    r10            , 8              
              mov     qword [rsp+344], r10            ; save->v43
              mov     r10            , qword [rsp+344]; load->v43
              add     r10            , 8              
              mov     qword [rsp+344], r10            ; save->v43
              mov     r10            , qword [rsp+344]; load->v43
              mov     r11            , qword [rsp+176]; load->v22
              add     r10            , r11            
              mov     qword [rsp+344], r10            ; save->v43
              mov     r10            , qword [rsp+352]; load->v44
              mov     r11            , qword [rsp+344]; translate->qword [v43]
              mov     r10            , qword [r11]    
              mov     qword [rsp+352], r10            ; save->v44
              mov     r10            , qword [rsp+224]; load->v28
              mov     r11            , qword [rsp+352]; load->v44
              mov     r10            , r11            ; assign->j
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+224]; load->v28
              mov     r11            , qword [rsp+96] ; load->v12
              cmp     r10            , r11            
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+360]; load->v45
              setle   r10b                            
              mov     qword [rsp+360], r10            ; save->v45
              mov     r10            , qword [rsp+360]; load->v45
              and     r10            , 15             
              mov     qword [rsp+360], r10            ; save->v45
_text__main_for2_init_check:
              mov     r10            , qword [rsp+360]; load->v45
              cmp     r10b           , 0              
              mov     qword [rsp+360], r10            ; save->v45
              je      _text__main_for2_end                 
;----------------------------------]
;[----------------------------------
_text__main_for2_start:
_text__main_if0_init:
              mov     r10            , qword [rsp+368]; load->v46
              mov     r11            , qword [rsp+224]; load->v28
              mov     r10            , r11            
              mov     qword [rsp+368], r10            ; save->v46
              mov     r10            , qword [rsp+368]; load->v46
              imul    r10            , 8              
              mov     qword [rsp+368], r10            ; save->v46
              mov     r10            , qword [rsp+368]; load->v46
              add     r10            , 8              
              mov     qword [rsp+368], r10            ; save->v46
              mov     r10            , qword [rsp+368]; load->v46
              mov     r11            , qword [rsp+208]; load->v26
              add     r10            , r11            
              mov     qword [rsp+368], r10            ; save->v46
              mov     r10            , qword [rsp+376]; load->v47
              mov     r11            , qword [rsp+368]; translate->qword [v46]
              mov     r10            , qword [r11]    
              mov     qword [rsp+376], r10            ; save->v47
              mov     r10            , qword [rsp+384]; load->v48
              mov     r11            , qword [rsp+328]; load->v41
              mov     r10            , r11            
              mov     qword [rsp+384], r10            ; save->v48
              mov     r10            , qword [rsp+384]; load->v48
              imul    r10            , 8              
              mov     qword [rsp+384], r10            ; save->v48
              mov     r10            , qword [rsp+384]; load->v48
              add     r10            , 8              
              mov     qword [rsp+384], r10            ; save->v48
              mov     r10            , qword [rsp+384]; load->v48
              mov     r11            , qword [rsp+176]; load->v22
              add     r10            , r11            
              mov     qword [rsp+384], r10            ; save->v48
              mov     r10            , qword [rsp+392]; load->v49
              mov     r11            , qword [rsp+384]; translate->qword [v48]
              mov     r10            , qword [r11]    
              mov     qword [rsp+392], r10            ; save->v49
              mov     r10            , qword [rsp+400]; load->v50
              mov     r11            , qword [rsp+224]; load->v28
              mov     r10            , r11            
              mov     qword [rsp+400], r10            ; save->v50
              mov     r10            , qword [rsp+400]; load->v50
              mov     r11            , qword [rsp+392]; load->v49
              sub     r10            , r11            
              mov     qword [rsp+400], r10            ; save->v50
              mov     r10            , qword [rsp+408]; load->v51
              mov     r11            , qword [rsp+400]; load->v50
              mov     r10            , r11            
              mov     qword [rsp+408], r10            ; save->v51
              mov     r10            , qword [rsp+408]; load->v51
              imul    r10            , 8              
              mov     qword [rsp+408], r10            ; save->v51
              mov     r10            , qword [rsp+408]; load->v51
              add     r10            , 8              
              mov     qword [rsp+408], r10            ; save->v51
              mov     r10            , qword [rsp+408]; load->v51
              mov     r11            , qword [rsp+208]; load->v26
              add     r10            , r11            
              mov     qword [rsp+408], r10            ; save->v51
              mov     r10            , qword [rsp+416]; load->v52
              mov     r11            , qword [rsp+408]; translate->qword [v51]
              mov     r10            , qword [r11]    
              mov     qword [rsp+416], r10            ; save->v52
              mov     r10            , qword [rsp+424]; load->v53
              mov     r11            , qword [rsp+328]; load->v41
              mov     r10            , r11            
              mov     qword [rsp+424], r10            ; save->v53
              mov     r10            , qword [rsp+424]; load->v53
              imul    r10            , 8              
              mov     qword [rsp+424], r10            ; save->v53
              mov     r10            , qword [rsp+424]; load->v53
              add     r10            , 8              
              mov     qword [rsp+424], r10            ; save->v53
              mov     r10            , qword [rsp+424]; load->v53
              mov     r11            , qword [rsp+144]; load->v18
              add     r10            , r11            
              mov     qword [rsp+424], r10            ; save->v53
              mov     r10            , qword [rsp+432]; load->v54
              mov     r11            , qword [rsp+424]; translate->qword [v53]
              mov     r10            , qword [r11]    
              mov     qword [rsp+432], r10            ; save->v54
              mov     r10            , qword [rsp+440]; load->v55
              mov     r11            , qword [rsp+416]; load->v52
              mov     r10            , r11            
              mov     qword [rsp+440], r10            ; save->v55
              mov     r10            , qword [rsp+440]; load->v55
              mov     r11            , qword [rsp+432]; load->v54
              add     r10            , r11            
              mov     qword [rsp+440], r10            ; save->v55
              mov     r10            , qword [rsp+376]; load->v47
              mov     r11            , qword [rsp+440]; load->v55
              cmp     r10            , r11            
              mov     qword [rsp+376], r10            ; save->v47
              mov     r10            , qword [rsp+448]; load->v56
              setle   r10b                            
              mov     qword [rsp+448], r10            ; save->v56
              mov     r10            , qword [rsp+448]; load->v56
              and     r10            , 15             
              mov     qword [rsp+448], r10            ; save->v56
_text__main_if0_check:
              mov     r10            , qword [rsp+448]; load->v56
              cmp     r10b           , 0              
              mov     qword [rsp+448], r10            ; save->v56
              je      _text__main_if0_else                 
;----------------------------------]
;[----------------------------------
_text__main_if0_start:
              mov     r10            , qword [rsp+456]; load->v57
              mov     r11            , qword [rsp+328]; load->v41
              mov     r10            , r11            
              mov     qword [rsp+456], r10            ; save->v57
              mov     r10            , qword [rsp+456]; load->v57
              imul    r10            , 8              
              mov     qword [rsp+456], r10            ; save->v57
              mov     r10            , qword [rsp+456]; load->v57
              add     r10            , 8              
              mov     qword [rsp+456], r10            ; save->v57
              mov     r10            , qword [rsp+456]; load->v57
              mov     r11            , qword [rsp+176]; load->v22
              add     r10            , r11            
              mov     qword [rsp+456], r10            ; save->v57
              mov     r10            , qword [rsp+464]; load->v58
              mov     r11            , qword [rsp+456]; translate->qword [v57]
              mov     r10            , qword [r11]    
              mov     qword [rsp+464], r10            ; save->v58
              mov     r10            , qword [rsp+472]; load->v59
              mov     r11            , qword [rsp+224]; load->v28
              mov     r10            , r11            
              mov     qword [rsp+472], r10            ; save->v59
              mov     r10            , qword [rsp+472]; load->v59
              mov     r11            , qword [rsp+464]; load->v58
              sub     r10            , r11            
              mov     qword [rsp+472], r10            ; save->v59
              mov     r10            , qword [rsp+480]; load->v60
              mov     r11            , qword [rsp+472]; load->v59
              mov     r10            , r11            
              mov     qword [rsp+480], r10            ; save->v60
              mov     r10            , qword [rsp+480]; load->v60
              imul    r10            , 8              
              mov     qword [rsp+480], r10            ; save->v60
              mov     r10            , qword [rsp+480]; load->v60
              add     r10            , 8              
              mov     qword [rsp+480], r10            ; save->v60
              mov     r10            , qword [rsp+480]; load->v60
              mov     r11            , qword [rsp+208]; load->v26
              add     r10            , r11            
              mov     qword [rsp+480], r10            ; save->v60
              mov     r10            , qword [rsp+488]; load->v61
              mov     r11            , qword [rsp+480]; translate->qword [v60]
              mov     r10            , qword [r11]    
              mov     qword [rsp+488], r10            ; save->v61
              mov     r10            , qword [rsp+496]; load->v62
              mov     r11            , qword [rsp+328]; load->v41
              mov     r10            , r11            
              mov     qword [rsp+496], r10            ; save->v62
              mov     r10            , qword [rsp+496]; load->v62
              imul    r10            , 8              
              mov     qword [rsp+496], r10            ; save->v62
              mov     r10            , qword [rsp+496]; load->v62
              add     r10            , 8              
              mov     qword [rsp+496], r10            ; save->v62
              mov     r10            , qword [rsp+496]; load->v62
              mov     r11            , qword [rsp+144]; load->v18
              add     r10            , r11            
              mov     qword [rsp+496], r10            ; save->v62
              mov     r10            , qword [rsp+504]; load->v63
              mov     r11            , qword [rsp+496]; translate->qword [v62]
              mov     r10            , qword [r11]    
              mov     qword [rsp+504], r10            ; save->v63
              mov     r10            , qword [rsp+512]; load->v64
              mov     r11            , qword [rsp+488]; load->v61
              mov     r10            , r11            
              mov     qword [rsp+512], r10            ; save->v64
              mov     r10            , qword [rsp+512]; load->v64
              mov     r11            , qword [rsp+504]; load->v63
              add     r10            , r11            
              mov     qword [rsp+512], r10            ; save->v64
              mov     r10            , qword [rsp+520]; load->v65
              mov     r11            , qword [rsp+224]; load->v28
              mov     r10            , r11            
              mov     qword [rsp+520], r10            ; save->v65
              mov     r10            , qword [rsp+520]; load->v65
              imul    r10            , 8              
              mov     qword [rsp+520], r10            ; save->v65
              mov     r10            , qword [rsp+520]; load->v65
              add     r10            , 8              
              mov     qword [rsp+520], r10            ; save->v65
              mov     r10            , qword [rsp+520]; load->v65
              mov     r11            , qword [rsp+208]; load->v26
              add     r10            , r11            
              mov     qword [rsp+520], r10            ; save->v65
              mov     r10            , qword [rsp+528]; load->v66
              mov     r11            , qword [rsp+520]; translate->qword [v65]
              mov     r10            , qword [r11]    
              mov     qword [rsp+528], r10            ; save->v66
              mov     r10            , qword [rsp+520]; translate->qword [v65]
              mov     r11            , qword [rsp+512]; load->v64
              mov     qword [r10]    , r11            ; assign->DP[j]
              jmp     _text__main_if0_end                 
;----------------------------------]
;[----------------------------------
_text__main_if0_else:
_text__main_if0_end:
_text__main_for2_continue:
              mov     r10            , qword [rsp+304]; load->v38
              mov     r10            , 1              
              mov     qword [rsp+304], r10            ; save->v38
              mov     r10            , qword [rsp+536]; load->v67
              mov     r11            , qword [rsp+224]; load->v28
              mov     r10            , r11            
              mov     qword [rsp+536], r10            ; save->v67
              mov     r10            , qword [rsp+536]; load->v67
              mov     r11            , qword [rsp+304]; load->v38
              add     r10            , r11            
              mov     qword [rsp+536], r10            ; save->v67
              mov     r10            , qword [rsp+224]; load->v28
              mov     r11            , qword [rsp+536]; load->v67
              mov     r10            , r11            ; assign->j
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+224]; load->v28
              mov     r11            , qword [rsp+96] ; load->v12
              cmp     r10            , r11            
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+544]; load->v68
              setle   r10b                            
              mov     qword [rsp+544], r10            ; save->v68
              mov     r10            , qword [rsp+544]; load->v68
              and     r10            , 15             
              mov     qword [rsp+544], r10            ; save->v68
              mov     r10            , qword [rsp+544]; load->v68
              cmp     r10b           , 0              
              mov     qword [rsp+544], r10            ; save->v68
              jne     _text__main_for2_start                 
;----------------------------------]
;[----------------------------------
_text__main_for2_end:
_text__main_for1_continue:
              mov     r10            , qword [rsp+304]; load->v38
              mov     r10            , 1              
              mov     qword [rsp+304], r10            ; save->v38
              mov     r10            , qword [rsp+552]; load->v69
              mov     r11            , qword [rsp+328]; load->v41
              mov     r10            , r11            
              mov     qword [rsp+552], r10            ; save->v69
              mov     r10            , qword [rsp+552]; load->v69
              mov     r11            , qword [rsp+304]; load->v38
              add     r10            , r11            
              mov     qword [rsp+552], r10            ; save->v69
              mov     r10            , qword [rsp+328]; load->v41
              mov     r11            , qword [rsp+552]; load->v69
              mov     r10            , r11            ; assign->i
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+328]; load->v41
              mov     r11            , qword [rsp+112]; load->v14
              cmp     r10            , r11            
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+560]; load->v70
              setl    r10b                            
              mov     qword [rsp+560], r10            ; save->v70
              mov     r10            , qword [rsp+560]; load->v70
              and     r10            , 15             
              mov     qword [rsp+560], r10            ; save->v70
              mov     r10            , qword [rsp+560]; load->v70
              cmp     r10b           , 0              
              mov     qword [rsp+560], r10            ; save->v70
              jne     _text__main_for1_start                 
;----------------------------------]
;[----------------------------------
_text__main_for1_end:
              mov     r10            , qword [rsp+568]; load->v71
              mov     r11            , qword [rsp+96] ; load->v12
              mov     r10            , r11            
              mov     qword [rsp+568], r10            ; save->v71
              mov     r10            , qword [rsp+568]; load->v71
              imul    r10            , 8              
              mov     qword [rsp+568], r10            ; save->v71
              mov     r10            , qword [rsp+568]; load->v71
              add     r10            , 8              
              mov     qword [rsp+568], r10            ; save->v71
              mov     r10            , qword [rsp+568]; load->v71
              mov     r11            , qword [rsp+208]; load->v26
              add     r10            , r11            
              mov     qword [rsp+568], r10            ; save->v71
              mov     r10            , qword [rsp+576]; load->v72
              mov     r11            , qword [rsp+568]; translate->qword [v71]
              mov     r10            , qword [r11]    
              mov     qword [rsp+576], r10            ; save->v72
_text__main_call4:
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
              mov     r11            , qword [rsp+576]; load->v72
              mov     rdi            , r11            
              call    _text__toString                 
              mov     r10            , qword [rsp+584]; load->v73
              mov     r10            , rax            
              mov     qword [rsp+584], r10            ; save->v73
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
_text__main_call5:
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
              mov     r11            , qword [rsp+584]; load->v73
              mov     rdi            , r11            
              call    _text__print                    
              mov     r10            , qword [rsp+592]; load->v74
              mov     r10            , rax            
              mov     qword [rsp+592], r10            ; save->v74
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
              mov     r10            , qword [rsp+232]; load->v29
              mov     r10            , 0              
              mov     qword [rsp+232], r10            ; save->v29
_text__main_ret0:
              mov     r11            , qword [rsp+232]; load->v29
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
              add     rsp            , 600            
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
              add     rsp            , 600            
              ret                                     
;----------------------------------]
                                                      
