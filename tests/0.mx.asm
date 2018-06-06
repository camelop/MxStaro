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
                                                      
; --- [ _text__p ] ---
;[----------------------------------
_text__p:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     qword [rsp+48] , rdi            ; null; save->v6
              mov     rbp            , qword [rsp+48] ; load->v6; null; save->v7
              mov     r10            , rbp            ; load->v7
              sub     r10            , 1              
              mov     rbp            , r10            ; save->v7
              mov     rbx            , rdx            ; null; save->v9
              mov     r12            , rax            ; null; save->v10
              mov     rax            , qword [rsp+48] ; load->v6; null
              and     rax            , -1             
              mov     r10            , rbp            ; load->v7
              and     r10d           , -1             
              mov     rbp            , r10            ; save->v7
              cqo                                     
              mov     r10            , rbp            ; load->v7
              idiv    r10d                            
              mov     rbp            , rdx            ; save->v7; null; save->v8
              mov     rdx            , rbx            ; load->v9; null
              mov     rax            , r12            ; load->v10; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v11
              mov     r10            , rbx            ; load->v11
              sub     r10            , 2              
              mov     rbx            , r10            ; save->v11
              mov     r12            , rdx            ; null; save->v13
              mov     r13            , rax            ; null; save->v14
              mov     rax            , rbp            ; load->v8; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v11
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v11
              cqo                                     
              mov     r10            , rbx            ; load->v11
              idiv    r10d                            
              mov     rbx            , r10            ; save->v11
              mov     rbp            , rdx            ; null; save->v12
              mov     rdx            , r12            ; load->v13; null
              mov     rax            , r13            ; load->v14; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v15
              mov     r10            , rbx            ; load->v15
              sub     r10            , 3              
              mov     rbx            , r10            ; save->v15
              mov     r12            , rdx            ; null; save->v17
              mov     r13            , rax            ; null; save->v18
              mov     rax            , rbp            ; load->v12; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v15
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v15
              cqo                                     
              mov     r10            , rbx            ; load->v15
              idiv    r10d                            
              mov     rbx            , r10            ; save->v15
              mov     rbp            , rdx            ; null; save->v16
              mov     rdx            , r12            ; load->v17; null
              mov     rax            , r13            ; load->v18; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v19
              mov     r10            , rbx            ; load->v19
              sub     r10            , 4              
              mov     rbx            , r10            ; save->v19
              mov     r12            , rdx            ; null; save->v21
              mov     r13            , rax            ; null; save->v22
              mov     rax            , rbp            ; load->v16; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v19
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v19
              cqo                                     
              mov     r10            , rbx            ; load->v19
              idiv    r10d                            
              mov     rbx            , r10            ; save->v19
              mov     rbp            , rdx            ; null; save->v20
              mov     rdx            , r12            ; load->v21; null
              mov     rax            , r13            ; load->v22; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v23
              mov     r10            , rbx            ; load->v23
              sub     r10            , 5              
              mov     rbx            , r10            ; save->v23
              mov     r12            , rdx            ; null; save->v25
              mov     r13            , rax            ; null; save->v26
              mov     rax            , rbp            ; load->v20; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v23
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v23
              cqo                                     
              mov     r10            , rbx            ; load->v23
              idiv    r10d                            
              mov     rbx            , r10            ; save->v23
              mov     rbp            , rdx            ; null; save->v24
              mov     rdx            , r12            ; load->v25; null
              mov     rax            , r13            ; load->v26; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v27
              mov     r10            , rbx            ; load->v27
              sub     r10            , 6              
              mov     rbx            , r10            ; save->v27
              mov     r12            , rdx            ; null; save->v29
              mov     r13            , rax            ; null; save->v30
              mov     rax            , rbp            ; load->v24; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v27
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v27
              cqo                                     
              mov     r10            , rbx            ; load->v27
              idiv    r10d                            
              mov     rbx            , r10            ; save->v27
              mov     rbp            , rdx            ; null; save->v28
              mov     rdx            , r12            ; load->v29; null
              mov     rax            , r13            ; load->v30; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v31
              mov     r10            , rbx            ; load->v31
              sub     r10            , 7              
              mov     rbx            , r10            ; save->v31
              mov     r12            , rdx            ; null; save->v33
              mov     r13            , rax            ; null; save->v34
              mov     rax            , rbp            ; load->v28; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v31
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v31
              cqo                                     
              mov     r10            , rbx            ; load->v31
              idiv    r10d                            
              mov     rbx            , r10            ; save->v31
              mov     rbp            , rdx            ; null; save->v32
              mov     rdx            , r12            ; load->v33; null
              mov     rax            , r13            ; load->v34; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v35
              mov     r10            , rbx            ; load->v35
              sub     r10            , 8              
              mov     rbx            , r10            ; save->v35
              mov     r12            , rdx            ; null; save->v37
              mov     r13            , rax            ; null; save->v38
              mov     rax            , rbp            ; load->v32; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v35
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v35
              cqo                                     
              mov     r10            , rbx            ; load->v35
              idiv    r10d                            
              mov     rbx            , r10            ; save->v35
              mov     rbp            , rdx            ; null; save->v36
              mov     rdx            , r12            ; load->v37; null
              mov     rax            , r13            ; load->v38; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v39
              mov     r10            , rbx            ; load->v39
              sub     r10            , 9              
              mov     rbx            , r10            ; save->v39
              mov     r12            , rdx            ; null; save->v41
              mov     r13            , rax            ; null; save->v42
              mov     rax            , rbp            ; load->v36; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v39
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v39
              cqo                                     
              mov     r10            , rbx            ; load->v39
              idiv    r10d                            
              mov     rbx            , r10            ; save->v39
              mov     rbp            , rdx            ; null; save->v40
              mov     rdx            , r12            ; load->v41; null
              mov     rax            , r13            ; load->v42; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v43
              mov     r10            , rbx            ; load->v43
              sub     r10            , 10             
              mov     rbx            , r10            ; save->v43
              mov     r12            , rdx            ; null; save->v45
              mov     r13            , rax            ; null; save->v46
              mov     rax            , rbp            ; load->v40; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v43
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v43
              cqo                                     
              mov     r10            , rbx            ; load->v43
              idiv    r10d                            
              mov     rbx            , r10            ; save->v43
              mov     rbp            , rdx            ; null; save->v44
              mov     rdx            , r12            ; load->v45; null
              mov     rax            , r13            ; load->v46; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v47
              mov     r10            , rbx            ; load->v47
              sub     r10            , 11             
              mov     rbx            , r10            ; save->v47
              mov     r12            , rdx            ; null; save->v49
              mov     r13            , rax            ; null; save->v50
              mov     rax            , rbp            ; load->v44; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v47
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v47
              cqo                                     
              mov     r10            , rbx            ; load->v47
              idiv    r10d                            
              mov     rbx            , r10            ; save->v47
              mov     rbp            , rdx            ; null; save->v48
              mov     rdx            , r12            ; load->v49; null
              mov     rax            , r13            ; load->v50; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v51
              mov     r10            , rbx            ; load->v51
              sub     r10            , 12             
              mov     rbx            , r10            ; save->v51
              mov     r12            , rdx            ; null; save->v53
              mov     r13            , rax            ; null; save->v54
              mov     rax            , rbp            ; load->v48; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v51
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v51
              cqo                                     
              mov     r10            , rbx            ; load->v51
              idiv    r10d                            
              mov     rbx            , r10            ; save->v51
              mov     rbp            , rdx            ; null; save->v52
              mov     rdx            , r12            ; load->v53; null
              mov     rax            , r13            ; load->v54; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v55
              mov     r10            , rbx            ; load->v55
              sub     r10            , 13             
              mov     rbx            , r10            ; save->v55
              mov     r12            , rdx            ; null; save->v57
              mov     r13            , rax            ; null; save->v58
              mov     rax            , rbp            ; load->v52; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v55
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v55
              cqo                                     
              mov     r10            , rbx            ; load->v55
              idiv    r10d                            
              mov     rbx            , r10            ; save->v55
              mov     rbp            , rdx            ; null; save->v56
              mov     rdx            , r12            ; load->v57; null
              mov     rax            , r13            ; load->v58; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v59
              mov     r10            , rbx            ; load->v59
              sub     r10            , 14             
              mov     rbx            , r10            ; save->v59
              mov     r12            , rdx            ; null; save->v61
              mov     r13            , rax            ; null; save->v62
              mov     rax            , rbp            ; load->v56; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v59
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v59
              cqo                                     
              mov     r10            , rbx            ; load->v59
              idiv    r10d                            
              mov     rbx            , r10            ; save->v59
              mov     rbp            , rdx            ; null; save->v60
              mov     rdx            , r12            ; load->v61; null
              mov     rax            , r13            ; load->v62; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v63
              mov     r10            , rbx            ; load->v63
              sub     r10            , 15             
              mov     rbx            , r10            ; save->v63
              mov     r12            , rdx            ; null; save->v65
              mov     r13            , rax            ; null; save->v66
              mov     rax            , rbp            ; load->v60; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v63
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v63
              cqo                                     
              mov     r10            , rbx            ; load->v63
              idiv    r10d                            
              mov     rbx            , r10            ; save->v63
              mov     rbp            , rdx            ; null; save->v64
              mov     rdx            , r12            ; load->v65; null
              mov     rax            , r13            ; load->v66; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v67
              mov     r10            , rbx            ; load->v67
              sub     r10            , 16             
              mov     rbx            , r10            ; save->v67
              mov     r12            , rdx            ; null; save->v69
              mov     r13            , rax            ; null; save->v70
              mov     rax            , rbp            ; load->v64; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v67
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v67
              cqo                                     
              mov     r10            , rbx            ; load->v67
              idiv    r10d                            
              mov     rbx            , r10            ; save->v67
              mov     rbp            , rdx            ; null; save->v68
              mov     rdx            , r12            ; load->v69; null
              mov     rax            , r13            ; load->v70; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v71
              mov     r10            , rbx            ; load->v71
              sub     r10            , 17             
              mov     rbx            , r10            ; save->v71
              mov     r12            , rdx            ; null; save->v73
              mov     r13            , rax            ; null; save->v74
              mov     rax            , rbp            ; load->v68; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v71
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v71
              cqo                                     
              mov     r10            , rbx            ; load->v71
              idiv    r10d                            
              mov     rbx            , r10            ; save->v71
              mov     rbp            , rdx            ; null; save->v72
              mov     rdx            , r12            ; load->v73; null
              mov     rax            , r13            ; load->v74; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v75
              mov     r10            , rbx            ; load->v75
              sub     r10            , 18             
              mov     rbx            , r10            ; save->v75
              mov     r12            , rdx            ; null; save->v77
              mov     r13            , rax            ; null; save->v78
              mov     rax            , rbp            ; load->v72; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v75
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v75
              cqo                                     
              mov     r10            , rbx            ; load->v75
              idiv    r10d                            
              mov     rbx            , r10            ; save->v75
              mov     rbp            , rdx            ; null; save->v76
              mov     rdx            , r12            ; load->v77; null
              mov     rax            , r13            ; load->v78; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v79
              mov     r10            , rbx            ; load->v79
              sub     r10            , 19             
              mov     rbx            , r10            ; save->v79
              mov     r12            , rdx            ; null; save->v81
              mov     r13            , rax            ; null; save->v82
              mov     rax            , rbp            ; load->v76; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v79
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v79
              cqo                                     
              mov     r10            , rbx            ; load->v79
              idiv    r10d                            
              mov     rbx            , r10            ; save->v79
              mov     rbp            , rdx            ; null; save->v80
              mov     rdx            , r12            ; load->v81; null
              mov     rax            , r13            ; load->v82; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v83
              mov     r10            , rbx            ; load->v83
              sub     r10            , 20             
              mov     rbx            , r10            ; save->v83
              mov     r12            , rdx            ; null; save->v85
              mov     r13            , rax            ; null; save->v86
              mov     rax            , rbp            ; load->v80; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v83
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v83
              cqo                                     
              mov     r10            , rbx            ; load->v83
              idiv    r10d                            
              mov     rbx            , r10            ; save->v83
              mov     rbp            , rdx            ; null; save->v84
              mov     rdx            , r12            ; load->v85; null
              mov     rax            , r13            ; load->v86; null
_text__p_ret0:
              mov     rax            , rbp            ; load->v84; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__h ] ---
;[----------------------------------
_text__h:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     qword [rsp+48] , rdi            ; null; save->v6
              mov     rbp            , qword [rsp+48] ; load->v6; null; save->v7
              mov     r10            , rbp            ; load->v7
              sub     r10            , 1              
              mov     rbp            , r10            ; save->v7
              mov     rbx            , rdx            ; null; save->v9
              mov     r12            , rax            ; null; save->v10
              mov     rax            , qword [rsp+48] ; load->v6; null
              and     rax            , -1             
              mov     r10            , rbp            ; load->v7
              and     r10d           , -1             
              mov     rbp            , r10            ; save->v7
              cqo                                     
              mov     r10            , rbp            ; load->v7
              idiv    r10d                            
              mov     rbp            , rdx            ; save->v7; null; save->v8
              mov     rdx            , rbx            ; load->v9; null
              mov     rax            , r12            ; load->v10; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v11
              mov     r10            , rbx            ; load->v11
              sub     r10            , 2              
              mov     rbx            , r10            ; save->v11
              mov     r12            , rdx            ; null; save->v13
              mov     r13            , rax            ; null; save->v14
              mov     rax            , rbp            ; load->v8; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v11
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v11
              cqo                                     
              mov     r10            , rbx            ; load->v11
              idiv    r10d                            
              mov     rbx            , r10            ; save->v11
              mov     rbp            , rdx            ; null; save->v12
              mov     rdx            , r12            ; load->v13; null
              mov     rax            , r13            ; load->v14; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v15
              mov     r10            , rbx            ; load->v15
              sub     r10            , 3              
              mov     rbx            , r10            ; save->v15
              mov     r12            , rdx            ; null; save->v17
              mov     r13            , rax            ; null; save->v18
              mov     rax            , rbp            ; load->v12; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v15
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v15
              cqo                                     
              mov     r10            , rbx            ; load->v15
              idiv    r10d                            
              mov     rbx            , r10            ; save->v15
              mov     rbp            , rdx            ; null; save->v16
              mov     rdx            , r12            ; load->v17; null
              mov     rax            , r13            ; load->v18; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v19
              mov     r10            , rbx            ; load->v19
              sub     r10            , 4              
              mov     rbx            , r10            ; save->v19
              mov     r12            , rdx            ; null; save->v21
              mov     r13            , rax            ; null; save->v22
              mov     rax            , rbp            ; load->v16; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v19
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v19
              cqo                                     
              mov     r10            , rbx            ; load->v19
              idiv    r10d                            
              mov     rbx            , r10            ; save->v19
              mov     rbp            , rdx            ; null; save->v20
              mov     rdx            , r12            ; load->v21; null
              mov     rax            , r13            ; load->v22; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v23
              mov     r10            , rbx            ; load->v23
              sub     r10            , 5              
              mov     rbx            , r10            ; save->v23
              mov     r12            , rdx            ; null; save->v25
              mov     r13            , rax            ; null; save->v26
              mov     rax            , rbp            ; load->v20; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v23
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v23
              cqo                                     
              mov     r10            , rbx            ; load->v23
              idiv    r10d                            
              mov     rbx            , r10            ; save->v23
              mov     rbp            , rdx            ; null; save->v24
              mov     rdx            , r12            ; load->v25; null
              mov     rax            , r13            ; load->v26; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v27
              mov     r10            , rbx            ; load->v27
              sub     r10            , 6              
              mov     rbx            , r10            ; save->v27
              mov     r12            , rdx            ; null; save->v29
              mov     r13            , rax            ; null; save->v30
              mov     rax            , rbp            ; load->v24; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v27
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v27
              cqo                                     
              mov     r10            , rbx            ; load->v27
              idiv    r10d                            
              mov     rbx            , r10            ; save->v27
              mov     rbp            , rdx            ; null; save->v28
              mov     rdx            , r12            ; load->v29; null
              mov     rax            , r13            ; load->v30; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v31
              mov     r10            , rbx            ; load->v31
              sub     r10            , 7              
              mov     rbx            , r10            ; save->v31
              mov     r12            , rdx            ; null; save->v33
              mov     r13            , rax            ; null; save->v34
              mov     rax            , rbp            ; load->v28; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v31
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v31
              cqo                                     
              mov     r10            , rbx            ; load->v31
              idiv    r10d                            
              mov     rbx            , r10            ; save->v31
              mov     rbp            , rdx            ; null; save->v32
              mov     rdx            , r12            ; load->v33; null
              mov     rax            , r13            ; load->v34; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v35
              mov     r10            , rbx            ; load->v35
              sub     r10            , 8              
              mov     rbx            , r10            ; save->v35
              mov     r12            , rdx            ; null; save->v37
              mov     r13            , rax            ; null; save->v38
              mov     rax            , rbp            ; load->v32; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v35
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v35
              cqo                                     
              mov     r10            , rbx            ; load->v35
              idiv    r10d                            
              mov     rbx            , r10            ; save->v35
              mov     rbp            , rdx            ; null; save->v36
              mov     rdx            , r12            ; load->v37; null
              mov     rax            , r13            ; load->v38; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v39
              mov     r10            , rbx            ; load->v39
              sub     r10            , 9              
              mov     rbx            , r10            ; save->v39
              mov     r12            , rdx            ; null; save->v41
              mov     r13            , rax            ; null; save->v42
              mov     rax            , rbp            ; load->v36; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v39
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v39
              cqo                                     
              mov     r10            , rbx            ; load->v39
              idiv    r10d                            
              mov     rbx            , r10            ; save->v39
              mov     rbp            , rdx            ; null; save->v40
              mov     rdx            , r12            ; load->v41; null
              mov     rax            , r13            ; load->v42; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v43
              mov     r10            , rbx            ; load->v43
              sub     r10            , 10             
              mov     rbx            , r10            ; save->v43
              mov     r12            , rdx            ; null; save->v45
              mov     r13            , rax            ; null; save->v46
              mov     rax            , rbp            ; load->v40; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v43
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v43
              cqo                                     
              mov     r10            , rbx            ; load->v43
              idiv    r10d                            
              mov     rbx            , r10            ; save->v43
              mov     rbp            , rdx            ; null; save->v44
              mov     rdx            , r12            ; load->v45; null
              mov     rax            , r13            ; load->v46; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v47
              mov     r10            , rbx            ; load->v47
              sub     r10            , 11             
              mov     rbx            , r10            ; save->v47
              mov     r12            , rdx            ; null; save->v49
              mov     r13            , rax            ; null; save->v50
              mov     rax            , rbp            ; load->v44; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v47
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v47
              cqo                                     
              mov     r10            , rbx            ; load->v47
              idiv    r10d                            
              mov     rbx            , r10            ; save->v47
              mov     rbp            , rdx            ; null; save->v48
              mov     rdx            , r12            ; load->v49; null
              mov     rax            , r13            ; load->v50; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v51
              mov     r10            , rbx            ; load->v51
              sub     r10            , 12             
              mov     rbx            , r10            ; save->v51
              mov     r12            , rdx            ; null; save->v53
              mov     r13            , rax            ; null; save->v54
              mov     rax            , rbp            ; load->v48; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v51
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v51
              cqo                                     
              mov     r10            , rbx            ; load->v51
              idiv    r10d                            
              mov     rbx            , r10            ; save->v51
              mov     rbp            , rdx            ; null; save->v52
              mov     rdx            , r12            ; load->v53; null
              mov     rax            , r13            ; load->v54; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v55
              mov     r10            , rbx            ; load->v55
              sub     r10            , 13             
              mov     rbx            , r10            ; save->v55
              mov     r12            , rdx            ; null; save->v57
              mov     r13            , rax            ; null; save->v58
              mov     rax            , rbp            ; load->v52; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v55
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v55
              cqo                                     
              mov     r10            , rbx            ; load->v55
              idiv    r10d                            
              mov     rbx            , r10            ; save->v55
              mov     rbp            , rdx            ; null; save->v56
              mov     rdx            , r12            ; load->v57; null
              mov     rax            , r13            ; load->v58; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v59
              mov     r10            , rbx            ; load->v59
              sub     r10            , 14             
              mov     rbx            , r10            ; save->v59
              mov     r12            , rdx            ; null; save->v61
              mov     r13            , rax            ; null; save->v62
              mov     rax            , rbp            ; load->v56; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v59
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v59
              cqo                                     
              mov     r10            , rbx            ; load->v59
              idiv    r10d                            
              mov     rbx            , r10            ; save->v59
              mov     rbp            , rdx            ; null; save->v60
              mov     rdx            , r12            ; load->v61; null
              mov     rax            , r13            ; load->v62; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v63
              mov     r10            , rbx            ; load->v63
              sub     r10            , 15             
              mov     rbx            , r10            ; save->v63
              mov     r12            , rdx            ; null; save->v65
              mov     r13            , rax            ; null; save->v66
              mov     rax            , rbp            ; load->v60; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v63
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v63
              cqo                                     
              mov     r10            , rbx            ; load->v63
              idiv    r10d                            
              mov     rbx            , r10            ; save->v63
              mov     rbp            , rdx            ; null; save->v64
              mov     rdx            , r12            ; load->v65; null
              mov     rax            , r13            ; load->v66; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v67
              mov     r10            , rbx            ; load->v67
              sub     r10            , 16             
              mov     rbx            , r10            ; save->v67
              mov     r12            , rdx            ; null; save->v69
              mov     r13            , rax            ; null; save->v70
              mov     rax            , rbp            ; load->v64; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v67
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v67
              cqo                                     
              mov     r10            , rbx            ; load->v67
              idiv    r10d                            
              mov     rbx            , r10            ; save->v67
              mov     rbp            , rdx            ; null; save->v68
              mov     rdx            , r12            ; load->v69; null
              mov     rax            , r13            ; load->v70; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v71
              mov     r10            , rbx            ; load->v71
              sub     r10            , 17             
              mov     rbx            , r10            ; save->v71
              mov     r12            , rdx            ; null; save->v73
              mov     r13            , rax            ; null; save->v74
              mov     rax            , rbp            ; load->v68; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v71
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v71
              cqo                                     
              mov     r10            , rbx            ; load->v71
              idiv    r10d                            
              mov     rbx            , r10            ; save->v71
              mov     rbp            , rdx            ; null; save->v72
              mov     rdx            , r12            ; load->v73; null
              mov     rax            , r13            ; load->v74; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v75
              mov     r10            , rbx            ; load->v75
              sub     r10            , 18             
              mov     rbx            , r10            ; save->v75
              mov     r12            , rdx            ; null; save->v77
              mov     r13            , rax            ; null; save->v78
              mov     rax            , rbp            ; load->v72; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v75
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v75
              cqo                                     
              mov     r10            , rbx            ; load->v75
              idiv    r10d                            
              mov     rbx            , r10            ; save->v75
              mov     rbp            , rdx            ; null; save->v76
              mov     rdx            , r12            ; load->v77; null
              mov     rax            , r13            ; load->v78; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v79
              mov     r10            , rbx            ; load->v79
              sub     r10            , 19             
              mov     rbx            , r10            ; save->v79
              mov     r12            , rdx            ; null; save->v81
              mov     r13            , rax            ; null; save->v82
              mov     rax            , rbp            ; load->v76; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v79
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v79
              cqo                                     
              mov     r10            , rbx            ; load->v79
              idiv    r10d                            
              mov     rbx            , r10            ; save->v79
              mov     rbp            , rdx            ; null; save->v80
              mov     rdx            , r12            ; load->v81; null
              mov     rax            , r13            ; load->v82; null
              mov     rbx            , qword [rsp+48] ; load->v6; null; save->v83
              mov     r10            , rbx            ; load->v83
              sub     r10            , 20             
              mov     rbx            , r10            ; save->v83
              mov     r12            , rdx            ; null; save->v85
              mov     r13            , rax            ; null; save->v86
              mov     rax            , rbp            ; load->v80; null
              and     rax            , -1             
              mov     r10            , rbx            ; load->v83
              and     r10d           , -1             
              mov     rbx            , r10            ; save->v83
              cqo                                     
              mov     r10            , rbx            ; load->v83
              idiv    r10d                            
              mov     rbx            , r10            ; save->v83
              mov     rbp            , rdx            ; null; save->v84
              mov     rdx            , r12            ; load->v85; null
              mov     rax            , r13            ; load->v86; null
_text__h_ret0:
              mov     rax            , rbp            ; load->v84; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__g ] ---
;[----------------------------------
_text__g:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     qword [rsp+48] , rdi            ; null; save->v6
_text__g_call0:
              mov     rdi            , qword [rsp+48] ; load->v6; null
              call    _text__p                        
              mov     rbp            , rax            ; null; save->v7
_text__g_ret0:
              mov     rax            , rbp            ; load->v7; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__f ] ---
;[----------------------------------
_text__f:
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     qword [rsp+48] , rdi            ; null; save->v6
_text__f_call0:
              mov     rdi            , qword [rsp+48] ; load->v6; null
              call    _text__h                        
              mov     rbp            , rax            ; null; save->v7
_text__f_ret0:
              mov     rax            , rbp            ; load->v7; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 408            
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
              mov     rbp            , 0              ; null; save->v6
              mov     qword [rsp+48] , rbp            ; load->v6; init->l1; save->v7
              mov     r10            , qword [rsp+48] ; load->v7; init->l2
              mov     qword [rsp+56] , r10            ; save->v8; load->v8; init->l3
              mov     qword [rsp+64] , r10            ; save->v9; load->v9; init->l4
              mov     qword [rsp+72] , r10            ; save->v10; load->v10; init->l5
              mov     qword [rsp+80] , r10            ; save->v11; load->v11; init->l6
              mov     qword [rsp+88] , r10            ; save->v12; load->v12; init->l7
              mov     qword [rsp+96] , r10            ; save->v13; load->v13; init->l8
              mov     qword [rsp+104], r10            ; save->v14; load->v14; init->l9
              mov     qword [rsp+112], r10            ; save->v15
_text__main_call0:
              call    _text__getInt                   
              mov     rbp            , rax            ; null; save->v19
              mov     qword [rsp+144], rbp            ; load->v19; init->T; save->v20
              mov     rbp            , 0              ; null; save->v21
              mov     qword [rsp+152], rbp            ; load->v21; init->ans; save->v22
              mov     rbp            , 0              ; null; save->v23
              mov     qword [rsp+160], rbp            ; load->v23; init->l10; save->v24
              mov     r10            , qword [rsp+160]; load->v24; init->l11
              mov     qword [rsp+168], r10            ; save->v25; load->v25; init->l12
              mov     qword [rsp+176], r10            ; save->v26; load->v26; init->l13
              mov     qword [rsp+184], r10            ; save->v27; load->v27; init->l14
              mov     qword [rsp+192], r10            ; save->v28; load->v28; init->l15
              mov     qword [rsp+200], r10            ; save->v29; load->v29; init->l16
              mov     qword [rsp+208], r10            ; save->v30; load->v30; init->l17
              mov     qword [rsp+216], r10            ; save->v31; load->v31; init->l18
              mov     qword [rsp+224], r10            ; save->v32; load->v32; init->l19
              mov     qword [rsp+232], r10            ; save->v33; load->v33; init->l20
              mov     qword [rsp+240], r10            ; save->v34
_text__main_for0_init:
              mov     rbp            , 0              ; null; save->v35
              mov     qword [rsp+120], rbp            ; load->v35; assign->i; save->v16
              mov     r10            , qword [rsp+120]; load->v16
              mov     r11            , qword [rsp+144]; load->v20
              cmp     r10d           , r11d           
              mov     qword [rsp+120], r10            ; save->v16
              mov     r10            , rbp            ; load->v36
              setl    r10b                            
              mov     rbp            , r10            ; save->v36; load->v36
              and     r10            , 255            
              mov     rbp            , r10            ; save->v36
_text__main_for0_init_check:
              mov     r10            , rbp            ; load->v36
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v36
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
_text__main_for1_init:
              mov     rbp            , 0              ; null; save->v37
              mov     qword [rsp+128], rbp            ; load->v37; assign->j; save->v17
              mov     r10            , qword [rsp+128]; load->v17
              mov     r11            , qword [rsp+144]; load->v20
              cmp     r10d           , r11d           
              mov     qword [rsp+128], r10            ; save->v17
              mov     r10            , rbp            ; load->v38
              setl    r10b                            
              mov     rbp            , r10            ; save->v38; load->v38
              and     r10            , 255            
              mov     rbp            , r10            ; save->v38
_text__main_for1_init_check:
              mov     r10            , rbp            ; load->v38
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v38
              je      _text__main_for1_end                 
;----------------------------------]
;[----------------------------------
_text__main_for1_start:
_text__main_for2_init:
              mov     rbp            , 0              ; null; save->v39
              mov     qword [rsp+136], rbp            ; load->v39; assign->k; save->v18
              mov     r10            , qword [rsp+136]; load->v18
              mov     r11            , qword [rsp+144]; load->v20
              cmp     r10d           , r11d           
              mov     qword [rsp+136], r10            ; save->v18
              mov     r10            , rbp            ; load->v40
              setl    r10b                            
              mov     rbp            , r10            ; save->v40; load->v40
              and     r10            , 255            
              mov     rbp            , r10            ; save->v40
_text__main_for2_init_check:
              mov     r10            , rbp            ; load->v40
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v40
              je      _text__main_for2_end                 
;----------------------------------]
;[----------------------------------
_text__main_for2_start:
_text__main_or0_lvalue:
              mov     qword [rsp+248], 255            ; null; save->v41
_text__main_and0_lvalue:
              mov     rbx            , 0              ; null; save->v42
              mov     r12            , 0              ; null; save->v43
              mov     r10            , qword [rsp+120]; load->v16
              mov     r11            , r12            ; load->v43
              cmp     r10d           , r11d           
              mov     qword [rsp+120], r10            ; save->v16
              mov     r10            , r12            ; load->v44
              setg    r10b                            
              mov     r12            , r10            ; save->v44; load->v44
              and     r10            , 255            
              mov     r12            , r10            ; save->v44; load->v44
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v44
              je      _text__main_and0_end                 
;----------------------------------]
;[----------------------------------
_text__main_and0_rvalue:
              mov     r12            , 199            ; null; save->v45
              mov     r13            , rdx            ; null; save->v47
              mov     r14            , rax            ; null; save->v48
              mov     rax            , qword [rsp+120]; load->v16; null
              and     rax            , -1             
              mov     r10            , r12            ; load->v45
              and     r10d           , -1             
              mov     r12            , r10            ; save->v45
              cqo                                     
              mov     r10            , r12            ; load->v45
              idiv    r10d                            
              mov     r12            , rdx            ; save->v45; null; save->v46
              mov     rdx            , r13            ; load->v47; null
              mov     rax            , r14            ; load->v48; null
              mov     r13            , 0              ; null; save->v49
              mov     r10            , r12            ; load->v46
              mov     r11            , r13            ; load->v49
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v46; load->v50
              sete    r10b                            
              mov     r12            , r10            ; save->v50; load->v50
              and     r10            , 255            
              mov     r12            , r10            ; save->v50; load->v50
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v50
              je      _text__main_and0_end                 
              mov     rbx            , 255            ; null; save->v42
_text__main_and0_end:
              mov     r10            , rbx            ; load->v42
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v42
              jne     _text__main_or0_end                 
;----------------------------------]
;[----------------------------------
_text__main_or0_rvalue:
_text__main_or1_lvalue:
              mov     qword [rsp+256], 255            ; null; save->v51
_text__main_and1_lvalue:
              mov     r12            , 0              ; null; save->v52
              mov     r13            , 0              ; null; save->v53
              mov     r10            , qword [rsp+128]; load->v17
              mov     r11            , r13            ; load->v53
              cmp     r10d           , r11d           
              mov     qword [rsp+128], r10            ; save->v17
              mov     r10            , r13            ; load->v54
              setg    r10b                            
              mov     r13            , r10            ; save->v54; load->v54
              and     r10            , 255            
              mov     r13            , r10            ; save->v54; load->v54
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v54
              je      _text__main_and1_end                 
;----------------------------------]
;[----------------------------------
_text__main_and1_rvalue:
              mov     r13            , 199            ; null; save->v55
              mov     r14            , rdx            ; null; save->v57
              mov     r15            , rax            ; null; save->v58
              mov     rax            , qword [rsp+128]; load->v17; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v55
              and     r10d           , -1             
              mov     r13            , r10            ; save->v55
              cqo                                     
              mov     r10            , r13            ; load->v55
              idiv    r10d                            
              mov     r13            , rdx            ; save->v55; null; save->v56
              mov     rdx            , r14            ; load->v57; null
              mov     rax            , r15            ; load->v58; null
              mov     r14            , 0              ; null; save->v59
              mov     r10            , r13            ; load->v56
              mov     r11            , r14            ; load->v59
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v56; load->v60
              sete    r10b                            
              mov     r13            , r10            ; save->v60; load->v60
              and     r10            , 255            
              mov     r13            , r10            ; save->v60; load->v60
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v60
              je      _text__main_and1_end                 
              mov     r12            , 255            ; null; save->v52
_text__main_and1_end:
              mov     r10            , r12            ; load->v52
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v52
              jne     _text__main_or1_end                 
;----------------------------------]
;[----------------------------------
_text__main_or1_rvalue:
_text__main_or2_lvalue:
              mov     r12            , 255            ; null; save->v61
_text__main_and2_lvalue:
              mov     r13            , 0              ; null; save->v62
              mov     r14            , 0              ; null; save->v63
              mov     r10            , qword [rsp+136]; load->v18
              mov     r11            , r14            ; load->v63
              cmp     r10d           , r11d           
              mov     qword [rsp+136], r10            ; save->v18
              mov     r10            , r14            ; load->v64
              setg    r10b                            
              mov     r14            , r10            ; save->v64; load->v64
              and     r10            , 255            
              mov     r14            , r10            ; save->v64; load->v64
              cmp     r10            , 0              
              mov     r14            , r10            ; save->v64
              je      _text__main_and2_end                 
;----------------------------------]
;[----------------------------------
_text__main_and2_rvalue:
              mov     r14            , 199            ; null; save->v65
              mov     r15            , rdx            ; null; save->v67
              mov     rbp            , rax            ; null; save->v68
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r14            ; load->v65
              and     r10d           , -1             
              mov     r14            , r10            ; save->v65
              cqo                                     
              mov     r10            , r14            ; load->v65
              idiv    r10d                            
              mov     r14            , rdx            ; save->v65; null; save->v66
              mov     rdx            , r15            ; load->v67; null
              mov     rax            , rbp            ; load->v68; null
              mov     rbp            , 0              ; null; save->v69
              mov     r10            , r14            ; load->v66
              mov     r11            , rbp            ; load->v69
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v66
              mov     r10            , rbp            ; load->v70
              sete    r10b                            
              mov     rbp            , r10            ; save->v70; load->v70
              and     r10            , 255            
              mov     rbp            , r10            ; save->v70; load->v70
              cmp     r10            , 0              
              mov     rbp            , r10            ; save->v70
              je      _text__main_and2_end                 
              mov     r13            , 255            ; null; save->v62
_text__main_and2_end:
              mov     r10            , r13            ; load->v62
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v62
              jne     _text__main_or2_end                 
;----------------------------------]
;[----------------------------------
_text__main_or2_rvalue:
_text__main_or3_lvalue:
              mov     rbp            , 255            ; null; save->v71
_text__main_and3_lvalue:
              mov     r13            , 0              ; null; save->v72
              mov     r14            , qword [rsp+120]; load->v16; null; save->v73
              mov     r10            , r14            ; load->v73
              mov     r11            , qword [rsp+128]; load->v17
              add     r10            , r11            
              mov     r14            , r10            ; save->v73
              mov     r15            , r14            ; load->v73; null; save->v74
              mov     r10            , r15            ; load->v74
              mov     r11            , qword [rsp+136]; load->v18
              add     r10            , r11            
              mov     r15            , r10            ; save->v74
              mov     r14            , 0              ; null; save->v75
              mov     r10            , r15            ; load->v74
              mov     r11            , r14            ; load->v75
              cmp     r10d           , r11d           
              mov     r15            , r10            ; save->v74
              mov     r10            , r14            ; load->v76
              setg    r10b                            
              mov     r14            , r10            ; save->v76; load->v76
              and     r10            , 255            
              mov     r14            , r10            ; save->v76; load->v76
              cmp     r10            , 0              
              mov     r14            , r10            ; save->v76
              je      _text__main_and3_end                 
;----------------------------------]
;[----------------------------------
_text__main_and3_rvalue:
              mov     r14            , 199            ; null; save->v77
              mov     r15            , rdx            ; null; save->v79
              mov     rbx            , rax            ; null; save->v80
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r14            ; load->v77
              and     r10d           , -1             
              mov     r14            , r10            ; save->v77
              cqo                                     
              mov     r10            , r14            ; load->v77
              idiv    r10d                            
              mov     r14            , rdx            ; save->v77; null; save->v78
              mov     rdx            , r15            ; load->v79; null
              mov     rax            , rbx            ; load->v80; null
              mov     rbx            , 0              ; null; save->v81
              mov     r10            , r14            ; load->v78
              mov     r11            , rbx            ; load->v81
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v78
              mov     r10            , rbx            ; load->v82
              sete    r10b                            
              mov     rbx            , r10            ; save->v82; load->v82
              and     r10            , 255            
              mov     rbx            , r10            ; save->v82; load->v82
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v82
              je      _text__main_and3_end                 
              mov     r13            , 255            ; null; save->v72
_text__main_and3_end:
              mov     r10            , r13            ; load->v72
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v72
              jne     _text__main_or3_end                 
;----------------------------------]
;[----------------------------------
_text__main_or3_rvalue:
_text__main_and4_lvalue:
              mov     rbx            , 0              ; null; save->v83
              mov     r13            , qword [rsp+120]; load->v16; null; save->v84
              mov     r10            , r13            ; load->v84
              mov     r11            , qword [rsp+128]; load->v17
              imul    r10            , r11            
              mov     r13            , r10            ; save->v84; load->v84
              and     r10            , -1             
              mov     r13            , r10            ; save->v84
              mov     r14            , r13            ; load->v84; null; save->v85
              mov     r10            , r14            ; load->v85
              mov     r11            , qword [rsp+136]; load->v18
              imul    r10            , r11            
              mov     r14            , r10            ; save->v85; load->v85
              and     r10            , -1             
              mov     r14            , r10            ; save->v85
              mov     r13            , 0              ; null; save->v86
              mov     r10            , r14            ; load->v85
              mov     r11            , r13            ; load->v86
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v85
              mov     r10            , r13            ; load->v87
              setg    r10b                            
              mov     r13            , r10            ; save->v87; load->v87
              and     r10            , 255            
              mov     r13            , r10            ; save->v87; load->v87
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v87
              je      _text__main_and4_end                 
;----------------------------------]
;[----------------------------------
_text__main_and4_rvalue:
              mov     r13            , 199            ; null; save->v88
              mov     r14            , rdx            ; null; save->v90
              mov     r15            , rax            ; null; save->v91
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v88
              and     r10d           , -1             
              mov     r13            , r10            ; save->v88
              cqo                                     
              mov     r10            , r13            ; load->v88
              idiv    r10d                            
              mov     r13            , rdx            ; save->v88; null; save->v89
              mov     rdx            , r14            ; load->v90; null
              mov     rax            , r15            ; load->v91; null
              mov     r14            , 0              ; null; save->v92
              mov     r10            , r13            ; load->v89
              mov     r11            , r14            ; load->v92
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v89; load->v93
              sete    r10b                            
              mov     r13            , r10            ; save->v93; load->v93
              and     r10            , 255            
              mov     r13            , r10            ; save->v93; load->v93
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v93
              je      _text__main_and4_end                 
              mov     rbx            , 255            ; null; save->v83
_text__main_and4_end:
              mov     r10            , rbx            ; load->v83
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v83
              jne     _text__main_or3_end                 
              mov     rbp            , 0              ; null; save->v71
_text__main_or3_end:
              mov     r10            , rbp            ; load->v71
              cmp     r10            , 0              
              mov     rbp            , r10            ; save->v71
              jne     _text__main_or2_end                 
              mov     r12            , 0              ; null; save->v61
_text__main_or2_end:
              mov     r10            , r12            ; load->v61
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v61
              jne     _text__main_or1_end                 
              mov     qword [rsp+256], 0              ; null; save->v51
_text__main_or1_end:
              mov     r10            , qword [rsp+256]; load->v51
              cmp     r10            , 0              
              mov     qword [rsp+256], r10            ; save->v51
              jne     _text__main_or0_end                 
              mov     qword [rsp+248], 0              ; null; save->v41
_text__main_or0_end:
              mov     r10            , qword [rsp+248]; load->v41; init->f1
              mov     qword [rsp+264], r10            ; save->v94
_text__main_or4_lvalue:
              mov     qword [rsp+272], 255            ; null; save->v95
_text__main_and5_lvalue:
              mov     rbx            , 0              ; null; save->v96
              mov     r12            , 0              ; null; save->v97
              mov     r10            , qword [rsp+120]; load->v16
              mov     r11            , r12            ; load->v97
              cmp     r10d           , r11d           
              mov     qword [rsp+120], r10            ; save->v16
              mov     r10            , r12            ; load->v98
              setg    r10b                            
              mov     r12            , r10            ; save->v98; load->v98
              and     r10            , 255            
              mov     r12            , r10            ; save->v98; load->v98
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v98
              je      _text__main_and5_end                 
;----------------------------------]
;[----------------------------------
_text__main_and5_rvalue:
              mov     r12            , 199            ; null; save->v99
              mov     r13            , rdx            ; null; save->v101
              mov     r14            , rax            ; null; save->v102
              mov     rax            , qword [rsp+120]; load->v16; null
              and     rax            , -1             
              mov     r10            , r12            ; load->v99
              and     r10d           , -1             
              mov     r12            , r10            ; save->v99
              cqo                                     
              mov     r10            , r12            ; load->v99
              idiv    r10d                            
              mov     r12            , rdx            ; save->v99; null; save->v100
              mov     rdx            , r13            ; load->v101; null
              mov     rax            , r14            ; load->v102; null
              mov     r13            , 0              ; null; save->v103
              mov     r10            , r12            ; load->v100
              mov     r11            , r13            ; load->v103
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v100; load->v104
              sete    r10b                            
              mov     r12            , r10            ; save->v104; load->v104
              and     r10            , 255            
              mov     r12            , r10            ; save->v104; load->v104
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v104
              je      _text__main_and5_end                 
              mov     rbx            , 255            ; null; save->v96
_text__main_and5_end:
              mov     r10            , rbx            ; load->v96
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v96
              jne     _text__main_or4_end                 
;----------------------------------]
;[----------------------------------
_text__main_or4_rvalue:
_text__main_or5_lvalue:
              mov     qword [rsp+280], 255            ; null; save->v105
_text__main_and6_lvalue:
              mov     r12            , 0              ; null; save->v106
              mov     r13            , 0              ; null; save->v107
              mov     r10            , qword [rsp+128]; load->v17
              mov     r11            , r13            ; load->v107
              cmp     r10d           , r11d           
              mov     qword [rsp+128], r10            ; save->v17
              mov     r10            , r13            ; load->v108
              setg    r10b                            
              mov     r13            , r10            ; save->v108; load->v108
              and     r10            , 255            
              mov     r13            , r10            ; save->v108; load->v108
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v108
              je      _text__main_and6_end                 
;----------------------------------]
;[----------------------------------
_text__main_and6_rvalue:
              mov     r13            , 199            ; null; save->v109
              mov     r14            , rdx            ; null; save->v111
              mov     r15            , rax            ; null; save->v112
              mov     rax            , qword [rsp+128]; load->v17; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v109
              and     r10d           , -1             
              mov     r13            , r10            ; save->v109
              cqo                                     
              mov     r10            , r13            ; load->v109
              idiv    r10d                            
              mov     r13            , rdx            ; save->v109; null; save->v110
              mov     rdx            , r14            ; load->v111; null
              mov     rax            , r15            ; load->v112; null
              mov     r14            , 0              ; null; save->v113
              mov     r10            , r13            ; load->v110
              mov     r11            , r14            ; load->v113
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v110; load->v114
              sete    r10b                            
              mov     r13            , r10            ; save->v114; load->v114
              and     r10            , 255            
              mov     r13            , r10            ; save->v114; load->v114
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v114
              je      _text__main_and6_end                 
              mov     r12            , 255            ; null; save->v106
_text__main_and6_end:
              mov     r10            , r12            ; load->v106
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v106
              jne     _text__main_or5_end                 
;----------------------------------]
;[----------------------------------
_text__main_or5_rvalue:
_text__main_or6_lvalue:
              mov     r12            , 255            ; null; save->v115
_text__main_and7_lvalue:
              mov     r13            , 0              ; null; save->v116
              mov     r14            , 0              ; null; save->v117
              mov     r10            , qword [rsp+136]; load->v18
              mov     r11            , r14            ; load->v117
              cmp     r10d           , r11d           
              mov     qword [rsp+136], r10            ; save->v18
              mov     r10            , r14            ; load->v118
              setg    r10b                            
              mov     r14            , r10            ; save->v118; load->v118
              and     r10            , 255            
              mov     r14            , r10            ; save->v118; load->v118
              cmp     r10            , 0              
              mov     r14            , r10            ; save->v118
              je      _text__main_and7_end                 
;----------------------------------]
;[----------------------------------
_text__main_and7_rvalue:
              mov     r14            , 199            ; null; save->v119
              mov     r15            , rdx            ; null; save->v121
              mov     rbp            , rax            ; null; save->v122
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r14            ; load->v119
              and     r10d           , -1             
              mov     r14            , r10            ; save->v119
              cqo                                     
              mov     r10            , r14            ; load->v119
              idiv    r10d                            
              mov     r14            , rdx            ; save->v119; null; save->v120
              mov     rdx            , r15            ; load->v121; null
              mov     rax            , rbp            ; load->v122; null
              mov     rbp            , 0              ; null; save->v123
              mov     r10            , r14            ; load->v120
              mov     r11            , rbp            ; load->v123
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v120
              mov     r10            , rbp            ; load->v124
              sete    r10b                            
              mov     rbp            , r10            ; save->v124; load->v124
              and     r10            , 255            
              mov     rbp            , r10            ; save->v124; load->v124
              cmp     r10            , 0              
              mov     rbp            , r10            ; save->v124
              je      _text__main_and7_end                 
              mov     r13            , 255            ; null; save->v116
_text__main_and7_end:
              mov     r10            , r13            ; load->v116
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v116
              jne     _text__main_or6_end                 
;----------------------------------]
;[----------------------------------
_text__main_or6_rvalue:
_text__main_or7_lvalue:
              mov     rbp            , 255            ; null; save->v125
_text__main_and8_lvalue:
              mov     r13            , 0              ; null; save->v126
              mov     r14            , qword [rsp+120]; load->v16; null; save->v127
              mov     r10            , r14            ; load->v127
              mov     r11            , qword [rsp+128]; load->v17
              add     r10            , r11            
              mov     r14            , r10            ; save->v127
              mov     r15            , r14            ; load->v127; null; save->v128
              mov     r10            , r15            ; load->v128
              mov     r11            , qword [rsp+136]; load->v18
              add     r10            , r11            
              mov     r15            , r10            ; save->v128
              mov     r14            , 0              ; null; save->v129
              mov     r10            , r15            ; load->v128
              mov     r11            , r14            ; load->v129
              cmp     r10d           , r11d           
              mov     r15            , r10            ; save->v128
              mov     r10            , r14            ; load->v130
              setg    r10b                            
              mov     r14            , r10            ; save->v130; load->v130
              and     r10            , 255            
              mov     r14            , r10            ; save->v130; load->v130
              cmp     r10            , 0              
              mov     r14            , r10            ; save->v130
              je      _text__main_and8_end                 
;----------------------------------]
;[----------------------------------
_text__main_and8_rvalue:
              mov     r14            , 199            ; null; save->v131
              mov     r15            , rdx            ; null; save->v133
              mov     rbx            , rax            ; null; save->v134
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r14            ; load->v131
              and     r10d           , -1             
              mov     r14            , r10            ; save->v131
              cqo                                     
              mov     r10            , r14            ; load->v131
              idiv    r10d                            
              mov     r14            , rdx            ; save->v131; null; save->v132
              mov     rdx            , r15            ; load->v133; null
              mov     rax            , rbx            ; load->v134; null
              mov     rbx            , 0              ; null; save->v135
              mov     r10            , r14            ; load->v132
              mov     r11            , rbx            ; load->v135
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v132
              mov     r10            , rbx            ; load->v136
              sete    r10b                            
              mov     rbx            , r10            ; save->v136; load->v136
              and     r10            , 255            
              mov     rbx            , r10            ; save->v136; load->v136
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v136
              je      _text__main_and8_end                 
              mov     r13            , 255            ; null; save->v126
_text__main_and8_end:
              mov     r10            , r13            ; load->v126
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v126
              jne     _text__main_or7_end                 
;----------------------------------]
;[----------------------------------
_text__main_or7_rvalue:
_text__main_and9_lvalue:
              mov     rbx            , 0              ; null; save->v137
              mov     r13            , qword [rsp+120]; load->v16; null; save->v138
              mov     r10            , r13            ; load->v138
              mov     r11            , qword [rsp+128]; load->v17
              imul    r10            , r11            
              mov     r13            , r10            ; save->v138; load->v138
              and     r10            , -1             
              mov     r13            , r10            ; save->v138
              mov     r14            , r13            ; load->v138; null; save->v139
              mov     r10            , r14            ; load->v139
              mov     r11            , qword [rsp+136]; load->v18
              imul    r10            , r11            
              mov     r14            , r10            ; save->v139; load->v139
              and     r10            , -1             
              mov     r14            , r10            ; save->v139
              mov     r13            , 0              ; null; save->v140
              mov     r10            , r14            ; load->v139
              mov     r11            , r13            ; load->v140
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v139
              mov     r10            , r13            ; load->v141
              setg    r10b                            
              mov     r13            , r10            ; save->v141; load->v141
              and     r10            , 255            
              mov     r13            , r10            ; save->v141; load->v141
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v141
              je      _text__main_and9_end                 
;----------------------------------]
;[----------------------------------
_text__main_and9_rvalue:
              mov     r13            , 199            ; null; save->v142
              mov     r14            , rdx            ; null; save->v144
              mov     r15            , rax            ; null; save->v145
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v142
              and     r10d           , -1             
              mov     r13            , r10            ; save->v142
              cqo                                     
              mov     r10            , r13            ; load->v142
              idiv    r10d                            
              mov     r13            , rdx            ; save->v142; null; save->v143
              mov     rdx            , r14            ; load->v144; null
              mov     rax            , r15            ; load->v145; null
              mov     r14            , 0              ; null; save->v146
              mov     r10            , r13            ; load->v143
              mov     r11            , r14            ; load->v146
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v143; load->v147
              sete    r10b                            
              mov     r13            , r10            ; save->v147; load->v147
              and     r10            , 255            
              mov     r13            , r10            ; save->v147; load->v147
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v147
              je      _text__main_and9_end                 
              mov     rbx            , 255            ; null; save->v137
_text__main_and9_end:
              mov     r10            , rbx            ; load->v137
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v137
              jne     _text__main_or7_end                 
              mov     rbp            , 0              ; null; save->v125
_text__main_or7_end:
              mov     r10            , rbp            ; load->v125
              cmp     r10            , 0              
              mov     rbp            , r10            ; save->v125
              jne     _text__main_or6_end                 
              mov     r12            , 0              ; null; save->v115
_text__main_or6_end:
              mov     r10            , r12            ; load->v115
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v115
              jne     _text__main_or5_end                 
              mov     qword [rsp+280], 0              ; null; save->v105
_text__main_or5_end:
              mov     r10            , qword [rsp+280]; load->v105
              cmp     r10            , 0              
              mov     qword [rsp+280], r10            ; save->v105
              jne     _text__main_or4_end                 
              mov     qword [rsp+272], 0              ; null; save->v95
_text__main_or4_end:
              mov     r10            , qword [rsp+272]; load->v95; init->f2
              mov     qword [rsp+288], r10            ; save->v148
_text__main_or8_lvalue:
              mov     qword [rsp+296], 255            ; null; save->v149
_text__main_and10_lvalue:
              mov     rbx            , 0              ; null; save->v150
              mov     r12            , 0              ; null; save->v151
              mov     r10            , qword [rsp+120]; load->v16
              mov     r11            , r12            ; load->v151
              cmp     r10d           , r11d           
              mov     qword [rsp+120], r10            ; save->v16
              mov     r10            , r12            ; load->v152
              setg    r10b                            
              mov     r12            , r10            ; save->v152; load->v152
              and     r10            , 255            
              mov     r12            , r10            ; save->v152; load->v152
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v152
              je      _text__main_and10_end                 
;----------------------------------]
;[----------------------------------
_text__main_and10_rvalue:
              mov     r12            , 199            ; null; save->v153
              mov     r13            , rdx            ; null; save->v155
              mov     r14            , rax            ; null; save->v156
              mov     rax            , qword [rsp+120]; load->v16; null
              and     rax            , -1             
              mov     r10            , r12            ; load->v153
              and     r10d           , -1             
              mov     r12            , r10            ; save->v153
              cqo                                     
              mov     r10            , r12            ; load->v153
              idiv    r10d                            
              mov     r12            , rdx            ; save->v153; null; save->v154
              mov     rdx            , r13            ; load->v155; null
              mov     rax            , r14            ; load->v156; null
              mov     r13            , 0              ; null; save->v157
              mov     r10            , r12            ; load->v154
              mov     r11            , r13            ; load->v157
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v154; load->v158
              sete    r10b                            
              mov     r12            , r10            ; save->v158; load->v158
              and     r10            , 255            
              mov     r12            , r10            ; save->v158; load->v158
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v158
              je      _text__main_and10_end                 
              mov     rbx            , 255            ; null; save->v150
_text__main_and10_end:
              mov     r10            , rbx            ; load->v150
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v150
              jne     _text__main_or8_end                 
;----------------------------------]
;[----------------------------------
_text__main_or8_rvalue:
_text__main_or9_lvalue:
              mov     qword [rsp+304], 255            ; null; save->v159
_text__main_and11_lvalue:
              mov     r12            , 0              ; null; save->v160
              mov     r13            , 0              ; null; save->v161
              mov     r10            , qword [rsp+128]; load->v17
              mov     r11            , r13            ; load->v161
              cmp     r10d           , r11d           
              mov     qword [rsp+128], r10            ; save->v17
              mov     r10            , r13            ; load->v162
              setg    r10b                            
              mov     r13            , r10            ; save->v162; load->v162
              and     r10            , 255            
              mov     r13            , r10            ; save->v162; load->v162
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v162
              je      _text__main_and11_end                 
;----------------------------------]
;[----------------------------------
_text__main_and11_rvalue:
              mov     r13            , 199            ; null; save->v163
              mov     r14            , rdx            ; null; save->v165
              mov     r15            , rax            ; null; save->v166
              mov     rax            , qword [rsp+128]; load->v17; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v163
              and     r10d           , -1             
              mov     r13            , r10            ; save->v163
              cqo                                     
              mov     r10            , r13            ; load->v163
              idiv    r10d                            
              mov     r13            , rdx            ; save->v163; null; save->v164
              mov     rdx            , r14            ; load->v165; null
              mov     rax            , r15            ; load->v166; null
              mov     r14            , 0              ; null; save->v167
              mov     r10            , r13            ; load->v164
              mov     r11            , r14            ; load->v167
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v164; load->v168
              sete    r10b                            
              mov     r13            , r10            ; save->v168; load->v168
              and     r10            , 255            
              mov     r13            , r10            ; save->v168; load->v168
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v168
              je      _text__main_and11_end                 
              mov     r12            , 255            ; null; save->v160
_text__main_and11_end:
              mov     r10            , r12            ; load->v160
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v160
              jne     _text__main_or9_end                 
;----------------------------------]
;[----------------------------------
_text__main_or9_rvalue:
_text__main_or10_lvalue:
              mov     r12            , 255            ; null; save->v169
_text__main_and12_lvalue:
              mov     r13            , 0              ; null; save->v170
              mov     r14            , 0              ; null; save->v171
              mov     r10            , qword [rsp+136]; load->v18
              mov     r11            , r14            ; load->v171
              cmp     r10d           , r11d           
              mov     qword [rsp+136], r10            ; save->v18
              mov     r10            , r14            ; load->v172
              setg    r10b                            
              mov     r14            , r10            ; save->v172; load->v172
              and     r10            , 255            
              mov     r14            , r10            ; save->v172; load->v172
              cmp     r10            , 0              
              mov     r14            , r10            ; save->v172
              je      _text__main_and12_end                 
;----------------------------------]
;[----------------------------------
_text__main_and12_rvalue:
              mov     r14            , 199            ; null; save->v173
              mov     r15            , rdx            ; null; save->v175
              mov     rbp            , rax            ; null; save->v176
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r14            ; load->v173
              and     r10d           , -1             
              mov     r14            , r10            ; save->v173
              cqo                                     
              mov     r10            , r14            ; load->v173
              idiv    r10d                            
              mov     r14            , rdx            ; save->v173; null; save->v174
              mov     rdx            , r15            ; load->v175; null
              mov     rax            , rbp            ; load->v176; null
              mov     rbp            , 0              ; null; save->v177
              mov     r10            , r14            ; load->v174
              mov     r11            , rbp            ; load->v177
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v174
              mov     r10            , rbp            ; load->v178
              sete    r10b                            
              mov     rbp            , r10            ; save->v178; load->v178
              and     r10            , 255            
              mov     rbp            , r10            ; save->v178; load->v178
              cmp     r10            , 0              
              mov     rbp            , r10            ; save->v178
              je      _text__main_and12_end                 
              mov     r13            , 255            ; null; save->v170
_text__main_and12_end:
              mov     r10            , r13            ; load->v170
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v170
              jne     _text__main_or10_end                 
;----------------------------------]
;[----------------------------------
_text__main_or10_rvalue:
_text__main_or11_lvalue:
              mov     rbp            , 255            ; null; save->v179
_text__main_and13_lvalue:
              mov     r13            , 0              ; null; save->v180
              mov     r14            , qword [rsp+120]; load->v16; null; save->v181
              mov     r10            , r14            ; load->v181
              mov     r11            , qword [rsp+128]; load->v17
              add     r10            , r11            
              mov     r14            , r10            ; save->v181
              mov     r15            , r14            ; load->v181; null; save->v182
              mov     r10            , r15            ; load->v182
              mov     r11            , qword [rsp+136]; load->v18
              add     r10            , r11            
              mov     r15            , r10            ; save->v182
              mov     r14            , 0              ; null; save->v183
              mov     r10            , r15            ; load->v182
              mov     r11            , r14            ; load->v183
              cmp     r10d           , r11d           
              mov     r15            , r10            ; save->v182
              mov     r10            , r14            ; load->v184
              setg    r10b                            
              mov     r14            , r10            ; save->v184; load->v184
              and     r10            , 255            
              mov     r14            , r10            ; save->v184; load->v184
              cmp     r10            , 0              
              mov     r14            , r10            ; save->v184
              je      _text__main_and13_end                 
;----------------------------------]
;[----------------------------------
_text__main_and13_rvalue:
              mov     r14            , 199            ; null; save->v185
              mov     r15            , rdx            ; null; save->v187
              mov     rbx            , rax            ; null; save->v188
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r14            ; load->v185
              and     r10d           , -1             
              mov     r14            , r10            ; save->v185
              cqo                                     
              mov     r10            , r14            ; load->v185
              idiv    r10d                            
              mov     r14            , rdx            ; save->v185; null; save->v186
              mov     rdx            , r15            ; load->v187; null
              mov     rax            , rbx            ; load->v188; null
              mov     rbx            , 0              ; null; save->v189
              mov     r10            , r14            ; load->v186
              mov     r11            , rbx            ; load->v189
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v186
              mov     r10            , rbx            ; load->v190
              sete    r10b                            
              mov     rbx            , r10            ; save->v190; load->v190
              and     r10            , 255            
              mov     rbx            , r10            ; save->v190; load->v190
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v190
              je      _text__main_and13_end                 
              mov     r13            , 255            ; null; save->v180
_text__main_and13_end:
              mov     r10            , r13            ; load->v180
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v180
              jne     _text__main_or11_end                 
;----------------------------------]
;[----------------------------------
_text__main_or11_rvalue:
_text__main_and14_lvalue:
              mov     rbx            , 0              ; null; save->v191
              mov     r13            , qword [rsp+120]; load->v16; null; save->v192
              mov     r10            , r13            ; load->v192
              mov     r11            , qword [rsp+128]; load->v17
              imul    r10            , r11            
              mov     r13            , r10            ; save->v192; load->v192
              and     r10            , -1             
              mov     r13            , r10            ; save->v192
              mov     r14            , r13            ; load->v192; null; save->v193
              mov     r10            , r14            ; load->v193
              mov     r11            , qword [rsp+136]; load->v18
              imul    r10            , r11            
              mov     r14            , r10            ; save->v193; load->v193
              and     r10            , -1             
              mov     r14            , r10            ; save->v193
              mov     r13            , 0              ; null; save->v194
              mov     r10            , r14            ; load->v193
              mov     r11            , r13            ; load->v194
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v193
              mov     r10            , r13            ; load->v195
              setg    r10b                            
              mov     r13            , r10            ; save->v195; load->v195
              and     r10            , 255            
              mov     r13            , r10            ; save->v195; load->v195
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v195
              je      _text__main_and14_end                 
;----------------------------------]
;[----------------------------------
_text__main_and14_rvalue:
              mov     r13            , 199            ; null; save->v196
              mov     r14            , rdx            ; null; save->v198
              mov     r15            , rax            ; null; save->v199
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v196
              and     r10d           , -1             
              mov     r13            , r10            ; save->v196
              cqo                                     
              mov     r10            , r13            ; load->v196
              idiv    r10d                            
              mov     r13            , rdx            ; save->v196; null; save->v197
              mov     rdx            , r14            ; load->v198; null
              mov     rax            , r15            ; load->v199; null
              mov     r14            , 0              ; null; save->v200
              mov     r10            , r13            ; load->v197
              mov     r11            , r14            ; load->v200
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v197; load->v201
              sete    r10b                            
              mov     r13            , r10            ; save->v201; load->v201
              and     r10            , 255            
              mov     r13            , r10            ; save->v201; load->v201
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v201
              je      _text__main_and14_end                 
              mov     rbx            , 255            ; null; save->v191
_text__main_and14_end:
              mov     r10            , rbx            ; load->v191
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v191
              jne     _text__main_or11_end                 
              mov     rbp            , 0              ; null; save->v179
_text__main_or11_end:
              mov     r10            , rbp            ; load->v179
              cmp     r10            , 0              
              mov     rbp            , r10            ; save->v179
              jne     _text__main_or10_end                 
              mov     r12            , 0              ; null; save->v169
_text__main_or10_end:
              mov     r10            , r12            ; load->v169
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v169
              jne     _text__main_or9_end                 
              mov     qword [rsp+304], 0              ; null; save->v159
_text__main_or9_end:
              mov     r10            , qword [rsp+304]; load->v159
              cmp     r10            , 0              
              mov     qword [rsp+304], r10            ; save->v159
              jne     _text__main_or8_end                 
              mov     qword [rsp+296], 0              ; null; save->v149
_text__main_or8_end:
              mov     r10            , qword [rsp+296]; load->v149; init->f3
              mov     qword [rsp+312], r10            ; save->v202
_text__main_or12_lvalue:
              mov     qword [rsp+320], 255            ; null; save->v203
_text__main_and15_lvalue:
              mov     rbx            , 0              ; null; save->v204
              mov     r12            , 0              ; null; save->v205
              mov     r10            , qword [rsp+120]; load->v16
              mov     r11            , r12            ; load->v205
              cmp     r10d           , r11d           
              mov     qword [rsp+120], r10            ; save->v16
              mov     r10            , r12            ; load->v206
              setg    r10b                            
              mov     r12            , r10            ; save->v206; load->v206
              and     r10            , 255            
              mov     r12            , r10            ; save->v206; load->v206
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v206
              je      _text__main_and15_end                 
;----------------------------------]
;[----------------------------------
_text__main_and15_rvalue:
              mov     r12            , 199            ; null; save->v207
              mov     r13            , rdx            ; null; save->v209
              mov     r14            , rax            ; null; save->v210
              mov     rax            , qword [rsp+120]; load->v16; null
              and     rax            , -1             
              mov     r10            , r12            ; load->v207
              and     r10d           , -1             
              mov     r12            , r10            ; save->v207
              cqo                                     
              mov     r10            , r12            ; load->v207
              idiv    r10d                            
              mov     r12            , rdx            ; save->v207; null; save->v208
              mov     rdx            , r13            ; load->v209; null
              mov     rax            , r14            ; load->v210; null
              mov     r13            , 0              ; null; save->v211
              mov     r10            , r12            ; load->v208
              mov     r11            , r13            ; load->v211
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v208; load->v212
              sete    r10b                            
              mov     r12            , r10            ; save->v212; load->v212
              and     r10            , 255            
              mov     r12            , r10            ; save->v212; load->v212
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v212
              je      _text__main_and15_end                 
              mov     rbx            , 255            ; null; save->v204
_text__main_and15_end:
              mov     r10            , rbx            ; load->v204
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v204
              jne     _text__main_or12_end                 
;----------------------------------]
;[----------------------------------
_text__main_or12_rvalue:
_text__main_or13_lvalue:
              mov     qword [rsp+328], 255            ; null; save->v213
_text__main_and16_lvalue:
              mov     r12            , 0              ; null; save->v214
              mov     r13            , 0              ; null; save->v215
              mov     r10            , qword [rsp+128]; load->v17
              mov     r11            , r13            ; load->v215
              cmp     r10d           , r11d           
              mov     qword [rsp+128], r10            ; save->v17
              mov     r10            , r13            ; load->v216
              setg    r10b                            
              mov     r13            , r10            ; save->v216; load->v216
              and     r10            , 255            
              mov     r13            , r10            ; save->v216; load->v216
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v216
              je      _text__main_and16_end                 
;----------------------------------]
;[----------------------------------
_text__main_and16_rvalue:
              mov     r13            , 199            ; null; save->v217
              mov     r14            , rdx            ; null; save->v219
              mov     r15            , rax            ; null; save->v220
              mov     rax            , qword [rsp+128]; load->v17; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v217
              and     r10d           , -1             
              mov     r13            , r10            ; save->v217
              cqo                                     
              mov     r10            , r13            ; load->v217
              idiv    r10d                            
              mov     r13            , rdx            ; save->v217; null; save->v218
              mov     rdx            , r14            ; load->v219; null
              mov     rax            , r15            ; load->v220; null
              mov     r14            , 0              ; null; save->v221
              mov     r10            , r13            ; load->v218
              mov     r11            , r14            ; load->v221
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v218; load->v222
              sete    r10b                            
              mov     r13            , r10            ; save->v222; load->v222
              and     r10            , 255            
              mov     r13            , r10            ; save->v222; load->v222
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v222
              je      _text__main_and16_end                 
              mov     r12            , 255            ; null; save->v214
_text__main_and16_end:
              mov     r10            , r12            ; load->v214
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v214
              jne     _text__main_or13_end                 
;----------------------------------]
;[----------------------------------
_text__main_or13_rvalue:
_text__main_or14_lvalue:
              mov     r12            , 255            ; null; save->v223
_text__main_and17_lvalue:
              mov     r13            , 0              ; null; save->v224
              mov     r14            , 0              ; null; save->v225
              mov     r10            , qword [rsp+136]; load->v18
              mov     r11            , r14            ; load->v225
              cmp     r10d           , r11d           
              mov     qword [rsp+136], r10            ; save->v18
              mov     r10            , r14            ; load->v226
              setg    r10b                            
              mov     r14            , r10            ; save->v226; load->v226
              and     r10            , 255            
              mov     r14            , r10            ; save->v226; load->v226
              cmp     r10            , 0              
              mov     r14            , r10            ; save->v226
              je      _text__main_and17_end                 
;----------------------------------]
;[----------------------------------
_text__main_and17_rvalue:
              mov     r14            , 199            ; null; save->v227
              mov     r15            , rdx            ; null; save->v229
              mov     rbp            , rax            ; null; save->v230
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r14            ; load->v227
              and     r10d           , -1             
              mov     r14            , r10            ; save->v227
              cqo                                     
              mov     r10            , r14            ; load->v227
              idiv    r10d                            
              mov     r14            , rdx            ; save->v227; null; save->v228
              mov     rdx            , r15            ; load->v229; null
              mov     rax            , rbp            ; load->v230; null
              mov     rbp            , 0              ; null; save->v231
              mov     r10            , r14            ; load->v228
              mov     r11            , rbp            ; load->v231
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v228
              mov     r10            , rbp            ; load->v232
              sete    r10b                            
              mov     rbp            , r10            ; save->v232; load->v232
              and     r10            , 255            
              mov     rbp            , r10            ; save->v232; load->v232
              cmp     r10            , 0              
              mov     rbp            , r10            ; save->v232
              je      _text__main_and17_end                 
              mov     r13            , 255            ; null; save->v224
_text__main_and17_end:
              mov     r10            , r13            ; load->v224
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v224
              jne     _text__main_or14_end                 
;----------------------------------]
;[----------------------------------
_text__main_or14_rvalue:
_text__main_or15_lvalue:
              mov     rbp            , 255            ; null; save->v233
_text__main_and18_lvalue:
              mov     r13            , 0              ; null; save->v234
              mov     r14            , qword [rsp+120]; load->v16; null; save->v235
              mov     r10            , r14            ; load->v235
              mov     r11            , qword [rsp+128]; load->v17
              add     r10            , r11            
              mov     r14            , r10            ; save->v235
              mov     r15            , r14            ; load->v235; null; save->v236
              mov     r10            , r15            ; load->v236
              mov     r11            , qword [rsp+136]; load->v18
              add     r10            , r11            
              mov     r15            , r10            ; save->v236
              mov     r14            , 0              ; null; save->v237
              mov     r10            , r15            ; load->v236
              mov     r11            , r14            ; load->v237
              cmp     r10d           , r11d           
              mov     r15            , r10            ; save->v236
              mov     r10            , r14            ; load->v238
              setg    r10b                            
              mov     r14            , r10            ; save->v238; load->v238
              and     r10            , 255            
              mov     r14            , r10            ; save->v238; load->v238
              cmp     r10            , 0              
              mov     r14            , r10            ; save->v238
              je      _text__main_and18_end                 
;----------------------------------]
;[----------------------------------
_text__main_and18_rvalue:
              mov     r14            , 199            ; null; save->v239
              mov     r15            , rdx            ; null; save->v241
              mov     rbx            , rax            ; null; save->v242
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r14            ; load->v239
              and     r10d           , -1             
              mov     r14            , r10            ; save->v239
              cqo                                     
              mov     r10            , r14            ; load->v239
              idiv    r10d                            
              mov     r14            , rdx            ; save->v239; null; save->v240
              mov     rdx            , r15            ; load->v241; null
              mov     rax            , rbx            ; load->v242; null
              mov     rbx            , 0              ; null; save->v243
              mov     r10            , r14            ; load->v240
              mov     r11            , rbx            ; load->v243
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v240
              mov     r10            , rbx            ; load->v244
              sete    r10b                            
              mov     rbx            , r10            ; save->v244; load->v244
              and     r10            , 255            
              mov     rbx            , r10            ; save->v244; load->v244
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v244
              je      _text__main_and18_end                 
              mov     r13            , 255            ; null; save->v234
_text__main_and18_end:
              mov     r10            , r13            ; load->v234
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v234
              jne     _text__main_or15_end                 
;----------------------------------]
;[----------------------------------
_text__main_or15_rvalue:
_text__main_and19_lvalue:
              mov     rbx            , 0              ; null; save->v245
              mov     r13            , qword [rsp+120]; load->v16; null; save->v246
              mov     r10            , r13            ; load->v246
              mov     r11            , qword [rsp+128]; load->v17
              imul    r10            , r11            
              mov     r13            , r10            ; save->v246; load->v246
              and     r10            , -1             
              mov     r13            , r10            ; save->v246
              mov     r14            , r13            ; load->v246; null; save->v247
              mov     r10            , r14            ; load->v247
              mov     r11            , qword [rsp+136]; load->v18
              imul    r10            , r11            
              mov     r14            , r10            ; save->v247; load->v247
              and     r10            , -1             
              mov     r14            , r10            ; save->v247
              mov     r13            , 0              ; null; save->v248
              mov     r10            , r14            ; load->v247
              mov     r11            , r13            ; load->v248
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v247
              mov     r10            , r13            ; load->v249
              setg    r10b                            
              mov     r13            , r10            ; save->v249; load->v249
              and     r10            , 255            
              mov     r13            , r10            ; save->v249; load->v249
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v249
              je      _text__main_and19_end                 
;----------------------------------]
;[----------------------------------
_text__main_and19_rvalue:
              mov     r13            , 199            ; null; save->v250
              mov     r14            , rdx            ; null; save->v252
              mov     r15            , rax            ; null; save->v253
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v250
              and     r10d           , -1             
              mov     r13            , r10            ; save->v250
              cqo                                     
              mov     r10            , r13            ; load->v250
              idiv    r10d                            
              mov     r13            , rdx            ; save->v250; null; save->v251
              mov     rdx            , r14            ; load->v252; null
              mov     rax            , r15            ; load->v253; null
              mov     r14            , 0              ; null; save->v254
              mov     r10            , r13            ; load->v251
              mov     r11            , r14            ; load->v254
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v251; load->v255
              sete    r10b                            
              mov     r13            , r10            ; save->v255; load->v255
              and     r10            , 255            
              mov     r13            , r10            ; save->v255; load->v255
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v255
              je      _text__main_and19_end                 
              mov     rbx            , 255            ; null; save->v245
_text__main_and19_end:
              mov     r10            , rbx            ; load->v245
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v245
              jne     _text__main_or15_end                 
              mov     rbp            , 0              ; null; save->v233
_text__main_or15_end:
              mov     r10            , rbp            ; load->v233
              cmp     r10            , 0              
              mov     rbp            , r10            ; save->v233
              jne     _text__main_or14_end                 
              mov     r12            , 0              ; null; save->v223
_text__main_or14_end:
              mov     r10            , r12            ; load->v223
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v223
              jne     _text__main_or13_end                 
              mov     qword [rsp+328], 0              ; null; save->v213
_text__main_or13_end:
              mov     r10            , qword [rsp+328]; load->v213
              cmp     r10            , 0              
              mov     qword [rsp+328], r10            ; save->v213
              jne     _text__main_or12_end                 
              mov     qword [rsp+320], 0              ; null; save->v203
_text__main_or12_end:
              mov     r10            , qword [rsp+320]; load->v203; init->f4
              mov     qword [rsp+336], r10            ; save->v256
_text__main_or16_lvalue:
              mov     qword [rsp+344], 255            ; null; save->v257
_text__main_and20_lvalue:
              mov     rbx            , 0              ; null; save->v258
              mov     r12            , 0              ; null; save->v259
              mov     r10            , qword [rsp+120]; load->v16
              mov     r11            , r12            ; load->v259
              cmp     r10d           , r11d           
              mov     qword [rsp+120], r10            ; save->v16
              mov     r10            , r12            ; load->v260
              setg    r10b                            
              mov     r12            , r10            ; save->v260; load->v260
              and     r10            , 255            
              mov     r12            , r10            ; save->v260; load->v260
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v260
              je      _text__main_and20_end                 
;----------------------------------]
;[----------------------------------
_text__main_and20_rvalue:
              mov     r12            , 199            ; null; save->v261
              mov     r13            , rdx            ; null; save->v263
              mov     r14            , rax            ; null; save->v264
              mov     rax            , qword [rsp+120]; load->v16; null
              and     rax            , -1             
              mov     r10            , r12            ; load->v261
              and     r10d           , -1             
              mov     r12            , r10            ; save->v261
              cqo                                     
              mov     r10            , r12            ; load->v261
              idiv    r10d                            
              mov     r12            , rdx            ; save->v261; null; save->v262
              mov     rdx            , r13            ; load->v263; null
              mov     rax            , r14            ; load->v264; null
              mov     r13            , 0              ; null; save->v265
              mov     r10            , r12            ; load->v262
              mov     r11            , r13            ; load->v265
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v262; load->v266
              sete    r10b                            
              mov     r12            , r10            ; save->v266; load->v266
              and     r10            , 255            
              mov     r12            , r10            ; save->v266; load->v266
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v266
              je      _text__main_and20_end                 
              mov     rbx            , 255            ; null; save->v258
_text__main_and20_end:
              mov     r10            , rbx            ; load->v258
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v258
              jne     _text__main_or16_end                 
;----------------------------------]
;[----------------------------------
_text__main_or16_rvalue:
_text__main_or17_lvalue:
              mov     qword [rsp+352], 255            ; null; save->v267
_text__main_and21_lvalue:
              mov     r12            , 0              ; null; save->v268
              mov     r13            , 0              ; null; save->v269
              mov     r10            , qword [rsp+128]; load->v17
              mov     r11            , r13            ; load->v269
              cmp     r10d           , r11d           
              mov     qword [rsp+128], r10            ; save->v17
              mov     r10            , r13            ; load->v270
              setg    r10b                            
              mov     r13            , r10            ; save->v270; load->v270
              and     r10            , 255            
              mov     r13            , r10            ; save->v270; load->v270
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v270
              je      _text__main_and21_end                 
;----------------------------------]
;[----------------------------------
_text__main_and21_rvalue:
              mov     r13            , 199            ; null; save->v271
              mov     r14            , rdx            ; null; save->v273
              mov     r15            , rax            ; null; save->v274
              mov     rax            , qword [rsp+128]; load->v17; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v271
              and     r10d           , -1             
              mov     r13            , r10            ; save->v271
              cqo                                     
              mov     r10            , r13            ; load->v271
              idiv    r10d                            
              mov     r13            , rdx            ; save->v271; null; save->v272
              mov     rdx            , r14            ; load->v273; null
              mov     rax            , r15            ; load->v274; null
              mov     r14            , 0              ; null; save->v275
              mov     r10            , r13            ; load->v272
              mov     r11            , r14            ; load->v275
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v272; load->v276
              sete    r10b                            
              mov     r13            , r10            ; save->v276; load->v276
              and     r10            , 255            
              mov     r13            , r10            ; save->v276; load->v276
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v276
              je      _text__main_and21_end                 
              mov     r12            , 255            ; null; save->v268
_text__main_and21_end:
              mov     r10            , r12            ; load->v268
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v268
              jne     _text__main_or17_end                 
;----------------------------------]
;[----------------------------------
_text__main_or17_rvalue:
_text__main_or18_lvalue:
              mov     r12            , 255            ; null; save->v277
_text__main_and22_lvalue:
              mov     r13            , 0              ; null; save->v278
              mov     r14            , 0              ; null; save->v279
              mov     r10            , qword [rsp+136]; load->v18
              mov     r11            , r14            ; load->v279
              cmp     r10d           , r11d           
              mov     qword [rsp+136], r10            ; save->v18
              mov     r10            , r14            ; load->v280
              setg    r10b                            
              mov     r14            , r10            ; save->v280; load->v280
              and     r10            , 255            
              mov     r14            , r10            ; save->v280; load->v280
              cmp     r10            , 0              
              mov     r14            , r10            ; save->v280
              je      _text__main_and22_end                 
;----------------------------------]
;[----------------------------------
_text__main_and22_rvalue:
              mov     r14            , 199            ; null; save->v281
              mov     r15            , rdx            ; null; save->v283
              mov     rbp            , rax            ; null; save->v284
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r14            ; load->v281
              and     r10d           , -1             
              mov     r14            , r10            ; save->v281
              cqo                                     
              mov     r10            , r14            ; load->v281
              idiv    r10d                            
              mov     r14            , rdx            ; save->v281; null; save->v282
              mov     rdx            , r15            ; load->v283; null
              mov     rax            , rbp            ; load->v284; null
              mov     rbp            , 0              ; null; save->v285
              mov     r10            , r14            ; load->v282
              mov     r11            , rbp            ; load->v285
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v282
              mov     r10            , rbp            ; load->v286
              sete    r10b                            
              mov     rbp            , r10            ; save->v286; load->v286
              and     r10            , 255            
              mov     rbp            , r10            ; save->v286; load->v286
              cmp     r10            , 0              
              mov     rbp            , r10            ; save->v286
              je      _text__main_and22_end                 
              mov     r13            , 255            ; null; save->v278
_text__main_and22_end:
              mov     r10            , r13            ; load->v278
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v278
              jne     _text__main_or18_end                 
;----------------------------------]
;[----------------------------------
_text__main_or18_rvalue:
_text__main_or19_lvalue:
              mov     rbp            , 255            ; null; save->v287
_text__main_and23_lvalue:
              mov     r13            , 0              ; null; save->v288
              mov     r14            , qword [rsp+120]; load->v16; null; save->v289
              mov     r10            , r14            ; load->v289
              mov     r11            , qword [rsp+128]; load->v17
              add     r10            , r11            
              mov     r14            , r10            ; save->v289
              mov     r15            , r14            ; load->v289; null; save->v290
              mov     r10            , r15            ; load->v290
              mov     r11            , qword [rsp+136]; load->v18
              add     r10            , r11            
              mov     r15            , r10            ; save->v290
              mov     r14            , 0              ; null; save->v291
              mov     r10            , r15            ; load->v290
              mov     r11            , r14            ; load->v291
              cmp     r10d           , r11d           
              mov     r15            , r10            ; save->v290
              mov     r10            , r14            ; load->v292
              setg    r10b                            
              mov     r14            , r10            ; save->v292; load->v292
              and     r10            , 255            
              mov     r14            , r10            ; save->v292; load->v292
              cmp     r10            , 0              
              mov     r14            , r10            ; save->v292
              je      _text__main_and23_end                 
;----------------------------------]
;[----------------------------------
_text__main_and23_rvalue:
              mov     r14            , 199            ; null; save->v293
              mov     r15            , rdx            ; null; save->v295
              mov     rbx            , rax            ; null; save->v296
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r14            ; load->v293
              and     r10d           , -1             
              mov     r14            , r10            ; save->v293
              cqo                                     
              mov     r10            , r14            ; load->v293
              idiv    r10d                            
              mov     r14            , rdx            ; save->v293; null; save->v294
              mov     rdx            , r15            ; load->v295; null
              mov     rax            , rbx            ; load->v296; null
              mov     rbx            , 0              ; null; save->v297
              mov     r10            , r14            ; load->v294
              mov     r11            , rbx            ; load->v297
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v294
              mov     r10            , rbx            ; load->v298
              sete    r10b                            
              mov     rbx            , r10            ; save->v298; load->v298
              and     r10            , 255            
              mov     rbx            , r10            ; save->v298; load->v298
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v298
              je      _text__main_and23_end                 
              mov     r13            , 255            ; null; save->v288
_text__main_and23_end:
              mov     r10            , r13            ; load->v288
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v288
              jne     _text__main_or19_end                 
;----------------------------------]
;[----------------------------------
_text__main_or19_rvalue:
_text__main_and24_lvalue:
              mov     rbx            , 0              ; null; save->v299
              mov     r13            , qword [rsp+120]; load->v16; null; save->v300
              mov     r10            , r13            ; load->v300
              mov     r11            , qword [rsp+128]; load->v17
              imul    r10            , r11            
              mov     r13            , r10            ; save->v300; load->v300
              and     r10            , -1             
              mov     r13            , r10            ; save->v300
              mov     r14            , r13            ; load->v300; null; save->v301
              mov     r10            , r14            ; load->v301
              mov     r11            , qword [rsp+136]; load->v18
              imul    r10            , r11            
              mov     r14            , r10            ; save->v301; load->v301
              and     r10            , -1             
              mov     r14            , r10            ; save->v301
              mov     r13            , 0              ; null; save->v302
              mov     r10            , r14            ; load->v301
              mov     r11            , r13            ; load->v302
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v301
              mov     r10            , r13            ; load->v303
              setg    r10b                            
              mov     r13            , r10            ; save->v303; load->v303
              and     r10            , 255            
              mov     r13            , r10            ; save->v303; load->v303
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v303
              je      _text__main_and24_end                 
;----------------------------------]
;[----------------------------------
_text__main_and24_rvalue:
              mov     r13            , 199            ; null; save->v304
              mov     r14            , rdx            ; null; save->v306
              mov     r15            , rax            ; null; save->v307
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v304
              and     r10d           , -1             
              mov     r13            , r10            ; save->v304
              cqo                                     
              mov     r10            , r13            ; load->v304
              idiv    r10d                            
              mov     r13            , rdx            ; save->v304; null; save->v305
              mov     rdx            , r14            ; load->v306; null
              mov     rax            , r15            ; load->v307; null
              mov     r14            , 0              ; null; save->v308
              mov     r10            , r13            ; load->v305
              mov     r11            , r14            ; load->v308
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v305; load->v309
              sete    r10b                            
              mov     r13            , r10            ; save->v309; load->v309
              and     r10            , 255            
              mov     r13            , r10            ; save->v309; load->v309
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v309
              je      _text__main_and24_end                 
              mov     rbx            , 255            ; null; save->v299
_text__main_and24_end:
              mov     r10            , rbx            ; load->v299
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v299
              jne     _text__main_or19_end                 
              mov     rbp            , 0              ; null; save->v287
_text__main_or19_end:
              mov     r10            , rbp            ; load->v287
              cmp     r10            , 0              
              mov     rbp            , r10            ; save->v287
              jne     _text__main_or18_end                 
              mov     r12            , 0              ; null; save->v277
_text__main_or18_end:
              mov     r10            , r12            ; load->v277
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v277
              jne     _text__main_or17_end                 
              mov     qword [rsp+352], 0              ; null; save->v267
_text__main_or17_end:
              mov     r10            , qword [rsp+352]; load->v267
              cmp     r10            , 0              
              mov     qword [rsp+352], r10            ; save->v267
              jne     _text__main_or16_end                 
              mov     qword [rsp+344], 0              ; null; save->v257
_text__main_or16_end:
              mov     r10            , qword [rsp+344]; load->v257; init->f5
              mov     qword [rsp+360], r10            ; save->v310
_text__main_or20_lvalue:
              mov     qword [rsp+368], 255            ; null; save->v311
_text__main_and25_lvalue:
              mov     rbx            , 0              ; null; save->v312
              mov     r12            , 0              ; null; save->v313
              mov     r10            , qword [rsp+120]; load->v16
              mov     r11            , r12            ; load->v313
              cmp     r10d           , r11d           
              mov     qword [rsp+120], r10            ; save->v16
              mov     r10            , r12            ; load->v314
              setg    r10b                            
              mov     r12            , r10            ; save->v314; load->v314
              and     r10            , 255            
              mov     r12            , r10            ; save->v314; load->v314
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v314
              je      _text__main_and25_end                 
;----------------------------------]
;[----------------------------------
_text__main_and25_rvalue:
              mov     r12            , 199            ; null; save->v315
              mov     r13            , rdx            ; null; save->v317
              mov     r14            , rax            ; null; save->v318
              mov     rax            , qword [rsp+120]; load->v16; null
              and     rax            , -1             
              mov     r10            , r12            ; load->v315
              and     r10d           , -1             
              mov     r12            , r10            ; save->v315
              cqo                                     
              mov     r10            , r12            ; load->v315
              idiv    r10d                            
              mov     r12            , rdx            ; save->v315; null; save->v316
              mov     rdx            , r13            ; load->v317; null
              mov     rax            , r14            ; load->v318; null
              mov     r13            , 0              ; null; save->v319
              mov     r10            , r12            ; load->v316
              mov     r11            , r13            ; load->v319
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v316; load->v320
              sete    r10b                            
              mov     r12            , r10            ; save->v320; load->v320
              and     r10            , 255            
              mov     r12            , r10            ; save->v320; load->v320
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v320
              je      _text__main_and25_end                 
              mov     rbx            , 255            ; null; save->v312
_text__main_and25_end:
              mov     r10            , rbx            ; load->v312
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v312
              jne     _text__main_or20_end                 
;----------------------------------]
;[----------------------------------
_text__main_or20_rvalue:
_text__main_or21_lvalue:
              mov     qword [rsp+376], 255            ; null; save->v321
_text__main_and26_lvalue:
              mov     r12            , 0              ; null; save->v322
              mov     r13            , 0              ; null; save->v323
              mov     r10            , qword [rsp+128]; load->v17
              mov     r11            , r13            ; load->v323
              cmp     r10d           , r11d           
              mov     qword [rsp+128], r10            ; save->v17
              mov     r10            , r13            ; load->v324
              setg    r10b                            
              mov     r13            , r10            ; save->v324; load->v324
              and     r10            , 255            
              mov     r13            , r10            ; save->v324; load->v324
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v324
              je      _text__main_and26_end                 
;----------------------------------]
;[----------------------------------
_text__main_and26_rvalue:
              mov     r13            , 199            ; null; save->v325
              mov     r14            , rdx            ; null; save->v327
              mov     r15            , rax            ; null; save->v328
              mov     rax            , qword [rsp+128]; load->v17; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v325
              and     r10d           , -1             
              mov     r13            , r10            ; save->v325
              cqo                                     
              mov     r10            , r13            ; load->v325
              idiv    r10d                            
              mov     r13            , rdx            ; save->v325; null; save->v326
              mov     rdx            , r14            ; load->v327; null
              mov     rax            , r15            ; load->v328; null
              mov     r14            , 0              ; null; save->v329
              mov     r10            , r13            ; load->v326
              mov     r11            , r14            ; load->v329
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v326; load->v330
              sete    r10b                            
              mov     r13            , r10            ; save->v330; load->v330
              and     r10            , 255            
              mov     r13            , r10            ; save->v330; load->v330
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v330
              je      _text__main_and26_end                 
              mov     r12            , 255            ; null; save->v322
_text__main_and26_end:
              mov     r10            , r12            ; load->v322
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v322
              jne     _text__main_or21_end                 
;----------------------------------]
;[----------------------------------
_text__main_or21_rvalue:
_text__main_or22_lvalue:
              mov     r12            , 255            ; null; save->v331
_text__main_and27_lvalue:
              mov     r13            , 0              ; null; save->v332
              mov     r14            , 0              ; null; save->v333
              mov     r10            , qword [rsp+136]; load->v18
              mov     r11            , r14            ; load->v333
              cmp     r10d           , r11d           
              mov     qword [rsp+136], r10            ; save->v18
              mov     r10            , r14            ; load->v334
              setg    r10b                            
              mov     r14            , r10            ; save->v334; load->v334
              and     r10            , 255            
              mov     r14            , r10            ; save->v334; load->v334
              cmp     r10            , 0              
              mov     r14            , r10            ; save->v334
              je      _text__main_and27_end                 
;----------------------------------]
;[----------------------------------
_text__main_and27_rvalue:
              mov     r14            , 199            ; null; save->v335
              mov     r15            , rdx            ; null; save->v337
              mov     rbp            , rax            ; null; save->v338
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r14            ; load->v335
              and     r10d           , -1             
              mov     r14            , r10            ; save->v335
              cqo                                     
              mov     r10            , r14            ; load->v335
              idiv    r10d                            
              mov     r14            , rdx            ; save->v335; null; save->v336
              mov     rdx            , r15            ; load->v337; null
              mov     rax            , rbp            ; load->v338; null
              mov     rbp            , 0              ; null; save->v339
              mov     r10            , r14            ; load->v336
              mov     r11            , rbp            ; load->v339
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v336
              mov     r10            , rbp            ; load->v340
              sete    r10b                            
              mov     rbp            , r10            ; save->v340; load->v340
              and     r10            , 255            
              mov     rbp            , r10            ; save->v340; load->v340
              cmp     r10            , 0              
              mov     rbp            , r10            ; save->v340
              je      _text__main_and27_end                 
              mov     r13            , 255            ; null; save->v332
_text__main_and27_end:
              mov     r10            , r13            ; load->v332
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v332
              jne     _text__main_or22_end                 
;----------------------------------]
;[----------------------------------
_text__main_or22_rvalue:
_text__main_or23_lvalue:
              mov     rbp            , 255            ; null; save->v341
_text__main_and28_lvalue:
              mov     r13            , 0              ; null; save->v342
              mov     r14            , qword [rsp+120]; load->v16; null; save->v343
              mov     r10            , r14            ; load->v343
              mov     r11            , qword [rsp+128]; load->v17
              add     r10            , r11            
              mov     r14            , r10            ; save->v343
              mov     r15            , r14            ; load->v343; null; save->v344
              mov     r10            , r15            ; load->v344
              mov     r11            , qword [rsp+136]; load->v18
              add     r10            , r11            
              mov     r15            , r10            ; save->v344
              mov     r14            , 0              ; null; save->v345
              mov     r10            , r15            ; load->v344
              mov     r11            , r14            ; load->v345
              cmp     r10d           , r11d           
              mov     r15            , r10            ; save->v344
              mov     r10            , r14            ; load->v346
              setg    r10b                            
              mov     r14            , r10            ; save->v346; load->v346
              and     r10            , 255            
              mov     r14            , r10            ; save->v346; load->v346
              cmp     r10            , 0              
              mov     r14            , r10            ; save->v346
              je      _text__main_and28_end                 
;----------------------------------]
;[----------------------------------
_text__main_and28_rvalue:
              mov     r14            , 199            ; null; save->v347
              mov     r15            , rdx            ; null; save->v349
              mov     rbx            , rax            ; null; save->v350
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r14            ; load->v347
              and     r10d           , -1             
              mov     r14            , r10            ; save->v347
              cqo                                     
              mov     r10            , r14            ; load->v347
              idiv    r10d                            
              mov     r14            , rdx            ; save->v347; null; save->v348
              mov     rdx            , r15            ; load->v349; null
              mov     rax            , rbx            ; load->v350; null
              mov     rbx            , 0              ; null; save->v351
              mov     r10            , r14            ; load->v348
              mov     r11            , rbx            ; load->v351
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v348
              mov     r10            , rbx            ; load->v352
              sete    r10b                            
              mov     rbx            , r10            ; save->v352; load->v352
              and     r10            , 255            
              mov     rbx            , r10            ; save->v352; load->v352
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v352
              je      _text__main_and28_end                 
              mov     r13            , 255            ; null; save->v342
_text__main_and28_end:
              mov     r10            , r13            ; load->v342
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v342
              jne     _text__main_or23_end                 
;----------------------------------]
;[----------------------------------
_text__main_or23_rvalue:
_text__main_and29_lvalue:
              mov     rbx            , 0              ; null; save->v353
              mov     r13            , qword [rsp+120]; load->v16; null; save->v354
              mov     r10            , r13            ; load->v354
              mov     r11            , qword [rsp+128]; load->v17
              imul    r10            , r11            
              mov     r13            , r10            ; save->v354; load->v354
              and     r10            , -1             
              mov     r13            , r10            ; save->v354
              mov     r14            , r13            ; load->v354; null; save->v355
              mov     r10            , r14            ; load->v355
              mov     r11            , qword [rsp+136]; load->v18
              imul    r10            , r11            
              mov     r14            , r10            ; save->v355; load->v355
              and     r10            , -1             
              mov     r14            , r10            ; save->v355
              mov     r13            , 0              ; null; save->v356
              mov     r10            , r14            ; load->v355
              mov     r11            , r13            ; load->v356
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v355
              mov     r10            , r13            ; load->v357
              setg    r10b                            
              mov     r13            , r10            ; save->v357; load->v357
              and     r10            , 255            
              mov     r13            , r10            ; save->v357; load->v357
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v357
              je      _text__main_and29_end                 
;----------------------------------]
;[----------------------------------
_text__main_and29_rvalue:
              mov     r13            , 199            ; null; save->v358
              mov     r14            , rdx            ; null; save->v360
              mov     r15            , rax            ; null; save->v361
              mov     rax            , qword [rsp+136]; load->v18; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v358
              and     r10d           , -1             
              mov     r13            , r10            ; save->v358
              cqo                                     
              mov     r10            , r13            ; load->v358
              idiv    r10d                            
              mov     r13            , rdx            ; save->v358; null; save->v359
              mov     rdx            , r14            ; load->v360; null
              mov     rax            , r15            ; load->v361; null
              mov     r14            , 0              ; null; save->v362
              mov     r10            , r13            ; load->v359
              mov     r11            , r14            ; load->v362
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v359; load->v363
              sete    r10b                            
              mov     r13            , r10            ; save->v363; load->v363
              and     r10            , 255            
              mov     r13            , r10            ; save->v363; load->v363
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v363
              je      _text__main_and29_end                 
              mov     rbx            , 255            ; null; save->v353
_text__main_and29_end:
              mov     r10            , rbx            ; load->v353
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v353
              jne     _text__main_or23_end                 
              mov     rbp            , 0              ; null; save->v341
_text__main_or23_end:
              mov     r10            , rbp            ; load->v341
              cmp     r10            , 0              
              mov     rbp            , r10            ; save->v341
              jne     _text__main_or22_end                 
              mov     r12            , 0              ; null; save->v331
_text__main_or22_end:
              mov     r10            , r12            ; load->v331
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v331
              jne     _text__main_or21_end                 
              mov     qword [rsp+376], 0              ; null; save->v321
_text__main_or21_end:
              mov     r10            , qword [rsp+376]; load->v321
              cmp     r10            , 0              
              mov     qword [rsp+376], r10            ; save->v321
              jne     _text__main_or20_end                 
              mov     qword [rsp+368], 0              ; null; save->v311
_text__main_or20_end:
              mov     r10            , qword [rsp+368]; load->v311; init->f6
              mov     qword [rsp+384], r10            ; save->v364
_text__main_if0_init:
_text__main_if0_check:
              mov     r10            , qword [rsp+264]; load->v94
              cmp     r10b           , 0              
              mov     qword [rsp+264], r10            ; save->v94
              je      _text__main_if0_else                 
;----------------------------------]
;[----------------------------------
_text__main_if0_start:
              mov     rbp            , qword [rsp+152]; load->v22; null; save->v365
              mov     rbp            , qword [rsp+152]; load->v22; null; save->v366
              mov     r10            , rbp            ; load->v366
              add     r10            , 1              
              mov     rbp            , r10            ; save->v366
              mov     qword [rsp+152], rbp            ; load->v366; assign->ans; save->v22
              jmp     _text__main_if0_end                 
;----------------------------------]
;[----------------------------------
_text__main_if0_else:
_text__main_if0_end:
_text__main_if1_init:
_text__main_if1_check:
              mov     r10            , qword [rsp+288]; load->v148
              cmp     r10b           , 0              
              mov     qword [rsp+288], r10            ; save->v148
              je      _text__main_if1_else                 
;----------------------------------]
;[----------------------------------
_text__main_if1_start:
              mov     rbp            , qword [rsp+152]; load->v22; null; save->v367
              mov     rbp            , qword [rsp+152]; load->v22; null; save->v368
              mov     r10            , rbp            ; load->v368
              add     r10            , 1              
              mov     rbp            , r10            ; save->v368
              mov     qword [rsp+152], rbp            ; load->v368; assign->ans; save->v22
              jmp     _text__main_if1_end                 
;----------------------------------]
;[----------------------------------
_text__main_if1_else:
_text__main_if1_end:
_text__main_if2_init:
_text__main_if2_check:
              mov     r10            , qword [rsp+312]; load->v202
              cmp     r10b           , 0              
              mov     qword [rsp+312], r10            ; save->v202
              je      _text__main_if2_else                 
;----------------------------------]
;[----------------------------------
_text__main_if2_start:
              mov     rbp            , qword [rsp+152]; load->v22; null; save->v369
              mov     rbp            , qword [rsp+152]; load->v22; null; save->v370
              mov     r10            , rbp            ; load->v370
              add     r10            , 1              
              mov     rbp            , r10            ; save->v370
              mov     qword [rsp+152], rbp            ; load->v370; assign->ans; save->v22
              jmp     _text__main_if2_end                 
;----------------------------------]
;[----------------------------------
_text__main_if2_else:
_text__main_if2_end:
_text__main_if3_init:
_text__main_if3_check:
              mov     r10            , qword [rsp+336]; load->v256
              cmp     r10b           , 0              
              mov     qword [rsp+336], r10            ; save->v256
              je      _text__main_if3_else                 
;----------------------------------]
;[----------------------------------
_text__main_if3_start:
              mov     rbp            , qword [rsp+152]; load->v22; null; save->v371
              mov     rbp            , qword [rsp+152]; load->v22; null; save->v372
              mov     r10            , rbp            ; load->v372
              add     r10            , 1              
              mov     rbp            , r10            ; save->v372
              mov     qword [rsp+152], rbp            ; load->v372; assign->ans; save->v22
              jmp     _text__main_if3_end                 
;----------------------------------]
;[----------------------------------
_text__main_if3_else:
_text__main_if3_end:
_text__main_if4_init:
_text__main_if4_check:
              mov     r10            , qword [rsp+360]; load->v310
              cmp     r10b           , 0              
              mov     qword [rsp+360], r10            ; save->v310
              je      _text__main_if4_else                 
;----------------------------------]
;[----------------------------------
_text__main_if4_start:
              mov     rbp            , qword [rsp+152]; load->v22; null; save->v373
              mov     rbp            , qword [rsp+152]; load->v22; null; save->v374
              mov     r10            , rbp            ; load->v374
              add     r10            , 1              
              mov     rbp            , r10            ; save->v374
              mov     qword [rsp+152], rbp            ; load->v374; assign->ans; save->v22
              jmp     _text__main_if4_end                 
;----------------------------------]
;[----------------------------------
_text__main_if4_else:
_text__main_if4_end:
_text__main_if5_init:
_text__main_if5_check:
              mov     r10            , qword [rsp+384]; load->v364
              cmp     r10b           , 0              
              mov     qword [rsp+384], r10            ; save->v364
              je      _text__main_if5_else                 
;----------------------------------]
;[----------------------------------
_text__main_if5_start:
              mov     rbp            , qword [rsp+152]; load->v22; null; save->v375
              mov     rbp            , qword [rsp+152]; load->v22; null; save->v376
              mov     r10            , rbp            ; load->v376
              add     r10            , 1              
              mov     rbp            , r10            ; save->v376
              mov     qword [rsp+152], rbp            ; load->v376; assign->ans; save->v22
              jmp     _text__main_if5_end                 
;----------------------------------]
;[----------------------------------
_text__main_if5_else:
_text__main_if5_end:
_text__main_for2_continue:
              mov     rbp            , qword [rsp+136]; load->v18; null; save->v377
              mov     r10            , rbp            ; load->v377
              add     r10            , 1              
              mov     rbp            , r10            ; save->v377
              mov     qword [rsp+136], rbp            ; load->v377; assign->k; save->v18
              mov     r10            , qword [rsp+136]; load->v18
              mov     r11            , qword [rsp+144]; load->v20
              cmp     r10d           , r11d           
              mov     qword [rsp+136], r10            ; save->v18
              jl      _text__main_for2_start                 
;----------------------------------]
;[----------------------------------
_text__main_for2_end:
_text__main_for1_continue:
              mov     rbp            , qword [rsp+128]; load->v17; null; save->v378
              mov     r10            , rbp            ; load->v378
              add     r10            , 1              
              mov     rbp            , r10            ; save->v378
              mov     qword [rsp+128], rbp            ; load->v378; assign->j; save->v17
              mov     r10            , qword [rsp+128]; load->v17
              mov     r11            , qword [rsp+144]; load->v20
              cmp     r10d           , r11d           
              mov     qword [rsp+128], r10            ; save->v17
              jl      _text__main_for1_start                 
;----------------------------------]
;[----------------------------------
_text__main_for1_end:
_text__main_for0_continue:
              mov     rbp            , qword [rsp+120]; load->v16; null; save->v379
              mov     r10            , rbp            ; load->v379
              add     r10            , 1              
              mov     rbp            , r10            ; save->v379
              mov     qword [rsp+120], rbp            ; load->v379; assign->i; save->v16
              mov     r10            , qword [rsp+120]; load->v16
              mov     r11            , qword [rsp+144]; load->v20
              cmp     r10d           , r11d           
              mov     qword [rsp+120], r10            ; save->v16
              jl      _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
_text__main_call1:
              mov     rdi            , qword [rsp+152]; load->v22; null
              call    _text__toString                 
              mov     rbp            , rax            ; null; save->v380
_text__main_call2:
              mov     rdi            , rbp            ; load->v380; null
              call    _text__println                  
              mov     rbp            , rax            ; null; save->v381
_text__main_for3_init:
              mov     rbp            , 1              ; null; save->v382
              mov     qword [rsp+120], rbp            ; load->v382; assign->i; save->v16
              mov     rbp            , 30000000       ; null; save->v383
              mov     r10            , qword [rsp+120]; load->v16
              mov     r11            , rbp            ; load->v383
              cmp     r10d           , r11d           
              mov     qword [rsp+120], r10            ; save->v16
              mov     r10            , rbp            ; load->v384
              setle   r10b                            
              mov     rbp            , r10            ; save->v384; load->v384
              and     r10            , 255            
              mov     rbp            , r10            ; save->v384
_text__main_for3_init_check:
              mov     r10            , rbp            ; load->v384
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v384
              je      _text__main_for3_end                 
;----------------------------------]
;[----------------------------------
_text__main_for3_start:
              mov     rbp            , 100            ; null; save->v385
_text__main_call3:
              mov     rdi            , rbp            ; load->v385; null
              call    _text__g                        
              mov     rbp            , rax            ; null; save->v386
              mov     qword [rsp+392], rbp            ; load->v386; init->tt; save->v387
_text__main_if6_init:
              mov     rbp            , 3000000        ; null; save->v388
              mov     rbx            , rdx            ; null; save->v390
              mov     r12            , rax            ; null; save->v391
              mov     rax            , qword [rsp+120]; load->v16; null
              and     rax            , -1             
              mov     r10            , rbp            ; load->v388
              and     r10d           , -1             
              mov     rbp            , r10            ; save->v388
              cqo                                     
              mov     r10            , rbp            ; load->v388
              idiv    r10d                            
              mov     rbp            , rdx            ; save->v388; null; save->v389
              mov     rdx            , rbx            ; load->v390; null
              mov     rax            , r12            ; load->v391; null
              mov     rbx            , 0              ; null; save->v392
              mov     r10            , rbp            ; load->v389
              mov     r11            , rbx            ; load->v392
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v389; load->v393
              sete    r10b                            
              mov     rbp            , r10            ; save->v393; load->v393
              and     r10            , 255            
              mov     rbp            , r10            ; save->v393
_text__main_if6_check:
              mov     r10            , rbp            ; load->v393
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v393
              je      _text__main_if6_else                 
;----------------------------------]
;[----------------------------------
_text__main_if6_start:
_text__main_call4:
              mov     rdi            , qword [rsp+392]; load->v387; null
              call    _text__toString                 
              mov     rbp            , rax            ; null; save->v394
_text__main_call5:
              mov     rdi            , rbp            ; load->v394; null
              call    _text__println                  
              mov     rbp            , rax            ; null; save->v395
              jmp     _text__main_if6_end                 
;----------------------------------]
;[----------------------------------
_text__main_if6_else:
_text__main_if6_end:
_text__main_for3_continue:
              mov     rbp            , qword [rsp+120]; load->v16; null; save->v396
              mov     r10            , rbp            ; load->v396
              add     r10            , 1              
              mov     rbp            , r10            ; save->v396
              mov     qword [rsp+120], rbp            ; load->v396; assign->i; save->v16
              mov     rbp            , 30000000       ; null; save->v397
              mov     r10            , qword [rsp+120]; load->v16
              mov     r11            , rbp            ; load->v397
              cmp     r10d           , r11d           
              mov     qword [rsp+120], r10            ; save->v16
              jle     _text__main_for3_start                 
;----------------------------------]
;[----------------------------------
_text__main_for3_end:
              mov     rbp            , 0              ; null; save->v398
_text__main_ret0:
              mov     rax            , rbp            ; load->v398; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 408            
              ret                                     
;----------------------------------]
                                                      
