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
              sub     rsp            , 152            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     rbx            , rdi            ; load->v6
              mov     r12            , _data_s0       ; load->v7
_text__print_call0:
              mov     rdi            , r12            ; load->v7
              mov     rsi            , rbx            ; load->v6
              mov     qword [rsp+64] , rax            ; load->v8
              mov     qword [rsp+72] , rdi            ; load->v9
              mov     qword [rsp+80] , rsi            ; load->v10
              mov     qword [rsp+88] , rdx            ; load->v11
              mov     qword [rsp+96] , rcx            ; load->v12
              mov     qword [rsp+104], r8             ; load->v13
              mov     qword [rsp+112], r9             ; load->v14
              mov     qword [rsp+128], r11            ; load->v15
              call    _text__printf                   
              mov     rbx            , rax            ; load->v17
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
              mov     rbx            , rdi            ; load->v6
              mov     r12            , _data_s1       ; load->v7
_text__println_call0:
              mov     rdi            , r12            ; load->v7
              mov     rsi            , rbx            ; load->v6
              mov     qword [rsp+64] , rax            ; load->v8
              mov     qword [rsp+72] , rdi            ; load->v9
              mov     qword [rsp+80] , rsi            ; load->v10
              mov     qword [rsp+88] , rdx            ; load->v11
              mov     qword [rsp+96] , rcx            ; load->v12
              mov     qword [rsp+104], r8             ; load->v13
              mov     qword [rsp+112], r9             ; load->v14
              mov     qword [rsp+128], r11            ; load->v15
              call    _text__printf                   
              mov     rbx            , rax            ; load->v17
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
              sub     rsp            , 72             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     rbx            , 10005          ; load->v6
              mov     [_data_bss_MAXN], rbx            ; load->v6
              mov     rbx            , 10005          ; load->v7
              mov     [_data_bss_MAXM], rbx            ; load->v7
_datainit_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 72             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 680            
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
_text__main_call0:
              mov     qword [rsp+64] , rax            ; load->v8
              mov     qword [rsp+72] , rdi            ; load->v9
              mov     qword [rsp+80] , rsi            ; load->v10
              mov     qword [rsp+88] , rdx            ; load->v11
              mov     qword [rsp+96] , rcx            ; load->v12
              mov     qword [rsp+104], r8             ; load->v13
              mov     qword [rsp+112], r9             ; load->v14
              mov     qword [rsp+128], r11            ; load->v15
              call    _text__getInt                   
              mov     rbx            , rax            ; load->v17
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rdi            , qword [rsp+72] ; load->v9
              mov     rsi            , qword [rsp+80] ; load->v10
              mov     rdx            , qword [rsp+88] ; load->v11
              mov     rcx            , qword [rsp+96] ; load->v12
              mov     r8             , qword [rsp+104]; load->v13
              mov     r9             , qword [rsp+112]; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+128]; load->v16
              mov     r10            , r12            ; load->v18
              mov     r12            , rbx            ; load->v17
_text__main_call1:
              mov     qword [rsp+64] , rax            ; load->v8
              mov     qword [rsp+72] , rdi            ; load->v9
              mov     qword [rsp+80] , rsi            ; load->v10
              mov     qword [rsp+88] , rdx            ; load->v11
              mov     qword [rsp+96] , rcx            ; load->v12
              mov     qword [rsp+104], r8             ; load->v13
              mov     qword [rsp+112], r9             ; load->v14
              mov     qword [rsp+128], r11            ; load->v15
              call    _text__getInt                   
              mov     rbx            , rax            ; load->v19
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rdi            , qword [rsp+72] ; load->v9
              mov     rsi            , qword [rsp+80] ; load->v10
              mov     rdx            , qword [rsp+88] ; load->v11
              mov     rcx            , qword [rsp+96] ; load->v12
              mov     r8             , qword [rsp+104]; load->v13
              mov     r9             , qword [rsp+112]; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+128]; load->v16
              mov     r10            , qword [rsp+160]; load->v20
              mov     qword [rsp+160], rbx            ; load->v19
              mov     r10            , [_data_bss_MAXN]; load->v21
              mov     qword [rsp+168], r10            ; save->v21
              mov     qword [rsp+176], r10            ; save->v22
              imul    r10            , 8              
              mov     qword [rsp+176], r10            ; save->v22
              add     r10            , 8              
              mov     qword [rsp+176], r10            ; save->v22
              mov     qword [rsp+64] , rax            ; load->v8
              mov     qword [rsp+72] , rdi            ; load->v9
              mov     qword [rsp+80] , rsi            ; load->v10
              mov     qword [rsp+88] , rdx            ; load->v11
              mov     qword [rsp+96] , rcx            ; load->v12
              mov     qword [rsp+104], r8             ; load->v13
              mov     qword [rsp+112], r9             ; load->v14
              mov     qword [rsp+128], r11            ; load->v15
              mov     rdi            , qword [rsp+176]; load->v22
              call    malloc                          
              mov     qword [rsp+184], rax            ; load->v23
              mov     r11            , qword [rsp+168]; load->v21
              mov     qword [rax]    , r11            
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rdi            , qword [rsp+72] ; load->v9
              mov     rsi            , qword [rsp+80] ; load->v10
              mov     rdx            , qword [rsp+88] ; load->v11
              mov     rcx            , qword [rsp+96] ; load->v12
              mov     r8             , qword [rsp+104]; load->v13
              mov     r9             , qword [rsp+112]; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+128]; load->v16
              mov     r10            , rbx            ; load->v24
              mov     rbx            , qword [rsp+184]; load->v23
              mov     r10            , [_data_bss_MAXN]; load->v25
              mov     qword [rsp+200], r10            ; save->v25
              mov     qword [rsp+208], r10            ; save->v26
              imul    r10            , 8              
              mov     qword [rsp+208], r10            ; save->v26
              add     r10            , 8              
              mov     qword [rsp+208], r10            ; save->v26
              mov     qword [rsp+64] , rax            ; load->v8
              mov     qword [rsp+72] , rdi            ; load->v9
              mov     qword [rsp+80] , rsi            ; load->v10
              mov     qword [rsp+88] , rdx            ; load->v11
              mov     qword [rsp+96] , rcx            ; load->v12
              mov     qword [rsp+104], r8             ; load->v13
              mov     qword [rsp+112], r9             ; load->v14
              mov     qword [rsp+128], r11            ; load->v15
              mov     rdi            , qword [rsp+208]; load->v26
              call    malloc                          
              mov     qword [rsp+216], rax            ; load->v27
              mov     r11            , qword [rsp+200]; load->v25
              mov     qword [rax]    , r11            
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rdi            , qword [rsp+72] ; load->v9
              mov     rsi            , qword [rsp+80] ; load->v10
              mov     rdx            , qword [rsp+88] ; load->v11
              mov     rcx            , qword [rsp+96] ; load->v12
              mov     r8             , qword [rsp+104]; load->v13
              mov     r9             , qword [rsp+112]; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+128]; load->v16
              mov     r10            , r14            ; load->v28
              mov     r14            , qword [rsp+216]; load->v27
              mov     r10            , [_data_bss_MAXN]; load->v29
              mov     qword [rsp+232], r10            ; save->v29
              mov     qword [rsp+240], r10            ; save->v30
              imul    r10            , 8              
              mov     qword [rsp+240], r10            ; save->v30
              add     r10            , 8              
              mov     qword [rsp+240], r10            ; save->v30
              mov     qword [rsp+64] , rax            ; load->v8
              mov     qword [rsp+72] , rdi            ; load->v9
              mov     qword [rsp+80] , rsi            ; load->v10
              mov     qword [rsp+88] , rdx            ; load->v11
              mov     qword [rsp+96] , rcx            ; load->v12
              mov     qword [rsp+104], r8             ; load->v13
              mov     qword [rsp+112], r9             ; load->v14
              mov     qword [rsp+128], r11            ; load->v15
              mov     rdi            , qword [rsp+240]; load->v30
              call    malloc                          
              mov     qword [rsp+248], rax            ; load->v31
              mov     r11            , qword [rsp+232]; load->v29
              mov     qword [rax]    , r11            
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rdi            , qword [rsp+72] ; load->v9
              mov     rsi            , qword [rsp+80] ; load->v10
              mov     rdx            , qword [rsp+88] ; load->v11
              mov     rcx            , qword [rsp+96] ; load->v12
              mov     r8             , qword [rsp+104]; load->v13
              mov     r9             , qword [rsp+112]; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+128]; load->v16
              mov     r10            , r15            ; load->v32
              mov     r15            , qword [rsp+248]; load->v31
_text__main_for0_init:
              mov     r13            , 0              ; load->v35
              mov     r10            , qword [rsp+288]; load->v36
              mov     qword [rsp+288], r13            ; load->v35
              mov     r10            , qword [rsp+288]; load->v36
              mov     r11            , qword [rsp+160]; load->v20
              cmp     r10            , r11            
              mov     qword [rsp+288], r10            ; save->v36
              mov     r10            , qword [rsp+296]; load->v37
              setl    r10b                            
              mov     qword [rsp+296], r10            ; save->v37
              and     r10            , 15             
              mov     qword [rsp+296], r10            ; save->v37
_text__main_for0_init_check:
              mov     r10            , qword [rsp+296]; load->v37
              cmp     r10b           , 0              
              mov     qword [rsp+296], r10            ; save->v37
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
_text__main_call2:
              mov     qword [rsp+64] , rax            ; load->v8
              mov     qword [rsp+72] , rdi            ; load->v9
              mov     qword [rsp+80] , rsi            ; load->v10
              mov     qword [rsp+88] , rdx            ; load->v11
              mov     qword [rsp+96] , rcx            ; load->v12
              mov     qword [rsp+104], r8             ; load->v13
              mov     qword [rsp+112], r9             ; load->v14
              mov     qword [rsp+128], r11            ; load->v15
              call    _text__getInt                   
              mov     qword [rsp+304], rax            ; load->v38
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rdi            , qword [rsp+72] ; load->v9
              mov     rsi            , qword [rsp+80] ; load->v10
              mov     rdx            , qword [rsp+88] ; load->v11
              mov     rcx            , qword [rsp+96] ; load->v12
              mov     r8             , qword [rsp+104]; load->v13
              mov     r9             , qword [rsp+112]; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+128]; load->v16
              mov     r10            , qword [rsp+288]; load->v39
              mov     qword [rsp+312], r10            ; save->v39
              imul    r10            , 8              
              mov     qword [rsp+312], r10            ; save->v39
              add     r10            , 8              
              mov     qword [rsp+312], r10            ; save->v39
              mov     r11            , rbx            ; load->v24
              add     r10            , r11            
              mov     qword [rsp+312], r10            ; save->v39
              mov     r10            , qword [rsp+320]; load->v40
              mov     r11            , qword [rsp+312]; translate->qword [v39]
              mov     r10            , qword [r11]    
              mov     qword [rsp+320], r10            ; save->v40
              mov     r10            , qword [rsp+312]; translate->qword [v39]
              mov     r11            , qword [rsp+304]; load->v38
              mov     qword [r10]    , r11            ; assign->w[i]
_text__main_call3:
              mov     qword [rsp+64] , rax            ; load->v8
              mov     qword [rsp+72] , rdi            ; load->v9
              mov     qword [rsp+80] , rsi            ; load->v10
              mov     qword [rsp+88] , rdx            ; load->v11
              mov     qword [rsp+96] , rcx            ; load->v12
              mov     qword [rsp+104], r8             ; load->v13
              mov     qword [rsp+112], r9             ; load->v14
              mov     qword [rsp+128], r11            ; load->v15
              call    _text__getInt                   
              mov     qword [rsp+328], rax            ; load->v41
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rdi            , qword [rsp+72] ; load->v9
              mov     rsi            , qword [rsp+80] ; load->v10
              mov     rdx            , qword [rsp+88] ; load->v11
              mov     rcx            , qword [rsp+96] ; load->v12
              mov     r8             , qword [rsp+104]; load->v13
              mov     r9             , qword [rsp+112]; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+128]; load->v16
              mov     r10            , qword [rsp+288]; load->v42
              mov     qword [rsp+336], r10            ; save->v42
              imul    r10            , 8              
              mov     qword [rsp+336], r10            ; save->v42
              add     r10            , 8              
              mov     qword [rsp+336], r10            ; save->v42
              mov     r11            , r14            ; load->v28
              add     r10            , r11            
              mov     qword [rsp+336], r10            ; save->v42
              mov     r10            , qword [rsp+344]; load->v43
              mov     r11            , qword [rsp+336]; translate->qword [v42]
              mov     r10            , qword [r11]    
              mov     qword [rsp+344], r10            ; save->v43
              mov     r10            , qword [rsp+336]; translate->qword [v42]
              mov     r11            , qword [rsp+328]; load->v41
              mov     qword [r10]    , r11            ; assign->t[i]
_text__main_for0_continue:
              mov     qword [rsp+352], 1              ; load->v44
              mov     r10            , qword [rsp+288]; load->v45
              mov     qword [rsp+360], r10            ; save->v45
              mov     r11            , qword [rsp+352]; load->v44
              add     r10            , r11            
              mov     qword [rsp+360], r10            ; save->v45
              mov     qword [rsp+288], r10            ; save->v36
              mov     r11            , qword [rsp+160]; load->v20
              cmp     r10            , r11            
              mov     qword [rsp+288], r10            ; save->v36
              mov     r10            , qword [rsp+368]; load->v46
              setl    r10b                            
              mov     qword [rsp+368], r10            ; save->v46
              and     r10            , 15             
              mov     qword [rsp+368], r10            ; save->v46
              cmp     r10b           , 0              
              mov     qword [rsp+368], r10            ; save->v46
              jne     _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
_text__main_for1_init:
              mov     qword [rsp+376], 0              ; load->v47
              mov     r10            , r13            ; load->v48
              mov     r13            , qword [rsp+376]; load->v47
              mov     r10            , r13            ; load->v48
              mov     r11            , qword [rsp+160]; load->v20
              cmp     r10            , r11            
              mov     r13            , r10            ; save->v48
              mov     r10            , qword [rsp+392]; load->v49
              setl    r10b                            
              mov     qword [rsp+392], r10            ; save->v49
              and     r10            , 15             
              mov     qword [rsp+392], r10            ; save->v49
_text__main_for1_init_check:
              mov     r10            , qword [rsp+392]; load->v49
              cmp     r10b           , 0              
              mov     qword [rsp+392], r10            ; save->v49
              je      _text__main_for1_end                 
;----------------------------------]
;[----------------------------------
_text__main_for1_start:
_text__main_for2_init:
              mov     r10            , qword [rsp+400]; load->v50
              mov     qword [rsp+400], r13            ; load->v48
              mov     r10            , qword [rsp+400]; load->v50
              imul    r10            , 8              
              mov     qword [rsp+400], r10            ; save->v50
              add     r10            , 8              
              mov     qword [rsp+400], r10            ; save->v50
              mov     r11            , r14            ; load->v28
              add     r10            , r11            
              mov     qword [rsp+400], r10            ; save->v50
              mov     r10            , qword [rsp+408]; load->v51
              mov     r11            , qword [rsp+400]; translate->qword [v50]
              mov     r10            , qword [r11]    
              mov     qword [rsp+408], r10            ; save->v51
              mov     qword [rsp+272], r10            ; save->v34
              mov     r11            , r12            ; load->v18
              cmp     r10            , r11            
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+416]; load->v52
              setle   r10b                            
              mov     qword [rsp+416], r10            ; save->v52
              and     r10            , 15             
              mov     qword [rsp+416], r10            ; save->v52
_text__main_for2_init_check:
              mov     r10            , qword [rsp+416]; load->v52
              cmp     r10b           , 0              
              mov     qword [rsp+416], r10            ; save->v52
              je      _text__main_for2_end                 
;----------------------------------]
;[----------------------------------
_text__main_for2_start:
_text__main_if0_init:
              mov     r10            , qword [rsp+272]; load->v53
              mov     qword [rsp+424], r10            ; save->v53
              imul    r10            , 8              
              mov     qword [rsp+424], r10            ; save->v53
              add     r10            , 8              
              mov     qword [rsp+424], r10            ; save->v53
              mov     r11            , r15            ; load->v32
              add     r10            , r11            
              mov     qword [rsp+424], r10            ; save->v53
              mov     r10            , qword [rsp+432]; load->v54
              mov     r11            , qword [rsp+424]; translate->qword [v53]
              mov     r10            , qword [r11]    
              mov     qword [rsp+432], r10            ; save->v54
              mov     r10            , qword [rsp+440]; load->v55
              mov     qword [rsp+440], r13            ; load->v48
              mov     r10            , qword [rsp+440]; load->v55
              imul    r10            , 8              
              mov     qword [rsp+440], r10            ; save->v55
              add     r10            , 8              
              mov     qword [rsp+440], r10            ; save->v55
              mov     r11            , r14            ; load->v28
              add     r10            , r11            
              mov     qword [rsp+440], r10            ; save->v55
              mov     r10            , qword [rsp+448]; load->v56
              mov     r11            , qword [rsp+440]; translate->qword [v55]
              mov     r10            , qword [r11]    
              mov     qword [rsp+448], r10            ; save->v56
              mov     r10            , qword [rsp+272]; load->v57
              mov     qword [rsp+456], r10            ; save->v57
              mov     r11            , qword [rsp+448]; load->v56
              sub     r10            , r11            
              mov     qword [rsp+456], r10            ; save->v57
              mov     qword [rsp+464], r10            ; save->v58
              imul    r10            , 8              
              mov     qword [rsp+464], r10            ; save->v58
              add     r10            , 8              
              mov     qword [rsp+464], r10            ; save->v58
              mov     r11            , r15            ; load->v32
              add     r10            , r11            
              mov     qword [rsp+464], r10            ; save->v58
              mov     r10            , qword [rsp+472]; load->v59
              mov     r11            , qword [rsp+464]; translate->qword [v58]
              mov     r10            , qword [r11]    
              mov     qword [rsp+472], r10            ; save->v59
              mov     r10            , qword [rsp+480]; load->v60
              mov     qword [rsp+480], r13            ; load->v48
              mov     r10            , qword [rsp+480]; load->v60
              imul    r10            , 8              
              mov     qword [rsp+480], r10            ; save->v60
              add     r10            , 8              
              mov     qword [rsp+480], r10            ; save->v60
              mov     r11            , rbx            ; load->v24
              add     r10            , r11            
              mov     qword [rsp+480], r10            ; save->v60
              mov     r10            , qword [rsp+488]; load->v61
              mov     r11            , qword [rsp+480]; translate->qword [v60]
              mov     r10            , qword [r11]    
              mov     qword [rsp+488], r10            ; save->v61
              mov     r10            , qword [rsp+472]; load->v62
              mov     qword [rsp+496], r10            ; save->v62
              mov     r11            , qword [rsp+488]; load->v61
              add     r10            , r11            
              mov     qword [rsp+496], r10            ; save->v62
              mov     r10            , qword [rsp+432]; load->v54
              mov     r11            , qword [rsp+496]; load->v62
              cmp     r10            , r11            
              mov     qword [rsp+432], r10            ; save->v54
              mov     r10            , qword [rsp+504]; load->v63
              setle   r10b                            
              mov     qword [rsp+504], r10            ; save->v63
              and     r10            , 15             
              mov     qword [rsp+504], r10            ; save->v63
_text__main_if0_check:
              mov     r10            , qword [rsp+504]; load->v63
              cmp     r10b           , 0              
              mov     qword [rsp+504], r10            ; save->v63
              je      _text__main_if0_else                 
;----------------------------------]
;[----------------------------------
_text__main_if0_start:
              mov     r10            , qword [rsp+512]; load->v64
              mov     qword [rsp+512], r13            ; load->v48
              mov     r10            , qword [rsp+512]; load->v64
              imul    r10            , 8              
              mov     qword [rsp+512], r10            ; save->v64
              add     r10            , 8              
              mov     qword [rsp+512], r10            ; save->v64
              mov     r11            , r14            ; load->v28
              add     r10            , r11            
              mov     qword [rsp+512], r10            ; save->v64
              mov     r10            , qword [rsp+520]; load->v65
              mov     r11            , qword [rsp+512]; translate->qword [v64]
              mov     r10            , qword [r11]    
              mov     qword [rsp+520], r10            ; save->v65
              mov     r10            , qword [rsp+272]; load->v66
              mov     qword [rsp+528], r10            ; save->v66
              mov     r11            , qword [rsp+520]; load->v65
              sub     r10            , r11            
              mov     qword [rsp+528], r10            ; save->v66
              mov     qword [rsp+536], r10            ; save->v67
              imul    r10            , 8              
              mov     qword [rsp+536], r10            ; save->v67
              add     r10            , 8              
              mov     qword [rsp+536], r10            ; save->v67
              mov     r11            , r15            ; load->v32
              add     r10            , r11            
              mov     qword [rsp+536], r10            ; save->v67
              mov     r10            , qword [rsp+544]; load->v68
              mov     r11            , qword [rsp+536]; translate->qword [v67]
              mov     r10            , qword [r11]    
              mov     qword [rsp+544], r10            ; save->v68
              mov     r10            , qword [rsp+552]; load->v69
              mov     qword [rsp+552], r13            ; load->v48
              mov     r10            , qword [rsp+552]; load->v69
              imul    r10            , 8              
              mov     qword [rsp+552], r10            ; save->v69
              add     r10            , 8              
              mov     qword [rsp+552], r10            ; save->v69
              mov     r11            , rbx            ; load->v24
              add     r10            , r11            
              mov     qword [rsp+552], r10            ; save->v69
              mov     r10            , qword [rsp+560]; load->v70
              mov     r11            , qword [rsp+552]; translate->qword [v69]
              mov     r10            , qword [r11]    
              mov     qword [rsp+560], r10            ; save->v70
              mov     r10            , qword [rsp+544]; load->v71
              mov     qword [rsp+568], r10            ; save->v71
              mov     r11            , qword [rsp+560]; load->v70
              add     r10            , r11            
              mov     qword [rsp+568], r10            ; save->v71
              mov     r10            , qword [rsp+272]; load->v72
              mov     qword [rsp+576], r10            ; save->v72
              imul    r10            , 8              
              mov     qword [rsp+576], r10            ; save->v72
              add     r10            , 8              
              mov     qword [rsp+576], r10            ; save->v72
              mov     r11            , r15            ; load->v32
              add     r10            , r11            
              mov     qword [rsp+576], r10            ; save->v72
              mov     r10            , qword [rsp+584]; load->v73
              mov     r11            , qword [rsp+576]; translate->qword [v72]
              mov     r10            , qword [r11]    
              mov     qword [rsp+584], r10            ; save->v73
              mov     r10            , qword [rsp+576]; translate->qword [v72]
              mov     r11            , qword [rsp+568]; load->v71
              mov     qword [r10]    , r11            ; assign->DP[j]
              jmp     _text__main_if0_end                 
;----------------------------------]
;[----------------------------------
_text__main_if0_else:
_text__main_if0_end:
_text__main_for2_continue:
              mov     qword [rsp+592], 1              ; load->v74
              mov     r10            , qword [rsp+272]; load->v75
              mov     qword [rsp+600], r10            ; save->v75
              mov     r11            , qword [rsp+592]; load->v74
              add     r10            , r11            
              mov     qword [rsp+600], r10            ; save->v75
              mov     qword [rsp+272], r10            ; save->v34
              mov     r11            , r12            ; load->v18
              cmp     r10            , r11            
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+608]; load->v76
              setle   r10b                            
              mov     qword [rsp+608], r10            ; save->v76
              and     r10            , 15             
              mov     qword [rsp+608], r10            ; save->v76
              cmp     r10b           , 0              
              mov     qword [rsp+608], r10            ; save->v76
              jne     _text__main_for2_start                 
;----------------------------------]
;[----------------------------------
_text__main_for2_end:
_text__main_for1_continue:
              mov     qword [rsp+616], 1              ; load->v77
              mov     r10            , qword [rsp+624]; load->v78
              mov     qword [rsp+624], r13            ; load->v48
              mov     r10            , qword [rsp+624]; load->v78
              mov     r11            , qword [rsp+616]; load->v77
              add     r10            , r11            
              mov     qword [rsp+624], r10            ; save->v78
              mov     r10            , r13            ; load->v48
              mov     r13            , qword [rsp+624]; load->v78
              mov     r10            , r13            ; load->v48
              mov     r11            , qword [rsp+160]; load->v20
              cmp     r10            , r11            
              mov     r13            , r10            ; save->v48
              mov     r10            , qword [rsp+632]; load->v79
              setl    r10b                            
              mov     qword [rsp+632], r10            ; save->v79
              and     r10            , 15             
              mov     qword [rsp+632], r10            ; save->v79
              cmp     r10b           , 0              
              mov     qword [rsp+632], r10            ; save->v79
              jne     _text__main_for1_start                 
;----------------------------------]
;[----------------------------------
_text__main_for1_end:
              mov     r10            , rbx            ; load->v80
              mov     rbx            , r12            ; load->v18
              mov     r10            , rbx            ; load->v80
              imul    r10            , 8              
              mov     rbx            , r10            ; save->v80
              add     r10            , 8              
              mov     rbx            , r10            ; save->v80
              mov     r11            , r15            ; load->v32
              add     r10            , r11            
              mov     rbx            , r10            ; save->v80
              mov     r10            , r13            ; load->v81
              mov     r11            , rbx            ; translate->qword [v80]
              mov     r13            , qword [r11]    
_text__main_call4:
              mov     rdi            , r13            ; load->v81
              mov     qword [rsp+64] , rax            ; load->v8
              mov     qword [rsp+72] , rdi            ; load->v9
              mov     qword [rsp+80] , rsi            ; load->v10
              mov     qword [rsp+88] , rdx            ; load->v11
              mov     qword [rsp+96] , rcx            ; load->v12
              mov     qword [rsp+104], r8             ; load->v13
              mov     qword [rsp+112], r9             ; load->v14
              mov     qword [rsp+128], r11            ; load->v15
              call    _text__toString                 
              mov     rbx            , rax            ; load->v82
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rdi            , qword [rsp+72] ; load->v9
              mov     rsi            , qword [rsp+80] ; load->v10
              mov     rdx            , qword [rsp+88] ; load->v11
              mov     rcx            , qword [rsp+96] ; load->v12
              mov     r8             , qword [rsp+104]; load->v13
              mov     r9             , qword [rsp+112]; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+128]; load->v16
_text__main_call5:
              mov     rdi            , rbx            ; load->v82
              mov     qword [rsp+64] , rax            ; load->v8
              mov     qword [rsp+72] , rdi            ; load->v9
              mov     qword [rsp+80] , rsi            ; load->v10
              mov     qword [rsp+88] , rdx            ; load->v11
              mov     qword [rsp+96] , rcx            ; load->v12
              mov     qword [rsp+104], r8             ; load->v13
              mov     qword [rsp+112], r9             ; load->v14
              mov     qword [rsp+128], r11            ; load->v15
              call    _text__print                    
              mov     rbx            , rax            ; load->v83
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rdi            , qword [rsp+72] ; load->v9
              mov     rsi            , qword [rsp+80] ; load->v10
              mov     rdx            , qword [rsp+88] ; load->v11
              mov     rcx            , qword [rsp+96] ; load->v12
              mov     r8             , qword [rsp+104]; load->v13
              mov     r9             , qword [rsp+112]; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+128]; load->v16
              mov     rbx            , 0              ; load->v84
_text__main_ret0:
              mov     rax            , rbx            ; load->v84
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 680            
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
              add     rsp            , 680            
              ret                                     
;----------------------------------]
                                                      
