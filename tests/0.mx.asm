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
_data_bss_i:
              resb    8                               
_data_bss_a0:
              resb    8                               
_data_bss_a1:
              resb    8                               
_data_bss_a2:
              resb    8                               
_data_bss_a3:
              resb    8                               
_data_bss_a4:
              resb    8                               
_data_bss_a5:
              resb    8                               
_data_bss_a6:
              resb    8                               
_data_bss_a7:
              resb    8                               
_data_bss_a8:
              resb    8                               
_data_bss_a9:
              resb    8                               
_data_bss_a10:
              resb    8                               
_data_bss_b0:
              resb    8                               
_data_bss_b1:
              resb    8                               
_data_bss_b2:
              resb    8                               
_data_bss_b3:
              resb    8                               
_data_bss_b4:
              resb    8                               
_data_bss_b5:
              resb    8                               
_data_bss_b6:
              resb    8                               
_data_bss_b7:
              resb    8                               
_data_bss_b8:
              resb    8                               
_data_bss_b9:
              resb    8                               
_data_bss_b10:
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
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     rbp            , 0              ; null; save->v6
              mov     [_data_bss_i]  , rbp            ; load->v6; null
              mov     rbp            , 0              ; null; save->v7
              mov     [_data_bss_a0] , rbp            ; load->v7; null
              mov     rbp            , 0              ; null; save->v8
              mov     [_data_bss_a1] , rbp            ; load->v8; null
              mov     rbp            , 0              ; null; save->v9
              mov     [_data_bss_a2] , rbp            ; load->v9; null
              mov     rbp            , 0              ; null; save->v10
              mov     [_data_bss_a3] , rbp            ; load->v10; null
              mov     rbp            , 0              ; null; save->v11
              mov     [_data_bss_a4] , rbp            ; load->v11; null
              mov     rbp            , 0              ; null; save->v12
              mov     [_data_bss_a5] , rbp            ; load->v12; null
              mov     rbp            , 0              ; null; save->v13
              mov     [_data_bss_a6] , rbp            ; load->v13; null
              mov     rbp            , 0              ; null; save->v14
              mov     [_data_bss_a7] , rbp            ; load->v14; null
              mov     rbp            , 0              ; null; save->v15
              mov     [_data_bss_a8] , rbp            ; load->v15; null
              mov     rbp            , 0              ; null; save->v16
              mov     [_data_bss_a9] , rbp            ; load->v16; null
              mov     rbp            , 0              ; null; save->v17
              mov     [_data_bss_a10], rbp            ; load->v17; null
              mov     rbp            , 0              ; null; save->v18
              mov     [_data_bss_b0] , rbp            ; load->v18; null
              mov     rbp            , 0              ; null; save->v19
              mov     [_data_bss_b1] , rbp            ; load->v19; null
              mov     rbp            , 0              ; null; save->v20
              mov     [_data_bss_b2] , rbp            ; load->v20; null
              mov     rbp            , 0              ; null; save->v21
              mov     [_data_bss_b3] , rbp            ; load->v21; null
              mov     rbp            , 0              ; null; save->v22
              mov     [_data_bss_b4] , rbp            ; load->v22; null
              mov     rbp            , 0              ; null; save->v23
              mov     [_data_bss_b5] , rbp            ; load->v23; null
              mov     rbp            , 0              ; null; save->v24
              mov     [_data_bss_b6] , rbp            ; load->v24; null
              mov     rbp            , 0              ; null; save->v25
              mov     [_data_bss_b7] , rbp            ; load->v25; null
              mov     rbp            , 0              ; null; save->v26
              mov     [_data_bss_b8] , rbp            ; load->v26; null
              mov     rbp            , 0              ; null; save->v27
              mov     [_data_bss_b9] , rbp            ; load->v27; null
              mov     rbp            , 0              ; null; save->v28
              mov     [_data_bss_b10], rbp            ; load->v28; null
_datainit_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 56             
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
              mov     qword [rsp+48] , rbp            ; load->v6; init->sum; save->v7
_text__main_call0:
              call    _text__getInt                   
              mov     rbp            , rax            ; null; save->v8
              mov     r12            , rbp            ; load->v8; init->n; save->v9
_text__main_for0_init:
              mov     rbp            , 0              ; null; save->v10
              mov     [_data_bss_i]  , rbp            ; load->v10; null; null; save->v11
              mov     r10            , rbp            ; load->v11
              mov     r11            , r12            ; load->v9
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v11; load->v12
              setl    r10b                            
              mov     rbp            , r10            ; save->v12; load->v12
              and     r10            , 255            
              mov     rbp            , r10            ; save->v12
_text__main_for0_init_check:
              mov     r10            , rbp            ; load->v12
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v12
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
              mov     rbp            , [_data_bss_a0] ; null; save->v13
              mov     r13            , rbp            ; load->v13; null; save->v14
              mov     r10            , r13            ; load->v14
              add     r10            , 1              
              mov     r13            , r10            ; save->v14
              mov     [_data_bss_a0] , r13            ; load->v14; null
              mov     rbp            , [_data_bss_a1] ; null; save->v15
              mov     r13            , rbp            ; load->v15; null; save->v16
              mov     r10            , r13            ; load->v16
              add     r10            , 1              
              mov     r13            , r10            ; save->v16
              mov     [_data_bss_a1] , r13            ; load->v16; null
              mov     rbp            , [_data_bss_a2] ; null; save->v17
              mov     r13            , rbp            ; load->v17; null; save->v18
              mov     r10            , r13            ; load->v18
              add     r10            , 1              
              mov     r13            , r10            ; save->v18
              mov     [_data_bss_a2] , r13            ; load->v18; null
              mov     rbp            , [_data_bss_a0] ; null; save->v19
              mov     r13            , rbp            ; load->v19; null; save->v20
              mov     r10            , r13            ; load->v20
              add     r10            , 1              
              mov     r13            , r10            ; save->v20
              mov     [_data_bss_a3] , r13            ; load->v20; null
              mov     rbp            , [_data_bss_a1] ; null; save->v21
              mov     r13            , rbp            ; load->v21; null; save->v22
              mov     r10            , r13            ; load->v22
              add     r10            , 1              
              mov     r13            , r10            ; save->v22
              mov     [_data_bss_a4] , r13            ; load->v22; null
              mov     rbp            , [_data_bss_a2] ; null; save->v23
              mov     r13            , rbp            ; load->v23; null; save->v24
              mov     r10            , r13            ; load->v24
              add     r10            , 1              
              mov     r13            , r10            ; save->v24
              mov     [_data_bss_a5] , r13            ; load->v24; null
              mov     rbp            , [_data_bss_a0] ; null; save->v25
              mov     r13            , rbp            ; load->v25; null; save->v26
              mov     r10            , r13            ; load->v26
              add     r10            , 1              
              mov     r13            , r10            ; save->v26
              mov     [_data_bss_a6] , r13            ; load->v26; null
              mov     rbp            , [_data_bss_a1] ; null; save->v27
              mov     r13            , rbp            ; load->v27; null; save->v28
              mov     r10            , r13            ; load->v28
              add     r10            , 1              
              mov     r13            , r10            ; save->v28
              mov     [_data_bss_a7] , r13            ; load->v28; null
              mov     rbp            , [_data_bss_a2] ; null; save->v29
              mov     r13            , rbp            ; load->v29; null; save->v30
              mov     r10            , r13            ; load->v30
              add     r10            , 1              
              mov     r13            , r10            ; save->v30
              mov     [_data_bss_a8] , r13            ; load->v30; null
              mov     rbp            , [_data_bss_a0] ; null; save->v31
              mov     r13            , rbp            ; load->v31; null; save->v32
              mov     r10            , r13            ; load->v32
              add     r10            , 1              
              mov     r13            , r10            ; save->v32
              mov     [_data_bss_a9] , r13            ; load->v32; null
              mov     rbp            , [_data_bss_a1] ; null; save->v33
              mov     r13            , rbp            ; load->v33; null; save->v34
              mov     r10            , r13            ; load->v34
              add     r10            , 0              
              mov     r13            , r10            ; save->v34
              mov     [_data_bss_a10], r13            ; load->v34; null
              mov     rbp            , [_data_bss_a0] ; null; save->v35
              mov     [_data_bss_b0] , rbp            ; load->v35; null
              mov     rbp            , [_data_bss_a1] ; null; save->v36
              mov     [_data_bss_b1] , rbp            ; load->v36; null
              mov     rbp            , [_data_bss_a2] ; null; save->v37
              mov     [_data_bss_b2] , rbp            ; load->v37; null
              mov     rbp            , [_data_bss_a3] ; null; save->v38
              mov     [_data_bss_b3] , rbp            ; load->v38; null
              mov     rbp            , [_data_bss_a4] ; null; save->v39
              mov     [_data_bss_b4] , rbp            ; load->v39; null
              mov     rbp            , [_data_bss_a5] ; null; save->v40
              mov     [_data_bss_b5] , rbp            ; load->v40; null
              mov     rbp            , [_data_bss_a6] ; null; save->v41
              mov     [_data_bss_b6] , rbp            ; load->v41; null
              mov     rbp            , [_data_bss_a7] ; null; save->v42
              mov     [_data_bss_b7] , rbp            ; load->v42; null
              mov     rbp            , [_data_bss_a8] ; null; save->v43
              mov     [_data_bss_b8] , rbp            ; load->v43; null
              mov     rbp            , [_data_bss_a9] ; null; save->v44
              mov     [_data_bss_b9] , rbp            ; load->v44; null
              mov     rbp            , [_data_bss_a10]; null; save->v45
              mov     [_data_bss_b10], rbp            ; load->v45; null
_text__main_if0_init:
              mov     rbp            , [_data_bss_i]  ; null; save->v46
              mov     r13            , 10000000       ; null; save->v47
              mov     r14            , rdx            ; null; save->v49
              mov     r15            , rax            ; null; save->v50
              mov     rax            , rbp            ; load->v46; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v47
              and     r10d           , -1             
              mov     r13            , r10            ; save->v47
              cqo                                     
              mov     r10            , r13            ; load->v47
              idiv    r10d                            
              mov     r13            , r10            ; save->v47
              mov     rbp            , rdx            ; null; save->v48
              mov     rdx            , r14            ; load->v49; null
              mov     rax            , r15            ; load->v50; null
              mov     r13            , 0              ; null; save->v51
              mov     r10            , rbp            ; load->v48
              mov     r11            , r13            ; load->v51
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v48; load->v52
              sete    r10b                            
              mov     rbp            , r10            ; save->v52; load->v52
              and     r10            , 255            
              mov     rbp            , r10            ; save->v52
_text__main_if0_check:
              mov     r10            , rbp            ; load->v52
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v52
              je      _text__main_if0_else                 
;----------------------------------]
;[----------------------------------
_text__main_if0_start:
              mov     rbp            , [_data_bss_a0] ; null; save->v53
              mov     r13            , qword [rsp+48] ; load->v7; null; save->v54
              mov     r10            , r13            ; load->v54
              mov     r11            , rbp            ; load->v53
              add     r10            , r11            
              mov     r13            , r10            ; save->v54
              mov     rbp            , [_data_bss_a1] ; null; save->v55
              mov     r14            , r13            ; load->v54; null; save->v56
              mov     r10            , r14            ; load->v56
              mov     r11            , rbp            ; load->v55
              add     r10            , r11            
              mov     r14            , r10            ; save->v56
              mov     rbp            , [_data_bss_a2] ; null; save->v57
              mov     r13            , r14            ; load->v56; null; save->v58
              mov     r10            , r13            ; load->v58
              mov     r11            , rbp            ; load->v57
              add     r10            , r11            
              mov     r13            , r10            ; save->v58
              mov     rbp            , [_data_bss_a3] ; null; save->v59
              mov     r14            , r13            ; load->v58; null; save->v60
              mov     r10            , r14            ; load->v60
              mov     r11            , rbp            ; load->v59
              add     r10            , r11            
              mov     r14            , r10            ; save->v60
              mov     rbp            , [_data_bss_a4] ; null; save->v61
              mov     r13            , r14            ; load->v60; null; save->v62
              mov     r10            , r13            ; load->v62
              mov     r11            , rbp            ; load->v61
              add     r10            , r11            
              mov     r13            , r10            ; save->v62
              mov     rbp            , [_data_bss_a5] ; null; save->v63
              mov     r14            , r13            ; load->v62; null; save->v64
              mov     r10            , r14            ; load->v64
              mov     r11            , rbp            ; load->v63
              add     r10            , r11            
              mov     r14            , r10            ; save->v64
              mov     rbp            , [_data_bss_a6] ; null; save->v65
              mov     r13            , r14            ; load->v64; null; save->v66
              mov     r10            , r13            ; load->v66
              mov     r11            , rbp            ; load->v65
              add     r10            , r11            
              mov     r13            , r10            ; save->v66
              mov     rbp            , [_data_bss_a7] ; null; save->v67
              mov     r14            , r13            ; load->v66; null; save->v68
              mov     r10            , r14            ; load->v68
              mov     r11            , rbp            ; load->v67
              add     r10            , r11            
              mov     r14            , r10            ; save->v68
              mov     rbp            , [_data_bss_a8] ; null; save->v69
              mov     r13            , r14            ; load->v68; null; save->v70
              mov     r10            , r13            ; load->v70
              mov     r11            , rbp            ; load->v69
              add     r10            , r11            
              mov     r13            , r10            ; save->v70
              mov     rbp            , [_data_bss_a9] ; null; save->v71
              mov     r14            , r13            ; load->v70; null; save->v72
              mov     r10            , r14            ; load->v72
              mov     r11            , rbp            ; load->v71
              add     r10            , r11            
              mov     r14            , r10            ; save->v72
              mov     rbp            , [_data_bss_a10]; null; save->v73
              mov     r13            , r14            ; load->v72; null; save->v74
              mov     r10            , r13            ; load->v74
              mov     r11            , rbp            ; load->v73
              add     r10            , r11            
              mov     r13            , r10            ; save->v74
              mov     rbp            , [_data_bss_b0] ; null; save->v75
              mov     r14            , r13            ; load->v74; null; save->v76
              mov     r10            , r14            ; load->v76
              mov     r11            , rbp            ; load->v75
              add     r10            , r11            
              mov     r14            , r10            ; save->v76
              mov     rbp            , [_data_bss_b1] ; null; save->v77
              mov     r13            , r14            ; load->v76; null; save->v78
              mov     r10            , r13            ; load->v78
              mov     r11            , rbp            ; load->v77
              add     r10            , r11            
              mov     r13            , r10            ; save->v78
              mov     rbp            , [_data_bss_b2] ; null; save->v79
              mov     r14            , r13            ; load->v78; null; save->v80
              mov     r10            , r14            ; load->v80
              mov     r11            , rbp            ; load->v79
              add     r10            , r11            
              mov     r14            , r10            ; save->v80
              mov     rbp            , [_data_bss_b3] ; null; save->v81
              mov     r13            , r14            ; load->v80; null; save->v82
              mov     r10            , r13            ; load->v82
              mov     r11            , rbp            ; load->v81
              add     r10            , r11            
              mov     r13            , r10            ; save->v82
              mov     rbp            , [_data_bss_b4] ; null; save->v83
              mov     r14            , r13            ; load->v82; null; save->v84
              mov     r10            , r14            ; load->v84
              mov     r11            , rbp            ; load->v83
              add     r10            , r11            
              mov     r14            , r10            ; save->v84
              mov     rbp            , [_data_bss_b5] ; null; save->v85
              mov     r13            , r14            ; load->v84; null; save->v86
              mov     r10            , r13            ; load->v86
              mov     r11            , rbp            ; load->v85
              add     r10            , r11            
              mov     r13            , r10            ; save->v86
              mov     rbp            , [_data_bss_b6] ; null; save->v87
              mov     r14            , r13            ; load->v86; null; save->v88
              mov     r10            , r14            ; load->v88
              mov     r11            , rbp            ; load->v87
              add     r10            , r11            
              mov     r14            , r10            ; save->v88
              mov     rbp            , [_data_bss_b7] ; null; save->v89
              mov     r13            , r14            ; load->v88; null; save->v90
              mov     r10            , r13            ; load->v90
              mov     r11            , rbp            ; load->v89
              add     r10            , r11            
              mov     r13            , r10            ; save->v90
              mov     rbp            , [_data_bss_b8] ; null; save->v91
              mov     r14            , r13            ; load->v90; null; save->v92
              mov     r10            , r14            ; load->v92
              mov     r11            , rbp            ; load->v91
              add     r10            , r11            
              mov     r14            , r10            ; save->v92
              mov     rbp            , [_data_bss_b9] ; null; save->v93
              mov     r13            , r14            ; load->v92; null; save->v94
              mov     r10            , r13            ; load->v94
              mov     r11            , rbp            ; load->v93
              add     r10            , r11            
              mov     r13            , r10            ; save->v94
              mov     rbp            , [_data_bss_b10]; null; save->v95
              mov     r14            , r13            ; load->v94; null; save->v96
              mov     r10            , r14            ; load->v96
              mov     r11            , rbp            ; load->v95
              add     r10            , r11            
              mov     r14            , r10            ; save->v96
              mov     rbp            , 32767          ; null; save->v97
              mov     r13            , 16             ; null; save->v98
              mov     r15            , rcx            ; null; save->v100
              mov     rbx            , rbp            ; load->v97; null; save->v99
              mov     rcx            , r13            ; load->v98; null
              mov     r10            , rbx            ; load->v99
              and     r10            , -1             
              mov     rbx            , r10            ; save->v99; load->v99
              sal     r10d           , cl             
              mov     rbx            , r10            ; save->v99
              mov     rcx            , r15            ; load->v100; null
              mov     rbp            , 32767          ; null; save->v101
              mov     r13            , rbx            ; load->v99; null; save->v102
              mov     r10            , r13            ; load->v102
              mov     r11            , rbp            ; load->v101
              or      r10            , r11            
              mov     r13            , r10            ; save->v102
              mov     rbp            , r14            ; load->v96; null; save->v103
              mov     r10            , rbp            ; load->v103
              mov     r11            , r13            ; load->v102
              and     r10            , r11            
              mov     rbp            , r10            ; save->v103
              mov     qword [rsp+48] , rbp            ; load->v103; assign->sum; save->v7
              jmp     _text__main_if0_end                 
;----------------------------------]
;[----------------------------------
_text__main_if0_else:
_text__main_if0_end:
_text__main_for0_continue:
              mov     rbp            , [_data_bss_i]  ; null; save->v104
              mov     rbx            , rbp            ; load->v104; null; save->v105
              mov     r10            , rbx            ; load->v105
              add     r10            , 1              
              mov     rbx            , r10            ; save->v105
              mov     [_data_bss_i]  , rbx            ; load->v105; null
              mov     rbp            , [_data_bss_i]  ; null; save->v106
              mov     r10            , rbp            ; load->v106
              mov     r11            , r12            ; load->v9
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v106
              jl      _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
_text__main_call1:
              mov     rdi            , qword [rsp+48] ; load->v7; null
              call    _text__toString                 
              mov     rbp            , rax            ; null; save->v107
_text__main_call2:
              mov     rdi            , rbp            ; load->v107; null
              call    _text__println                  
              mov     rbp            , 0              ; null; save->v108; null; save->v109
_text__main_ret0:
              mov     rax            , rbp            ; load->v109; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
