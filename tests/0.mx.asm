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
_data_bss_N:
              resb    8                               
_data_bss_n:
              resb    8                               
_data_bss_a:
              resb    8                               
_data_bss_bak:
              resb    8                               
_data_bss_a_left:
              resb    8                               
_data_bss_a_right:
              resb    8                               
_data_bss_heap:
              resb    8                               
_data_bss_i1:
              resb    8                               
_data_bss_i2:
              resb    8                               
_data_bss_i3:
              resb    8                               
_data_bss_i4:
              resb    8                               
_data_bss_i5:
              resb    8                               
_data_bss_i6:
              resb    8                               
_data_bss_i7:
              resb    8                               
_data_bss_i8:
              resb    8                               
_data_bss_i9:
              resb    8                               
_data_bss_i10:
              resb    8                               
_data_bss_i11:
              resb    8                               
_data_bss_i12:
              resb    8                               
_data_bss_i13:
              resb    8                               
_data_bss_i14:
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
              sub     rsp            , 168            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     rbp            , 100000         ; null; save->v6
              mov     [_data_bss_N]  , rbp            ; load->v6; null
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+48] , r10            ; save->v7; load->v7; null
              mov     qword [rsp+56] , r10            ; save->v8; load->v8
              sal     r10            , 3              ; from imul              mov     qword [rsp+56] , r10            ; save->v8; load->v8
              add     r10            , 8              
              mov     qword [rsp+56] , r10            ; save->v8
              mov     rdi            , qword [rsp+56] ; load->v8; null
              call    malloc                          
              mov     qword [rsp+64] , rax            ; null; save->v9
              mov     r11            , qword [rsp+48] ; load->v7
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+64] ; load->v9
              mov     [_data_bss_a]  , r11            
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+72] , r10            ; save->v10; load->v10; null
              mov     qword [rsp+80] , r10            ; save->v11; load->v11
              sal     r10            , 3              ; from imul              mov     qword [rsp+80] , r10            ; save->v11; load->v11
              add     r10            , 8              
              mov     qword [rsp+80] , r10            ; save->v11
              mov     rdi            , qword [rsp+80] ; load->v11; null
              call    malloc                          
              mov     qword [rsp+88] , rax            ; null; save->v12
              mov     r11            , qword [rsp+72] ; load->v10
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+88] ; load->v12
              mov     [_data_bss_bak], r11            
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+96] , r10            ; save->v13; load->v13; null
              mov     qword [rsp+104], r10            ; save->v14; load->v14
              sal     r10            , 3              ; from imul              mov     qword [rsp+104], r10            ; save->v14; load->v14
              add     r10            , 8              
              mov     qword [rsp+104], r10            ; save->v14
              mov     rdi            , qword [rsp+104]; load->v14; null
              call    malloc                          
              mov     qword [rsp+112], rax            ; null; save->v15
              mov     r11            , qword [rsp+96] ; load->v13
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+112]; load->v15
              mov     [_data_bss_a_left], r11            
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+120], r10            ; save->v16; load->v16; null
              mov     qword [rsp+128], r10            ; save->v17; load->v17
              sal     r10            , 3              ; from imul              mov     qword [rsp+128], r10            ; save->v17; load->v17
              add     r10            , 8              
              mov     qword [rsp+128], r10            ; save->v17
              mov     rdi            , qword [rsp+128]; load->v17; null
              call    malloc                          
              mov     qword [rsp+136], rax            ; null; save->v18
              mov     r11            , qword [rsp+120]; load->v16
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+136]; load->v18
              mov     [_data_bss_a_right], r11            
              mov     r10            , [_data_bss_N]  
              mov     qword [rsp+144], r10            ; save->v19; load->v19; null
              mov     qword [rsp+152], r10            ; save->v20; load->v20
              sal     r10            , 3              ; from imul              mov     qword [rsp+152], r10            ; save->v20; load->v20
              add     r10            , 8              
              mov     qword [rsp+152], r10            ; save->v20
              mov     rdi            , qword [rsp+152]; load->v20; null
              call    malloc                          
              mov     qword [rsp+160], rax            ; null; save->v21
              mov     r11            , qword [rsp+144]; load->v19
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+160]; load->v21
              mov     [_data_bss_heap], r11            
_datainit_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              add     rsp            , 168            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text_A_Optimizer ] ---
;[----------------------------------
_text_A_Optimizer:
              sub     rsp            , 1064           
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     rbp            , rdi            ; null; save->v6
              mov     qword [rsp+48] , 2              ; null; save->v7
              mov     r10            , qword [rsp+48] ; load->v7; null
              mov     qword [rsp+56] , r10            ; save->v8; load->v8
              sal     r10            , 3              ; from imul              mov     qword [rsp+56] , r10            ; save->v8; load->v8
              add     r10            , 8              
              mov     qword [rsp+56] , r10            ; save->v8
              mov     rdi            , qword [rsp+56] ; load->v8; null
              call    malloc                          
              mov     qword [rsp+64] , rax            ; null; save->v9
              mov     r11            , qword [rsp+48] ; load->v7
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+48] ; load->v7; null
              mov     qword [rsp+72] , r10            ; save->v10
              mov     r10            , qword [rsp+64] ; load->v9; null
              mov     qword [rsp+80] , r10            ; save->v11; load->v11
              add     r10            , 8              
              mov     qword [rsp+80] , r10            ; save->v11
_text_A_Optimizer_new0_expand_start:
              mov     qword [rsp+88] , 2              ; null; save->v12
              mov     r10            , qword [rsp+88] ; load->v12; null
              mov     qword [rsp+96] , r10            ; save->v13; load->v13
              sal     r10            , 3              ; from imul              mov     qword [rsp+96] , r10            ; save->v13; load->v13
              add     r10            , 8              
              mov     qword [rsp+96] , r10            ; save->v13
              mov     rdi            , qword [rsp+96] ; load->v13; null
              call    malloc                          
              mov     qword [rsp+104], rax            ; null; save->v14
              mov     r11            , qword [rsp+88] ; load->v12
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+88] ; load->v12; null
              mov     qword [rsp+112], r10            ; save->v15
              mov     r10            , qword [rsp+104]; load->v14; null
              mov     qword [rsp+120], r10            ; save->v16; load->v16
              add     r10            , 8              
              mov     qword [rsp+120], r10            ; save->v16
_text_A_Optimizer_new1_expand_start:
              mov     qword [rsp+128], 2              ; null; save->v17
              mov     r10            , qword [rsp+128]; load->v17; null
              mov     qword [rsp+136], r10            ; save->v18; load->v18
              sal     r10            , 3              ; from imul              mov     qword [rsp+136], r10            ; save->v18; load->v18
              add     r10            , 8              
              mov     qword [rsp+136], r10            ; save->v18
              mov     rdi            , qword [rsp+136]; load->v18; null
              call    malloc                          
              mov     qword [rsp+144], rax            ; null; save->v19
              mov     r11            , qword [rsp+128]; load->v17
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+128]; load->v17; null
              mov     qword [rsp+152], r10            ; save->v20
              mov     r10            , qword [rsp+144]; load->v19; null
              mov     qword [rsp+160], r10            ; save->v21; load->v21
              add     r10            , 8              
              mov     qword [rsp+160], r10            ; save->v21
_text_A_Optimizer_new2_expand_start:
              mov     qword [rsp+168], 2              ; null; save->v22
              mov     r10            , qword [rsp+168]; load->v22; null
              mov     qword [rsp+176], r10            ; save->v23; load->v23
              sal     r10            , 3              ; from imul              mov     qword [rsp+176], r10            ; save->v23; load->v23
              add     r10            , 8              
              mov     qword [rsp+176], r10            ; save->v23
              mov     rdi            , qword [rsp+176]; load->v23; null
              call    malloc                          
              mov     qword [rsp+184], rax            ; null; save->v24
              mov     r11            , qword [rsp+168]; load->v22
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+168]; load->v22; null
              mov     qword [rsp+192], r10            ; save->v25
              mov     r10            , qword [rsp+184]; load->v24; null
              mov     qword [rsp+200], r10            ; save->v26; load->v26
              add     r10            , 8              
              mov     qword [rsp+200], r10            ; save->v26
_text_A_Optimizer_new3_expand_start:
              mov     qword [rsp+208], 2              ; null; save->v27
              mov     r10            , qword [rsp+208]; load->v27; null
              mov     qword [rsp+216], r10            ; save->v28; load->v28
              sal     r10            , 3              ; from imul              mov     qword [rsp+216], r10            ; save->v28; load->v28
              add     r10            , 8              
              mov     qword [rsp+216], r10            ; save->v28
              mov     rdi            , qword [rsp+216]; load->v28; null
              call    malloc                          
              mov     qword [rsp+224], rax            ; null; save->v29
              mov     r11            , qword [rsp+208]; load->v27
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+208]; load->v27; null
              mov     qword [rsp+232], r10            ; save->v30
              mov     r10            , qword [rsp+224]; load->v29; null
              mov     qword [rsp+240], r10            ; save->v31; load->v31
              add     r10            , 8              
              mov     qword [rsp+240], r10            ; save->v31
_text_A_Optimizer_new4_expand_start:
              mov     qword [rsp+248], 2              ; null; save->v32
              mov     r10            , qword [rsp+248]; load->v32; null
              mov     qword [rsp+256], r10            ; save->v33; load->v33
              sal     r10            , 3              ; from imul              mov     qword [rsp+256], r10            ; save->v33; load->v33
              add     r10            , 8              
              mov     qword [rsp+256], r10            ; save->v33
              mov     rdi            , qword [rsp+256]; load->v33; null
              call    malloc                          
              mov     qword [rsp+264], rax            ; null; save->v34
              mov     r11            , qword [rsp+248]; load->v32
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+248]; load->v32; null
              mov     qword [rsp+272], r10            ; save->v35
              mov     r10            , qword [rsp+264]; load->v34; null
              mov     qword [rsp+280], r10            ; save->v36; load->v36
              add     r10            , 8              
              mov     qword [rsp+280], r10            ; save->v36
_text_A_Optimizer_new5_expand_start:
              mov     qword [rsp+288], 2              ; null; save->v37
              mov     r10            , qword [rsp+288]; load->v37; null
              mov     qword [rsp+296], r10            ; save->v38; load->v38
              sal     r10            , 3              ; from imul              mov     qword [rsp+296], r10            ; save->v38; load->v38
              add     r10            , 8              
              mov     qword [rsp+296], r10            ; save->v38
              mov     rdi            , qword [rsp+296]; load->v38; null
              call    malloc                          
              mov     qword [rsp+304], rax            ; null; save->v39
              mov     r11            , qword [rsp+288]; load->v37
              mov     qword [rax]    , r11            
              mov     rbp            , qword [rsp+288]; load->v37; null; save->v40
              mov     rbx            , qword [rsp+304]; load->v39; null; save->v41
              mov     r10            , rbx            ; load->v41
              add     r10            , 8              
              mov     rbx            , r10            ; save->v41
_text_A_Optimizer_new6_expand_start:
              mov     qword [rsp+312], 2              ; null; save->v42
              mov     r10            , qword [rsp+312]; load->v42; null
              mov     qword [rsp+320], r10            ; save->v43; load->v43
              sal     r10            , 3              ; from imul              mov     qword [rsp+320], r10            ; save->v43; load->v43
              add     r10            , 8              
              mov     qword [rsp+320], r10            ; save->v43
              mov     rdi            , qword [rsp+320]; load->v43; null
              call    malloc                          
              mov     qword [rsp+328], rax            ; null; save->v44
              mov     r11            , qword [rsp+312]; load->v42
              mov     qword [rax]    , r11            
              mov     r12            , qword [rsp+312]; load->v42; null; save->v45
              mov     r13            , qword [rsp+328]; load->v44; null; save->v46
              mov     r10            , r13            ; load->v46
              add     r10            , 8              
              mov     r13            , r10            ; save->v46
_text_A_Optimizer_new7_expand_start:
              mov     qword [rsp+336], 2              ; null; save->v47
              mov     r10            , qword [rsp+336]; load->v47; null
              mov     qword [rsp+344], r10            ; save->v48; load->v48
              sal     r10            , 3              ; from imul              mov     qword [rsp+344], r10            ; save->v48; load->v48
              add     r10            , 8              
              mov     qword [rsp+344], r10            ; save->v48
              mov     rdi            , qword [rsp+344]; load->v48; null
              call    malloc                          
              mov     qword [rsp+352], rax            ; null; save->v49
              mov     r11            , qword [rsp+336]; load->v47
              mov     qword [rax]    , r11            
              mov     r14            , qword [rsp+336]; load->v47; null; save->v50
              mov     r15            , qword [rsp+352]; load->v49; null; save->v51
              mov     r10            , r15            ; load->v51
              add     r10            , 8              
              mov     r15            , r10            ; save->v51
_text_A_Optimizer_new8_expand_start:
              mov     qword [rsp+360], 2              ; null; save->v52
              mov     r10            , qword [rsp+360]; load->v52; null
              mov     qword [rsp+368], r10            ; save->v53; load->v53
              sal     r10            , 3              ; from imul              mov     qword [rsp+368], r10            ; save->v53; load->v53
              add     r10            , 8              
              mov     qword [rsp+368], r10            ; save->v53
              mov     rdi            , qword [rsp+368]; load->v53; null
              call    malloc                          
              mov     qword [rsp+376], rax            ; null; save->v54
              mov     r11            , qword [rsp+360]; load->v52
              mov     qword [rax]    , r11            
              mov     r10            , r15            ; translate->qword [v51]
              mov     r11            , qword [rsp+376]; load->v54
              mov     qword [r10]    , r11            
              mov     r10            , r15            ; load->v51
              add     r10            , 8              
              mov     r15            , r10            ; save->v51
              mov     r10            , r14            ; load->v50
              sub     r10            , 1              
              mov     r14            , r10            ; save->v50; load->v50
              cmp     r10            , 0              
              mov     r14            , r10            ; save->v50
              jne     _text_A_Optimizer_new8_expand_start                 
_text_A_Optimizer_new8_expand_end:
              mov     r10            , r13            ; translate->qword [v46]
              mov     r11            , qword [rsp+352]; load->v49
              mov     qword [r10]    , r11            
              mov     r10            , r13            ; load->v46
              add     r10            , 8              
              mov     r13            , r10            ; save->v46
              mov     r10            , r12            ; load->v45
              sub     r10            , 1              
              mov     r12            , r10            ; save->v45; load->v45
              cmp     r10            , 0              
              mov     r12            , r10            ; save->v45
              jne     _text_A_Optimizer_new7_expand_start                 
_text_A_Optimizer_new7_expand_end:
              mov     r10            , rbx            ; translate->qword [v41]
              mov     r11            , qword [rsp+328]; load->v44
              mov     qword [r10]    , r11            
              mov     r10            , rbx            ; load->v41
              add     r10            , 8              
              mov     rbx            , r10            ; save->v41
              mov     r10            , rbp            ; load->v40
              sub     r10            , 1              
              mov     rbp            , r10            ; save->v40; load->v40
              cmp     r10            , 0              
              mov     rbp            , r10            ; save->v40
              jne     _text_A_Optimizer_new6_expand_start                 
_text_A_Optimizer_new6_expand_end:
              mov     r10            , qword [rsp+280]; translate->qword [v36]
              mov     r11            , qword [rsp+304]; load->v39
              mov     qword [r10]    , r11            
              mov     r10            , qword [rsp+280]; load->v36
              add     r10            , 8              
              mov     qword [rsp+280], r10            ; save->v36
              mov     r10            , qword [rsp+272]; load->v35
              sub     r10            , 1              
              mov     qword [rsp+272], r10            ; save->v35; load->v35
              cmp     r10            , 0              
              mov     qword [rsp+272], r10            ; save->v35
              jne     _text_A_Optimizer_new5_expand_start                 
_text_A_Optimizer_new5_expand_end:
              mov     r10            , qword [rsp+240]; translate->qword [v31]
              mov     r11            , qword [rsp+264]; load->v34
              mov     qword [r10]    , r11            
              mov     r10            , qword [rsp+240]; load->v31
              add     r10            , 8              
              mov     qword [rsp+240], r10            ; save->v31
              mov     r10            , qword [rsp+232]; load->v30
              sub     r10            , 1              
              mov     qword [rsp+232], r10            ; save->v30; load->v30
              cmp     r10            , 0              
              mov     qword [rsp+232], r10            ; save->v30
              jne     _text_A_Optimizer_new4_expand_start                 
_text_A_Optimizer_new4_expand_end:
              mov     r10            , qword [rsp+200]; translate->qword [v26]
              mov     r11            , qword [rsp+224]; load->v29
              mov     qword [r10]    , r11            
              mov     r10            , qword [rsp+200]; load->v26
              add     r10            , 8              
              mov     qword [rsp+200], r10            ; save->v26
              mov     r10            , qword [rsp+192]; load->v25
              sub     r10            , 1              
              mov     qword [rsp+192], r10            ; save->v25; load->v25
              cmp     r10            , 0              
              mov     qword [rsp+192], r10            ; save->v25
              jne     _text_A_Optimizer_new3_expand_start                 
_text_A_Optimizer_new3_expand_end:
              mov     r10            , qword [rsp+160]; translate->qword [v21]
              mov     r11            , qword [rsp+184]; load->v24
              mov     qword [r10]    , r11            
              mov     r10            , qword [rsp+160]; load->v21
              add     r10            , 8              
              mov     qword [rsp+160], r10            ; save->v21
              mov     r10            , qword [rsp+152]; load->v20
              sub     r10            , 1              
              mov     qword [rsp+152], r10            ; save->v20; load->v20
              cmp     r10            , 0              
              mov     qword [rsp+152], r10            ; save->v20
              jne     _text_A_Optimizer_new2_expand_start                 
_text_A_Optimizer_new2_expand_end:
              mov     r10            , qword [rsp+120]; translate->qword [v16]
              mov     r11            , qword [rsp+144]; load->v19
              mov     qword [r10]    , r11            
              mov     r10            , qword [rsp+120]; load->v16
              add     r10            , 8              
              mov     qword [rsp+120], r10            ; save->v16
              mov     r10            , qword [rsp+112]; load->v15
              sub     r10            , 1              
              mov     qword [rsp+112], r10            ; save->v15; load->v15
              cmp     r10            , 0              
              mov     qword [rsp+112], r10            ; save->v15
              jne     _text_A_Optimizer_new1_expand_start                 
_text_A_Optimizer_new1_expand_end:
              mov     r10            , qword [rsp+80] ; translate->qword [v11]
              mov     r11            , qword [rsp+104]; load->v14
              mov     qword [r10]    , r11            
              mov     r10            , qword [rsp+80] ; load->v11
              add     r10            , 8              
              mov     qword [rsp+80] , r10            ; save->v11
              mov     r10            , qword [rsp+72] ; load->v10
              sub     r10            , 1              
              mov     qword [rsp+72] , r10            ; save->v10; load->v10
              cmp     r10            , 0              
              mov     qword [rsp+72] , r10            ; save->v10
              jne     _text_A_Optimizer_new0_expand_start                 
_text_A_Optimizer_new0_expand_end:
              mov     rbp            , qword [rsp+64] ; load->v9; init->arr; save->v55
              mov     rbx            , 0              ; null; save->v71
              mov     qword [rsp+504], rbx            ; load->v71; init->sum; save->v72
_text_A_Optimizer_for0_init:
              mov     r13            , 1              ; null; save->v73
              mov     qword [rsp+496], r13            ; load->v73; assign->i; save->v70
              mov     r14            , 1000           ; null; save->v74
              mov     r10            , qword [rsp+496]; load->v70
              mov     r11            , r14            ; load->v74
              cmp     r10d           , r11d           
              mov     qword [rsp+496], r10            ; save->v70
              mov     r10            , r15            ; load->v75
              setle   r10b                            
              mov     r15            , r10            ; save->v75; load->v75
              and     r10            , 255            
              mov     r15            , r10            ; save->v75
_text_A_Optimizer_for0_init_check:
              mov     r10            , r15            ; load->v75
              cmp     r10b           , 0              
              mov     r15            , r10            ; save->v75
              je      _text_A_Optimizer_for0_end                 
;----------------------------------]
;[----------------------------------
_text_A_Optimizer_for0_start:
              mov     rbx            , 123            ; null; save->v76
              mov     r12            , rbx            ; load->v76; null; save->v77
              mov     r10            , r12            ; load->v77
              mov     r11            , qword [rsp+496]; load->v70
              add     r10            , r11            
              mov     r12            , r10            ; save->v77
              mov     qword [rsp+512], 0              ; null; save->v78
              mov     r10            , qword [rsp+512]; load->v78; null
              mov     qword [rsp+520], r10            ; save->v79; load->v79
              sal     r10            , 3              ; from imul              mov     qword [rsp+520], r10            ; save->v79; load->v79
              add     r10            , 8              
              mov     qword [rsp+520], r10            ; save->v79; load->v79
              mov     r11            , rbp            ; load->v55
              add     r10            , r11            
              mov     qword [rsp+520], r10            ; save->v79
              mov     r11            , qword [rsp+520]; translate->qword [v79]
              mov     r10            , qword [r11]    
              mov     qword [rsp+528], r10            ; save->v80
              mov     qword [rsp+536], 1              ; null; save->v81
              mov     r10            , qword [rsp+536]; load->v81; null
              mov     qword [rsp+544], r10            ; save->v82; load->v82
              sal     r10            , 3              ; from imul              mov     qword [rsp+544], r10            ; save->v82; load->v82
              add     r10            , 8              
              mov     qword [rsp+544], r10            ; save->v82; load->v82
              mov     r11            , qword [rsp+528]; load->v80
              add     r10            , r11            
              mov     qword [rsp+544], r10            ; save->v82
              mov     r11            , qword [rsp+544]; translate->qword [v82]
              mov     r10            , qword [r11]    
              mov     qword [rsp+552], r10            ; save->v83
              mov     qword [rsp+560], 0              ; null; save->v84
              mov     r10            , qword [rsp+560]; load->v84; null
              mov     qword [rsp+568], r10            ; save->v85; load->v85
              sal     r10            , 3              ; from imul              mov     qword [rsp+568], r10            ; save->v85; load->v85
              add     r10            , 8              
              mov     qword [rsp+568], r10            ; save->v85; load->v85
              mov     r11            , qword [rsp+552]; load->v83
              add     r10            , r11            
              mov     qword [rsp+568], r10            ; save->v85
              mov     r11            , qword [rsp+568]; translate->qword [v85]
              mov     r10            , qword [r11]    
              mov     qword [rsp+576], r10            ; save->v86
              mov     qword [rsp+584], 1              ; null; save->v87
              mov     r10            , qword [rsp+584]; load->v87; null
              mov     qword [rsp+592], r10            ; save->v88; load->v88
              sal     r10            , 3              ; from imul              mov     qword [rsp+592], r10            ; save->v88; load->v88
              add     r10            , 8              
              mov     qword [rsp+592], r10            ; save->v88; load->v88
              mov     r11            , qword [rsp+576]; load->v86
              add     r10            , r11            
              mov     qword [rsp+592], r10            ; save->v88
              mov     r11            , qword [rsp+592]; translate->qword [v88]
              mov     r10            , qword [r11]    
              mov     qword [rsp+600], r10            ; save->v89
              mov     qword [rsp+608], 0              ; null; save->v90
              mov     r10            , qword [rsp+608]; load->v90; null
              mov     qword [rsp+616], r10            ; save->v91; load->v91
              sal     r10            , 3              ; from imul              mov     qword [rsp+616], r10            ; save->v91; load->v91
              add     r10            , 8              
              mov     qword [rsp+616], r10            ; save->v91; load->v91
              mov     r11            , qword [rsp+600]; load->v89
              add     r10            , r11            
              mov     qword [rsp+616], r10            ; save->v91
              mov     r11            , qword [rsp+616]; translate->qword [v91]
              mov     r10            , qword [r11]    
              mov     qword [rsp+624], r10            ; save->v92
              mov     qword [rsp+632], 1              ; null; save->v93
              mov     r10            , qword [rsp+632]; load->v93; null
              mov     qword [rsp+640], r10            ; save->v94; load->v94
              sal     r10            , 3              ; from imul              mov     qword [rsp+640], r10            ; save->v94; load->v94
              add     r10            , 8              
              mov     qword [rsp+640], r10            ; save->v94; load->v94
              mov     r11            , qword [rsp+624]; load->v92
              add     r10            , r11            
              mov     qword [rsp+640], r10            ; save->v94
              mov     r11            , qword [rsp+640]; translate->qword [v94]
              mov     r10            , qword [r11]    
              mov     qword [rsp+648], r10            ; save->v95
              mov     qword [rsp+656], 0              ; null; save->v96
              mov     r10            , qword [rsp+656]; load->v96; null
              mov     qword [rsp+664], r10            ; save->v97; load->v97
              sal     r10            , 3              ; from imul              mov     qword [rsp+664], r10            ; save->v97; load->v97
              add     r10            , 8              
              mov     qword [rsp+664], r10            ; save->v97; load->v97
              mov     r11            , qword [rsp+648]; load->v95
              add     r10            , r11            
              mov     qword [rsp+664], r10            ; save->v97
              mov     r11            , qword [rsp+664]; translate->qword [v97]
              mov     r10            , qword [r11]    
              mov     qword [rsp+672], r10            ; save->v98
              mov     qword [rsp+680], 1              ; null; save->v99
              mov     r10            , qword [rsp+680]; load->v99; null
              mov     qword [rsp+688], r10            ; save->v100; load->v100
              sal     r10            , 3              ; from imul              mov     qword [rsp+688], r10            ; save->v100; load->v100
              add     r10            , 8              
              mov     qword [rsp+688], r10            ; save->v100; load->v100
              mov     r11            , qword [rsp+672]; load->v98
              add     r10            , r11            
              mov     qword [rsp+688], r10            ; save->v100
              mov     r11            , qword [rsp+688]; translate->qword [v100]
              mov     r10            , qword [r11]    
              mov     qword [rsp+696], r10            ; save->v101
              mov     qword [rsp+704], 0              ; null; save->v102
              mov     r10            , qword [rsp+704]; load->v102; null
              mov     qword [rsp+712], r10            ; save->v103; load->v103
              sal     r10            , 3              ; from imul              mov     qword [rsp+712], r10            ; save->v103; load->v103
              add     r10            , 8              
              mov     qword [rsp+712], r10            ; save->v103; load->v103
              mov     r11            , qword [rsp+696]; load->v101
              add     r10            , r11            
              mov     qword [rsp+712], r10            ; save->v103
              mov     r11            , qword [rsp+712]; translate->qword [v103]
              mov     r10            , qword [r11]    
              mov     qword [rsp+720], r10            ; save->v104
              mov     qword [rsp+728], 1              ; null; save->v105
              mov     r10            , qword [rsp+728]; load->v105; null
              mov     qword [rsp+736], r10            ; save->v106; load->v106
              sal     r10            , 3              ; from imul              mov     qword [rsp+736], r10            ; save->v106; load->v106
              add     r10            , 8              
              mov     qword [rsp+736], r10            ; save->v106; load->v106
              mov     r11            , qword [rsp+720]; load->v104
              add     r10            , r11            
              mov     qword [rsp+736], r10            ; save->v106
              mov     r11            , qword [rsp+736]; translate->qword [v106]
              mov     r10            , qword [r11]    
              mov     qword [rsp+744], r10            ; save->v107
              mov     r10            , qword [rsp+736]; translate->qword [v106]
              mov     qword [r10]    , r12            ; load->v77; assign->arr[0][1][0][1][0][1][0][1][0][1]
              mov     qword [rsp+752], 0              ; null; save->v108
              mov     r10            , qword [rsp+752]; load->v108; null
              mov     qword [rsp+760], r10            ; save->v109; load->v109
              sal     r10            , 3              ; from imul              mov     qword [rsp+760], r10            ; save->v109; load->v109
              add     r10            , 8              
              mov     qword [rsp+760], r10            ; save->v109; load->v109
              mov     r11            , rbp            ; load->v55
              add     r10            , r11            
              mov     qword [rsp+760], r10            ; save->v109
              mov     r11            , qword [rsp+760]; translate->qword [v109]
              mov     r10            , qword [r11]    
              mov     qword [rsp+768], r10            ; save->v110
              mov     qword [rsp+776], 1              ; null; save->v111
              mov     r10            , qword [rsp+776]; load->v111; null
              mov     qword [rsp+784], r10            ; save->v112; load->v112
              sal     r10            , 3              ; from imul              mov     qword [rsp+784], r10            ; save->v112; load->v112
              add     r10            , 8              
              mov     qword [rsp+784], r10            ; save->v112; load->v112
              mov     r11            , qword [rsp+768]; load->v110
              add     r10            , r11            
              mov     qword [rsp+784], r10            ; save->v112
              mov     r11            , qword [rsp+784]; translate->qword [v112]
              mov     r10            , qword [r11]    
              mov     qword [rsp+792], r10            ; save->v113
              mov     qword [rsp+800], 0              ; null; save->v114
              mov     r10            , qword [rsp+800]; load->v114; null
              mov     qword [rsp+808], r10            ; save->v115; load->v115
              sal     r10            , 3              ; from imul              mov     qword [rsp+808], r10            ; save->v115; load->v115
              add     r10            , 8              
              mov     qword [rsp+808], r10            ; save->v115; load->v115
              mov     r11            , qword [rsp+792]; load->v113
              add     r10            , r11            
              mov     qword [rsp+808], r10            ; save->v115
              mov     r11            , qword [rsp+808]; translate->qword [v115]
              mov     r10            , qword [r11]    
              mov     qword [rsp+816], r10            ; save->v116
              mov     qword [rsp+824], 1              ; null; save->v117
              mov     r10            , qword [rsp+824]; load->v117; null
              mov     qword [rsp+832], r10            ; save->v118; load->v118
              sal     r10            , 3              ; from imul              mov     qword [rsp+832], r10            ; save->v118; load->v118
              add     r10            , 8              
              mov     qword [rsp+832], r10            ; save->v118; load->v118
              mov     r11            , qword [rsp+816]; load->v116
              add     r10            , r11            
              mov     qword [rsp+832], r10            ; save->v118
              mov     r11            , qword [rsp+832]; translate->qword [v118]
              mov     r10            , qword [r11]    
              mov     qword [rsp+840], r10            ; save->v119
              mov     qword [rsp+848], 0              ; null; save->v120
              mov     r10            , qword [rsp+848]; load->v120; null
              mov     qword [rsp+856], r10            ; save->v121; load->v121
              sal     r10            , 3              ; from imul              mov     qword [rsp+856], r10            ; save->v121; load->v121
              add     r10            , 8              
              mov     qword [rsp+856], r10            ; save->v121; load->v121
              mov     r11            , qword [rsp+840]; load->v119
              add     r10            , r11            
              mov     qword [rsp+856], r10            ; save->v121
              mov     r11            , qword [rsp+856]; translate->qword [v121]
              mov     r10            , qword [r11]    
              mov     qword [rsp+864], r10            ; save->v122
              mov     qword [rsp+872], 1              ; null; save->v123
              mov     r10            , qword [rsp+872]; load->v123; null
              mov     qword [rsp+880], r10            ; save->v124; load->v124
              sal     r10            , 3              ; from imul              mov     qword [rsp+880], r10            ; save->v124; load->v124
              add     r10            , 8              
              mov     qword [rsp+880], r10            ; save->v124; load->v124
              mov     r11            , qword [rsp+864]; load->v122
              add     r10            , r11            
              mov     qword [rsp+880], r10            ; save->v124
              mov     r11            , qword [rsp+880]; translate->qword [v124]
              mov     r10            , qword [r11]    
              mov     qword [rsp+888], r10            ; save->v125
              mov     qword [rsp+896], 0              ; null; save->v126
              mov     r10            , qword [rsp+896]; load->v126; null
              mov     qword [rsp+904], r10            ; save->v127; load->v127
              sal     r10            , 3              ; from imul              mov     qword [rsp+904], r10            ; save->v127; load->v127
              add     r10            , 8              
              mov     qword [rsp+904], r10            ; save->v127; load->v127
              mov     r11            , qword [rsp+888]; load->v125
              add     r10            , r11            
              mov     qword [rsp+904], r10            ; save->v127
              mov     r11            , qword [rsp+904]; translate->qword [v127]
              mov     r10            , qword [r11]    
              mov     qword [rsp+912], r10            ; save->v128
              mov     qword [rsp+920], 1              ; null; save->v129
              mov     r10            , qword [rsp+920]; load->v129; null
              mov     qword [rsp+928], r10            ; save->v130; load->v130
              sal     r10            , 3              ; from imul              mov     qword [rsp+928], r10            ; save->v130; load->v130
              add     r10            , 8              
              mov     qword [rsp+928], r10            ; save->v130; load->v130
              mov     r11            , qword [rsp+912]; load->v128
              add     r10            , r11            
              mov     qword [rsp+928], r10            ; save->v130
              mov     r11            , qword [rsp+928]; translate->qword [v130]
              mov     r10            , qword [r11]    
              mov     qword [rsp+936], r10            ; save->v131
              mov     qword [rsp+944], 0              ; null; save->v132
              mov     r10            , qword [rsp+944]; load->v132; null
              mov     qword [rsp+952], r10            ; save->v133; load->v133
              sal     r10            , 3              ; from imul              mov     qword [rsp+952], r10            ; save->v133; load->v133
              add     r10            , 8              
              mov     qword [rsp+952], r10            ; save->v133; load->v133
              mov     r11            , qword [rsp+936]; load->v131
              add     r10            , r11            
              mov     qword [rsp+952], r10            ; save->v133
              mov     r11            , qword [rsp+952]; translate->qword [v133]
              mov     r10            , qword [r11]    
              mov     qword [rsp+960], r10            ; save->v134
              mov     qword [rsp+968], 1              ; null; save->v135
              mov     r10            , qword [rsp+968]; load->v135; null
              mov     qword [rsp+976], r10            ; save->v136; load->v136
              sal     r10            , 3              ; from imul              mov     qword [rsp+976], r10            ; save->v136; load->v136
              add     r10            , 8              
              mov     qword [rsp+976], r10            ; save->v136; load->v136
              mov     r11            , qword [rsp+960]; load->v134
              add     r10            , r11            
              mov     qword [rsp+976], r10            ; save->v136
              mov     r11            , qword [rsp+976]; translate->qword [v136]
              mov     r10            , qword [r11]    
              mov     qword [rsp+984], r10            ; save->v137
              mov     r10            , qword [rsp+504]; load->v72; null
              mov     qword [rsp+992], r10            ; save->v138; load->v138
              mov     r11            , qword [rsp+984]; load->v137
              add     r10            , r11            
              mov     qword [rsp+992], r10            ; save->v138; load->v138; assign->sum
              mov     qword [rsp+504], r10            ; save->v72
_text_A_Optimizer_for0_continue:
              mov     r10            , qword [rsp+496]; load->v70; null
              mov     qword [rsp+1000], r10            ; save->v139
              mov     qword [rsp+1008], 1              ; null; save->v140
              mov     r10            , qword [rsp+496]; load->v70; null
              mov     qword [rsp+1016], r10            ; save->v141; load->v141
              mov     r11            , qword [rsp+1008]; load->v140
              add     r10            , r11            
              mov     qword [rsp+1016], r10            ; save->v141; load->v141; assign->i
              mov     qword [rsp+496], r10            ; save->v70
              mov     qword [rsp+1024], 1000           ; null; save->v142
              mov     r10            , qword [rsp+496]; load->v70
              mov     r11            , qword [rsp+1024]; load->v142
              cmp     r10d           , r11d           
              mov     qword [rsp+496], r10            ; save->v70
              jle     _text_A_Optimizer_for0_start                 
;----------------------------------]
;[----------------------------------
_text_A_Optimizer_for0_end:
_text_A_Optimizer_call0:
              mov     rdi            , qword [rsp+504]; load->v72; null
              call    _text__toString                 
              mov     rbp            , rax            ; null; save->v143
_text_A_Optimizer_call1:
              mov     rdi            , rbp            ; load->v143; null
              call    _text__println                  
              mov     rbp            , rax            ; null; save->v144
_text_A_Optimizer_for1_init:
              mov     rbp            , 1              ; null; save->v145
              mov     qword [rsp+496], rbp            ; load->v145; assign->i; save->v70
              mov     rbx            , 1000000        ; null; save->v146
              mov     r10            , qword [rsp+496]; load->v70
              mov     r11            , rbx            ; load->v146
              cmp     r10d           , r11d           
              mov     qword [rsp+496], r10            ; save->v70
              mov     r10            , r12            ; load->v147
              setle   r10b                            
              mov     r12            , r10            ; save->v147; load->v147
              and     r10            , 255            
              mov     r12            , r10            ; save->v147
_text_A_Optimizer_for1_init_check:
              mov     r10            , r12            ; load->v147
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v147
              je      _text_A_Optimizer_for1_end                 
;----------------------------------]
;[----------------------------------
_text_A_Optimizer_for1_start:
              mov     r13            , 8              ; null; save->v148
              mov     r14            , qword [rsp+504]; load->v72; null; save->v149
              mov     r10            , r14            ; load->v149
              mov     r11            , r13            ; load->v148
              add     r10            , r11            
              mov     r14            , r10            ; save->v149
              mov     qword [rsp+504], r14            ; load->v149; assign->sum; save->v72
_text_A_Optimizer_for1_continue:
              mov     r15            , qword [rsp+496]; load->v70; null; save->v150
              mov     qword [rsp+1032], 1              ; null; save->v151
              mov     r10            , qword [rsp+496]; load->v70; null
              mov     qword [rsp+1040], r10            ; save->v152; load->v152
              mov     r11            , qword [rsp+1032]; load->v151
              add     r10            , r11            
              mov     qword [rsp+1040], r10            ; save->v152; load->v152; assign->i
              mov     qword [rsp+496], r10            ; save->v70
              mov     qword [rsp+1048], 1000000        ; null; save->v153
              mov     r10            , qword [rsp+496]; load->v70
              mov     r11            , qword [rsp+1048]; load->v153
              cmp     r10d           , r11d           
              mov     qword [rsp+496], r10            ; save->v70
              jle     _text_A_Optimizer_for1_start                 
;----------------------------------]
;[----------------------------------
_text_A_Optimizer_for1_end:
_text_A_Optimizer_call2:
              mov     rdi            , qword [rsp+504]; load->v72; null
              call    _text__toString                 
              mov     rbp            , rax            ; null; save->v154
_text_A_Optimizer_call3:
              mov     rdi            , rbp            ; load->v154; null
              call    _text__println                  
              mov     rbp            , rax            ; null; save->v155
_text_A_Optimizer_for2_init:
              mov     rbp            , 1              ; null; save->v156
              mov     qword [rsp+496], rbp            ; load->v156; assign->i; save->v70
              mov     rbx            , 200000000      ; null; save->v157
              mov     r10            , qword [rsp+496]; load->v70
              mov     r11            , rbx            ; load->v157
              cmp     r10d           , r11d           
              mov     qword [rsp+496], r10            ; save->v70
              mov     r10            , r12            ; load->v158
              setle   r10b                            
              mov     r12            , r10            ; save->v158; load->v158
              and     r10            , 255            
              mov     r12            , r10            ; save->v158
_text_A_Optimizer_for2_init_check:
              mov     r10            , r12            ; load->v158
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v158
              je      _text_A_Optimizer_for2_end                 
;----------------------------------]
;[----------------------------------
_text_A_Optimizer_for2_start:
_text_A_Optimizer_for2_continue:
              mov     r13            , qword [rsp+496]; load->v70; null; save->v159
              mov     r14            , 1              ; null; save->v160
              mov     r15            , qword [rsp+496]; load->v70; null; save->v161
              mov     r10            , r15            ; load->v161
              mov     r11            , r14            ; load->v160
              add     r10            , r11            
              mov     r15            , r10            ; save->v161
              mov     qword [rsp+496], r15            ; load->v161; assign->i; save->v70
              mov     qword [rsp+1056], 200000000      ; null; save->v162
              mov     r10            , qword [rsp+496]; load->v70
              mov     r11            , qword [rsp+1056]; load->v162
              cmp     r10d           , r11d           
              mov     qword [rsp+496], r10            ; save->v70
              jle     _text_A_Optimizer_for2_start                 
;----------------------------------]
;[----------------------------------
_text_A_Optimizer_for2_end:
_text_A_Optimizer_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 1064           
              ret                                     
;----------------------------------]
                                                      
; --- [ _text_A_A ] ---
;[----------------------------------
_text_A_A:
              sub     rsp            , 392            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     qword [rsp+48] , rdi            ; null; save->v6
              mov     qword [rsp+56] , 2              ; null; save->v7
              mov     r10            , qword [rsp+56] ; load->v7; null
              mov     qword [rsp+64] , r10            ; save->v8; load->v8
              sal     r10            , 3              ; from imul              mov     qword [rsp+64] , r10            ; save->v8; load->v8
              add     r10            , 8              
              mov     qword [rsp+64] , r10            ; save->v8
              mov     rdi            , qword [rsp+64] ; load->v8; null
              call    malloc                          
              mov     qword [rsp+72] , rax            ; null; save->v9
              mov     r11            , qword [rsp+56] ; load->v7
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+56] ; load->v7; null
              mov     qword [rsp+80] , r10            ; save->v10
              mov     r10            , qword [rsp+72] ; load->v9; null
              mov     qword [rsp+88] , r10            ; save->v11; load->v11
              add     r10            , 8              
              mov     qword [rsp+88] , r10            ; save->v11
_text_A_A_new0_expand_start:
              mov     qword [rsp+96] , 2              ; null; save->v12
              mov     r10            , qword [rsp+96] ; load->v12; null
              mov     qword [rsp+104], r10            ; save->v13; load->v13
              sal     r10            , 3              ; from imul              mov     qword [rsp+104], r10            ; save->v13; load->v13
              add     r10            , 8              
              mov     qword [rsp+104], r10            ; save->v13
              mov     rdi            , qword [rsp+104]; load->v13; null
              call    malloc                          
              mov     qword [rsp+112], rax            ; null; save->v14
              mov     r11            , qword [rsp+96] ; load->v12
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+96] ; load->v12; null
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+112]; load->v14; null
              mov     qword [rsp+128], r10            ; save->v16; load->v16
              add     r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16
_text_A_A_new1_expand_start:
              mov     qword [rsp+136], 3              ; null; save->v17
              mov     r10            , qword [rsp+136]; load->v17; null
              mov     qword [rsp+144], r10            ; save->v18; load->v18
              sal     r10            , 3              ; from imul              mov     qword [rsp+144], r10            ; save->v18; load->v18
              add     r10            , 8              
              mov     qword [rsp+144], r10            ; save->v18
              mov     rdi            , qword [rsp+144]; load->v18; null
              call    malloc                          
              mov     qword [rsp+152], rax            ; null; save->v19
              mov     r11            , qword [rsp+136]; load->v17
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+136]; load->v17; null
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , qword [rsp+152]; load->v19; null
              mov     qword [rsp+168], r10            ; save->v21; load->v21
              add     r10            , 8              
              mov     qword [rsp+168], r10            ; save->v21
_text_A_A_new2_expand_start:
              mov     qword [rsp+176], 2              ; null; save->v22
              mov     r10            , qword [rsp+176]; load->v22; null
              mov     qword [rsp+184], r10            ; save->v23; load->v23
              sal     r10            , 3              ; from imul              mov     qword [rsp+184], r10            ; save->v23; load->v23
              add     r10            , 8              
              mov     qword [rsp+184], r10            ; save->v23
              mov     rdi            , qword [rsp+184]; load->v23; null
              call    malloc                          
              mov     qword [rsp+192], rax            ; null; save->v24
              mov     r11            , qword [rsp+176]; load->v22
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+176]; load->v22; null
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+192]; load->v24; null
              mov     qword [rsp+208], r10            ; save->v26; load->v26
              add     r10            , 8              
              mov     qword [rsp+208], r10            ; save->v26
_text_A_A_new3_expand_start:
              mov     qword [rsp+216], 3              ; null; save->v27
              mov     r10            , qword [rsp+216]; load->v27; null
              mov     qword [rsp+224], r10            ; save->v28; load->v28
              sal     r10            , 3              ; from imul              mov     qword [rsp+224], r10            ; save->v28; load->v28
              add     r10            , 8              
              mov     qword [rsp+224], r10            ; save->v28
              mov     rdi            , qword [rsp+224]; load->v28; null
              call    malloc                          
              mov     qword [rsp+232], rax            ; null; save->v29
              mov     r11            , qword [rsp+216]; load->v27
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+216]; load->v27; null
              mov     qword [rsp+240], r10            ; save->v30
              mov     r10            , qword [rsp+232]; load->v29; null
              mov     qword [rsp+248], r10            ; save->v31; load->v31
              add     r10            , 8              
              mov     qword [rsp+248], r10            ; save->v31
_text_A_A_new4_expand_start:
              mov     qword [rsp+256], 2              ; null; save->v32
              mov     r10            , qword [rsp+256]; load->v32; null
              mov     qword [rsp+264], r10            ; save->v33; load->v33
              sal     r10            , 3              ; from imul              mov     qword [rsp+264], r10            ; save->v33; load->v33
              add     r10            , 8              
              mov     qword [rsp+264], r10            ; save->v33
              mov     rdi            , qword [rsp+264]; load->v33; null
              call    malloc                          
              mov     qword [rsp+272], rax            ; null; save->v34
              mov     r11            , qword [rsp+256]; load->v32
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+256]; load->v32; null
              mov     qword [rsp+280], r10            ; save->v35
              mov     r10            , qword [rsp+272]; load->v34; null
              mov     qword [rsp+288], r10            ; save->v36; load->v36
              add     r10            , 8              
              mov     qword [rsp+288], r10            ; save->v36
_text_A_A_new5_expand_start:
              mov     qword [rsp+296], 2              ; null; save->v37
              mov     r10            , qword [rsp+296]; load->v37; null
              mov     qword [rsp+304], r10            ; save->v38; load->v38
              sal     r10            , 3              ; from imul              mov     qword [rsp+304], r10            ; save->v38; load->v38
              add     r10            , 8              
              mov     qword [rsp+304], r10            ; save->v38
              mov     rdi            , qword [rsp+304]; load->v38; null
              call    malloc                          
              mov     qword [rsp+312], rax            ; null; save->v39
              mov     r11            , qword [rsp+296]; load->v37
              mov     qword [rax]    , r11            
              mov     rbx            , qword [rsp+296]; load->v37; null; save->v40
              mov     r12            , qword [rsp+312]; load->v39; null; save->v41
              mov     r10            , r12            ; load->v41
              add     r10            , 8              
              mov     r12            , r10            ; save->v41
_text_A_A_new6_expand_start:
              mov     qword [rsp+320], 3              ; null; save->v42
              mov     r10            , qword [rsp+320]; load->v42; null
              mov     qword [rsp+328], r10            ; save->v43; load->v43
              sal     r10            , 3              ; from imul              mov     qword [rsp+328], r10            ; save->v43; load->v43
              add     r10            , 8              
              mov     qword [rsp+328], r10            ; save->v43
              mov     rdi            , qword [rsp+328]; load->v43; null
              call    malloc                          
              mov     qword [rsp+336], rax            ; null; save->v44
              mov     r11            , qword [rsp+320]; load->v42
              mov     qword [rax]    , r11            
              mov     r13            , qword [rsp+320]; load->v42; null; save->v45
              mov     r14            , qword [rsp+336]; load->v44; null; save->v46
              mov     r10            , r14            ; load->v46
              add     r10            , 8              
              mov     r14            , r10            ; save->v46
_text_A_A_new7_expand_start:
              mov     qword [rsp+344], 2              ; null; save->v47
              mov     r10            , qword [rsp+344]; load->v47; null
              mov     qword [rsp+352], r10            ; save->v48; load->v48
              sal     r10            , 3              ; from imul              mov     qword [rsp+352], r10            ; save->v48; load->v48
              add     r10            , 8              
              mov     qword [rsp+352], r10            ; save->v48
              mov     rdi            , qword [rsp+352]; load->v48; null
              call    malloc                          
              mov     qword [rsp+360], rax            ; null; save->v49
              mov     r11            , qword [rsp+344]; load->v47
              mov     qword [rax]    , r11            
              mov     r15            , qword [rsp+344]; load->v47; null; save->v50
              mov     rbp            , qword [rsp+360]; load->v49; null; save->v51
              mov     r10            , rbp            ; load->v51
              add     r10            , 8              
              mov     rbp            , r10            ; save->v51
_text_A_A_new8_expand_start:
              mov     qword [rsp+368], 2              ; null; save->v52
              mov     r10            , qword [rsp+368]; load->v52; null
              mov     qword [rsp+376], r10            ; save->v53; load->v53
              sal     r10            , 3              ; from imul              mov     qword [rsp+376], r10            ; save->v53; load->v53
              add     r10            , 8              
              mov     qword [rsp+376], r10            ; save->v53
              mov     rdi            , qword [rsp+376]; load->v53; null
              call    malloc                          
              mov     qword [rsp+384], rax            ; null; save->v54
              mov     r11            , qword [rsp+368]; load->v52
              mov     qword [rax]    , r11            
              mov     r10            , rbp            ; translate->qword [v51]
              mov     r11            , qword [rsp+384]; load->v54
              mov     qword [r10]    , r11            
              mov     r10            , rbp            ; load->v51
              add     r10            , 8              
              mov     rbp            , r10            ; save->v51
              mov     r10            , r15            ; load->v50
              sub     r10            , 1              
              mov     r15            , r10            ; save->v50; load->v50
              cmp     r10            , 0              
              mov     r15            , r10            ; save->v50
              jne     _text_A_A_new8_expand_start                 
_text_A_A_new8_expand_end:
              mov     r10            , r14            ; translate->qword [v46]
              mov     r11            , qword [rsp+360]; load->v49
              mov     qword [r10]    , r11            
              mov     r10            , r14            ; load->v46
              add     r10            , 8              
              mov     r14            , r10            ; save->v46
              mov     r10            , r13            ; load->v45
              sub     r10            , 1              
              mov     r13            , r10            ; save->v45; load->v45
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v45
              jne     _text_A_A_new7_expand_start                 
_text_A_A_new7_expand_end:
              mov     r10            , r12            ; translate->qword [v41]
              mov     r11            , qword [rsp+336]; load->v44
              mov     qword [r10]    , r11            
              mov     r10            , r12            ; load->v41
              add     r10            , 8              
              mov     r12            , r10            ; save->v41
              mov     r10            , rbx            ; load->v40
              sub     r10            , 1              
              mov     rbx            , r10            ; save->v40; load->v40
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v40
              jne     _text_A_A_new6_expand_start                 
_text_A_A_new6_expand_end:
              mov     r10            , qword [rsp+288]; translate->qword [v36]
              mov     r11            , qword [rsp+312]; load->v39
              mov     qword [r10]    , r11            
              mov     r10            , qword [rsp+288]; load->v36
              add     r10            , 8              
              mov     qword [rsp+288], r10            ; save->v36
              mov     r10            , qword [rsp+280]; load->v35
              sub     r10            , 1              
              mov     qword [rsp+280], r10            ; save->v35; load->v35
              cmp     r10            , 0              
              mov     qword [rsp+280], r10            ; save->v35
              jne     _text_A_A_new5_expand_start                 
_text_A_A_new5_expand_end:
              mov     r10            , qword [rsp+248]; translate->qword [v31]
              mov     r11            , qword [rsp+272]; load->v34
              mov     qword [r10]    , r11            
              mov     r10            , qword [rsp+248]; load->v31
              add     r10            , 8              
              mov     qword [rsp+248], r10            ; save->v31
              mov     r10            , qword [rsp+240]; load->v30
              sub     r10            , 1              
              mov     qword [rsp+240], r10            ; save->v30; load->v30
              cmp     r10            , 0              
              mov     qword [rsp+240], r10            ; save->v30
              jne     _text_A_A_new4_expand_start                 
_text_A_A_new4_expand_end:
              mov     r10            , qword [rsp+208]; translate->qword [v26]
              mov     r11            , qword [rsp+232]; load->v29
              mov     qword [r10]    , r11            
              mov     r10            , qword [rsp+208]; load->v26
              add     r10            , 8              
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+200]; load->v25
              sub     r10            , 1              
              mov     qword [rsp+200], r10            ; save->v25; load->v25
              cmp     r10            , 0              
              mov     qword [rsp+200], r10            ; save->v25
              jne     _text_A_A_new3_expand_start                 
_text_A_A_new3_expand_end:
              mov     r10            , qword [rsp+168]; translate->qword [v21]
              mov     r11            , qword [rsp+192]; load->v24
              mov     qword [r10]    , r11            
              mov     r10            , qword [rsp+168]; load->v21
              add     r10            , 8              
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+160]; load->v20
              sub     r10            , 1              
              mov     qword [rsp+160], r10            ; save->v20; load->v20
              cmp     r10            , 0              
              mov     qword [rsp+160], r10            ; save->v20
              jne     _text_A_A_new2_expand_start                 
_text_A_A_new2_expand_end:
              mov     r10            , qword [rsp+128]; translate->qword [v16]
              mov     r11            , qword [rsp+152]; load->v19
              mov     qword [r10]    , r11            
              mov     r10            , qword [rsp+128]; load->v16
              add     r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+120]; load->v15
              sub     r10            , 1              
              mov     qword [rsp+120], r10            ; save->v15; load->v15
              cmp     r10            , 0              
              mov     qword [rsp+120], r10            ; save->v15
              jne     _text_A_A_new1_expand_start                 
_text_A_A_new1_expand_end:
              mov     r10            , qword [rsp+88] ; translate->qword [v11]
              mov     r11            , qword [rsp+112]; load->v14
              mov     qword [r10]    , r11            
              mov     r10            , qword [rsp+88] ; load->v11
              add     r10            , 8              
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , qword [rsp+80] ; load->v10
              sub     r10            , 1              
              mov     qword [rsp+80] , r10            ; save->v10; load->v10
              cmp     r10            , 0              
              mov     qword [rsp+80] , r10            ; save->v10
              jne     _text_A_A_new0_expand_start                 
_text_A_A_new0_expand_end:
              mov     rbp            , qword [rsp+48] ; load->v6; null; save->v55
              mov     r10            , rbp            ; load->v55
              add     r10            , 0              
              mov     rbp            , r10            ; save->v55
              mov     r11            , rbp            ; translate->qword [v55]
              mov     rbx            , qword [r11]    ; null; save->v56
              mov     r10            , rbp            ; translate->qword [v55]
              mov     r11            , qword [rsp+72] ; load->v9
              mov     qword [r10]    , r11            
_text_A_A_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 392            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__restore ] ---
;[----------------------------------
_text__restore:
              sub     rsp            , 120            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
_text__restore_for0_init:
              mov     rbx            , 1              ; null; save->v7
              mov     rbp            , rbx            ; load->v7; assign->i; save->v6
              mov     r12            , [_data_bss_n]  ; null; save->v8
              mov     r10            , rbp            ; load->v6
              mov     r11            , r12            ; load->v8
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v6
              mov     r10            , r13            ; load->v9
              setle   r10b                            
              mov     r13            , r10            ; save->v9; load->v9
              and     r10            , 255            
              mov     r13            , r10            ; save->v9
_text__restore_for0_init_check:
              mov     r10            , r13            ; load->v9
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v9
              je      _text__restore_for0_end                 
;----------------------------------]
;[----------------------------------
_text__restore_for0_start:
              mov     r14            , [_data_bss_bak]; null; save->v10
              mov     r15            , rbp            ; load->v6; null; save->v11
              mov     r10            , r15            ; load->v11
              sal     r10            , 3              ; from imul              mov     r15            , r10            ; save->v11; load->v11
              add     r10            , 8              
              mov     r15            , r10            ; save->v11; load->v11
              mov     r11            , r14            ; load->v10
              add     r10            , r11            
              mov     r15            , r10            ; save->v11
              mov     r11            , r15            ; translate->qword [v11]
              mov     r10            , qword [r11]    
              mov     qword [rsp+48] , r10            ; save->v12
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+56] , r10            ; save->v13
              mov     qword [rsp+64] , rbp            ; load->v6; null; save->v14
              mov     r10            , qword [rsp+64] ; load->v14
              sal     r10            , 3              ; from imul              mov     qword [rsp+64] , r10            ; save->v14; load->v14
              add     r10            , 8              
              mov     qword [rsp+64] , r10            ; save->v14; load->v14
              mov     r11            , qword [rsp+56] ; load->v13
              add     r10            , r11            
              mov     qword [rsp+64] , r10            ; save->v14
              mov     r11            , qword [rsp+64] ; translate->qword [v14]
              mov     r10            , qword [r11]    
              mov     qword [rsp+72] , r10            ; save->v15
              mov     r10            , qword [rsp+64] ; translate->qword [v14]
              mov     r11            , qword [rsp+48] ; load->v12
              mov     qword [r10]    , r11            ; assign->a[i]
_text__restore_for0_continue:
              mov     qword [rsp+80] , rbp            ; load->v6; null; save->v16
              mov     qword [rsp+88] , 1              ; null; save->v17
              mov     qword [rsp+96] , rbp            ; load->v6; null; save->v18
              mov     r10            , qword [rsp+96] ; load->v18
              mov     r11            , qword [rsp+88] ; load->v17
              add     r10            , r11            
              mov     qword [rsp+96] , r10            ; save->v18
              mov     rbp            , qword [rsp+96] ; load->v18; assign->i; save->v6
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+104], r10            ; save->v19
              mov     r10            , rbp            ; load->v6
              mov     r11            , qword [rsp+104]; load->v19
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v6
              jle     _text__restore_for0_start                 
;----------------------------------]
;[----------------------------------
_text__restore_for0_end:
_text__restore_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 120            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__quicksort ] ---
;[----------------------------------
_text__quicksort:
              sub     rsp            , 552            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     qword [rsp+48] , rdi            ; null; save->v6
              mov     qword [rsp+56] , rsi            ; null; save->v7
              mov     r12            , 0              ; null; save->v22
              mov     qword [rsp+176], r12            ; load->v22; init->sum; save->v23
              mov     r12            , [_data_bss_a]  ; null; save->v24
              mov     r14            , qword [rsp+48] ; load->v6; null; save->v25
              mov     r10            , r14            ; load->v25
              sal     r10            , 3              ; from imul              mov     r14            , r10            ; save->v25; load->v25
              add     r10            , 8              
              mov     r14            , r10            ; save->v25; load->v25
              mov     r11            , r12            ; load->v24
              add     r10            , r11            
              mov     r14            , r10            ; save->v25
              mov     r11            , r14            ; translate->qword [v25]
              mov     r12            , qword [r11]    ; null; save->v26
              mov     qword [rsp+184], r12            ; load->v26; init->x; save->v27
              mov     r12            , 0              ; null; save->v28
              mov     qword [rsp+192], r12            ; load->v28; init->z_l; save->v29
              mov     qword [rsp+200], 0              ; null; save->v30
              mov     r10            , qword [rsp+200]; load->v30; init->z_r
              mov     qword [rsp+208], r10            ; save->v31
_text__quicksort_for0_init:
              mov     rbx            , 1              ; null; save->v33
              mov     r12            , qword [rsp+48] ; load->v6; null; save->v34
              mov     r10            , r12            ; load->v34
              mov     r11            , rbx            ; load->v33
              add     r10            , r11            
              mov     r12            , r10            ; save->v34
              mov     qword [rsp+216], r12            ; load->v34; assign->i; save->v32
              mov     r10            , qword [rsp+216]; load->v32
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10d           , r11d           
              mov     qword [rsp+216], r10            ; save->v32
              mov     r10            , rbp            ; load->v35
              setl    r10b                            
              mov     rbp            , r10            ; save->v35; load->v35
              and     r10            , 255            
              mov     rbp            , r10            ; save->v35
_text__quicksort_for0_init_check:
              mov     r10            , rbp            ; load->v35
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v35
              je      _text__quicksort_for0_end                 
;----------------------------------]
;[----------------------------------
_text__quicksort_for0_start:
              mov     r15            , qword [rsp+176]; load->v23; null; save->v36
              mov     r13            , 1              ; null; save->v37
              mov     r14            , qword [rsp+176]; load->v23; null; save->v38
              mov     r10            , r14            ; load->v38
              mov     r11            , r13            ; load->v37
              add     r10            , r11            
              mov     r14            , r10            ; save->v38
              mov     qword [rsp+176], r14            ; load->v38; assign->sum; save->v23
_text__quicksort_if0_init:
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+224], r10            ; save->v39
              mov     r10            , qword [rsp+216]; load->v32; null
              mov     qword [rsp+232], r10            ; save->v40; load->v40
              sal     r10            , 3              ; from imul              mov     qword [rsp+232], r10            ; save->v40; load->v40
              add     r10            , 8              
              mov     qword [rsp+232], r10            ; save->v40; load->v40
              mov     r11            , qword [rsp+224]; load->v39
              add     r10            , r11            
              mov     qword [rsp+232], r10            ; save->v40
              mov     r11            , qword [rsp+232]; translate->qword [v40]
              mov     r10            , qword [r11]    
              mov     qword [rsp+240], r10            ; save->v41
_text__quicksort_if0_check:
              mov     r10            , qword [rsp+240]; load->v41
              mov     r11            , qword [rsp+184]; load->v27
              cmp     r10d           , r11d           
              mov     qword [rsp+240], r10            ; save->v41
              jge     _text__quicksort_if0_else                 
;----------------------------------]
;[----------------------------------
_text__quicksort_if0_start:
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+248], r10            ; save->v42
              mov     r10            , qword [rsp+216]; load->v32; null
              mov     qword [rsp+256], r10            ; save->v43; load->v43
              sal     r10            , 3              ; from imul              mov     qword [rsp+256], r10            ; save->v43; load->v43
              add     r10            , 8              
              mov     qword [rsp+256], r10            ; save->v43; load->v43
              mov     r11            , qword [rsp+248]; load->v42
              add     r10            , r11            
              mov     qword [rsp+256], r10            ; save->v43
              mov     r11            , qword [rsp+256]; translate->qword [v43]
              mov     r10            , qword [r11]    
              mov     qword [rsp+264], r10            ; save->v44
              mov     r10            , [_data_bss_a_left]
              mov     qword [rsp+272], r10            ; save->v45
              mov     r10            , qword [rsp+192]; load->v29; null
              mov     qword [rsp+280], r10            ; save->v46
              mov     qword [rsp+288], 1              ; null; save->v47
              mov     r10            , qword [rsp+192]; load->v29; null
              mov     qword [rsp+296], r10            ; save->v48; load->v48
              mov     r11            , qword [rsp+288]; load->v47
              add     r10            , r11            
              mov     qword [rsp+296], r10            ; save->v48; load->v48; assign->z_l
              mov     qword [rsp+192], r10            ; save->v29
              mov     r10            , qword [rsp+280]; load->v46; null
              mov     qword [rsp+304], r10            ; save->v49; load->v49
              sal     r10            , 3              ; from imul              mov     qword [rsp+304], r10            ; save->v49; load->v49
              add     r10            , 8              
              mov     qword [rsp+304], r10            ; save->v49; load->v49
              mov     r11            , qword [rsp+272]; load->v45
              add     r10            , r11            
              mov     qword [rsp+304], r10            ; save->v49
              mov     r11            , qword [rsp+304]; translate->qword [v49]
              mov     r10            , qword [r11]    
              mov     qword [rsp+312], r10            ; save->v50
              mov     r10            , qword [rsp+304]; translate->qword [v49]
              mov     r11            , qword [rsp+264]; load->v44
              mov     qword [r10]    , r11            ; assign->a_left[z_l++]
              jmp     _text__quicksort_if0_end                 
;----------------------------------]
;[----------------------------------
_text__quicksort_if0_else:
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+320], r10            ; save->v51
              mov     r10            , qword [rsp+216]; load->v32; null
              mov     qword [rsp+328], r10            ; save->v52; load->v52
              sal     r10            , 3              ; from imul              mov     qword [rsp+328], r10            ; save->v52; load->v52
              add     r10            , 8              
              mov     qword [rsp+328], r10            ; save->v52; load->v52
              mov     r11            , qword [rsp+320]; load->v51
              add     r10            , r11            
              mov     qword [rsp+328], r10            ; save->v52
              mov     r11            , qword [rsp+328]; translate->qword [v52]
              mov     r10            , qword [r11]    
              mov     qword [rsp+336], r10            ; save->v53
              mov     r10            , [_data_bss_a_right]
              mov     qword [rsp+344], r10            ; save->v54
              mov     r10            , qword [rsp+208]; load->v31; null
              mov     qword [rsp+352], r10            ; save->v55
              mov     qword [rsp+360], 1              ; null; save->v56
              mov     r10            , qword [rsp+208]; load->v31; null
              mov     qword [rsp+368], r10            ; save->v57; load->v57
              mov     r11            , qword [rsp+360]; load->v56
              add     r10            , r11            
              mov     qword [rsp+368], r10            ; save->v57; load->v57; assign->z_r
              mov     qword [rsp+208], r10            ; save->v31
              mov     r10            , qword [rsp+352]; load->v55; null
              mov     qword [rsp+376], r10            ; save->v58; load->v58
              sal     r10            , 3              ; from imul              mov     qword [rsp+376], r10            ; save->v58; load->v58
              add     r10            , 8              
              mov     qword [rsp+376], r10            ; save->v58; load->v58
              mov     r11            , qword [rsp+344]; load->v54
              add     r10            , r11            
              mov     qword [rsp+376], r10            ; save->v58
              mov     r11            , qword [rsp+376]; translate->qword [v58]
              mov     r10            , qword [r11]    
              mov     qword [rsp+384], r10            ; save->v59
              mov     r10            , qword [rsp+376]; translate->qword [v58]
              mov     r11            , qword [rsp+336]; load->v53
              mov     qword [r10]    , r11            ; assign->a_right[z_r++]
_text__quicksort_if0_end:
_text__quicksort_for0_continue:
              mov     r10            , qword [rsp+216]; load->v32; null
              mov     qword [rsp+392], r10            ; save->v60
              mov     qword [rsp+400], 1              ; null; save->v61
              mov     r10            , qword [rsp+216]; load->v32; null
              mov     qword [rsp+408], r10            ; save->v62; load->v62
              mov     r11            , qword [rsp+400]; load->v61
              add     r10            , r11            
              mov     qword [rsp+408], r10            ; save->v62; load->v62; assign->i
              mov     qword [rsp+216], r10            ; save->v32; load->v32
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10d           , r11d           
              mov     qword [rsp+216], r10            ; save->v32
              jl      _text__quicksort_for0_start                 
;----------------------------------]
;[----------------------------------
_text__quicksort_for0_end:
              mov     r10            , qword [rsp+48] ; load->v6; init->p
              mov     qword [rsp+416], r10            ; save->v63
_text__quicksort_for1_init:
              mov     rbx            , 0              ; null; save->v64
              mov     qword [rsp+216], rbx            ; load->v64; assign->i; save->v32
              mov     r10            , qword [rsp+216]; load->v32
              mov     r11            , qword [rsp+192]; load->v29
              cmp     r10d           , r11d           
              mov     qword [rsp+216], r10            ; save->v32
              mov     r10            , r12            ; load->v65
              setl    r10b                            
              mov     r12            , r10            ; save->v65; load->v65
              and     r10            , 255            
              mov     r12            , r10            ; save->v65
_text__quicksort_for1_init_check:
              mov     r10            , r12            ; load->v65
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v65
              je      _text__quicksort_for1_end                 
;----------------------------------]
;[----------------------------------
_text__quicksort_for1_start:
              mov     r13            , [_data_bss_a_left]; null; save->v66
              mov     r14            , qword [rsp+216]; load->v32; null; save->v67
              mov     r10            , r14            ; load->v67
              sal     r10            , 3              ; from imul              mov     r14            , r10            ; save->v67; load->v67
              add     r10            , 8              
              mov     r14            , r10            ; save->v67; load->v67
              mov     r11            , r13            ; load->v66
              add     r10            , r11            
              mov     r14            , r10            ; save->v67
              mov     r11            , r14            ; translate->qword [v67]
              mov     r15            , qword [r11]    ; null; save->v68
              mov     rbp            , [_data_bss_a]  ; null; save->v69
              mov     r10            , qword [rsp+416]; load->v63; null
              mov     qword [rsp+424], r10            ; save->v70
              mov     qword [rsp+432], 1              ; null; save->v71
              mov     r10            , qword [rsp+416]; load->v63; null
              mov     qword [rsp+440], r10            ; save->v72; load->v72
              mov     r11            , qword [rsp+432]; load->v71
              add     r10            , r11            
              mov     qword [rsp+440], r10            ; save->v72; load->v72; assign->p
              mov     qword [rsp+416], r10            ; save->v63
              mov     r10            , qword [rsp+424]; load->v70; null
              mov     qword [rsp+448], r10            ; save->v73; load->v73
              sal     r10            , 3              ; from imul              mov     qword [rsp+448], r10            ; save->v73; load->v73
              add     r10            , 8              
              mov     qword [rsp+448], r10            ; save->v73; load->v73
              mov     r11            , rbp            ; load->v69
              add     r10            , r11            
              mov     qword [rsp+448], r10            ; save->v73
              mov     r11            , qword [rsp+448]; translate->qword [v73]
              mov     r10            , qword [r11]    
              mov     qword [rsp+456], r10            ; save->v74
              mov     r10            , qword [rsp+448]; translate->qword [v73]
              mov     qword [r10]    , r15            ; load->v68; assign->a[p++]
_text__quicksort_for1_continue:
              mov     r10            , qword [rsp+216]; load->v32; null
              mov     qword [rsp+464], r10            ; save->v75
              mov     qword [rsp+472], 1              ; null; save->v76
              mov     r10            , qword [rsp+216]; load->v32; null
              mov     qword [rsp+480], r10            ; save->v77; load->v77
              mov     r11            , qword [rsp+472]; load->v76
              add     r10            , r11            
              mov     qword [rsp+480], r10            ; save->v77; load->v77; assign->i
              mov     qword [rsp+216], r10            ; save->v32; load->v32
              mov     r11            , qword [rsp+192]; load->v29
              cmp     r10d           , r11d           
              mov     qword [rsp+216], r10            ; save->v32
              jl      _text__quicksort_for1_start                 
;----------------------------------]
;[----------------------------------
_text__quicksort_for1_end:
              mov     rbp            , [_data_bss_a]  ; null; save->v78
              mov     rbx            , qword [rsp+416]; load->v63; null; save->v79
              mov     r12            , 1              ; null; save->v80
              mov     r13            , qword [rsp+416]; load->v63; null; save->v81
              mov     r10            , r13            ; load->v81
              mov     r11            , r12            ; load->v80
              add     r10            , r11            
              mov     r13            , r10            ; save->v81
              mov     qword [rsp+416], r13            ; load->v81; assign->p; save->v63
              mov     r12            , rbx            ; load->v79; null; save->v82
              mov     r10            , r12            ; load->v82
              sal     r10            , 3              ; from imul              mov     r12            , r10            ; save->v82; load->v82
              add     r10            , 8              
              mov     r12            , r10            ; save->v82; load->v82
              mov     r11            , rbp            ; load->v78
              add     r10            , r11            
              mov     r12            , r10            ; save->v82
              mov     r11            , r12            ; translate->qword [v82]
              mov     rbp            , qword [r11]    ; null; save->v83
              mov     r10            , r12            ; translate->qword [v82]
              mov     r11            , qword [rsp+184]; load->v27
              mov     qword [r10]    , r11            ; assign->a[p++]
_text__quicksort_for2_init:
              mov     rbp            , 0              ; null; save->v84
              mov     qword [rsp+216], rbp            ; load->v84; assign->i; save->v32
              mov     r10            , qword [rsp+216]; load->v32
              mov     r11            , qword [rsp+208]; load->v31
              cmp     r10d           , r11d           
              mov     qword [rsp+216], r10            ; save->v32
              mov     r10            , rbx            ; load->v85
              setl    r10b                            
              mov     rbx            , r10            ; save->v85; load->v85
              and     r10            , 255            
              mov     rbx            , r10            ; save->v85
_text__quicksort_for2_init_check:
              mov     r10            , rbx            ; load->v85
              cmp     r10b           , 0              
              mov     rbx            , r10            ; save->v85
              je      _text__quicksort_for2_end                 
;----------------------------------]
;[----------------------------------
_text__quicksort_for2_start:
              mov     r12            , [_data_bss_a_right]; null; save->v86
              mov     r13            , qword [rsp+216]; load->v32; null; save->v87
              mov     r10            , r13            ; load->v87
              sal     r10            , 3              ; from imul              mov     r13            , r10            ; save->v87; load->v87
              add     r10            , 8              
              mov     r13            , r10            ; save->v87; load->v87
              mov     r11            , r12            ; load->v86
              add     r10            , r11            
              mov     r13            , r10            ; save->v87
              mov     r11            , r13            ; translate->qword [v87]
              mov     r14            , qword [r11]    ; null; save->v88
              mov     r15            , [_data_bss_a]  ; null; save->v89
              mov     r10            , qword [rsp+416]; load->v63; null
              mov     qword [rsp+488], r10            ; save->v90
              mov     qword [rsp+496], 1              ; null; save->v91
              mov     r10            , qword [rsp+416]; load->v63; null
              mov     qword [rsp+504], r10            ; save->v92; load->v92
              mov     r11            , qword [rsp+496]; load->v91
              add     r10            , r11            
              mov     qword [rsp+504], r10            ; save->v92; load->v92; assign->p
              mov     qword [rsp+416], r10            ; save->v63
              mov     r10            , qword [rsp+488]; load->v90; null
              mov     qword [rsp+512], r10            ; save->v93; load->v93
              sal     r10            , 3              ; from imul              mov     qword [rsp+512], r10            ; save->v93; load->v93
              add     r10            , 8              
              mov     qword [rsp+512], r10            ; save->v93; load->v93
              mov     r11            , r15            ; load->v89
              add     r10            , r11            
              mov     qword [rsp+512], r10            ; save->v93
              mov     r11            , qword [rsp+512]; translate->qword [v93]
              mov     r10            , qword [r11]    
              mov     qword [rsp+520], r10            ; save->v94
              mov     r10            , qword [rsp+512]; translate->qword [v93]
              mov     qword [r10]    , r14            ; load->v88; assign->a[p++]
_text__quicksort_for2_continue:
              mov     r10            , qword [rsp+216]; load->v32; null
              mov     qword [rsp+528], r10            ; save->v95
              mov     qword [rsp+536], 1              ; null; save->v96
              mov     r10            , qword [rsp+216]; load->v32; null
              mov     qword [rsp+544], r10            ; save->v97; load->v97
              mov     r11            , qword [rsp+536]; load->v96
              add     r10            , r11            
              mov     qword [rsp+544], r10            ; save->v97; load->v97; assign->i
              mov     qword [rsp+216], r10            ; save->v32; load->v32
              mov     r11            , qword [rsp+208]; load->v31
              cmp     r10d           , r11d           
              mov     qword [rsp+216], r10            ; save->v32
              jl      _text__quicksort_for2_start                 
;----------------------------------]
;[----------------------------------
_text__quicksort_for2_end:
_text__quicksort_if1_init:
              mov     rbp            , 1              ; null; save->v98
_text__quicksort_if1_check:
              mov     r10            , qword [rsp+192]; load->v29
              mov     r11            , rbp            ; load->v98
              cmp     r10d           , r11d           
              mov     qword [rsp+192], r10            ; save->v29
              jle     _text__quicksort_if1_else                 
;----------------------------------]
;[----------------------------------
_text__quicksort_if1_start:
              mov     rbp            , qword [rsp+48] ; load->v6; null; save->v99
              mov     r10            , rbp            ; load->v99
              mov     r11            , qword [rsp+192]; load->v29
              add     r10            , r11            
              mov     rbp            , r10            ; save->v99
_text__quicksort_call0:
              mov     rdi            , qword [rsp+48] ; load->v6; null
              mov     rsi            , rbp            ; load->v99; null
              call    _text__quicksort                 
              mov     rbp            , rax            ; null; save->v100
              mov     rbx            , qword [rsp+176]; load->v23; null; save->v101
              mov     r10            , rbx            ; load->v101
              mov     r11            , rbp            ; load->v100
              add     r10            , r11            
              mov     rbx            , r10            ; save->v101
              mov     qword [rsp+176], rbx            ; load->v101; assign->sum; save->v23
              jmp     _text__quicksort_if1_end                 
;----------------------------------]
;[----------------------------------
_text__quicksort_if1_else:
_text__quicksort_if1_end:
_text__quicksort_if2_init:
              mov     rbp            , 1              ; null; save->v102
_text__quicksort_if2_check:
              mov     r10            , qword [rsp+208]; load->v31
              mov     r11            , rbp            ; load->v102
              cmp     r10d           , r11d           
              mov     qword [rsp+208], r10            ; save->v31
              jle     _text__quicksort_if2_else                 
;----------------------------------]
;[----------------------------------
_text__quicksort_if2_start:
              mov     rbp            , qword [rsp+56] ; load->v7; null; save->v103
              mov     r10            , rbp            ; load->v103
              mov     r11            , qword [rsp+208]; load->v31
              sub     r10            , r11            
              mov     rbp            , r10            ; save->v103
_text__quicksort_call1:
              mov     rdi            , rbp            ; load->v103; null
              mov     rsi            , qword [rsp+56] ; load->v7; null
              call    _text__quicksort                 
              mov     rbp            , rax            ; null; save->v104
              mov     rbx            , qword [rsp+176]; load->v23; null; save->v105
              mov     r10            , rbx            ; load->v105
              mov     r11            , rbp            ; load->v104
              add     r10            , r11            
              mov     rbx            , r10            ; save->v105
              mov     qword [rsp+176], rbx            ; load->v105; assign->sum; save->v23
              jmp     _text__quicksort_if2_end                 
;----------------------------------]
;[----------------------------------
_text__quicksort_if2_else:
_text__quicksort_if2_end:
_text__quicksort_ret0:
              mov     rax            , qword [rsp+176]; load->v23; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 552            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__calc ] ---
;[----------------------------------
_text__calc:
              sub     rsp            , 472            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
_text__calc_for0_init:
              mov     rbx            , 1              ; null; save->v21
              mov     qword [rsp+160], rbx            ; load->v21; assign->i; save->v20
              mov     r12            , [_data_bss_n]  ; null; save->v22
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , r12            ; load->v22
              cmp     r10d           , r11d           
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , r13            ; load->v23
              setle   r10b                            
              mov     r13            , r10            ; save->v23; load->v23
              and     r10            , 255            
              mov     r13            , r10            ; save->v23
_text__calc_for0_init_check:
              mov     r10            , r13            ; load->v23
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v23
              je      _text__calc_for0_end                 
;----------------------------------]
;[----------------------------------
_text__calc_for0_start:
              mov     r14            , 1              ; null; save->v24
              mov     r15            , qword [rsp+160]; load->v20; null; save->v25
              mov     r10            , r15            ; load->v25
              mov     r11            , r14            ; load->v24
              sub     r10            , r11            
              mov     r15            , r10            ; save->v25
              mov     rbp            , [_data_bss_a_left]; null; save->v26
              mov     r10            , qword [rsp+160]; load->v20; null
              mov     qword [rsp+168], r10            ; save->v27; load->v27
              sal     r10            , 3              ; from imul              mov     qword [rsp+168], r10            ; save->v27; load->v27
              add     r10            , 8              
              mov     qword [rsp+168], r10            ; save->v27; load->v27
              mov     r11            , rbp            ; load->v26
              add     r10            , r11            
              mov     qword [rsp+168], r10            ; save->v27
              mov     r11            , qword [rsp+168]; translate->qword [v27]
              mov     r10            , qword [r11]    
              mov     qword [rsp+176], r10            ; save->v28
              mov     r10            , qword [rsp+168]; translate->qword [v27]
              mov     qword [r10]    , r15            ; load->v25; assign->a_left[i]
              mov     qword [rsp+184], 1              ; null; save->v29
              mov     r10            , qword [rsp+160]; load->v20; null
              mov     qword [rsp+192], r10            ; save->v30; load->v30
              mov     r11            , qword [rsp+184]; load->v29
              add     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v30
              mov     r10            , [_data_bss_a_right]
              mov     qword [rsp+200], r10            ; save->v31
              mov     r10            , qword [rsp+160]; load->v20; null
              mov     qword [rsp+208], r10            ; save->v32; load->v32
              sal     r10            , 3              ; from imul              mov     qword [rsp+208], r10            ; save->v32; load->v32
              add     r10            , 8              
              mov     qword [rsp+208], r10            ; save->v32; load->v32
              mov     r11            , qword [rsp+200]; load->v31
              add     r10            , r11            
              mov     qword [rsp+208], r10            ; save->v32
              mov     r11            , qword [rsp+208]; translate->qword [v32]
              mov     r10            , qword [r11]    
              mov     qword [rsp+216], r10            ; save->v33
              mov     r10            , qword [rsp+208]; translate->qword [v32]
              mov     r11            , qword [rsp+192]; load->v30
              mov     qword [r10]    , r11            ; assign->a_right[i]
_text__calc_for0_continue:
              mov     r10            , qword [rsp+160]; load->v20; null
              mov     qword [rsp+224], r10            ; save->v34
              mov     qword [rsp+232], 1              ; null; save->v35
              mov     r10            , qword [rsp+160]; load->v20; null
              mov     qword [rsp+240], r10            ; save->v36; load->v36
              mov     r11            , qword [rsp+232]; load->v35
              add     r10            , r11            
              mov     qword [rsp+240], r10            ; save->v36; load->v36; assign->i
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+248], r10            ; save->v37
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+248]; load->v37
              cmp     r10d           , r11d           
              mov     qword [rsp+160], r10            ; save->v20
              jle     _text__calc_for0_start                 
;----------------------------------]
;[----------------------------------
_text__calc_for0_end:
              mov     rbp            , 0              ; null; save->v38
              mov     qword [rsp+256], rbp            ; load->v38; init->sum; save->v39
_text__calc_for1_init:
              mov     rbp            , [_data_bss_n]  ; null; save->v40
              mov     qword [rsp+160], rbp            ; load->v40; assign->i; save->v20
              mov     r12            , 1              ; null; save->v41
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , r12            ; load->v41
              cmp     r10d           , r11d           
              mov     qword [rsp+160], r10            ; save->v20
              mov     r10            , r13            ; load->v42
              setge   r10b                            
              mov     r13            , r10            ; save->v42; load->v42
              and     r10            , 255            
              mov     r13            , r10            ; save->v42
_text__calc_for1_init_check:
              mov     r10            , r13            ; load->v42
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v42
              je      _text__calc_for1_end                 
;----------------------------------]
;[----------------------------------
_text__calc_for1_start:
              mov     r14            , [_data_bss_a_left]; null; save->v43
              mov     r15            , [_data_bss_a]  ; null; save->v44
              mov     rbx            , qword [rsp+160]; load->v20; null; save->v45
              mov     r10            , rbx            ; load->v45
              sal     r10            , 3              ; from imul              mov     rbx            , r10            ; save->v45; load->v45
              add     r10            , 8              
              mov     rbx            , r10            ; save->v45; load->v45
              mov     r11            , r15            ; load->v44
              add     r10            , r11            
              mov     rbx            , r10            ; save->v45
              mov     r11            , rbx            ; translate->qword [v45]
              mov     r10            , qword [r11]    
              mov     qword [rsp+264], r10            ; save->v46; load->v46; null
              mov     qword [rsp+272], r10            ; save->v47; load->v47
              sal     r10            , 3              ; from imul              mov     qword [rsp+272], r10            ; save->v47; load->v47
              add     r10            , 8              
              mov     qword [rsp+272], r10            ; save->v47; load->v47
              mov     r11            , r14            ; load->v43
              add     r10            , r11            
              mov     qword [rsp+272], r10            ; save->v47
              mov     r11            , qword [rsp+272]; translate->qword [v47]
              mov     r10            , qword [r11]    
              mov     qword [rsp+280], r10            ; save->v48; load->v48; init->l
              mov     qword [rsp+288], r10            ; save->v49
              mov     r10            , [_data_bss_a_right]
              mov     qword [rsp+296], r10            ; save->v50
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+304], r10            ; save->v51
              mov     r10            , qword [rsp+160]; load->v20; null
              mov     qword [rsp+312], r10            ; save->v52; load->v52
              sal     r10            , 3              ; from imul              mov     qword [rsp+312], r10            ; save->v52; load->v52
              add     r10            , 8              
              mov     qword [rsp+312], r10            ; save->v52; load->v52
              mov     r11            , qword [rsp+304]; load->v51
              add     r10            , r11            
              mov     qword [rsp+312], r10            ; save->v52
              mov     r11            , qword [rsp+312]; translate->qword [v52]
              mov     r10            , qword [r11]    
              mov     qword [rsp+320], r10            ; save->v53; load->v53; null
              mov     qword [rsp+328], r10            ; save->v54; load->v54
              sal     r10            , 3              ; from imul              mov     qword [rsp+328], r10            ; save->v54; load->v54
              add     r10            , 8              
              mov     qword [rsp+328], r10            ; save->v54; load->v54
              mov     r11            , qword [rsp+296]; load->v50
              add     r10            , r11            
              mov     qword [rsp+328], r10            ; save->v54
              mov     r11            , qword [rsp+328]; translate->qword [v54]
              mov     r10            , qword [r11]    
              mov     qword [rsp+336], r10            ; save->v55; load->v55; init->r
              mov     qword [rsp+344], r10            ; save->v56
              mov     r10            , [_data_bss_a_right]
              mov     qword [rsp+352], r10            ; save->v57
              mov     r10            , qword [rsp+288]; load->v49; null
              mov     qword [rsp+360], r10            ; save->v58; load->v58
              sal     r10            , 3              ; from imul              mov     qword [rsp+360], r10            ; save->v58; load->v58
              add     r10            , 8              
              mov     qword [rsp+360], r10            ; save->v58; load->v58
              mov     r11            , qword [rsp+352]; load->v57
              add     r10            , r11            
              mov     qword [rsp+360], r10            ; save->v58
              mov     r11            , qword [rsp+360]; translate->qword [v58]
              mov     r10            , qword [r11]    
              mov     qword [rsp+368], r10            ; save->v59
              mov     r10            , qword [rsp+360]; translate->qword [v58]
              mov     r11            , qword [rsp+344]; load->v56
              mov     qword [r10]    , r11            ; assign->a_right[l]
              mov     r10            , [_data_bss_a_left]
              mov     qword [rsp+376], r10            ; save->v60
              mov     r10            , qword [rsp+344]; load->v56; null
              mov     qword [rsp+384], r10            ; save->v61; load->v61
              sal     r10            , 3              ; from imul              mov     qword [rsp+384], r10            ; save->v61; load->v61
              add     r10            , 8              
              mov     qword [rsp+384], r10            ; save->v61; load->v61
              mov     r11            , qword [rsp+376]; load->v60
              add     r10            , r11            
              mov     qword [rsp+384], r10            ; save->v61
              mov     r11            , qword [rsp+384]; translate->qword [v61]
              mov     r10            , qword [r11]    
              mov     qword [rsp+392], r10            ; save->v62
              mov     r10            , qword [rsp+384]; translate->qword [v61]
              mov     r11            , qword [rsp+288]; load->v49
              mov     qword [r10]    , r11            ; assign->a_left[r]
              mov     r10            , qword [rsp+256]; load->v39; null
              mov     qword [rsp+400], r10            ; save->v63; load->v63
              mov     r11            , qword [rsp+344]; load->v56
              add     r10            , r11            
              mov     qword [rsp+400], r10            ; save->v63; load->v63; null
              mov     qword [rsp+408], r10            ; save->v64; load->v64
              mov     r11            , qword [rsp+288]; load->v49
              sub     r10            , r11            
              mov     qword [rsp+408], r10            ; save->v64
              mov     qword [rsp+416], 2              ; null; save->v65
              mov     r10            , qword [rsp+408]; load->v64; null
              mov     qword [rsp+424], r10            ; save->v66; load->v66
              mov     r11            , qword [rsp+416]; load->v65
              sub     r10            , r11            
              mov     qword [rsp+424], r10            ; save->v66; load->v66; assign->sum
              mov     qword [rsp+256], r10            ; save->v39
_text__calc_for1_continue:
              mov     r10            , qword [rsp+160]; load->v20; null
              mov     qword [rsp+432], r10            ; save->v67
              mov     qword [rsp+440], 1              ; null; save->v68
              mov     r10            , qword [rsp+160]; load->v20; null
              mov     qword [rsp+448], r10            ; save->v69; load->v69
              mov     r11            , qword [rsp+440]; load->v68
              sub     r10            , r11            
              mov     qword [rsp+448], r10            ; save->v69; load->v69; assign->i
              mov     qword [rsp+160], r10            ; save->v20
              mov     qword [rsp+456], 1              ; null; save->v70
              mov     r10            , qword [rsp+160]; load->v20
              mov     r11            , qword [rsp+456]; load->v70
              cmp     r10d           , r11d           
              mov     qword [rsp+160], r10            ; save->v20
              jge     _text__calc_for1_start                 
;----------------------------------]
;[----------------------------------
_text__calc_for1_end:
_text__calc_ret0:
              mov     rax            , qword [rsp+256]; load->v39; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 472            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__mergesort ] ---
;[----------------------------------
_text__mergesort:
              sub     rsp            , 744            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     qword [rsp+48] , rdi            ; null; save->v6
              mov     qword [rsp+56] , rsi            ; null; save->v7
_text__mergesort_if0_init:
              mov     r12            , 1              ; null; save->v22
              mov     r13            , qword [rsp+48] ; load->v6; null; save->v23
              mov     r10            , r13            ; load->v23
              mov     r11            , r12            ; load->v22
              add     r10            , r11            
              mov     r13            , r10            ; save->v23; load->v23
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v23
              mov     r10            , r12            ; load->v24
              sete    r10b                            
              mov     r12            , r10            ; save->v24; load->v24
              and     r10            , 255            
              mov     r12            , r10            ; save->v24
_text__mergesort_if0_check:
              mov     r10            , r12            ; load->v24
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v24
              je      _text__mergesort_if0_else                 
;----------------------------------]
;[----------------------------------
_text__mergesort_if0_start:
              mov     r12            , 0              ; null; save->v25
_text__mergesort_ret0:
              mov     rax            , r12            ; load->v25; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 744            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__mergesort_if0_else:
_text__mergesort_if0_end:
              mov     r12            , qword [rsp+48] ; load->v6; null; save->v26
              mov     r10            , r12            ; load->v26
              mov     r11            , qword [rsp+56] ; load->v7
              add     r10            , r11            
              mov     r12            , r10            ; save->v26
              mov     r13            , 1              ; null; save->v27
              mov     r14            , rcx            ; null; save->v29
              mov     r15            , r12            ; load->v26; null; save->v28
              mov     rcx            , r13            ; load->v27; null
              mov     r10            , r15            ; load->v28
              and     r10            , -1             
              mov     r15            , r10            ; save->v28; load->v28
              sar     r10d           , cl             
              mov     r15            , r10            ; save->v28
              mov     rcx            , r14            ; load->v29; null
              mov     qword [rsp+176], r15            ; load->v28; init->mid; save->v30
              mov     r13            , 0              ; null; save->v31
              mov     qword [rsp+184], r13            ; load->v31; init->sum; save->v32
_text__mergesort_call0:
              mov     rdi            , qword [rsp+48] ; load->v6; null
              mov     rsi            , qword [rsp+176]; load->v30; null
              call    _text__mergesort                 
              mov     r13            , rax            ; null; save->v33
              mov     r15            , qword [rsp+184]; load->v32; null; save->v34
              mov     r10            , r15            ; load->v34
              mov     r11            , r13            ; load->v33
              add     r10            , r11            
              mov     r15            , r10            ; save->v34
              mov     qword [rsp+184], r15            ; load->v34; assign->sum; save->v32
_text__mergesort_call1:
              mov     rdi            , qword [rsp+176]; load->v30; null
              mov     rsi            , qword [rsp+56] ; load->v7; null
              call    _text__mergesort                 
              mov     r13            , rax            ; null; save->v35
              mov     r15            , qword [rsp+184]; load->v32; null; save->v36
              mov     r10            , r15            ; load->v36
              mov     r11            , r13            ; load->v35
              add     r10            , r11            
              mov     r15            , r10            ; save->v36
              mov     qword [rsp+184], r15            ; load->v36; assign->sum; save->v32
              mov     r13            , 0              ; null; save->v37
              mov     qword [rsp+192], r13            ; load->v37; init->n_l; save->v38
              mov     qword [rsp+200], 0              ; null; save->v39
              mov     r10            , qword [rsp+200]; load->v39; init->n_r
              mov     qword [rsp+208], r10            ; save->v40
_text__mergesort_for0_init:
              mov     r10            , qword [rsp+48] ; load->v6; assign->i
              mov     qword [rsp+216], r10            ; save->v41; load->v41
              mov     r11            , qword [rsp+176]; load->v30
              cmp     r10d           , r11d           
              mov     qword [rsp+216], r10            ; save->v41
              mov     r10            , r13            ; load->v42
              setl    r10b                            
              mov     r13            , r10            ; save->v42; load->v42
              and     r10            , 255            
              mov     r13            , r10            ; save->v42
_text__mergesort_for0_init_check:
              mov     r10            , r13            ; load->v42
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v42
              je      _text__mergesort_for0_end                 
;----------------------------------]
;[----------------------------------
_text__mergesort_for0_start:
              mov     r15            , [_data_bss_a]  ; null; save->v43
              mov     rbp            , qword [rsp+216]; load->v41; null; save->v44
              mov     r10            , rbp            ; load->v44
              sal     r10            , 3              ; from imul              mov     rbp            , r10            ; save->v44; load->v44
              add     r10            , 8              
              mov     rbp            , r10            ; save->v44; load->v44
              mov     r11            , r15            ; load->v43
              add     r10            , r11            
              mov     rbp            , r10            ; save->v44
              mov     r11            , rbp            ; translate->qword [v44]
              mov     r14            , qword [r11]    ; null; save->v45
              mov     rbx            , [_data_bss_a_left]; null; save->v46
              mov     r12            , qword [rsp+192]; load->v38; null; save->v47
              mov     qword [rsp+224], 1              ; null; save->v48
              mov     r10            , qword [rsp+192]; load->v38; null
              mov     qword [rsp+232], r10            ; save->v49; load->v49
              mov     r11            , qword [rsp+224]; load->v48
              add     r10            , r11            
              mov     qword [rsp+232], r10            ; save->v49; load->v49; assign->n_l
              mov     qword [rsp+192], r10            ; save->v38
              mov     qword [rsp+240], r12            ; load->v47; null; save->v50
              mov     r10            , qword [rsp+240]; load->v50
              sal     r10            , 3              ; from imul              mov     qword [rsp+240], r10            ; save->v50; load->v50
              add     r10            , 8              
              mov     qword [rsp+240], r10            ; save->v50; load->v50
              mov     r11            , rbx            ; load->v46
              add     r10            , r11            
              mov     qword [rsp+240], r10            ; save->v50
              mov     r11            , qword [rsp+240]; translate->qword [v50]
              mov     r10            , qword [r11]    
              mov     qword [rsp+248], r10            ; save->v51
              mov     r10            , qword [rsp+240]; translate->qword [v50]
              mov     qword [r10]    , r14            ; load->v45; assign->a_left[n_l++]
_text__mergesort_for0_continue:
              mov     r10            , qword [rsp+216]; load->v41; null
              mov     qword [rsp+256], r10            ; save->v52
              mov     qword [rsp+264], 1              ; null; save->v53
              mov     r10            , qword [rsp+216]; load->v41; null
              mov     qword [rsp+272], r10            ; save->v54; load->v54
              mov     r11            , qword [rsp+264]; load->v53
              add     r10            , r11            
              mov     qword [rsp+272], r10            ; save->v54; load->v54; assign->i
              mov     qword [rsp+216], r10            ; save->v41; load->v41
              mov     r11            , qword [rsp+176]; load->v30
              cmp     r10d           , r11d           
              mov     qword [rsp+216], r10            ; save->v41
              jl      _text__mergesort_for0_start                 
;----------------------------------]
;[----------------------------------
_text__mergesort_for0_end:
_text__mergesort_for1_init:
              mov     r10            , qword [rsp+176]; load->v30; assign->i
              mov     qword [rsp+216], r10            ; save->v41; load->v41
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10d           , r11d           
              mov     qword [rsp+216], r10            ; save->v41
              mov     r10            , rbp            ; load->v55
              setl    r10b                            
              mov     rbp            , r10            ; save->v55; load->v55
              and     r10            , 255            
              mov     rbp            , r10            ; save->v55
_text__mergesort_for1_init_check:
              mov     r10            , rbp            ; load->v55
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v55
              je      _text__mergesort_for1_end                 
;----------------------------------]
;[----------------------------------
_text__mergesort_for1_start:
              mov     rbx            , [_data_bss_a]  ; null; save->v56
              mov     r12            , qword [rsp+216]; load->v41; null; save->v57
              mov     r10            , r12            ; load->v57
              sal     r10            , 3              ; from imul              mov     r12            , r10            ; save->v57; load->v57
              add     r10            , 8              
              mov     r12            , r10            ; save->v57; load->v57
              mov     r11            , rbx            ; load->v56
              add     r10            , r11            
              mov     r12            , r10            ; save->v57
              mov     r11            , r12            ; translate->qword [v57]
              mov     r13            , qword [r11]    ; null; save->v58
              mov     r14            , [_data_bss_a_right]; null; save->v59
              mov     r15            , qword [rsp+208]; load->v40; null; save->v60
              mov     qword [rsp+280], 1              ; null; save->v61
              mov     r10            , qword [rsp+208]; load->v40; null
              mov     qword [rsp+288], r10            ; save->v62; load->v62
              mov     r11            , qword [rsp+280]; load->v61
              add     r10            , r11            
              mov     qword [rsp+288], r10            ; save->v62; load->v62; assign->n_r
              mov     qword [rsp+208], r10            ; save->v40
              mov     qword [rsp+296], r15            ; load->v60; null; save->v63
              mov     r10            , qword [rsp+296]; load->v63
              sal     r10            , 3              ; from imul              mov     qword [rsp+296], r10            ; save->v63; load->v63
              add     r10            , 8              
              mov     qword [rsp+296], r10            ; save->v63; load->v63
              mov     r11            , r14            ; load->v59
              add     r10            , r11            
              mov     qword [rsp+296], r10            ; save->v63
              mov     r11            , qword [rsp+296]; translate->qword [v63]
              mov     r10            , qword [r11]    
              mov     qword [rsp+304], r10            ; save->v64
              mov     r10            , qword [rsp+296]; translate->qword [v63]
              mov     qword [r10]    , r13            ; load->v58; assign->a_right[n_r++]
_text__mergesort_for1_continue:
              mov     r10            , qword [rsp+216]; load->v41; null
              mov     qword [rsp+312], r10            ; save->v65
              mov     qword [rsp+320], 1              ; null; save->v66
              mov     r10            , qword [rsp+216]; load->v41; null
              mov     qword [rsp+328], r10            ; save->v67; load->v67
              mov     r11            , qword [rsp+320]; load->v66
              add     r10            , r11            
              mov     qword [rsp+328], r10            ; save->v67; load->v67; assign->i
              mov     qword [rsp+216], r10            ; save->v41; load->v41
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10d           , r11d           
              mov     qword [rsp+216], r10            ; save->v41
              jl      _text__mergesort_for1_start                 
;----------------------------------]
;[----------------------------------
_text__mergesort_for1_end:
              mov     rbp            , 0              ; null; save->v68
              mov     qword [rsp+336], rbp            ; load->v68; init->z_l; save->v69
              mov     rbp            , 0              ; null; save->v70
              mov     qword [rsp+344], rbp            ; load->v70; init->z_r; save->v71
              mov     r10            , qword [rsp+48] ; load->v6; init->z
              mov     qword [rsp+352], r10            ; save->v72
_text__mergesort_for2_init:
_text__mergesort_and0_lvalue:
              mov     r13            , 0              ; null; save->v73
              mov     r10            , qword [rsp+336]; load->v69
              mov     r11            , qword [rsp+192]; load->v38
              cmp     r10d           , r11d           
              mov     qword [rsp+336], r10            ; save->v69
              mov     r10            , r14            ; load->v74
              setl    r10b                            
              mov     r14            , r10            ; save->v74; load->v74
              and     r10            , 255            
              mov     r14            , r10            ; save->v74; load->v74
              cmp     r10            , 0              
              mov     r14            , r10            ; save->v74
              je      _text__mergesort_and0_end                 
;----------------------------------]
;[----------------------------------
_text__mergesort_and0_rvalue:
              mov     r10            , qword [rsp+344]; load->v71
              mov     r11            , qword [rsp+208]; load->v40
              cmp     r10d           , r11d           
              mov     qword [rsp+344], r10            ; save->v71
              mov     r10            , r15            ; load->v75
              setl    r10b                            
              mov     r15            , r10            ; save->v75; load->v75
              and     r10            , 255            
              mov     r15            , r10            ; save->v75; load->v75
              cmp     r10            , 0              
              mov     r15            , r10            ; save->v75
              je      _text__mergesort_and0_end                 
              mov     r13            , 255            ; null; save->v73
_text__mergesort_and0_end:
_text__mergesort_for2_init_check:
              mov     r10            , r13            ; load->v73
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v73
              je      _text__mergesort_for2_end                 
;----------------------------------]
;[----------------------------------
_text__mergesort_for2_start:
              mov     r12            , qword [rsp+184]; load->v32; null; save->v76
              mov     rbp            , 1              ; null; save->v77
              mov     rbx            , qword [rsp+184]; load->v32; null; save->v78
              mov     r10            , rbx            ; load->v78
              mov     r11            , rbp            ; load->v77
              add     r10            , r11            
              mov     rbx            , r10            ; save->v78
              mov     qword [rsp+184], rbx            ; load->v78; assign->sum; save->v32
_text__mergesort_if1_init:
              mov     r10            , [_data_bss_a_left]
              mov     qword [rsp+360], r10            ; save->v79
              mov     r10            , qword [rsp+336]; load->v69; null
              mov     qword [rsp+368], r10            ; save->v80; load->v80
              sal     r10            , 3              ; from imul              mov     qword [rsp+368], r10            ; save->v80; load->v80
              add     r10            , 8              
              mov     qword [rsp+368], r10            ; save->v80; load->v80
              mov     r11            , qword [rsp+360]; load->v79
              add     r10            , r11            
              mov     qword [rsp+368], r10            ; save->v80
              mov     r11            , qword [rsp+368]; translate->qword [v80]
              mov     r10            , qword [r11]    
              mov     qword [rsp+376], r10            ; save->v81
              mov     r10            , [_data_bss_a_right]
              mov     qword [rsp+384], r10            ; save->v82
              mov     r10            , qword [rsp+344]; load->v71; null
              mov     qword [rsp+392], r10            ; save->v83; load->v83
              sal     r10            , 3              ; from imul              mov     qword [rsp+392], r10            ; save->v83; load->v83
              add     r10            , 8              
              mov     qword [rsp+392], r10            ; save->v83; load->v83
              mov     r11            , qword [rsp+384]; load->v82
              add     r10            , r11            
              mov     qword [rsp+392], r10            ; save->v83
              mov     r11            , qword [rsp+392]; translate->qword [v83]
              mov     r10            , qword [r11]    
              mov     qword [rsp+400], r10            ; save->v84
_text__mergesort_if1_check:
              mov     r10            , qword [rsp+376]; load->v81
              mov     r11            , qword [rsp+400]; load->v84
              cmp     r10d           , r11d           
              mov     qword [rsp+376], r10            ; save->v81
              jge     _text__mergesort_if1_else                 
;----------------------------------]
;[----------------------------------
_text__mergesort_if1_start:
              mov     r10            , [_data_bss_a_left]
              mov     qword [rsp+408], r10            ; save->v85
              mov     r10            , qword [rsp+336]; load->v69; null
              mov     qword [rsp+416], r10            ; save->v86
              mov     qword [rsp+424], 1              ; null; save->v87
              mov     r10            , qword [rsp+336]; load->v69; null
              mov     qword [rsp+432], r10            ; save->v88; load->v88
              mov     r11            , qword [rsp+424]; load->v87
              add     r10            , r11            
              mov     qword [rsp+432], r10            ; save->v88; load->v88; assign->z_l
              mov     qword [rsp+336], r10            ; save->v69
              mov     r10            , qword [rsp+416]; load->v86; null
              mov     qword [rsp+440], r10            ; save->v89; load->v89
              sal     r10            , 3              ; from imul              mov     qword [rsp+440], r10            ; save->v89; load->v89
              add     r10            , 8              
              mov     qword [rsp+440], r10            ; save->v89; load->v89
              mov     r11            , qword [rsp+408]; load->v85
              add     r10            , r11            
              mov     qword [rsp+440], r10            ; save->v89
              mov     r11            , qword [rsp+440]; translate->qword [v89]
              mov     r10            , qword [r11]    
              mov     qword [rsp+448], r10            ; save->v90
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+456], r10            ; save->v91
              mov     r10            , qword [rsp+352]; load->v72; null
              mov     qword [rsp+464], r10            ; save->v92
              mov     qword [rsp+472], 1              ; null; save->v93
              mov     r10            , qword [rsp+352]; load->v72; null
              mov     qword [rsp+480], r10            ; save->v94; load->v94
              mov     r11            , qword [rsp+472]; load->v93
              add     r10            , r11            
              mov     qword [rsp+480], r10            ; save->v94; load->v94; assign->z
              mov     qword [rsp+352], r10            ; save->v72
              mov     r10            , qword [rsp+464]; load->v92; null
              mov     qword [rsp+488], r10            ; save->v95; load->v95
              sal     r10            , 3              ; from imul              mov     qword [rsp+488], r10            ; save->v95; load->v95
              add     r10            , 8              
              mov     qword [rsp+488], r10            ; save->v95; load->v95
              mov     r11            , qword [rsp+456]; load->v91
              add     r10            , r11            
              mov     qword [rsp+488], r10            ; save->v95
              mov     r11            , qword [rsp+488]; translate->qword [v95]
              mov     r10            , qword [r11]    
              mov     qword [rsp+496], r10            ; save->v96
              mov     r10            , qword [rsp+488]; translate->qword [v95]
              mov     r11            , qword [rsp+448]; load->v90
              mov     qword [r10]    , r11            ; assign->a[z++]
              jmp     _text__mergesort_if1_end                 
;----------------------------------]
;[----------------------------------
_text__mergesort_if1_else:
              mov     r10            , [_data_bss_a_right]
              mov     qword [rsp+504], r10            ; save->v97
              mov     r10            , qword [rsp+344]; load->v71; null
              mov     qword [rsp+512], r10            ; save->v98
              mov     qword [rsp+520], 1              ; null; save->v99
              mov     r10            , qword [rsp+344]; load->v71; null
              mov     qword [rsp+528], r10            ; save->v100; load->v100
              mov     r11            , qword [rsp+520]; load->v99
              add     r10            , r11            
              mov     qword [rsp+528], r10            ; save->v100; load->v100; assign->z_r
              mov     qword [rsp+344], r10            ; save->v71
              mov     r10            , qword [rsp+512]; load->v98; null
              mov     qword [rsp+536], r10            ; save->v101; load->v101
              sal     r10            , 3              ; from imul              mov     qword [rsp+536], r10            ; save->v101; load->v101
              add     r10            , 8              
              mov     qword [rsp+536], r10            ; save->v101; load->v101
              mov     r11            , qword [rsp+504]; load->v97
              add     r10            , r11            
              mov     qword [rsp+536], r10            ; save->v101
              mov     r11            , qword [rsp+536]; translate->qword [v101]
              mov     r10            , qword [r11]    
              mov     qword [rsp+544], r10            ; save->v102
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+552], r10            ; save->v103
              mov     r10            , qword [rsp+352]; load->v72; null
              mov     qword [rsp+560], r10            ; save->v104
              mov     qword [rsp+568], 1              ; null; save->v105
              mov     r10            , qword [rsp+352]; load->v72; null
              mov     qword [rsp+576], r10            ; save->v106; load->v106
              mov     r11            , qword [rsp+568]; load->v105
              add     r10            , r11            
              mov     qword [rsp+576], r10            ; save->v106; load->v106; assign->z
              mov     qword [rsp+352], r10            ; save->v72
              mov     r10            , qword [rsp+560]; load->v104; null
              mov     qword [rsp+584], r10            ; save->v107; load->v107
              sal     r10            , 3              ; from imul              mov     qword [rsp+584], r10            ; save->v107; load->v107
              add     r10            , 8              
              mov     qword [rsp+584], r10            ; save->v107; load->v107
              mov     r11            , qword [rsp+552]; load->v103
              add     r10            , r11            
              mov     qword [rsp+584], r10            ; save->v107
              mov     r11            , qword [rsp+584]; translate->qword [v107]
              mov     r10            , qword [r11]    
              mov     qword [rsp+592], r10            ; save->v108
              mov     r10            , qword [rsp+584]; translate->qword [v107]
              mov     r11            , qword [rsp+544]; load->v102
              mov     qword [r10]    , r11            ; assign->a[z++]
_text__mergesort_if1_end:
_text__mergesort_for2_continue:
_text__mergesort_and1_lvalue:
              mov     qword [rsp+600], 0              ; null; save->v109
              mov     r10            , qword [rsp+336]; load->v69
              mov     r11            , qword [rsp+192]; load->v38
              cmp     r10d           , r11d           
              mov     qword [rsp+336], r10            ; save->v69
              mov     r10            , qword [rsp+608]; load->v110
              setl    r10b                            
              mov     qword [rsp+608], r10            ; save->v110; load->v110
              and     r10            , 255            
              mov     qword [rsp+608], r10            ; save->v110; load->v110
              cmp     r10            , 0              
              mov     qword [rsp+608], r10            ; save->v110
              je      _text__mergesort_and1_end                 
;----------------------------------]
;[----------------------------------
_text__mergesort_and1_rvalue:
              mov     r10            , qword [rsp+344]; load->v71
              mov     r11            , qword [rsp+208]; load->v40
              cmp     r10d           , r11d           
              mov     qword [rsp+344], r10            ; save->v71
              mov     r10            , qword [rsp+616]; load->v111
              setl    r10b                            
              mov     qword [rsp+616], r10            ; save->v111; load->v111
              and     r10            , 255            
              mov     qword [rsp+616], r10            ; save->v111; load->v111
              cmp     r10            , 0              
              mov     qword [rsp+616], r10            ; save->v111
              je      _text__mergesort_and1_end                 
              mov     qword [rsp+600], 255            ; null; save->v109
_text__mergesort_and1_end:
              mov     r10            , qword [rsp+600]; load->v109
              cmp     r10b           , 0              
              mov     qword [rsp+600], r10            ; save->v109
              jne     _text__mergesort_for2_start                 
;----------------------------------]
;[----------------------------------
_text__mergesort_for2_end:
_text__mergesort_for3_init:
              mov     r10            , qword [rsp+336]; load->v69
              mov     r11            , qword [rsp+192]; load->v38
              cmp     r10d           , r11d           
              mov     qword [rsp+336], r10            ; save->v69
              mov     r10            , rbp            ; load->v112
              setl    r10b                            
              mov     rbp            , r10            ; save->v112; load->v112
              and     r10            , 255            
              mov     rbp            , r10            ; save->v112
_text__mergesort_for3_init_check:
              mov     r10            , rbp            ; load->v112
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v112
              je      _text__mergesort_for3_end                 
;----------------------------------]
;[----------------------------------
_text__mergesort_for3_start:
              mov     rbx            , [_data_bss_a_left]; null; save->v113
              mov     r12            , qword [rsp+336]; load->v69; null; save->v114
              mov     r13            , 1              ; null; save->v115
              mov     r14            , qword [rsp+336]; load->v69; null; save->v116
              mov     r10            , r14            ; load->v116
              mov     r11            , r13            ; load->v115
              add     r10            , r11            
              mov     r14            , r10            ; save->v116
              mov     qword [rsp+336], r14            ; load->v116; assign->z_l; save->v69
              mov     r15            , r12            ; load->v114; null; save->v117
              mov     r10            , r15            ; load->v117
              sal     r10            , 3              ; from imul              mov     r15            , r10            ; save->v117; load->v117
              add     r10            , 8              
              mov     r15            , r10            ; save->v117; load->v117
              mov     r11            , rbx            ; load->v113
              add     r10            , r11            
              mov     r15            , r10            ; save->v117
              mov     r11            , r15            ; translate->qword [v117]
              mov     r10            , qword [r11]    
              mov     qword [rsp+624], r10            ; save->v118
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+632], r10            ; save->v119
              mov     r10            , qword [rsp+352]; load->v72; null
              mov     qword [rsp+640], r10            ; save->v120
              mov     qword [rsp+648], 1              ; null; save->v121
              mov     r10            , qword [rsp+352]; load->v72; null
              mov     qword [rsp+656], r10            ; save->v122; load->v122
              mov     r11            , qword [rsp+648]; load->v121
              add     r10            , r11            
              mov     qword [rsp+656], r10            ; save->v122; load->v122; assign->z
              mov     qword [rsp+352], r10            ; save->v72
              mov     r10            , qword [rsp+640]; load->v120; null
              mov     qword [rsp+664], r10            ; save->v123; load->v123
              sal     r10            , 3              ; from imul              mov     qword [rsp+664], r10            ; save->v123; load->v123
              add     r10            , 8              
              mov     qword [rsp+664], r10            ; save->v123; load->v123
              mov     r11            , qword [rsp+632]; load->v119
              add     r10            , r11            
              mov     qword [rsp+664], r10            ; save->v123
              mov     r11            , qword [rsp+664]; translate->qword [v123]
              mov     r10            , qword [r11]    
              mov     qword [rsp+672], r10            ; save->v124
              mov     r10            , qword [rsp+664]; translate->qword [v123]
              mov     r11            , qword [rsp+624]; load->v118
              mov     qword [r10]    , r11            ; assign->a[z++]
_text__mergesort_for3_continue:
              mov     r10            , qword [rsp+336]; load->v69
              mov     r11            , qword [rsp+192]; load->v38
              cmp     r10d           , r11d           
              mov     qword [rsp+336], r10            ; save->v69
              jl      _text__mergesort_for3_start                 
;----------------------------------]
;[----------------------------------
_text__mergesort_for3_end:
_text__mergesort_for4_init:
              mov     r10            , qword [rsp+344]; load->v71
              mov     r11            , qword [rsp+208]; load->v40
              cmp     r10d           , r11d           
              mov     qword [rsp+344], r10            ; save->v71
              mov     r10            , rbp            ; load->v125
              setl    r10b                            
              mov     rbp            , r10            ; save->v125; load->v125
              and     r10            , 255            
              mov     rbp            , r10            ; save->v125
_text__mergesort_for4_init_check:
              mov     r10            , rbp            ; load->v125
              cmp     r10b           , 0              
              mov     rbp            , r10            ; save->v125
              je      _text__mergesort_for4_end                 
;----------------------------------]
;[----------------------------------
_text__mergesort_for4_start:
              mov     rbx            , [_data_bss_a_right]; null; save->v126
              mov     r12            , qword [rsp+344]; load->v71; null; save->v127
              mov     r13            , 1              ; null; save->v128
              mov     r14            , qword [rsp+344]; load->v71; null; save->v129
              mov     r10            , r14            ; load->v129
              mov     r11            , r13            ; load->v128
              add     r10            , r11            
              mov     r14            , r10            ; save->v129
              mov     qword [rsp+344], r14            ; load->v129; assign->z_r; save->v71
              mov     r15            , r12            ; load->v127; null; save->v130
              mov     r10            , r15            ; load->v130
              sal     r10            , 3              ; from imul              mov     r15            , r10            ; save->v130; load->v130
              add     r10            , 8              
              mov     r15            , r10            ; save->v130; load->v130
              mov     r11            , rbx            ; load->v126
              add     r10            , r11            
              mov     r15            , r10            ; save->v130
              mov     r11            , r15            ; translate->qword [v130]
              mov     r10            , qword [r11]    
              mov     qword [rsp+680], r10            ; save->v131
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+688], r10            ; save->v132
              mov     r10            , qword [rsp+352]; load->v72; null
              mov     qword [rsp+696], r10            ; save->v133
              mov     qword [rsp+704], 1              ; null; save->v134
              mov     r10            , qword [rsp+352]; load->v72; null
              mov     qword [rsp+712], r10            ; save->v135; load->v135
              mov     r11            , qword [rsp+704]; load->v134
              add     r10            , r11            
              mov     qword [rsp+712], r10            ; save->v135; load->v135; assign->z
              mov     qword [rsp+352], r10            ; save->v72
              mov     r10            , qword [rsp+696]; load->v133; null
              mov     qword [rsp+720], r10            ; save->v136; load->v136
              sal     r10            , 3              ; from imul              mov     qword [rsp+720], r10            ; save->v136; load->v136
              add     r10            , 8              
              mov     qword [rsp+720], r10            ; save->v136; load->v136
              mov     r11            , qword [rsp+688]; load->v132
              add     r10            , r11            
              mov     qword [rsp+720], r10            ; save->v136
              mov     r11            , qword [rsp+720]; translate->qword [v136]
              mov     r10            , qword [r11]    
              mov     qword [rsp+728], r10            ; save->v137
              mov     r10            , qword [rsp+720]; translate->qword [v136]
              mov     r11            , qword [rsp+680]; load->v131
              mov     qword [r10]    , r11            ; assign->a[z++]
_text__mergesort_for4_continue:
              mov     r10            , qword [rsp+344]; load->v71
              mov     r11            , qword [rsp+208]; load->v40
              cmp     r10d           , r11d           
              mov     qword [rsp+344], r10            ; save->v71
              jl      _text__mergesort_for4_start                 
;----------------------------------]
;[----------------------------------
_text__mergesort_for4_end:
_text__mergesort_ret1:
              mov     rax            , qword [rsp+184]; load->v32; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 744            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__heapsort ] ---
;[----------------------------------
_text__heapsort:
              sub     rsp            , 1080           
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; null; save->v0
              mov     qword [rsp+8]  , rbx            ; null; save->v1
              mov     qword [rsp+16] , r12            ; null; save->v2
              mov     qword [rsp+24] , r13            ; null; save->v3
              mov     qword [rsp+32] , r14            ; null; save->v4
              mov     qword [rsp+40] , r15            ; null; save->v5
              mov     rbp            , 0              ; null; save->v20
              mov     qword [rsp+160], rbp            ; load->v20; init->sum; save->v21
_text__heapsort_for0_init:
              mov     qword [rsp+184], 1              ; null; save->v24
              mov     r10            , qword [rsp+184]; load->v24; assign->i
              mov     qword [rsp+168], r10            ; save->v22
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+192], r10            ; save->v25
              mov     r10            , qword [rsp+168]; load->v22
              mov     r11            , qword [rsp+192]; load->v25
              cmp     r10d           , r11d           
              mov     qword [rsp+168], r10            ; save->v22
              mov     r10            , qword [rsp+200]; load->v26
              setle   r10b                            
              mov     qword [rsp+200], r10            ; save->v26; load->v26
              and     r10            , 255            
              mov     qword [rsp+200], r10            ; save->v26
_text__heapsort_for0_init_check:
              mov     r10            , qword [rsp+200]; load->v26
              cmp     r10b           , 0              
              mov     qword [rsp+200], r10            ; save->v26
              je      _text__heapsort_for0_end                 
;----------------------------------]
;[----------------------------------
_text__heapsort_for0_start:
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+208], r10            ; save->v27
              mov     r10            , qword [rsp+168]; load->v22; null
              mov     qword [rsp+216], r10            ; save->v28; load->v28
              sal     r10            , 3              ; from imul              mov     qword [rsp+216], r10            ; save->v28; load->v28
              add     r10            , 8              
              mov     qword [rsp+216], r10            ; save->v28; load->v28
              mov     r11            , qword [rsp+208]; load->v27
              add     r10            , r11            
              mov     qword [rsp+216], r10            ; save->v28
              mov     r11            , qword [rsp+216]; translate->qword [v28]
              mov     r10            , qword [r11]    
              mov     qword [rsp+224], r10            ; save->v29
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+232], r10            ; save->v30
              mov     r10            , qword [rsp+168]; load->v22; null
              mov     qword [rsp+240], r10            ; save->v31; load->v31
              sal     r10            , 3              ; from imul              mov     qword [rsp+240], r10            ; save->v31; load->v31
              add     r10            , 8              
              mov     qword [rsp+240], r10            ; save->v31; load->v31
              mov     r11            , qword [rsp+232]; load->v30
              add     r10            , r11            
              mov     qword [rsp+240], r10            ; save->v31
              mov     r11            , qword [rsp+240]; translate->qword [v31]
              mov     r10            , qword [r11]    
              mov     qword [rsp+248], r10            ; save->v32
              mov     r10            , qword [rsp+240]; translate->qword [v31]
              mov     r11            , qword [rsp+224]; load->v29
              mov     qword [r10]    , r11            ; assign->heap[i]
              mov     r10            , qword [rsp+168]; load->v22; init->x
              mov     qword [rsp+256], r10            ; save->v33
_text__heapsort_for1_init:
              mov     r13            , 1              ; null; save->v34
              mov     r10            , qword [rsp+256]; load->v33
              mov     r11            , r13            ; load->v34
              cmp     r10d           , r11d           
              mov     qword [rsp+256], r10            ; save->v33
              mov     r10            , r14            ; load->v35
              setne   r10b                            
              mov     r14            , r10            ; save->v35; load->v35
              and     r10            , 255            
              mov     r14            , r10            ; save->v35
_text__heapsort_for1_init_check:
              mov     r10            , r14            ; load->v35
              cmp     r10b           , 0              
              mov     r14            , r10            ; save->v35
              je      _text__heapsort_for1_end                 
;----------------------------------]
;[----------------------------------
_text__heapsort_for1_start:
              mov     r15            , qword [rsp+160]; load->v21; null; save->v36
              mov     rbx            , 1              ; null; save->v37
              mov     rbp            , qword [rsp+160]; load->v21; null; save->v38
              mov     r10            , rbp            ; load->v38
              mov     r11            , rbx            ; load->v37
              add     r10            , r11            
              mov     rbp            , r10            ; save->v38
              mov     qword [rsp+160], rbp            ; load->v38; assign->sum; save->v21
_text__heapsort_if0_init:
              mov     r12            , [_data_bss_heap]; null; save->v39
              mov     r10            , qword [rsp+256]; load->v33; null
              mov     qword [rsp+264], r10            ; save->v40; load->v40
              sal     r10            , 3              ; from imul              mov     qword [rsp+264], r10            ; save->v40; load->v40
              add     r10            , 8              
              mov     qword [rsp+264], r10            ; save->v40; load->v40
              mov     r11            , r12            ; load->v39
              add     r10            , r11            
              mov     qword [rsp+264], r10            ; save->v40
              mov     r11            , qword [rsp+264]; translate->qword [v40]
              mov     r10            , qword [r11]    
              mov     qword [rsp+272], r10            ; save->v41
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+280], r10            ; save->v42
              mov     qword [rsp+288], 1              ; null; save->v43
              mov     qword [rsp+304], rcx            ; null; save->v45
              mov     r10            , qword [rsp+256]; load->v33; null
              mov     qword [rsp+296], r10            ; save->v44
              mov     rcx            , qword [rsp+288]; load->v43; null
              mov     r10            , qword [rsp+296]; load->v44
              and     r10            , -1             
              mov     qword [rsp+296], r10            ; save->v44; load->v44
              sar     r10d           , cl             
              mov     qword [rsp+296], r10            ; save->v44
              mov     rcx            , qword [rsp+304]; load->v45; null
              mov     r10            , qword [rsp+296]; load->v44; null
              mov     qword [rsp+312], r10            ; save->v46; load->v46
              sal     r10            , 3              ; from imul              mov     qword [rsp+312], r10            ; save->v46; load->v46
              add     r10            , 8              
              mov     qword [rsp+312], r10            ; save->v46; load->v46
              mov     r11            , qword [rsp+280]; load->v42
              add     r10            , r11            
              mov     qword [rsp+312], r10            ; save->v46
              mov     r11            , qword [rsp+312]; translate->qword [v46]
              mov     r10            , qword [r11]    
              mov     qword [rsp+320], r10            ; save->v47
_text__heapsort_if0_check:
              mov     r10            , qword [rsp+272]; load->v41
              mov     r11            , qword [rsp+320]; load->v47
              cmp     r10d           , r11d           
              mov     qword [rsp+272], r10            ; save->v41
              jle     _text__heapsort_if0_else                 
;----------------------------------]
;[----------------------------------
_text__heapsort_if0_start:
_text__heapsort_for1_break0:
              jmp     _text__heapsort_for1_end                 
;----------------------------------]
;[----------------------------------
_text__heapsort_if0_else:
_text__heapsort_if0_end:
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+328], r10            ; save->v48
              mov     r10            , qword [rsp+256]; load->v33; null
              mov     qword [rsp+336], r10            ; save->v49; load->v49
              sal     r10            , 3              ; from imul              mov     qword [rsp+336], r10            ; save->v49; load->v49
              add     r10            , 8              
              mov     qword [rsp+336], r10            ; save->v49; load->v49
              mov     r11            , qword [rsp+328]; load->v48
              add     r10            , r11            
              mov     qword [rsp+336], r10            ; save->v49
              mov     r11            , qword [rsp+336]; translate->qword [v49]
              mov     r10            , qword [r11]    
              mov     qword [rsp+344], r10            ; save->v50; load->v50; assign->tmp
              mov     qword [rsp+176], r10            ; save->v23
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+352], r10            ; save->v51
              mov     qword [rsp+360], 1              ; null; save->v52
              mov     qword [rsp+376], rcx            ; null; save->v54
              mov     r10            , qword [rsp+256]; load->v33; null
              mov     qword [rsp+368], r10            ; save->v53
              mov     rcx            , qword [rsp+360]; load->v52; null
              mov     r10            , qword [rsp+368]; load->v53
              and     r10            , -1             
              mov     qword [rsp+368], r10            ; save->v53; load->v53
              sar     r10d           , cl             
              mov     qword [rsp+368], r10            ; save->v53
              mov     rcx            , qword [rsp+376]; load->v54; null
              mov     r10            , qword [rsp+368]; load->v53; null
              mov     qword [rsp+384], r10            ; save->v55; load->v55
              sal     r10            , 3              ; from imul              mov     qword [rsp+384], r10            ; save->v55; load->v55
              add     r10            , 8              
              mov     qword [rsp+384], r10            ; save->v55; load->v55
              mov     r11            , qword [rsp+352]; load->v51
              add     r10            , r11            
              mov     qword [rsp+384], r10            ; save->v55
              mov     r11            , qword [rsp+384]; translate->qword [v55]
              mov     r10            , qword [r11]    
              mov     qword [rsp+392], r10            ; save->v56
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+400], r10            ; save->v57
              mov     r10            , qword [rsp+256]; load->v33; null
              mov     qword [rsp+408], r10            ; save->v58; load->v58
              sal     r10            , 3              ; from imul              mov     qword [rsp+408], r10            ; save->v58; load->v58
              add     r10            , 8              
              mov     qword [rsp+408], r10            ; save->v58; load->v58
              mov     r11            , qword [rsp+400]; load->v57
              add     r10            , r11            
              mov     qword [rsp+408], r10            ; save->v58
              mov     r11            , qword [rsp+408]; translate->qword [v58]
              mov     r10            , qword [r11]    
              mov     qword [rsp+416], r10            ; save->v59
              mov     r10            , qword [rsp+408]; translate->qword [v58]
              mov     r11            , qword [rsp+392]; load->v56
              mov     qword [r10]    , r11            ; assign->heap[x]
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+424], r10            ; save->v60
              mov     qword [rsp+432], 1              ; null; save->v61
              mov     qword [rsp+448], rcx            ; null; save->v63
              mov     r10            , qword [rsp+256]; load->v33; null
              mov     qword [rsp+440], r10            ; save->v62
              mov     rcx            , qword [rsp+432]; load->v61; null
              mov     r10            , qword [rsp+440]; load->v62
              and     r10            , -1             
              mov     qword [rsp+440], r10            ; save->v62; load->v62
              sar     r10d           , cl             
              mov     qword [rsp+440], r10            ; save->v62
              mov     rcx            , qword [rsp+448]; load->v63; null
              mov     r10            , qword [rsp+440]; load->v62; null
              mov     qword [rsp+456], r10            ; save->v64; load->v64
              sal     r10            , 3              ; from imul              mov     qword [rsp+456], r10            ; save->v64; load->v64
              add     r10            , 8              
              mov     qword [rsp+456], r10            ; save->v64; load->v64
              mov     r11            , qword [rsp+424]; load->v60
              add     r10            , r11            
              mov     qword [rsp+456], r10            ; save->v64
              mov     r11            , qword [rsp+456]; translate->qword [v64]
              mov     r10            , qword [r11]    
              mov     qword [rsp+464], r10            ; save->v65
              mov     r10            , qword [rsp+456]; translate->qword [v64]
              mov     r11            , qword [rsp+176]; load->v23
              mov     qword [r10]    , r11            ; assign->heap[x>>1]
              mov     qword [rsp+472], 1              ; null; save->v66
              mov     qword [rsp+488], rcx            ; null; save->v68
              mov     r10            , qword [rsp+256]; load->v33; null
              mov     qword [rsp+480], r10            ; save->v67
              mov     rcx            , qword [rsp+472]; load->v66; null
              mov     r10            , qword [rsp+480]; load->v67
              and     r10            , -1             
              mov     qword [rsp+480], r10            ; save->v67; load->v67
              sar     r10d           , cl             
              mov     qword [rsp+480], r10            ; save->v67
              mov     rcx            , qword [rsp+488]; load->v68; null
              mov     r10            , qword [rsp+480]; load->v67; assign->x
              mov     qword [rsp+256], r10            ; save->v33
_text__heapsort_for1_continue:
              mov     qword [rsp+496], 1              ; null; save->v69
              mov     r10            , qword [rsp+256]; load->v33
              mov     r11            , qword [rsp+496]; load->v69
              cmp     r10d           , r11d           
              mov     qword [rsp+256], r10            ; save->v33
              mov     r10            , qword [rsp+504]; load->v70
              setne   r10b                            
              mov     qword [rsp+504], r10            ; save->v70; load->v70
              and     r10            , 255            
              mov     qword [rsp+504], r10            ; save->v70; load->v70
              cmp     r10b           , 0              
              mov     qword [rsp+504], r10            ; save->v70
              jne     _text__heapsort_for1_start                 
;----------------------------------]
;[----------------------------------
_text__heapsort_for1_end:
_text__heapsort_for0_continue:
              mov     r10            , qword [rsp+168]; load->v22; null
              mov     qword [rsp+512], r10            ; save->v71
              mov     qword [rsp+520], 1              ; null; save->v72
              mov     r10            , qword [rsp+168]; load->v22; null
              mov     qword [rsp+528], r10            ; save->v73; load->v73
              mov     r11            , qword [rsp+520]; load->v72
              add     r10            , r11            
              mov     qword [rsp+528], r10            ; save->v73; load->v73; assign->i
              mov     qword [rsp+168], r10            ; save->v22
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+536], r10            ; save->v74
              mov     r10            , qword [rsp+168]; load->v22
              mov     r11            , qword [rsp+536]; load->v74
              cmp     r10d           , r11d           
              mov     qword [rsp+168], r10            ; save->v22
              jle     _text__heapsort_for0_start                 
;----------------------------------]
;[----------------------------------
_text__heapsort_for0_end:
              mov     rbp            , [_data_bss_n]  ; null; save->v75
              mov     qword [rsp+544], rbp            ; load->v75; init->heap_size; save->v76
_text__heapsort_for2_init:
              mov     qword [rsp+552], 1              ; null; save->v77
              mov     r10            , qword [rsp+552]; load->v77; assign->i
              mov     qword [rsp+168], r10            ; save->v22
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+560], r10            ; save->v78
              mov     r10            , qword [rsp+168]; load->v22
              mov     r11            , qword [rsp+560]; load->v78
              cmp     r10d           , r11d           
              mov     qword [rsp+168], r10            ; save->v22
              mov     r10            , qword [rsp+568]; load->v79
              setle   r10b                            
              mov     qword [rsp+568], r10            ; save->v79; load->v79
              and     r10            , 255            
              mov     qword [rsp+568], r10            ; save->v79
_text__heapsort_for2_init_check:
              mov     r10            , qword [rsp+568]; load->v79
              cmp     r10b           , 0              
              mov     qword [rsp+568], r10            ; save->v79
              je      _text__heapsort_for2_end                 
;----------------------------------]
;[----------------------------------
_text__heapsort_for2_start:
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+576], r10            ; save->v80
              mov     qword [rsp+584], 1              ; null; save->v81
              mov     r10            , qword [rsp+584]; load->v81; null
              mov     qword [rsp+592], r10            ; save->v82; load->v82
              sal     r10            , 3              ; from imul              mov     qword [rsp+592], r10            ; save->v82; load->v82
              add     r10            , 8              
              mov     qword [rsp+592], r10            ; save->v82; load->v82
              mov     r11            , qword [rsp+576]; load->v80
              add     r10            , r11            
              mov     qword [rsp+592], r10            ; save->v82
              mov     r11            , qword [rsp+592]; translate->qword [v82]
              mov     r10            , qword [r11]    
              mov     qword [rsp+600], r10            ; save->v83
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+608], r10            ; save->v84
              mov     r10            , qword [rsp+168]; load->v22; null
              mov     qword [rsp+616], r10            ; save->v85; load->v85
              sal     r10            , 3              ; from imul              mov     qword [rsp+616], r10            ; save->v85; load->v85
              add     r10            , 8              
              mov     qword [rsp+616], r10            ; save->v85; load->v85
              mov     r11            , qword [rsp+608]; load->v84
              add     r10            , r11            
              mov     qword [rsp+616], r10            ; save->v85
              mov     r11            , qword [rsp+616]; translate->qword [v85]
              mov     r10            , qword [r11]    
              mov     qword [rsp+624], r10            ; save->v86
              mov     r10            , qword [rsp+616]; translate->qword [v85]
              mov     r11            , qword [rsp+600]; load->v83
              mov     qword [r10]    , r11            ; assign->a[i]
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+632], r10            ; save->v87
              mov     r10            , qword [rsp+544]; load->v76; null
              mov     qword [rsp+640], r10            ; save->v88
              mov     qword [rsp+648], 1              ; null; save->v89
              mov     r10            , qword [rsp+544]; load->v76; null
              mov     qword [rsp+656], r10            ; save->v90; load->v90
              mov     r11            , qword [rsp+648]; load->v89
              sub     r10            , r11            
              mov     qword [rsp+656], r10            ; save->v90; load->v90; assign->heap_size
              mov     qword [rsp+544], r10            ; save->v76
              mov     r10            , qword [rsp+640]; load->v88; null
              mov     qword [rsp+664], r10            ; save->v91; load->v91
              sal     r10            , 3              ; from imul              mov     qword [rsp+664], r10            ; save->v91; load->v91
              add     r10            , 8              
              mov     qword [rsp+664], r10            ; save->v91; load->v91
              mov     r11            , qword [rsp+632]; load->v87
              add     r10            , r11            
              mov     qword [rsp+664], r10            ; save->v91
              mov     r11            , qword [rsp+664]; translate->qword [v91]
              mov     r10            , qword [r11]    
              mov     qword [rsp+672], r10            ; save->v92
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+680], r10            ; save->v93
              mov     qword [rsp+688], 1              ; null; save->v94
              mov     r10            , qword [rsp+688]; load->v94; null
              mov     qword [rsp+696], r10            ; save->v95; load->v95
              sal     r10            , 3              ; from imul              mov     qword [rsp+696], r10            ; save->v95; load->v95
              add     r10            , 8              
              mov     qword [rsp+696], r10            ; save->v95; load->v95
              mov     r11            , qword [rsp+680]; load->v93
              add     r10            , r11            
              mov     qword [rsp+696], r10            ; save->v95
              mov     r11            , qword [rsp+696]; translate->qword [v95]
              mov     r10            , qword [r11]    
              mov     qword [rsp+704], r10            ; save->v96
              mov     r10            , qword [rsp+696]; translate->qword [v95]
              mov     r11            , qword [rsp+672]; load->v92
              mov     qword [r10]    , r11            ; assign->heap[1]
              mov     qword [rsp+712], 1              ; null; save->v97
              mov     r10            , qword [rsp+712]; load->v97; init->x
              mov     qword [rsp+720], r10            ; save->v98
_text__heapsort_for3_init:
              mov     r15            , 1              ; null; save->v99
              mov     r12            , rcx            ; null; save->v101
              mov     r13            , qword [rsp+720]; load->v98; null; save->v100
              mov     rcx            , r15            ; load->v99; null
              mov     r10            , r13            ; load->v100
              and     r10            , -1             
              mov     r13            , r10            ; save->v100; load->v100
              sal     r10d           , cl             
              mov     r13            , r10            ; save->v100
              mov     rcx            , r12            ; load->v101; null
              mov     r10            , r13            ; load->v100
              mov     r11            , qword [rsp+544]; load->v76
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v100
              mov     r10            , r14            ; load->v102
              setle   r10b                            
              mov     r14            , r10            ; save->v102; load->v102
              and     r10            , 255            
              mov     r14            , r10            ; save->v102
_text__heapsort_for3_init_check:
              mov     r10            , r14            ; load->v102
              cmp     r10b           , 0              
              mov     r14            , r10            ; save->v102
              je      _text__heapsort_for3_end                 
;----------------------------------]
;[----------------------------------
_text__heapsort_for3_start:
              mov     rbx            , 1              ; null; save->v103
              mov     qword [rsp+728], rcx            ; null; save->v105
              mov     rbp            , qword [rsp+720]; load->v98; null; save->v104
              mov     rcx            , rbx            ; load->v103; null
              mov     r10            , rbp            ; load->v104
              and     r10            , -1             
              mov     rbp            , r10            ; save->v104; load->v104
              sal     r10d           , cl             
              mov     rbp            , r10            ; save->v104
              mov     rcx            , qword [rsp+728]; load->v105; null
              mov     qword [rsp+736], rbp            ; load->v104; init->l; save->v106
              mov     qword [rsp+744], 1              ; null; save->v107
              mov     r10            , qword [rsp+736]; load->v106; null
              mov     qword [rsp+752], r10            ; save->v108; load->v108
              mov     r11            , qword [rsp+744]; load->v107
              add     r10            , r11            
              mov     qword [rsp+752], r10            ; save->v108; load->v108; init->r
              mov     qword [rsp+760], r10            ; save->v109
              mov     r10            , qword [rsp+736]; load->v106; init->y
              mov     qword [rsp+768], r10            ; save->v110
_text__heapsort_if1_init:
_text__heapsort_if1_check:
              mov     r10            , qword [rsp+760]; load->v109
              mov     r11            , qword [rsp+544]; load->v76
              cmp     r10d           , r11d           
              mov     qword [rsp+760], r10            ; save->v109
              jg      _text__heapsort_if1_else                 
;----------------------------------]
;[----------------------------------
_text__heapsort_if1_start:
              mov     r10            , qword [rsp+160]; load->v21; null
              mov     qword [rsp+776], r10            ; save->v111
              mov     qword [rsp+784], 1              ; null; save->v112
              mov     r10            , qword [rsp+160]; load->v21; null
              mov     qword [rsp+792], r10            ; save->v113; load->v113
              mov     r11            , qword [rsp+784]; load->v112
              add     r10            , r11            
              mov     qword [rsp+792], r10            ; save->v113; load->v113; assign->sum
              mov     qword [rsp+160], r10            ; save->v21
_text__heapsort_if2_init:
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+800], r10            ; save->v114
              mov     r10            , qword [rsp+760]; load->v109; null
              mov     qword [rsp+808], r10            ; save->v115; load->v115
              sal     r10            , 3              ; from imul              mov     qword [rsp+808], r10            ; save->v115; load->v115
              add     r10            , 8              
              mov     qword [rsp+808], r10            ; save->v115; load->v115
              mov     r11            , qword [rsp+800]; load->v114
              add     r10            , r11            
              mov     qword [rsp+808], r10            ; save->v115
              mov     r11            , qword [rsp+808]; translate->qword [v115]
              mov     r10            , qword [r11]    
              mov     qword [rsp+816], r10            ; save->v116
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+824], r10            ; save->v117
              mov     r10            , qword [rsp+736]; load->v106; null
              mov     qword [rsp+832], r10            ; save->v118; load->v118
              sal     r10            , 3              ; from imul              mov     qword [rsp+832], r10            ; save->v118; load->v118
              add     r10            , 8              
              mov     qword [rsp+832], r10            ; save->v118; load->v118
              mov     r11            , qword [rsp+824]; load->v117
              add     r10            , r11            
              mov     qword [rsp+832], r10            ; save->v118
              mov     r11            , qword [rsp+832]; translate->qword [v118]
              mov     r10            , qword [r11]    
              mov     qword [rsp+840], r10            ; save->v119
_text__heapsort_if2_check:
              mov     r10            , qword [rsp+816]; load->v116
              mov     r11            , qword [rsp+840]; load->v119
              cmp     r10d           , r11d           
              mov     qword [rsp+816], r10            ; save->v116
              jge     _text__heapsort_if2_else                 
;----------------------------------]
;[----------------------------------
_text__heapsort_if2_start:
              mov     r10            , qword [rsp+760]; load->v109; assign->y
              mov     qword [rsp+768], r10            ; save->v110
              jmp     _text__heapsort_if2_end                 
;----------------------------------]
;[----------------------------------
_text__heapsort_if2_else:
_text__heapsort_if2_end:
              jmp     _text__heapsort_if1_end                 
;----------------------------------]
;[----------------------------------
_text__heapsort_if1_else:
_text__heapsort_if1_end:
              mov     r10            , qword [rsp+160]; load->v21; null
              mov     qword [rsp+848], r10            ; save->v120
              mov     qword [rsp+856], 1              ; null; save->v121
              mov     r10            , qword [rsp+160]; load->v21; null
              mov     qword [rsp+864], r10            ; save->v122; load->v122
              mov     r11            , qword [rsp+856]; load->v121
              add     r10            , r11            
              mov     qword [rsp+864], r10            ; save->v122; load->v122; assign->sum
              mov     qword [rsp+160], r10            ; save->v21
_text__heapsort_if3_init:
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+872], r10            ; save->v123
              mov     r10            , qword [rsp+720]; load->v98; null
              mov     qword [rsp+880], r10            ; save->v124; load->v124
              sal     r10            , 3              ; from imul              mov     qword [rsp+880], r10            ; save->v124; load->v124
              add     r10            , 8              
              mov     qword [rsp+880], r10            ; save->v124; load->v124
              mov     r11            , qword [rsp+872]; load->v123
              add     r10            , r11            
              mov     qword [rsp+880], r10            ; save->v124
              mov     r11            , qword [rsp+880]; translate->qword [v124]
              mov     r10            , qword [r11]    
              mov     qword [rsp+888], r10            ; save->v125
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+896], r10            ; save->v126
              mov     r10            , qword [rsp+768]; load->v110; null
              mov     qword [rsp+904], r10            ; save->v127; load->v127
              sal     r10            , 3              ; from imul              mov     qword [rsp+904], r10            ; save->v127; load->v127
              add     r10            , 8              
              mov     qword [rsp+904], r10            ; save->v127; load->v127
              mov     r11            , qword [rsp+896]; load->v126
              add     r10            , r11            
              mov     qword [rsp+904], r10            ; save->v127
              mov     r11            , qword [rsp+904]; translate->qword [v127]
              mov     r10            , qword [r11]    
              mov     qword [rsp+912], r10            ; save->v128
_text__heapsort_if3_check:
              mov     r10            , qword [rsp+888]; load->v125
              mov     r11            , qword [rsp+912]; load->v128
              cmp     r10d           , r11d           
              mov     qword [rsp+888], r10            ; save->v125
              jge     _text__heapsort_if3_else                 
;----------------------------------]
;[----------------------------------
_text__heapsort_if3_start:
_text__heapsort_for3_break1:
              jmp     _text__heapsort_for3_end                 
;----------------------------------]
;[----------------------------------
_text__heapsort_if3_else:
_text__heapsort_if3_end:
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+920], r10            ; save->v129
              mov     r10            , qword [rsp+720]; load->v98; null
              mov     qword [rsp+928], r10            ; save->v130; load->v130
              sal     r10            , 3              ; from imul              mov     qword [rsp+928], r10            ; save->v130; load->v130
              add     r10            , 8              
              mov     qword [rsp+928], r10            ; save->v130; load->v130
              mov     r11            , qword [rsp+920]; load->v129
              add     r10            , r11            
              mov     qword [rsp+928], r10            ; save->v130
              mov     r11            , qword [rsp+928]; translate->qword [v130]
              mov     r10            , qword [r11]    
              mov     qword [rsp+936], r10            ; save->v131; load->v131; assign->tmp
              mov     qword [rsp+176], r10            ; save->v23
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+944], r10            ; save->v132
              mov     r10            , qword [rsp+768]; load->v110; null
              mov     qword [rsp+952], r10            ; save->v133; load->v133
              sal     r10            , 3              ; from imul              mov     qword [rsp+952], r10            ; save->v133; load->v133
              add     r10            , 8              
              mov     qword [rsp+952], r10            ; save->v133; load->v133
              mov     r11            , qword [rsp+944]; load->v132
              add     r10            , r11            
              mov     qword [rsp+952], r10            ; save->v133
              mov     r11            , qword [rsp+952]; translate->qword [v133]
              mov     r10            , qword [r11]    
              mov     qword [rsp+960], r10            ; save->v134
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+968], r10            ; save->v135
              mov     r10            , qword [rsp+720]; load->v98; null
              mov     qword [rsp+976], r10            ; save->v136; load->v136
              sal     r10            , 3              ; from imul              mov     qword [rsp+976], r10            ; save->v136; load->v136
              add     r10            , 8              
              mov     qword [rsp+976], r10            ; save->v136; load->v136
              mov     r11            , qword [rsp+968]; load->v135
              add     r10            , r11            
              mov     qword [rsp+976], r10            ; save->v136
              mov     r11            , qword [rsp+976]; translate->qword [v136]
              mov     r10            , qword [r11]    
              mov     qword [rsp+984], r10            ; save->v137
              mov     r10            , qword [rsp+976]; translate->qword [v136]
              mov     r11            , qword [rsp+960]; load->v134
              mov     qword [r10]    , r11            ; assign->heap[x]
              mov     r10            , [_data_bss_heap]
              mov     qword [rsp+992], r10            ; save->v138
              mov     r10            , qword [rsp+768]; load->v110; null
              mov     qword [rsp+1000], r10            ; save->v139; load->v139
              sal     r10            , 3              ; from imul              mov     qword [rsp+1000], r10            ; save->v139; load->v139
              add     r10            , 8              
              mov     qword [rsp+1000], r10            ; save->v139; load->v139
              mov     r11            , qword [rsp+992]; load->v138
              add     r10            , r11            
              mov     qword [rsp+1000], r10            ; save->v139
              mov     r11            , qword [rsp+1000]; translate->qword [v139]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1008], r10            ; save->v140
              mov     r10            , qword [rsp+1000]; translate->qword [v139]
              mov     r11            , qword [rsp+176]; load->v23
              mov     qword [r10]    , r11            ; assign->heap[y]
              mov     r10            , qword [rsp+720]; load->v98; assign->tmp
              mov     qword [rsp+176], r10            ; save->v23
              mov     r10            , qword [rsp+768]; load->v110; assign->x
              mov     qword [rsp+720], r10            ; save->v98
              mov     r10            , qword [rsp+176]; load->v23; assign->y
              mov     qword [rsp+768], r10            ; save->v110
_text__heapsort_for3_continue:
              mov     qword [rsp+1016], 1              ; null; save->v141
              mov     qword [rsp+1032], rcx            ; null; save->v143
              mov     r10            , qword [rsp+720]; load->v98; null
              mov     qword [rsp+1024], r10            ; save->v142
              mov     rcx            , qword [rsp+1016]; load->v141; null
              mov     r10            , qword [rsp+1024]; load->v142
              and     r10            , -1             
              mov     qword [rsp+1024], r10            ; save->v142; load->v142
              sal     r10d           , cl             
              mov     qword [rsp+1024], r10            ; save->v142
              mov     rcx            , qword [rsp+1032]; load->v143; null
              mov     r10            , qword [rsp+1024]; load->v142
              mov     r11            , qword [rsp+544]; load->v76
              cmp     r10d           , r11d           
              mov     qword [rsp+1024], r10            ; save->v142
              jle     _text__heapsort_for3_start                 
;----------------------------------]
;[----------------------------------
_text__heapsort_for3_end:
_text__heapsort_for2_continue:
              mov     r10            , qword [rsp+168]; load->v22; null
              mov     qword [rsp+1040], r10            ; save->v144
              mov     qword [rsp+1048], 1              ; null; save->v145
              mov     r10            , qword [rsp+168]; load->v22; null
              mov     qword [rsp+1056], r10            ; save->v146; load->v146
              mov     r11            , qword [rsp+1048]; load->v145
              add     r10            , r11            
              mov     qword [rsp+1056], r10            ; save->v146; load->v146; assign->i
              mov     qword [rsp+168], r10            ; save->v22
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+1064], r10            ; save->v147
              mov     r10            , qword [rsp+168]; load->v22
              mov     r11            , qword [rsp+1064]; load->v147
              cmp     r10d           , r11d           
              mov     qword [rsp+168], r10            ; save->v22
              jle     _text__heapsort_for2_start                 
;----------------------------------]
;[----------------------------------
_text__heapsort_for2_end:
_text__heapsort_ret0:
              mov     rax            , qword [rsp+160]; load->v21; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 1080           
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 344            
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
_text__main_call0:
              call    _text__getInt                   
              mov     rbp            , rax            ; null; save->v20
              mov     [_data_bss_n]  , rbp            ; load->v20; null
_text__main_call1:
              call    _text__getInt                   
              mov     rbp            , rax            ; null; save->v21
              mov     rbx            , rbp            ; load->v21; init->k; save->v22
_text__main_for0_init:
              mov     r12            , 1              ; null; save->v24
              mov     rbp            , r12            ; load->v24; assign->i; save->v23
              mov     r13            , [_data_bss_n]  ; null; save->v25
              mov     r10            , rbp            ; load->v23
              mov     r11            , r13            ; load->v25
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v23
              mov     r10            , r14            ; load->v26
              setle   r10b                            
              mov     r14            , r10            ; save->v26; load->v26
              and     r10            , 255            
              mov     r14            , r10            ; save->v26
_text__main_for0_init_check:
              mov     r10            , r14            ; load->v26
              cmp     r10b           , 0              
              mov     r14            , r10            ; save->v26
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
              mov     r15            , [_data_bss_a]  ; null; save->v27
              mov     qword [rsp+160], rbp            ; load->v23; null; save->v28
              mov     r10            , qword [rsp+160]; load->v28
              sal     r10            , 3              ; from imul              mov     qword [rsp+160], r10            ; save->v28; load->v28
              add     r10            , 8              
              mov     qword [rsp+160], r10            ; save->v28; load->v28
              mov     r11            , r15            ; load->v27
              add     r10            , r11            
              mov     qword [rsp+160], r10            ; save->v28
              mov     r11            , qword [rsp+160]; translate->qword [v28]
              mov     r10            , qword [r11]    
              mov     qword [rsp+168], r10            ; save->v29
              mov     r10            , qword [rsp+160]; translate->qword [v28]
              mov     qword [r10]    , rbp            ; load->v23; assign->a[i]
_text__main_if0_init:
_text__main_if0_check:
              mov     r10            , rbp            ; load->v23
              mov     r11            , rbx            ; load->v22
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v23
              jg      _text__main_if0_else                 
;----------------------------------]
;[----------------------------------
_text__main_if0_start:
              mov     qword [rsp+176], 1              ; null; save->v30
              mov     qword [rsp+184], rbx            ; load->v22; null; save->v31
              mov     r10            , qword [rsp+184]; load->v31
              mov     r11            , qword [rsp+176]; load->v30
              add     r10            , r11            
              mov     qword [rsp+184], r10            ; save->v31; load->v31; null
              mov     qword [rsp+192], r10            ; save->v32; load->v32
              mov     r11            , rbp            ; load->v23
              sub     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v32
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+200], r10            ; save->v33
              mov     qword [rsp+208], rbp            ; load->v23; null; save->v34
              mov     r10            , qword [rsp+208]; load->v34
              sal     r10            , 3              ; from imul              mov     qword [rsp+208], r10            ; save->v34; load->v34
              add     r10            , 8              
              mov     qword [rsp+208], r10            ; save->v34; load->v34
              mov     r11            , qword [rsp+200]; load->v33
              add     r10            , r11            
              mov     qword [rsp+208], r10            ; save->v34
              mov     r11            , qword [rsp+208]; translate->qword [v34]
              mov     r10            , qword [r11]    
              mov     qword [rsp+216], r10            ; save->v35
              mov     r10            , qword [rsp+208]; translate->qword [v34]
              mov     r11            , qword [rsp+192]; load->v32
              mov     qword [r10]    , r11            ; assign->a[i]
              jmp     _text__main_if0_end                 
;----------------------------------]
;[----------------------------------
_text__main_if0_else:
_text__main_if0_end:
              mov     r10            , [_data_bss_a]  
              mov     qword [rsp+224], r10            ; save->v36
              mov     qword [rsp+232], rbp            ; load->v23; null; save->v37
              mov     r10            , qword [rsp+232]; load->v37
              sal     r10            , 3              ; from imul              mov     qword [rsp+232], r10            ; save->v37; load->v37
              add     r10            , 8              
              mov     qword [rsp+232], r10            ; save->v37; load->v37
              mov     r11            , qword [rsp+224]; load->v36
              add     r10            , r11            
              mov     qword [rsp+232], r10            ; save->v37
              mov     r11            , qword [rsp+232]; translate->qword [v37]
              mov     r10            , qword [r11]    
              mov     qword [rsp+240], r10            ; save->v38
              mov     r10            , [_data_bss_bak]
              mov     qword [rsp+248], r10            ; save->v39
              mov     qword [rsp+256], rbp            ; load->v23; null; save->v40
              mov     r10            , qword [rsp+256]; load->v40
              sal     r10            , 3              ; from imul              mov     qword [rsp+256], r10            ; save->v40; load->v40
              add     r10            , 8              
              mov     qword [rsp+256], r10            ; save->v40; load->v40
              mov     r11            , qword [rsp+248]; load->v39
              add     r10            , r11            
              mov     qword [rsp+256], r10            ; save->v40
              mov     r11            , qword [rsp+256]; translate->qword [v40]
              mov     r10            , qword [r11]    
              mov     qword [rsp+264], r10            ; save->v41
              mov     r10            , qword [rsp+256]; translate->qword [v40]
              mov     r11            , qword [rsp+240]; load->v38
              mov     qword [r10]    , r11            ; assign->bak[i]
_text__main_for0_continue:
              mov     qword [rsp+272], rbp            ; load->v23; null; save->v42
              mov     qword [rsp+280], 1              ; null; save->v43
              mov     qword [rsp+288], rbp            ; load->v23; null; save->v44
              mov     r10            , qword [rsp+288]; load->v44
              mov     r11            , qword [rsp+280]; load->v43
              add     r10            , r11            
              mov     qword [rsp+288], r10            ; save->v44
              mov     rbp            , qword [rsp+288]; load->v44; assign->i; save->v23
              mov     r10            , [_data_bss_n]  
              mov     qword [rsp+296], r10            ; save->v45
              mov     r10            , rbp            ; load->v23
              mov     r11            , qword [rsp+296]; load->v45
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v23
              jle     _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
              mov     rbp            , 1              ; null; save->v46
              mov     rbx            , [_data_bss_n]  ; null; save->v47
              mov     r12            , 1              ; null; save->v48
              mov     r13            , rbx            ; load->v47; null; save->v49
              mov     r10            , r13            ; load->v49
              mov     r11            , r12            ; load->v48
              add     r10            , r11            
              mov     r13            , r10            ; save->v49
_text__main_call2:
              mov     rdi            , rbp            ; load->v46; null
              mov     rsi            , r13            ; load->v49; null
              call    _text__quicksort                 
              mov     rbp            , rax            ; null; save->v50
              mov     rbx            , rbp            ; load->v50; init->ans1; save->v51
_text__main_call3:
              call    _text__restore                  
              mov     rbp            , rax            ; null; save->v52
_text__main_call4:
              call    _text__calc                     
              mov     rbp            , rax            ; null; save->v53
              mov     r12            , rbp            ; load->v53; init->ans2; save->v54
_text__main_call5:
              call    _text__restore                  
              mov     rbp            , 1              ; null; save->v55; null; save->v56
              mov     r13            , [_data_bss_n]  ; null; save->v57
              mov     r14            , 1              ; null; save->v58
              mov     r15            , r13            ; load->v57; null; save->v59
              mov     r10            , r15            ; load->v59
              mov     r11            , r14            ; load->v58
              add     r10            , r11            
              mov     r15            , r10            ; save->v59
_text__main_call6:
              mov     rdi            , rbp            ; load->v56; null
              mov     rsi            , r15            ; load->v59; null
              call    _text__mergesort                 
              mov     rbp            , rax            ; null; save->v60
              mov     r13            , rbp            ; load->v60; init->ans3; save->v61
_text__main_call7:
              call    _text__restore                  
              mov     rbp            , rax            ; null; save->v62
_text__main_call8:
              call    _text__heapsort                 
              mov     rbp            , rax            ; null; save->v63
              mov     r14            , rbp            ; load->v63; init->ans4; save->v64
_text__main_call9:
              mov     rdi            , rbx            ; load->v51; null
              call    _text__toString                 
              mov     rbp            , rax            ; null; save->v65
_text__main_call10:
              mov     rdi            , rbp            ; load->v65; null
              call    _text__println                  
              mov     rbp            , rax            ; null; save->v66
_text__main_call11:
              mov     rdi            , r12            ; load->v54; null
              call    _text__toString                 
              mov     rbp            , rax            ; null; save->v67
_text__main_call12:
              mov     rdi            , rbp            ; load->v67; null
              call    _text__println                  
              mov     rbp            , rax            ; null; save->v68
_text__main_call13:
              mov     rdi            , r13            ; load->v61; null
              call    _text__toString                 
              mov     rbp            , rax            ; null; save->v69
_text__main_call14:
              mov     rdi            , rbp            ; load->v69; null
              call    _text__println                  
              mov     rbp            , rax            ; null; save->v70
_text__main_call15:
              mov     rdi            , r14            ; load->v64; null
              call    _text__toString                 
              mov     rbp            , rax            ; null; save->v71
_text__main_call16:
              mov     rdi            , rbp            ; load->v71; null
              call    _text__println                  
              mov     rbp            , rax            ; null; save->v72
              mov     qword [rsp+304], 1              ; null; save->v73
              mov     r10            , qword [rsp+304]; load->v73; null
              mov     qword [rsp+312], r10            ; save->v74; load->v74
              sal     r10            , 3              ; from imul              mov     qword [rsp+312], r10            ; save->v74; load->v74
              add     r10            , 8              
              mov     qword [rsp+312], r10            ; save->v74
              mov     rdi            , qword [rsp+312]; load->v74; null
              call    malloc                          
              mov     qword [rsp+320], rax            ; null; save->v75
              mov     r11            , qword [rsp+304]; load->v73
              mov     qword [rax]    , r11            
              mov     rdi            , qword [rsp+320]; load->v75; null
              call    _text_A_A                       
;----------------------------------]
;[----------------------------------
              mov     rbp            , qword [rsp+320]; load->v75; init->a; save->v76
_text__main_call17:
              mov     rdi            , rbp            ; load->v76; null
              call    _text_A_Optimizer                 
              mov     qword [rsp+328], rax            ; null; save->v77
              mov     rbp            , 0              ; null; save->v78
_text__main_ret0:
              mov     rax            , rbp            ; load->v78; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 344            
              ret                                     
;----------------------------------]
                                                      
