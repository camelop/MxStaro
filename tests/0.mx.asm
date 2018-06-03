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
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     rbp            , rdi            ; null; save->v6
              mov     rbx            , _data_s0       ; null; save->v7
_text__print_call0:
              mov     rdi            , rbx            ; load->v7; null
              mov     rsi            , rbp            ; load->v6; null
              call    _text__printf                   
              mov     rbp            , rax            ; null; save->v8
_text__print_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
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
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     rbp            , rdi            ; null; save->v6
              mov     rbx            , _data_s1       ; null; save->v7
_text__println_call0:
              mov     rdi            , rbx            ; load->v7; null
              mov     rsi            , rbp            ; load->v6; null
              call    _text__printf                   
              mov     rbp            , rax            ; null; save->v8
_text__println_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
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
              sub     rsp            , 792            
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
              mov     [_data_bss_i]  , rbp            ; load->v10; null
              mov     r13            , [_data_bss_i]  ; null; save->v11
              mov     r10            , r13            ; load->v11
              mov     r11            , r12            ; load->v9
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v11
              mov     r10            , r14            ; load->v12
              setl    r10b                            
              mov     r14            , r10            ; save->v12; load->v12
              and     r10            , 255            
              mov     r14            , r10            ; save->v12
_text__main_for0_init_check:
              mov     r10            , r14            ; load->v12
              cmp     r10b           , 0              
              mov     r14            , r10            ; save->v12
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
              mov     r15            , [_data_bss_a0] ; null; save->v13
              mov     rbx            , r15            ; load->v13; null; save->v14
              mov     r10            , rbx            ; load->v14
              add     r10            , 1              
              mov     rbx            , r10            ; save->v14
              mov     [_data_bss_a0] , rbx            ; load->v14; null
              mov     r10            , [_data_bss_a1] 
              mov     qword [rsp+56] , r10            ; save->v15; load->v15; null
              mov     qword [rsp+64] , r10            ; save->v16; load->v16
              add     r10            , 1              
              mov     qword [rsp+64] , r10            ; save->v16
              mov     r11            , qword [rsp+64] ; load->v16
              mov     [_data_bss_a1] , r11            
              mov     r10            , [_data_bss_a2] 
              mov     qword [rsp+72] , r10            ; save->v17; load->v17; null
              mov     qword [rsp+80] , r10            ; save->v18; load->v18
              add     r10            , 1              
              mov     qword [rsp+80] , r10            ; save->v18
              mov     r11            , qword [rsp+80] ; load->v18
              mov     [_data_bss_a2] , r11            
              mov     r10            , [_data_bss_a0] 
              mov     qword [rsp+88] , r10            ; save->v19; load->v19; null
              mov     qword [rsp+96] , r10            ; save->v20; load->v20
              add     r10            , 1              
              mov     qword [rsp+96] , r10            ; save->v20
              mov     r11            , qword [rsp+96] ; load->v20
              mov     [_data_bss_a3] , r11            
              mov     r10            , [_data_bss_a1] 
              mov     qword [rsp+104], r10            ; save->v21; load->v21; null
              mov     qword [rsp+112], r10            ; save->v22; load->v22
              add     r10            , 1              
              mov     qword [rsp+112], r10            ; save->v22
              mov     r11            , qword [rsp+112]; load->v22
              mov     [_data_bss_a4] , r11            
              mov     r10            , [_data_bss_a2] 
              mov     qword [rsp+120], r10            ; save->v23; load->v23; null
              mov     qword [rsp+128], r10            ; save->v24; load->v24
              add     r10            , 1              
              mov     qword [rsp+128], r10            ; save->v24
              mov     r11            , qword [rsp+128]; load->v24
              mov     [_data_bss_a5] , r11            
              mov     r10            , [_data_bss_a0] 
              mov     qword [rsp+136], r10            ; save->v25; load->v25; null
              mov     qword [rsp+144], r10            ; save->v26; load->v26
              add     r10            , 1              
              mov     qword [rsp+144], r10            ; save->v26
              mov     r11            , qword [rsp+144]; load->v26
              mov     [_data_bss_a6] , r11            
              mov     r10            , [_data_bss_a1] 
              mov     qword [rsp+152], r10            ; save->v27; load->v27; null
              mov     qword [rsp+160], r10            ; save->v28; load->v28
              add     r10            , 1              
              mov     qword [rsp+160], r10            ; save->v28
              mov     r11            , qword [rsp+160]; load->v28
              mov     [_data_bss_a7] , r11            
              mov     r10            , [_data_bss_a2] 
              mov     qword [rsp+168], r10            ; save->v29; load->v29; null
              mov     qword [rsp+176], r10            ; save->v30; load->v30
              add     r10            , 1              
              mov     qword [rsp+176], r10            ; save->v30
              mov     r11            , qword [rsp+176]; load->v30
              mov     [_data_bss_a8] , r11            
              mov     r10            , [_data_bss_a0] 
              mov     qword [rsp+184], r10            ; save->v31; load->v31; null
              mov     qword [rsp+192], r10            ; save->v32; load->v32
              add     r10            , 1              
              mov     qword [rsp+192], r10            ; save->v32
              mov     r11            , qword [rsp+192]; load->v32
              mov     [_data_bss_a9] , r11            
              mov     r10            , [_data_bss_a1] 
              mov     qword [rsp+200], r10            ; save->v33; load->v33; null
              mov     qword [rsp+208], r10            ; save->v34; load->v34
              add     r10            , 0              
              mov     qword [rsp+208], r10            ; save->v34
              mov     r11            , qword [rsp+208]; load->v34
              mov     [_data_bss_a10], r11            
              mov     r10            , [_data_bss_a0] 
              mov     qword [rsp+216], r10            ; save->v35
              mov     r11            , qword [rsp+216]; load->v35
              mov     [_data_bss_b0] , r11            
              mov     r10            , [_data_bss_a1] 
              mov     qword [rsp+224], r10            ; save->v36
              mov     r11            , qword [rsp+224]; load->v36
              mov     [_data_bss_b1] , r11            
              mov     r10            , [_data_bss_a2] 
              mov     qword [rsp+232], r10            ; save->v37
              mov     r11            , qword [rsp+232]; load->v37
              mov     [_data_bss_b2] , r11            
              mov     r10            , [_data_bss_a3] 
              mov     qword [rsp+240], r10            ; save->v38
              mov     r11            , qword [rsp+240]; load->v38
              mov     [_data_bss_b3] , r11            
              mov     r10            , [_data_bss_a4] 
              mov     qword [rsp+248], r10            ; save->v39
              mov     r11            , qword [rsp+248]; load->v39
              mov     [_data_bss_b4] , r11            
              mov     r10            , [_data_bss_a5] 
              mov     qword [rsp+256], r10            ; save->v40
              mov     r11            , qword [rsp+256]; load->v40
              mov     [_data_bss_b5] , r11            
              mov     r10            , [_data_bss_a6] 
              mov     qword [rsp+264], r10            ; save->v41
              mov     r11            , qword [rsp+264]; load->v41
              mov     [_data_bss_b6] , r11            
              mov     r10            , [_data_bss_a7] 
              mov     qword [rsp+272], r10            ; save->v42
              mov     r11            , qword [rsp+272]; load->v42
              mov     [_data_bss_b7] , r11            
              mov     r10            , [_data_bss_a8] 
              mov     qword [rsp+280], r10            ; save->v43
              mov     r11            , qword [rsp+280]; load->v43
              mov     [_data_bss_b8] , r11            
              mov     r10            , [_data_bss_a9] 
              mov     qword [rsp+288], r10            ; save->v44
              mov     r11            , qword [rsp+288]; load->v44
              mov     [_data_bss_b9] , r11            
              mov     r10            , [_data_bss_a10]
              mov     qword [rsp+296], r10            ; save->v45
              mov     r11            , qword [rsp+296]; load->v45
              mov     [_data_bss_b10], r11            
_text__main_if0_init:
              mov     r10            , [_data_bss_i]  
              mov     qword [rsp+304], r10            ; save->v46
              mov     qword [rsp+312], 10000000       ; null; save->v47
              mov     qword [rsp+328], rdx            ; null; save->v49
              mov     qword [rsp+336], rax            ; null; save->v50
              mov     rax            , qword [rsp+304]; load->v46; null
              and     rax            , -1             
              mov     r10            , qword [rsp+312]; load->v47
              and     r10d           , -1             
              mov     qword [rsp+312], r10            ; save->v47
              cqo                                     
              mov     r10            , qword [rsp+312]; load->v47
              idiv    r10d                            
              mov     qword [rsp+312], r10            ; save->v47
              mov     qword [rsp+320], rdx            ; null; save->v48
              mov     rdx            , qword [rsp+328]; load->v49; null
              mov     rax            , qword [rsp+336]; load->v50; null
              mov     qword [rsp+344], 0              ; null; save->v51
              mov     r10            , qword [rsp+320]; load->v48
              mov     r11            , qword [rsp+344]; load->v51
              cmp     r10d           , r11d           
              mov     qword [rsp+320], r10            ; save->v48
              mov     r10            , qword [rsp+352]; load->v52
              sete    r10b                            
              mov     qword [rsp+352], r10            ; save->v52; load->v52
              and     r10            , 255            
              mov     qword [rsp+352], r10            ; save->v52
_text__main_if0_check:
              mov     r10            , qword [rsp+352]; load->v52
              cmp     r10b           , 0              
              mov     qword [rsp+352], r10            ; save->v52
              je      _text__main_if0_else                 
;----------------------------------]
;[----------------------------------
_text__main_if0_start:
              mov     r10            , [_data_bss_a0] 
              mov     qword [rsp+360], r10            ; save->v53
              mov     r10            , qword [rsp+48] ; load->v7; null
              mov     qword [rsp+368], r10            ; save->v54; load->v54
              mov     r11            , qword [rsp+360]; load->v53
              add     r10            , r11            
              mov     qword [rsp+368], r10            ; save->v54
              mov     r10            , [_data_bss_a1] 
              mov     qword [rsp+376], r10            ; save->v55
              mov     r10            , qword [rsp+368]; load->v54; null
              mov     qword [rsp+384], r10            ; save->v56; load->v56
              mov     r11            , qword [rsp+376]; load->v55
              add     r10            , r11            
              mov     qword [rsp+384], r10            ; save->v56
              mov     r10            , [_data_bss_a2] 
              mov     qword [rsp+392], r10            ; save->v57
              mov     r10            , qword [rsp+384]; load->v56; null
              mov     qword [rsp+400], r10            ; save->v58; load->v58
              mov     r11            , qword [rsp+392]; load->v57
              add     r10            , r11            
              mov     qword [rsp+400], r10            ; save->v58
              mov     r10            , [_data_bss_a3] 
              mov     qword [rsp+408], r10            ; save->v59
              mov     r10            , qword [rsp+400]; load->v58; null
              mov     qword [rsp+416], r10            ; save->v60; load->v60
              mov     r11            , qword [rsp+408]; load->v59
              add     r10            , r11            
              mov     qword [rsp+416], r10            ; save->v60
              mov     r10            , [_data_bss_a4] 
              mov     qword [rsp+424], r10            ; save->v61
              mov     r10            , qword [rsp+416]; load->v60; null
              mov     qword [rsp+432], r10            ; save->v62; load->v62
              mov     r11            , qword [rsp+424]; load->v61
              add     r10            , r11            
              mov     qword [rsp+432], r10            ; save->v62
              mov     r10            , [_data_bss_a5] 
              mov     qword [rsp+440], r10            ; save->v63
              mov     r10            , qword [rsp+432]; load->v62; null
              mov     qword [rsp+448], r10            ; save->v64; load->v64
              mov     r11            , qword [rsp+440]; load->v63
              add     r10            , r11            
              mov     qword [rsp+448], r10            ; save->v64
              mov     r10            , [_data_bss_a6] 
              mov     qword [rsp+456], r10            ; save->v65
              mov     r10            , qword [rsp+448]; load->v64; null
              mov     qword [rsp+464], r10            ; save->v66; load->v66
              mov     r11            , qword [rsp+456]; load->v65
              add     r10            , r11            
              mov     qword [rsp+464], r10            ; save->v66
              mov     r10            , [_data_bss_a7] 
              mov     qword [rsp+472], r10            ; save->v67
              mov     r10            , qword [rsp+464]; load->v66; null
              mov     qword [rsp+480], r10            ; save->v68; load->v68
              mov     r11            , qword [rsp+472]; load->v67
              add     r10            , r11            
              mov     qword [rsp+480], r10            ; save->v68
              mov     r10            , [_data_bss_a8] 
              mov     qword [rsp+488], r10            ; save->v69
              mov     r10            , qword [rsp+480]; load->v68; null
              mov     qword [rsp+496], r10            ; save->v70; load->v70
              mov     r11            , qword [rsp+488]; load->v69
              add     r10            , r11            
              mov     qword [rsp+496], r10            ; save->v70
              mov     r10            , [_data_bss_a9] 
              mov     qword [rsp+504], r10            ; save->v71
              mov     r10            , qword [rsp+496]; load->v70; null
              mov     qword [rsp+512], r10            ; save->v72; load->v72
              mov     r11            , qword [rsp+504]; load->v71
              add     r10            , r11            
              mov     qword [rsp+512], r10            ; save->v72
              mov     r10            , [_data_bss_a10]
              mov     qword [rsp+520], r10            ; save->v73
              mov     r10            , qword [rsp+512]; load->v72; null
              mov     qword [rsp+528], r10            ; save->v74; load->v74
              mov     r11            , qword [rsp+520]; load->v73
              add     r10            , r11            
              mov     qword [rsp+528], r10            ; save->v74
              mov     r10            , [_data_bss_b0] 
              mov     qword [rsp+536], r10            ; save->v75
              mov     r10            , qword [rsp+528]; load->v74; null
              mov     qword [rsp+544], r10            ; save->v76; load->v76
              mov     r11            , qword [rsp+536]; load->v75
              add     r10            , r11            
              mov     qword [rsp+544], r10            ; save->v76
              mov     r10            , [_data_bss_b1] 
              mov     qword [rsp+552], r10            ; save->v77
              mov     r10            , qword [rsp+544]; load->v76; null
              mov     qword [rsp+560], r10            ; save->v78; load->v78
              mov     r11            , qword [rsp+552]; load->v77
              add     r10            , r11            
              mov     qword [rsp+560], r10            ; save->v78
              mov     r10            , [_data_bss_b2] 
              mov     qword [rsp+568], r10            ; save->v79
              mov     r10            , qword [rsp+560]; load->v78; null
              mov     qword [rsp+576], r10            ; save->v80; load->v80
              mov     r11            , qword [rsp+568]; load->v79
              add     r10            , r11            
              mov     qword [rsp+576], r10            ; save->v80
              mov     r10            , [_data_bss_b3] 
              mov     qword [rsp+584], r10            ; save->v81
              mov     r10            , qword [rsp+576]; load->v80; null
              mov     qword [rsp+592], r10            ; save->v82; load->v82
              mov     r11            , qword [rsp+584]; load->v81
              add     r10            , r11            
              mov     qword [rsp+592], r10            ; save->v82
              mov     r10            , [_data_bss_b4] 
              mov     qword [rsp+600], r10            ; save->v83
              mov     r10            , qword [rsp+592]; load->v82; null
              mov     qword [rsp+608], r10            ; save->v84; load->v84
              mov     r11            , qword [rsp+600]; load->v83
              add     r10            , r11            
              mov     qword [rsp+608], r10            ; save->v84
              mov     r10            , [_data_bss_b5] 
              mov     qword [rsp+616], r10            ; save->v85
              mov     r10            , qword [rsp+608]; load->v84; null
              mov     qword [rsp+624], r10            ; save->v86; load->v86
              mov     r11            , qword [rsp+616]; load->v85
              add     r10            , r11            
              mov     qword [rsp+624], r10            ; save->v86
              mov     r10            , [_data_bss_b6] 
              mov     qword [rsp+632], r10            ; save->v87
              mov     r10            , qword [rsp+624]; load->v86; null
              mov     qword [rsp+640], r10            ; save->v88; load->v88
              mov     r11            , qword [rsp+632]; load->v87
              add     r10            , r11            
              mov     qword [rsp+640], r10            ; save->v88
              mov     r10            , [_data_bss_b7] 
              mov     qword [rsp+648], r10            ; save->v89
              mov     r10            , qword [rsp+640]; load->v88; null
              mov     qword [rsp+656], r10            ; save->v90; load->v90
              mov     r11            , qword [rsp+648]; load->v89
              add     r10            , r11            
              mov     qword [rsp+656], r10            ; save->v90
              mov     r10            , [_data_bss_b8] 
              mov     qword [rsp+664], r10            ; save->v91
              mov     r10            , qword [rsp+656]; load->v90; null
              mov     qword [rsp+672], r10            ; save->v92; load->v92
              mov     r11            , qword [rsp+664]; load->v91
              add     r10            , r11            
              mov     qword [rsp+672], r10            ; save->v92
              mov     r10            , [_data_bss_b9] 
              mov     qword [rsp+680], r10            ; save->v93
              mov     r10            , qword [rsp+672]; load->v92; null
              mov     qword [rsp+688], r10            ; save->v94; load->v94
              mov     r11            , qword [rsp+680]; load->v93
              add     r10            , r11            
              mov     qword [rsp+688], r10            ; save->v94
              mov     r10            , [_data_bss_b10]
              mov     qword [rsp+696], r10            ; save->v95
              mov     r10            , qword [rsp+688]; load->v94; null
              mov     qword [rsp+704], r10            ; save->v96; load->v96
              mov     r11            , qword [rsp+696]; load->v95
              add     r10            , r11            
              mov     qword [rsp+704], r10            ; save->v96
              mov     qword [rsp+712], 32767          ; null; save->v97
              mov     qword [rsp+720], 16             ; null; save->v98
              mov     qword [rsp+736], rcx            ; null; save->v100
              mov     r10            , qword [rsp+712]; load->v97; null
              mov     qword [rsp+728], r10            ; save->v99
              mov     rcx            , qword [rsp+720]; load->v98; null
              mov     r10            , qword [rsp+728]; load->v99
              and     r10            , -1             
              mov     qword [rsp+728], r10            ; save->v99; load->v99
              sal     r10d           , cl             
              mov     qword [rsp+728], r10            ; save->v99
              mov     rcx            , qword [rsp+736]; load->v100; null
              mov     qword [rsp+744], 32767          ; null; save->v101
              mov     r10            , qword [rsp+728]; load->v99; null
              mov     qword [rsp+752], r10            ; save->v102; load->v102
              mov     r11            , qword [rsp+744]; load->v101
              or      r10            , r11            
              mov     qword [rsp+752], r10            ; save->v102
              mov     r10            , qword [rsp+704]; load->v96; null
              mov     qword [rsp+760], r10            ; save->v103; load->v103
              mov     r11            , qword [rsp+752]; load->v102
              and     r10            , r11            
              mov     qword [rsp+760], r10            ; save->v103; load->v103; assign->sum
              mov     qword [rsp+48] , r10            ; save->v7
              jmp     _text__main_if0_end                 
;----------------------------------]
;[----------------------------------
_text__main_if0_else:
_text__main_if0_end:
_text__main_for0_continue:
              mov     r10            , [_data_bss_i]  
              mov     qword [rsp+768], r10            ; save->v104; load->v104; null
              mov     qword [rsp+776], r10            ; save->v105; load->v105
              add     r10            , 1              
              mov     qword [rsp+776], r10            ; save->v105
              mov     r11            , qword [rsp+776]; load->v105
              mov     [_data_bss_i]  , r11            
              mov     r10            , [_data_bss_i]  
              mov     qword [rsp+784], r10            ; save->v106; load->v106
              mov     r11            , r12            ; load->v9
              cmp     r10d           , r11d           
              mov     qword [rsp+784], r10            ; save->v106
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
              add     rsp            , 792            
              ret                                     
;----------------------------------]
                                                      
