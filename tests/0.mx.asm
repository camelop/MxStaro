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
_data_s3:
              db      0                               
_data_s1:
              db      `%s\n`                          
              db      0                               
_data_s2:
              db      ` !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_\`abcdefghijklmnopqrstuvwxyz{|}~`                 
              db      0                               
_data_s4:
              db      `nChunk > MAXCHUNK!`                 
              db      0                               
_data_s0:
              db      `%s`                            
              db      0                               
_data_s5:
              db      `Invalid input`                 
              db      0                               
_data_s6:
              db      `Not Found!`                    
              db      0                               

              section .bss                            
_data_bss_asciiTable:
              resb    8                               
_data_bss_MAXCHUNK:
              resb    8                               
_data_bss_MAXLENGTH:
              resb    8                               
_data_bss_chunks:
              resb    8                               
_data_bss_inputBuffer:
              resb    8                               
_data_bss_outputBuffer:
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
              sub     rsp            , 232            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbx            , _data_s2       ; load->v6; null; save->v6
              mov     [_data_bss_asciiTable], rbx            ; load->v6; null
              mov     rbx            , 100            ; load->v7; null; save->v7
              mov     [_data_bss_MAXCHUNK], rbx            ; load->v7; null
              mov     r10            , rbx            ; load->v8
              mov     rbx            , [_data_bss_MAXCHUNK]; null; save->v8
              mov     r12            , 1              ; load->v9; null; save->v9
              mov     r10            , r13            ; load->v10
              mov     r13            , rbx            ; load->v8; null; save->v10
              mov     r10            , r13            ; load->v10
              mov     r11            , r12            ; load->v9
              sub     r10            , r11            
              mov     r13            , r10            ; save->v10
              mov     rbx            , 64             ; load->v11; null; save->v11
              mov     r10            , r12            ; load->v12
              mov     r12            , r13            ; load->v10; null; save->v12
              mov     r10            , r12            ; load->v12
              mov     r11            , rbx            ; load->v11
              imul    r10            , r11            
              mov     r12            , r10            ; save->v12; load->v12
              and     r10            , -1             
              mov     r12            , r10            ; save->v12
              mov     rbx            , 16             ; load->v13; null; save->v13
              mov     r10            , r13            ; load->v14
              mov     r13            , r12            ; load->v12; null; save->v14
              mov     r10            , r13            ; load->v14
              mov     r11            , rbx            ; load->v13
              sub     r10            , r11            
              mov     r13            , r10            ; save->v14
              mov     [_data_bss_MAXLENGTH], r13            ; load->v14; null
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , [_data_bss_MAXCHUNK]
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , qword [rsp+120]; load->v15; null
              mov     qword [rsp+128], r10            ; save->v16; load->v16
              imul    r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16; load->v16
              add     r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16
              mov     rdi            , qword [rsp+128]; load->v16; null
              call    malloc                          
              mov     qword [rsp+136], rax            ; load->v17; null; save->v17
              mov     r11            , qword [rsp+120]; load->v15
              mov     qword [rax]    , r11            
              mov     r10            , rbx            ; load->v18
              mov     rbx            , qword [rsp+120]; load->v15; null; save->v18
              mov     r10            , r12            ; load->v19
              mov     r12            , qword [rsp+136]; load->v17; null; save->v19
              mov     r10            , r12            ; load->v19
              add     r10            , 8              
              mov     r12            , r10            ; save->v19
_datainit_new0_expand_start:
              mov     qword [rsp+160], 80             ; load->v20; null; save->v20
              mov     r10            , qword [rsp+168]; load->v21
              mov     r10            , qword [rsp+160]; load->v20; null
              mov     qword [rsp+168], r10            ; save->v21; load->v21
              imul    r10            , 8              
              mov     qword [rsp+168], r10            ; save->v21; load->v21
              add     r10            , 8              
              mov     qword [rsp+168], r10            ; save->v21
              mov     rdi            , qword [rsp+168]; load->v21; null
              call    malloc                          
              mov     qword [rsp+176], rax            ; load->v22; null; save->v22
              mov     r11            , qword [rsp+160]; load->v20
              mov     qword [rax]    , r11            
              mov     r10            , r12            ; translate->qword [v19]
              mov     r11            , qword [rsp+176]; load->v22
              mov     qword [r10]    , r11            
              mov     r10            , r12            ; load->v19
              add     r10            , 8              
              mov     r12            , r10            ; save->v19
              mov     r10            , rbx            ; load->v18
              sub     r10            , 1              
              mov     rbx            , r10            ; save->v18; load->v18
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v18
              jne     _datainit_new0_expand_start                 
_datainit_new0_expand_end:
              mov     r11            , qword [rsp+136]; load->v17
              mov     [_data_bss_chunks], r11            
              mov     r10            , qword [rsp+184]; load->v23
              mov     r10            , [_data_bss_MAXLENGTH]
              mov     qword [rsp+184], r10            ; save->v23
              mov     r10            , qword [rsp+192]; load->v24
              mov     r10            , qword [rsp+184]; load->v23; null
              mov     qword [rsp+192], r10            ; save->v24; load->v24
              imul    r10            , 8              
              mov     qword [rsp+192], r10            ; save->v24; load->v24
              add     r10            , 8              
              mov     qword [rsp+192], r10            ; save->v24
              mov     rdi            , qword [rsp+192]; load->v24; null
              call    malloc                          
              mov     qword [rsp+200], rax            ; load->v25; null; save->v25
              mov     r11            , qword [rsp+184]; load->v23
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+200]; load->v25
              mov     [_data_bss_inputBuffer], r11            
              mov     qword [rsp+208], 5              ; load->v26; null; save->v26
              mov     r10            , qword [rsp+216]; load->v27
              mov     r10            , qword [rsp+208]; load->v26; null
              mov     qword [rsp+216], r10            ; save->v27; load->v27
              imul    r10            , 8              
              mov     qword [rsp+216], r10            ; save->v27; load->v27
              add     r10            , 8              
              mov     qword [rsp+216], r10            ; save->v27
              mov     rdi            , qword [rsp+216]; load->v27; null
              call    malloc                          
              mov     qword [rsp+224], rax            ; load->v28; null; save->v28
              mov     r11            , qword [rsp+208]; load->v26
              mov     qword [rax]    , r11            
              mov     r11            , qword [rsp+224]; load->v28
              mov     [_data_bss_outputBuffer], r11            
_datainit_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 232            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__hex2int ] ---
;[----------------------------------
_text__hex2int:
              sub     rsp            , 440            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbx            , rdi            ; load->v6; null; save->v6
              mov     r12            , 0              ; load->v8; null; save->v8
              mov     r10            , r13            ; load->v9
              mov     r13            , r12            ; load->v8; init->result; save->v9
_text__hex2int_for0_init:
              mov     r14            , 0              ; load->v10; null; save->v10
              mov     r10            , r12            ; load->v7
              mov     r12            , r14            ; load->v10; assign->i; save->v7
_text__hex2int_call0:
              mov     rdi            , rbx            ; load->v6; null
              call    _text_built_in_string_length                 
              mov     qword [rsp+88] , rax            ; load->v11; null; save->v11
              mov     r10            , r12            ; load->v7
              mov     r11            , qword [rsp+88] ; load->v11
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , r15            ; load->v12
              setl    r10b                            
              mov     r15            , r10            ; save->v12; load->v12
              and     r10            , 255            
              mov     r15            , r10            ; save->v12
_text__hex2int_for0_init_check:
              mov     r10            , r15            ; load->v12
              cmp     r10b           , 0              
              mov     r15            , r10            ; save->v12
              je      _text__hex2int_for0_end                 
;----------------------------------]
;[----------------------------------
_text__hex2int_for0_start:
_text__hex2int_call1:
              mov     rdi            , rbx            ; load->v6; null
              mov     rsi            , r12            ; load->v7; null
              call    _text_built_in_string_ord                 
              mov     qword [rsp+104], rax            ; load->v13; null; save->v13
              mov     r10            , qword [rsp+112]; load->v14
              mov     r10            , qword [rsp+104]; load->v13; init->digit
              mov     qword [rsp+112], r10            ; save->v14
_text__hex2int_if0_init:
_text__hex2int_and0_lvalue:
              mov     qword [rsp+120], 0              ; load->v15; null; save->v15
              mov     qword [rsp+128], 48             ; load->v16; null; save->v16
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+128]; load->v16
              cmp     r10d           , r11d           
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+136]; load->v17
              setge   r10b                            
              mov     qword [rsp+136], r10            ; save->v17; load->v17
              and     r10            , 255            
              mov     qword [rsp+136], r10            ; save->v17; load->v17
              cmp     r10            , 0              
              mov     qword [rsp+136], r10            ; save->v17
              je      _text__hex2int_and0_end                 
;----------------------------------]
;[----------------------------------
_text__hex2int_and0_rvalue:
              mov     qword [rsp+144], 57             ; load->v18; null; save->v18
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+144]; load->v18
              cmp     r10d           , r11d           
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+152]; load->v19
              setle   r10b                            
              mov     qword [rsp+152], r10            ; save->v19; load->v19
              and     r10            , 255            
              mov     qword [rsp+152], r10            ; save->v19; load->v19
              cmp     r10            , 0              
              mov     qword [rsp+152], r10            ; save->v19
              je      _text__hex2int_and0_end                 
              mov     qword [rsp+120], 255            ; load->v15; null; save->v15
_text__hex2int_and0_end:
_text__hex2int_if0_check:
              mov     r10            , qword [rsp+120]; load->v15
              cmp     r10b           , 0              
              mov     qword [rsp+120], r10            ; save->v15
              je      _text__hex2int_if0_else                 
;----------------------------------]
;[----------------------------------
_text__hex2int_if0_start:
              mov     qword [rsp+160], 16             ; load->v20; null; save->v20
              mov     r10            , qword [rsp+168]; load->v21
              mov     qword [rsp+168], r13            ; load->v9; null; save->v21
              mov     r10            , qword [rsp+168]; load->v21
              mov     r11            , qword [rsp+160]; load->v20
              imul    r10            , r11            
              mov     qword [rsp+168], r10            ; save->v21; load->v21
              and     r10            , -1             
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+176]; load->v22
              mov     r10            , qword [rsp+168]; load->v21; null
              mov     qword [rsp+176], r10            ; save->v22; load->v22
              mov     r11            , qword [rsp+112]; load->v14
              add     r10            , r11            
              mov     qword [rsp+176], r10            ; save->v22
              mov     qword [rsp+184], 48             ; load->v23; null; save->v23
              mov     r10            , qword [rsp+192]; load->v24
              mov     r10            , qword [rsp+176]; load->v22; null
              mov     qword [rsp+192], r10            ; save->v24; load->v24
              mov     r11            , qword [rsp+184]; load->v23
              sub     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , r13            ; load->v9
              mov     r13            , qword [rsp+192]; load->v24; assign->result; save->v9
              jmp     _text__hex2int_if0_end                 
;----------------------------------]
;[----------------------------------
_text__hex2int_if0_else:
_text__hex2int_if1_init:
_text__hex2int_and1_lvalue:
              mov     qword [rsp+200], 0              ; load->v25; null; save->v25
              mov     qword [rsp+208], 65             ; load->v26; null; save->v26
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+208]; load->v26
              cmp     r10d           , r11d           
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+216]; load->v27
              setge   r10b                            
              mov     qword [rsp+216], r10            ; save->v27; load->v27
              and     r10            , 255            
              mov     qword [rsp+216], r10            ; save->v27; load->v27
              cmp     r10            , 0              
              mov     qword [rsp+216], r10            ; save->v27
              je      _text__hex2int_and1_end                 
;----------------------------------]
;[----------------------------------
_text__hex2int_and1_rvalue:
              mov     qword [rsp+224], 70             ; load->v28; null; save->v28
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+224]; load->v28
              cmp     r10d           , r11d           
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+232]; load->v29
              setle   r10b                            
              mov     qword [rsp+232], r10            ; save->v29; load->v29
              and     r10            , 255            
              mov     qword [rsp+232], r10            ; save->v29; load->v29
              cmp     r10            , 0              
              mov     qword [rsp+232], r10            ; save->v29
              je      _text__hex2int_and1_end                 
              mov     qword [rsp+200], 255            ; load->v25; null; save->v25
_text__hex2int_and1_end:
_text__hex2int_if1_check:
              mov     r10            , qword [rsp+200]; load->v25
              cmp     r10b           , 0              
              mov     qword [rsp+200], r10            ; save->v25
              je      _text__hex2int_if1_else                 
;----------------------------------]
;[----------------------------------
_text__hex2int_if1_start:
              mov     qword [rsp+240], 16             ; load->v30; null; save->v30
              mov     r10            , qword [rsp+248]; load->v31
              mov     qword [rsp+248], r13            ; load->v9; null; save->v31
              mov     r10            , qword [rsp+248]; load->v31
              mov     r11            , qword [rsp+240]; load->v30
              imul    r10            , r11            
              mov     qword [rsp+248], r10            ; save->v31; load->v31
              and     r10            , -1             
              mov     qword [rsp+248], r10            ; save->v31
              mov     r10            , qword [rsp+256]; load->v32
              mov     r10            , qword [rsp+248]; load->v31; null
              mov     qword [rsp+256], r10            ; save->v32; load->v32
              mov     r11            , qword [rsp+112]; load->v14
              add     r10            , r11            
              mov     qword [rsp+256], r10            ; save->v32
              mov     qword [rsp+264], 65             ; load->v33; null; save->v33
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , qword [rsp+256]; load->v32; null
              mov     qword [rsp+272], r10            ; save->v34; load->v34
              mov     r11            , qword [rsp+264]; load->v33
              sub     r10            , r11            
              mov     qword [rsp+272], r10            ; save->v34
              mov     qword [rsp+280], 10             ; load->v35; null; save->v35
              mov     r10            , qword [rsp+288]; load->v36
              mov     r10            , qword [rsp+272]; load->v34; null
              mov     qword [rsp+288], r10            ; save->v36; load->v36
              mov     r11            , qword [rsp+280]; load->v35
              add     r10            , r11            
              mov     qword [rsp+288], r10            ; save->v36
              mov     r10            , r13            ; load->v9
              mov     r13            , qword [rsp+288]; load->v36; assign->result; save->v9
              jmp     _text__hex2int_if1_end                 
;----------------------------------]
;[----------------------------------
_text__hex2int_if1_else:
_text__hex2int_if2_init:
_text__hex2int_and2_lvalue:
              mov     qword [rsp+296], 0              ; load->v37; null; save->v37
              mov     qword [rsp+304], 97             ; load->v38; null; save->v38
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+304]; load->v38
              cmp     r10d           , r11d           
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+312]; load->v39
              setge   r10b                            
              mov     qword [rsp+312], r10            ; save->v39; load->v39
              and     r10            , 255            
              mov     qword [rsp+312], r10            ; save->v39; load->v39
              cmp     r10            , 0              
              mov     qword [rsp+312], r10            ; save->v39
              je      _text__hex2int_and2_end                 
;----------------------------------]
;[----------------------------------
_text__hex2int_and2_rvalue:
              mov     qword [rsp+320], 102            ; load->v40; null; save->v40
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+320]; load->v40
              cmp     r10d           , r11d           
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+328]; load->v41
              setle   r10b                            
              mov     qword [rsp+328], r10            ; save->v41; load->v41
              and     r10            , 255            
              mov     qword [rsp+328], r10            ; save->v41; load->v41
              cmp     r10            , 0              
              mov     qword [rsp+328], r10            ; save->v41
              je      _text__hex2int_and2_end                 
              mov     qword [rsp+296], 255            ; load->v37; null; save->v37
_text__hex2int_and2_end:
_text__hex2int_if2_check:
              mov     r10            , qword [rsp+296]; load->v37
              cmp     r10b           , 0              
              mov     qword [rsp+296], r10            ; save->v37
              je      _text__hex2int_if2_else                 
;----------------------------------]
;[----------------------------------
_text__hex2int_if2_start:
              mov     qword [rsp+336], 16             ; load->v42; null; save->v42
              mov     r10            , qword [rsp+344]; load->v43
              mov     qword [rsp+344], r13            ; load->v9; null; save->v43
              mov     r10            , qword [rsp+344]; load->v43
              mov     r11            , qword [rsp+336]; load->v42
              imul    r10            , r11            
              mov     qword [rsp+344], r10            ; save->v43; load->v43
              and     r10            , -1             
              mov     qword [rsp+344], r10            ; save->v43
              mov     r10            , qword [rsp+352]; load->v44
              mov     r10            , qword [rsp+344]; load->v43; null
              mov     qword [rsp+352], r10            ; save->v44; load->v44
              mov     r11            , qword [rsp+112]; load->v14
              add     r10            , r11            
              mov     qword [rsp+352], r10            ; save->v44
              mov     qword [rsp+360], 97             ; load->v45; null; save->v45
              mov     r10            , qword [rsp+368]; load->v46
              mov     r10            , qword [rsp+352]; load->v44; null
              mov     qword [rsp+368], r10            ; save->v46; load->v46
              mov     r11            , qword [rsp+360]; load->v45
              sub     r10            , r11            
              mov     qword [rsp+368], r10            ; save->v46
              mov     qword [rsp+376], 10             ; load->v47; null; save->v47
              mov     r10            , qword [rsp+384]; load->v48
              mov     r10            , qword [rsp+368]; load->v46; null
              mov     qword [rsp+384], r10            ; save->v48; load->v48
              mov     r11            , qword [rsp+376]; load->v47
              add     r10            , r11            
              mov     qword [rsp+384], r10            ; save->v48
              mov     r10            , r13            ; load->v9
              mov     r13            , qword [rsp+384]; load->v48; assign->result; save->v9
              jmp     _text__hex2int_if2_end                 
;----------------------------------]
;[----------------------------------
_text__hex2int_if2_else:
              mov     qword [rsp+392], 0              ; load->v49; null; save->v49
_text__hex2int_ret0:
              mov     rax            , qword [rsp+392]; load->v49; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 440            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__hex2int_if2_end:
_text__hex2int_if1_end:
_text__hex2int_if0_end:
_text__hex2int_for0_continue:
              mov     r10            , qword [rsp+400]; load->v50
              mov     qword [rsp+400], r12            ; load->v7; null; save->v50
              mov     qword [rsp+408], 1              ; load->v51; null; save->v51
              mov     r10            , qword [rsp+416]; load->v52
              mov     qword [rsp+416], r12            ; load->v7; null; save->v52
              mov     r10            , qword [rsp+416]; load->v52
              mov     r11            , qword [rsp+408]; load->v51
              add     r10            , r11            
              mov     qword [rsp+416], r10            ; save->v52
              mov     r10            , r12            ; load->v7
              mov     r12            , qword [rsp+416]; load->v52; assign->i; save->v7
_text__hex2int_call2:
              mov     rdi            , rbx            ; load->v6; null
              call    _text_built_in_string_length                 
              mov     qword [rsp+424], rax            ; load->v53; null; save->v53
              mov     r10            , r12            ; load->v7
              mov     r11            , qword [rsp+424]; load->v53
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , qword [rsp+432]; load->v54
              setl    r10b                            
              mov     qword [rsp+432], r10            ; save->v54; load->v54
              and     r10            , 255            
              mov     qword [rsp+432], r10            ; save->v54; load->v54
              cmp     r10b           , 0              
              mov     qword [rsp+432], r10            ; save->v54
              jne     _text__hex2int_for0_start                 
;----------------------------------]
;[----------------------------------
_text__hex2int_for0_end:
_text__hex2int_ret1:
              mov     rax            , r13            ; load->v9; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 440            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__hex2int_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 440            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__int2chr ] ---
;[----------------------------------
_text__int2chr:
              sub     rsp            , 152            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbx            , rdi            ; load->v6; null; save->v6
_text__int2chr_if0_init:
_text__int2chr_and0_lvalue:
              mov     r12            , 0              ; load->v7; null; save->v7
              mov     r13            , 32             ; load->v8; null; save->v8
              mov     r10            , rbx            ; load->v6
              mov     r11            , r13            ; load->v8
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , r13            ; load->v9
              setge   r10b                            
              mov     r13            , r10            ; save->v9; load->v9
              and     r10            , 255            
              mov     r13            , r10            ; save->v9; load->v9
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v9
              je      _text__int2chr_and0_end                 
;----------------------------------]
;[----------------------------------
_text__int2chr_and0_rvalue:
              mov     r13            , 126            ; load->v10; null; save->v10
              mov     r10            , rbx            ; load->v6
              mov     r11            , r13            ; load->v10
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , r13            ; load->v11
              setle   r10b                            
              mov     r13            , r10            ; save->v11; load->v11
              and     r10            , 255            
              mov     r13            , r10            ; save->v11; load->v11
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v11
              je      _text__int2chr_and0_end                 
              mov     r12            , 255            ; load->v7; null; save->v7
_text__int2chr_and0_end:
_text__int2chr_if0_check:
              mov     r10            , r12            ; load->v7
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v7
              je      _text__int2chr_if0_else                 
;----------------------------------]
;[----------------------------------
_text__int2chr_if0_start:
              mov     r12            , 32             ; load->v12; null; save->v12
              mov     r10            , r13            ; load->v13
              mov     r13            , rbx            ; load->v6; null; save->v13
              mov     r10            , r13            ; load->v13
              mov     r11            , r12            ; load->v12
              sub     r10            , r11            
              mov     r13            , r10            ; save->v13
              mov     r12            , 32             ; load->v14; null; save->v14
              mov     r10            , r14            ; load->v15
              mov     r14            , rbx            ; load->v6; null; save->v15
              mov     r10            , r14            ; load->v15
              mov     r11            , r12            ; load->v14
              sub     r10            , r11            
              mov     r14            , r10            ; save->v15
              mov     r10            , rbx            ; load->v16
              mov     rbx            , [_data_bss_asciiTable]; null; save->v16
_text__int2chr_call0:
              mov     rdi            , rbx            ; load->v16; null
              mov     rsi            , r13            ; load->v13; null
              mov     rdx            , r14            ; load->v15; null
              call    _text_built_in_string_substring                 
              mov     qword [rsp+136], rax            ; load->v17; null; save->v17
_text__int2chr_ret0:
              mov     rax            , qword [rsp+136]; load->v17; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 152            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__int2chr_if0_end                 
;----------------------------------]
;[----------------------------------
_text__int2chr_if0_else:
_text__int2chr_if0_end:
              mov     rbx            , _data_s3       ; load->v18; null; save->v18
_text__int2chr_ret1:
              mov     rax            , rbx            ; load->v18; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 152            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__int2chr_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 152            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__toStringHex ] ---
;[----------------------------------
_text__toStringHex:
              sub     rsp            , 312            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbx            , rdi            ; load->v6; null; save->v6
              mov     r12            , _data_s3       ; load->v7; null; save->v7
              mov     r10            , qword [rsp+64] ; load->v8
              mov     qword [rsp+64] , r12            ; load->v7; init->ret; save->v8
_text__toStringHex_for0_init:
              mov     r13            , 28             ; load->v10; null; save->v10
              mov     r10            , r12            ; load->v9
              mov     r12            , r13            ; load->v10; assign->i; save->v9
              mov     r14            , 0              ; load->v11; null; save->v11
              mov     r10            , r12            ; load->v9
              mov     r11            , r14            ; load->v11
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v9
              mov     r10            , r15            ; load->v12
              setge   r10b                            
              mov     r15            , r10            ; save->v12; load->v12
              and     r10            , 255            
              mov     r15            , r10            ; save->v12
_text__toStringHex_for0_init_check:
              mov     r10            , r15            ; load->v12
              cmp     r10b           , 0              
              mov     r15            , r10            ; save->v12
              je      _text__toStringHex_for0_end                 
;----------------------------------]
;[----------------------------------
_text__toStringHex_for0_start:
              mov     qword [rsp+112], rcx            ; load->v14; null; save->v14
              mov     r10            , qword [rsp+104]; load->v13
              mov     qword [rsp+104], rbx            ; load->v6; null; save->v13
              mov     rcx            , r12            ; load->v9; null
              mov     r10            , qword [rsp+104]; load->v13
              and     r10            , -1             
              mov     qword [rsp+104], r10            ; save->v13; load->v13
              sar     r10d           , cl             
              mov     qword [rsp+104], r10            ; save->v13
              mov     rcx            , qword [rsp+112]; load->v14; null
              mov     qword [rsp+120], 15             ; load->v15; null; save->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , qword [rsp+104]; load->v13; null
              mov     qword [rsp+128], r10            ; save->v16; load->v16
              mov     r11            , qword [rsp+120]; load->v15
              and     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , qword [rsp+128]; load->v16; init->digit
              mov     qword [rsp+136], r10            ; save->v17
_text__toStringHex_if0_init:
              mov     qword [rsp+144], 10             ; load->v18; null; save->v18
              mov     r10            , qword [rsp+136]; load->v17
              mov     r11            , qword [rsp+144]; load->v18
              cmp     r10d           , r11d           
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+152]; load->v19
              setl    r10b                            
              mov     qword [rsp+152], r10            ; save->v19; load->v19
              and     r10            , 255            
              mov     qword [rsp+152], r10            ; save->v19
_text__toStringHex_if0_check:
              mov     r10            , qword [rsp+152]; load->v19
              cmp     r10b           , 0              
              mov     qword [rsp+152], r10            ; save->v19
              je      _text__toStringHex_if0_else                 
;----------------------------------]
;[----------------------------------
_text__toStringHex_if0_start:
              mov     qword [rsp+160], 48             ; load->v20; null; save->v20
              mov     r10            , qword [rsp+168]; load->v21
              mov     r10            , qword [rsp+160]; load->v20; null
              mov     qword [rsp+168], r10            ; save->v21; load->v21
              mov     r11            , qword [rsp+136]; load->v17
              add     r10            , r11            
              mov     qword [rsp+168], r10            ; save->v21
_text__toStringHex_call0:
              mov     rdi            , qword [rsp+168]; load->v21; null
              call    _text__int2chr                  
              mov     qword [rsp+176], rax            ; load->v22; null; save->v22
              mov     rdi            , qword [rsp+64] ; load->v8; null
              call    strlen                          
              mov     qword [rsp+184], rax            ; load->v23; null; save->v23
              mov     rdi            , qword [rsp+176]; load->v22; null
              call    strlen                          
              mov     qword [rsp+192], rax            ; load->v24; null; save->v24
              mov     r10            , qword [rsp+192]; load->v24
              mov     r11            , qword [rsp+184]; load->v23
              add     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v24; load->v24
              add     r10            , 1              
              mov     qword [rsp+192], r10            ; save->v24
              mov     rdi            , qword [rsp+192]; load->v24; null
              call    malloc                          
              mov     qword [rsp+200], rax            ; load->v25; null; save->v25
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+64] ; load->v8; null
              call    strcpy                          
              mov     rdi            , qword [rsp+200]; load->v25; null
              mov     r11            , qword [rsp+184]; load->v23
              add     rdi            , r11            
              mov     rsi            , qword [rsp+176]; load->v22; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , qword [rsp+200]; load->v25; assign->ret
              mov     qword [rsp+64] , r10            ; save->v8
              jmp     _text__toStringHex_if0_end                 
;----------------------------------]
;[----------------------------------
_text__toStringHex_if0_else:
              mov     qword [rsp+208], 65             ; load->v26; null; save->v26
              mov     r10            , qword [rsp+216]; load->v27
              mov     r10            , qword [rsp+208]; load->v26; null
              mov     qword [rsp+216], r10            ; save->v27; load->v27
              mov     r11            , qword [rsp+136]; load->v17
              add     r10            , r11            
              mov     qword [rsp+216], r10            ; save->v27
              mov     qword [rsp+224], 10             ; load->v28; null; save->v28
              mov     r10            , qword [rsp+232]; load->v29
              mov     r10            , qword [rsp+216]; load->v27; null
              mov     qword [rsp+232], r10            ; save->v29; load->v29
              mov     r11            , qword [rsp+224]; load->v28
              sub     r10            , r11            
              mov     qword [rsp+232], r10            ; save->v29
_text__toStringHex_call1:
              mov     rdi            , qword [rsp+232]; load->v29; null
              call    _text__int2chr                  
              mov     qword [rsp+240], rax            ; load->v30; null; save->v30
              mov     rdi            , qword [rsp+64] ; load->v8; null
              call    strlen                          
              mov     qword [rsp+248], rax            ; load->v31; null; save->v31
              mov     rdi            , qword [rsp+240]; load->v30; null
              call    strlen                          
              mov     qword [rsp+256], rax            ; load->v32; null; save->v32
              mov     r10            , qword [rsp+256]; load->v32
              mov     r11            , qword [rsp+248]; load->v31
              add     r10            , r11            
              mov     qword [rsp+256], r10            ; save->v32; load->v32
              add     r10            , 1              
              mov     qword [rsp+256], r10            ; save->v32
              mov     rdi            , qword [rsp+256]; load->v32; null
              call    malloc                          
              mov     qword [rsp+264], rax            ; load->v33; null; save->v33
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+64] ; load->v8; null
              call    strcpy                          
              mov     rdi            , qword [rsp+264]; load->v33; null
              mov     r11            , qword [rsp+248]; load->v31
              add     rdi            , r11            
              mov     rsi            , qword [rsp+240]; load->v30; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , qword [rsp+264]; load->v33; assign->ret
              mov     qword [rsp+64] , r10            ; save->v8
_text__toStringHex_if0_end:
_text__toStringHex_for0_continue:
              mov     qword [rsp+272], 4              ; load->v34; null; save->v34
              mov     r10            , qword [rsp+280]; load->v35
              mov     qword [rsp+280], r12            ; load->v9; null; save->v35
              mov     r10            , qword [rsp+280]; load->v35
              mov     r11            , qword [rsp+272]; load->v34
              sub     r10            , r11            
              mov     qword [rsp+280], r10            ; save->v35
              mov     r10            , r12            ; load->v9
              mov     r12            , qword [rsp+280]; load->v35; assign->i; save->v9
              mov     qword [rsp+288], 0              ; load->v36; null; save->v36
              mov     r10            , r12            ; load->v9
              mov     r11            , qword [rsp+288]; load->v36
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v9
              mov     r10            , qword [rsp+296]; load->v37
              setge   r10b                            
              mov     qword [rsp+296], r10            ; save->v37; load->v37
              and     r10            , 255            
              mov     qword [rsp+296], r10            ; save->v37; load->v37
              cmp     r10b           , 0              
              mov     qword [rsp+296], r10            ; save->v37
              jne     _text__toStringHex_for0_start                 
;----------------------------------]
;[----------------------------------
_text__toStringHex_for0_end:
_text__toStringHex_ret0:
              mov     rax            , qword [rsp+64] ; load->v8; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 312            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__toStringHex_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 312            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__rotate_left ] ---
;[----------------------------------
_text__rotate_left:
              sub     rsp            , 440            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbx            , rdi            ; load->v6; null; save->v6
              mov     r12            , rsi            ; load->v7; null; save->v7
_text__rotate_left_if0_init:
              mov     r13            , 1              ; load->v8; null; save->v8
              mov     r10            , r12            ; load->v7
              mov     r11            , r13            ; load->v8
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , r13            ; load->v9
              sete    r10b                            
              mov     r13            , r10            ; save->v9; load->v9
              and     r10            , 255            
              mov     r13            , r10            ; save->v9
_text__rotate_left_if0_check:
              mov     r10            , r13            ; load->v9
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v9
              je      _text__rotate_left_if0_else                 
;----------------------------------]
;[----------------------------------
_text__rotate_left_if0_start:
              mov     r13            , 2147483647     ; load->v10; null; save->v10
              mov     r10            , r14            ; load->v11
              mov     r14            , rbx            ; load->v6; null; save->v11
              mov     r10            , r14            ; load->v11
              mov     r11            , r13            ; load->v10
              and     r10            , r11            
              mov     r14            , r10            ; save->v11
              mov     r13            , 1              ; load->v12; null; save->v12
              mov     r15            , rcx            ; load->v14; null; save->v14
              mov     r10            , qword [rsp+104]; load->v13
              mov     qword [rsp+104], r14            ; load->v11; null; save->v13
              mov     rcx            , r13            ; load->v12; null
              mov     r10            , qword [rsp+104]; load->v13
              and     r10            , -1             
              mov     qword [rsp+104], r10            ; save->v13; load->v13
              sal     r10d           , cl             
              mov     qword [rsp+104], r10            ; save->v13
              mov     rcx            , r15            ; load->v14; null
              mov     r13            , 31             ; load->v15; null; save->v15
              mov     r14            , rcx            ; load->v17; null; save->v17
              mov     r10            , r15            ; load->v16
              mov     r15            , rbx            ; load->v6; null; save->v16
              mov     rcx            , r13            ; load->v15; null
              mov     r10            , r15            ; load->v16
              and     r10            , -1             
              mov     r15            , r10            ; save->v16; load->v16
              sar     r10d           , cl             
              mov     r15            , r10            ; save->v16
              mov     rcx            , r14            ; load->v17; null
              mov     r13            , 1              ; load->v18; null; save->v18
              mov     r10            , r14            ; load->v19
              mov     r14            , r15            ; load->v16; null; save->v19
              mov     r10            , r14            ; load->v19
              mov     r11            , r13            ; load->v18
              and     r10            , r11            
              mov     r14            , r10            ; save->v19
              mov     r10            , r13            ; load->v20
              mov     r13            , qword [rsp+104]; load->v13; null; save->v20
              mov     r10            , r13            ; load->v20
              mov     r11            , r14            ; load->v19
              or      r10            , r11            
              mov     r13            , r10            ; save->v20
_text__rotate_left_ret0:
              mov     rax            , r13            ; load->v20; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 440            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__rotate_left_if0_end                 
;----------------------------------]
;[----------------------------------
_text__rotate_left_if0_else:
_text__rotate_left_if0_end:
_text__rotate_left_if1_init:
              mov     r13            , 31             ; load->v21; null; save->v21
              mov     r10            , r12            ; load->v7
              mov     r11            , r13            ; load->v21
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , r13            ; load->v22
              sete    r10b                            
              mov     r13            , r10            ; save->v22; load->v22
              and     r10            , 255            
              mov     r13            , r10            ; save->v22
_text__rotate_left_if1_check:
              mov     r10            , r13            ; load->v22
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v22
              je      _text__rotate_left_if1_else                 
;----------------------------------]
;[----------------------------------
_text__rotate_left_if1_start:
              mov     r13            , 1              ; load->v23; null; save->v23
              mov     r10            , r14            ; load->v24
              mov     r14            , rbx            ; load->v6; null; save->v24
              mov     r10            , r14            ; load->v24
              mov     r11            , r13            ; load->v23
              and     r10            , r11            
              mov     r14            , r10            ; save->v24
              mov     r13            , 31             ; load->v25; null; save->v25
              mov     r15            , rcx            ; load->v27; null; save->v27
              mov     r10            , qword [rsp+208]; load->v26
              mov     qword [rsp+208], r14            ; load->v24; null; save->v26
              mov     rcx            , r13            ; load->v25; null
              mov     r10            , qword [rsp+208]; load->v26
              and     r10            , -1             
              mov     qword [rsp+208], r10            ; save->v26; load->v26
              sal     r10d           , cl             
              mov     qword [rsp+208], r10            ; save->v26
              mov     rcx            , r15            ; load->v27; null
              mov     r13            , 1              ; load->v28; null; save->v28
              mov     r14            , rcx            ; load->v30; null; save->v30
              mov     r10            , r15            ; load->v29
              mov     r15            , rbx            ; load->v6; null; save->v29
              mov     rcx            , r13            ; load->v28; null
              mov     r10            , r15            ; load->v29
              and     r10            , -1             
              mov     r15            , r10            ; save->v29; load->v29
              sar     r10d           , cl             
              mov     r15            , r10            ; save->v29
              mov     rcx            , r14            ; load->v30; null
              mov     r13            , 2147483647     ; load->v31; null; save->v31
              mov     r10            , r14            ; load->v32
              mov     r14            , r15            ; load->v29; null; save->v32
              mov     r10            , r14            ; load->v32
              mov     r11            , r13            ; load->v31
              and     r10            , r11            
              mov     r14            , r10            ; save->v32
              mov     r10            , r13            ; load->v33
              mov     r13            , qword [rsp+208]; load->v26; null; save->v33
              mov     r10            , r13            ; load->v33
              mov     r11            , r14            ; load->v32
              or      r10            , r11            
              mov     r13            , r10            ; save->v33
_text__rotate_left_ret1:
              mov     rax            , r13            ; load->v33; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 440            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__rotate_left_if1_end                 
;----------------------------------]
;[----------------------------------
_text__rotate_left_if1_else:
_text__rotate_left_if1_end:
              mov     r13            , 1              ; load->v34; null; save->v34
              mov     r14            , 32             ; load->v35; null; save->v35
              mov     r10            , r15            ; load->v36
              mov     r15            , r14            ; load->v35; null; save->v36
              mov     r10            , r15            ; load->v36
              mov     r11            , r12            ; load->v7
              sub     r10            , r11            
              mov     r15            , r10            ; save->v36
              mov     r14            , rcx            ; load->v38; null; save->v38
              mov     r10            , qword [rsp+296]; load->v37
              mov     qword [rsp+296], r13            ; load->v34; null; save->v37
              mov     rcx            , r15            ; load->v36; null
              mov     r10            , qword [rsp+296]; load->v37
              and     r10            , -1             
              mov     qword [rsp+296], r10            ; save->v37; load->v37
              sal     r10d           , cl             
              mov     qword [rsp+296], r10            ; save->v37
              mov     rcx            , r14            ; load->v38; null
              mov     r13            , 1              ; load->v39; null; save->v39
              mov     r10            , r14            ; load->v40
              mov     r14            , qword [rsp+296]; load->v37; null; save->v40
              mov     r10            , r14            ; load->v40
              mov     r11            , r13            ; load->v39
              sub     r10            , r11            
              mov     r14            , r10            ; save->v40
              mov     r10            , r13            ; load->v41
              mov     r13            , rbx            ; load->v6; null; save->v41
              mov     r10            , r13            ; load->v41
              mov     r11            , r14            ; load->v40
              and     r10            , r11            
              mov     r13            , r10            ; save->v41
              mov     r14            , rcx            ; load->v43; null; save->v43
              mov     r10            , r15            ; load->v42
              mov     r15            , r13            ; load->v41; null; save->v42
              mov     rcx            , r12            ; load->v7; null
              mov     r10            , r15            ; load->v42
              and     r10            , -1             
              mov     r15            , r10            ; save->v42; load->v42
              sal     r10d           , cl             
              mov     r15            , r10            ; save->v42
              mov     rcx            , r14            ; load->v43; null
              mov     r13            , 32             ; load->v44; null; save->v44
              mov     r10            , r14            ; load->v45
              mov     r14            , r13            ; load->v44; null; save->v45
              mov     r10            , r14            ; load->v45
              mov     r11            , r12            ; load->v7
              sub     r10            , r11            
              mov     r14            , r10            ; save->v45
              mov     r13            , rcx            ; load->v47; null; save->v47
              mov     r10            , qword [rsp+368]; load->v46
              mov     qword [rsp+368], rbx            ; load->v6; null; save->v46
              mov     rcx            , r14            ; load->v45; null
              mov     r10            , qword [rsp+368]; load->v46
              and     r10            , -1             
              mov     qword [rsp+368], r10            ; save->v46; load->v46
              sar     r10d           , cl             
              mov     qword [rsp+368], r10            ; save->v46
              mov     rcx            , r13            ; load->v47; null
              mov     rbx            , 1              ; load->v48; null; save->v48
              mov     r13            , rcx            ; load->v50; null; save->v50
              mov     r10            , r14            ; load->v49
              mov     r14            , rbx            ; load->v48; null; save->v49
              mov     rcx            , r12            ; load->v7; null
              mov     r10            , r14            ; load->v49
              and     r10            , -1             
              mov     r14            , r10            ; save->v49; load->v49
              sal     r10d           , cl             
              mov     r14            , r10            ; save->v49
              mov     rcx            , r13            ; load->v50; null
              mov     rbx            , 1              ; load->v51; null; save->v51
              mov     r10            , r12            ; load->v52
              mov     r12            , r14            ; load->v49; null; save->v52
              mov     r10            , r12            ; load->v52
              mov     r11            , rbx            ; load->v51
              sub     r10            , r11            
              mov     r12            , r10            ; save->v52
              mov     r10            , rbx            ; load->v53
              mov     rbx            , qword [rsp+368]; load->v46; null; save->v53
              mov     r10            , rbx            ; load->v53
              mov     r11            , r12            ; load->v52
              and     r10            , r11            
              mov     rbx            , r10            ; save->v53
              mov     r10            , r12            ; load->v54
              mov     r12            , r15            ; load->v42; null; save->v54
              mov     r10            , r12            ; load->v54
              mov     r11            , rbx            ; load->v53
              or      r10            , r11            
              mov     r12            , r10            ; save->v54
_text__rotate_left_ret2:
              mov     rax            , r12            ; load->v54; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 440            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__rotate_left_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 440            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__add ] ---
;[----------------------------------
_text__add:
              sub     rsp            , 312            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbx            , rdi            ; load->v6; null; save->v6
              mov     r12            , rsi            ; load->v7; null; save->v7
              mov     r13            , 65535          ; load->v8; null; save->v8
              mov     r10            , r14            ; load->v9
              mov     r14            , rbx            ; load->v6; null; save->v9
              mov     r10            , r14            ; load->v9
              mov     r11            , r13            ; load->v8
              and     r10            , r11            
              mov     r14            , r10            ; save->v9
              mov     r13            , 65535          ; load->v10; null; save->v10
              mov     r10            , r15            ; load->v11
              mov     r15            , r12            ; load->v7; null; save->v11
              mov     r10            , r15            ; load->v11
              mov     r11            , r13            ; load->v10
              and     r10            , r11            
              mov     r15            , r10            ; save->v11
              mov     r10            , r13            ; load->v12
              mov     r13            , r14            ; load->v9; null; save->v12
              mov     r10            , r13            ; load->v12
              mov     r11            , r15            ; load->v11
              add     r10            , r11            
              mov     r13            , r10            ; save->v12
              mov     r10            , r14            ; load->v13
              mov     r14            , r13            ; load->v12; init->low; save->v13
              mov     r13            , 16             ; load->v14; null; save->v14
              mov     r15            , rcx            ; load->v16; null; save->v16
              mov     r10            , qword [rsp+120]; load->v15
              mov     qword [rsp+120], rbx            ; load->v6; null; save->v15
              mov     rcx            , r13            ; load->v14; null
              mov     r10            , qword [rsp+120]; load->v15
              and     r10            , -1             
              mov     qword [rsp+120], r10            ; save->v15; load->v15
              sar     r10d           , cl             
              mov     qword [rsp+120], r10            ; save->v15
              mov     rcx            , r15            ; load->v16; null
              mov     rbx            , 65535          ; load->v17; null; save->v17
              mov     r10            , r13            ; load->v18
              mov     r13            , qword [rsp+120]; load->v15; null; save->v18
              mov     r10            , r13            ; load->v18
              mov     r11            , rbx            ; load->v17
              and     r10            , r11            
              mov     r13            , r10            ; save->v18
              mov     rbx            , 16             ; load->v19; null; save->v19
              mov     r15            , rcx            ; load->v21; null; save->v21
              mov     r10            , qword [rsp+160]; load->v20
              mov     qword [rsp+160], r12            ; load->v7; null; save->v20
              mov     rcx            , rbx            ; load->v19; null
              mov     r10            , qword [rsp+160]; load->v20
              and     r10            , -1             
              mov     qword [rsp+160], r10            ; save->v20; load->v20
              sar     r10d           , cl             
              mov     qword [rsp+160], r10            ; save->v20
              mov     rcx            , r15            ; load->v21; null
              mov     rbx            , 65535          ; load->v22; null; save->v22
              mov     r10            , r12            ; load->v23
              mov     r12            , qword [rsp+160]; load->v20; null; save->v23
              mov     r10            , r12            ; load->v23
              mov     r11            , rbx            ; load->v22
              and     r10            , r11            
              mov     r12            , r10            ; save->v23
              mov     r10            , rbx            ; load->v24
              mov     rbx            , r13            ; load->v18; null; save->v24
              mov     r10            , rbx            ; load->v24
              mov     r11            , r12            ; load->v23
              add     r10            , r11            
              mov     rbx            , r10            ; save->v24
              mov     r12            , 16             ; load->v25; null; save->v25
              mov     r13            , rcx            ; load->v27; null; save->v27
              mov     r10            , r15            ; load->v26
              mov     r15            , r14            ; load->v13; null; save->v26
              mov     rcx            , r12            ; load->v25; null
              mov     r10            , r15            ; load->v26
              and     r10            , -1             
              mov     r15            , r10            ; save->v26; load->v26
              sar     r10d           , cl             
              mov     r15            , r10            ; save->v26
              mov     rcx            , r13            ; load->v27; null
              mov     r10            , r12            ; load->v28
              mov     r12            , rbx            ; load->v24; null; save->v28
              mov     r10            , r12            ; load->v28
              mov     r11            , r15            ; load->v26
              add     r10            , r11            
              mov     r12            , r10            ; save->v28
              mov     rbx            , 65535          ; load->v29; null; save->v29
              mov     r10            , r13            ; load->v30
              mov     r13            , r12            ; load->v28; null; save->v30
              mov     r10            , r13            ; load->v30
              mov     r11            , rbx            ; load->v29
              and     r10            , r11            
              mov     r13            , r10            ; save->v30
              mov     r10            , rbx            ; load->v31
              mov     rbx            , r13            ; load->v30; init->high; save->v31
              mov     r12            , 16             ; load->v32; null; save->v32
              mov     r13            , rcx            ; load->v34; null; save->v34
              mov     r10            , r15            ; load->v33
              mov     r15            , rbx            ; load->v31; null; save->v33
              mov     rcx            , r12            ; load->v32; null
              mov     r10            , r15            ; load->v33
              and     r10            , -1             
              mov     r15            , r10            ; save->v33; load->v33
              sal     r10d           , cl             
              mov     r15            , r10            ; save->v33
              mov     rcx            , r13            ; load->v34; null
              mov     rbx            , 65535          ; load->v35; null; save->v35
              mov     r10            , r12            ; load->v36
              mov     r12            , r14            ; load->v13; null; save->v36
              mov     r10            , r12            ; load->v36
              mov     r11            , rbx            ; load->v35
              and     r10            , r11            
              mov     r12            , r10            ; save->v36
              mov     r10            , rbx            ; load->v37
              mov     rbx            , r15            ; load->v33; null; save->v37
              mov     r10            , rbx            ; load->v37
              mov     r11            , r12            ; load->v36
              or      r10            , r11            
              mov     rbx            , r10            ; save->v37
_text__add_ret0:
              mov     rax            , rbx            ; load->v37; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 312            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__add_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 312            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__lohi ] ---
;[----------------------------------
_text__lohi:
              sub     rsp            , 104            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbx            , rdi            ; load->v6; null; save->v6
              mov     r12            , rsi            ; load->v7; null; save->v7
              mov     r13            , 16             ; load->v8; null; save->v8
              mov     r14            , rcx            ; load->v10; null; save->v10
              mov     r10            , r15            ; load->v9
              mov     r15            , r12            ; load->v7; null; save->v9
              mov     rcx            , r13            ; load->v8; null
              mov     r10            , r15            ; load->v9
              and     r10            , -1             
              mov     r15            , r10            ; save->v9; load->v9
              sal     r10d           , cl             
              mov     r15            , r10            ; save->v9
              mov     rcx            , r14            ; load->v10; null
              mov     r10            , r12            ; load->v11
              mov     r12            , rbx            ; load->v6; null; save->v11
              mov     r10            , r12            ; load->v11
              mov     r11            , r15            ; load->v9
              or      r10            , r11            
              mov     r12            , r10            ; save->v11
_text__lohi_ret0:
              mov     rax            , r12            ; load->v11; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 104            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__lohi_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 104            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__sha1 ] ---
;[----------------------------------
_text__sha1:
              sub     rsp            , 2552           
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     qword [rsp+48] , rdi            ; load->v6; null; save->v6
              mov     qword [rsp+56] , rsi            ; load->v7; null; save->v7
              mov     r13            , 64             ; load->v8; null; save->v8
              mov     r10            , r14            ; load->v9
              mov     r14            , qword [rsp+56] ; load->v7; null; save->v9
              mov     r10            , r14            ; load->v9
              mov     r11            , r13            ; load->v8
              add     r10            , r11            
              mov     r14            , r10            ; save->v9
              mov     r13            , 56             ; load->v10; null; save->v10
              mov     r10            , r15            ; load->v11
              mov     r15            , r14            ; load->v9; null; save->v11
              mov     r10            , r15            ; load->v11
              mov     r11            , r13            ; load->v10
              sub     r10            , r11            
              mov     r15            , r10            ; save->v11
              mov     r13            , 64             ; load->v12; null; save->v12
              mov     r14            , rdx            ; load->v14; null; save->v14
              mov     qword [rsp+120], rax            ; load->v15; null; save->v15
              mov     rax            , r15            ; load->v11; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v12
              and     r10d           , -1             
              mov     r13            , r10            ; save->v12
              cqo                                     
              mov     r10            , r13            ; load->v12
              idiv    r10d                            
              mov     r13            , rax            ; save->v12; load->v13; null; save->v13
              mov     rdx            , r14            ; load->v14; null
              mov     rax            , qword [rsp+120]; load->v15; null
              mov     r14            , 1              ; load->v16; null; save->v16
              mov     r10            , r15            ; load->v17
              mov     r15            , r13            ; load->v13; null; save->v17
              mov     r10            , r15            ; load->v17
              mov     r11            , r14            ; load->v16
              add     r10            , r11            
              mov     r15            , r10            ; save->v17
              mov     r10            , qword [rsp+144]; load->v18
              mov     qword [rsp+144], r15            ; load->v17; init->nChunk; save->v18
_text__sha1_if0_init:
              mov     r10            , r14            ; load->v19
              mov     r14            , [_data_bss_MAXCHUNK]; null; save->v19
              mov     r10            , qword [rsp+144]; load->v18
              mov     r11            , r14            ; load->v19
              cmp     r10d           , r11d           
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , r14            ; load->v20
              setg    r10b                            
              mov     r14            , r10            ; save->v20; load->v20
              and     r10            , 255            
              mov     r14            , r10            ; save->v20
_text__sha1_if0_check:
              mov     r10            , r14            ; load->v20
              cmp     r10b           , 0              
              mov     r14            , r10            ; save->v20
              je      _text__sha1_if0_else                 
;----------------------------------]
;[----------------------------------
_text__sha1_if0_start:
              mov     r14            , _data_s4       ; load->v21; null; save->v21
_text__sha1_call0:
              mov     rdi            , r14            ; load->v21; null
              call    _text__println                  
              mov     r14            , 0              ; load->v22; null; save->v22; load->v23; null; save->v23
_text__sha1_ret0:
              mov     rax            , r14            ; load->v23; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 2552           
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__sha1_if0_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_if0_else:
_text__sha1_if0_end:
_text__sha1_for0_init:
              mov     qword [rsp+208], 0              ; load->v26; null; save->v26
              mov     r10            , r14            ; load->v24
              mov     r14            , qword [rsp+208]; load->v26; assign->i; save->v24
              mov     r10            , r14            ; load->v24
              mov     r11            , qword [rsp+144]; load->v18
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v24
              mov     r10            , qword [rsp+216]; load->v27
              setl    r10b                            
              mov     qword [rsp+216], r10            ; save->v27; load->v27
              and     r10            , 255            
              mov     qword [rsp+216], r10            ; save->v27
_text__sha1_for0_init_check:
              mov     r10            , qword [rsp+216]; load->v27
              cmp     r10b           , 0              
              mov     qword [rsp+216], r10            ; save->v27
              je      _text__sha1_for0_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_for0_start:
_text__sha1_for1_init:
              mov     rbx            , 0              ; load->v28; null; save->v28
              mov     r10            , qword [rsp+200]; load->v25
              mov     qword [rsp+200], rbx            ; load->v28; assign->j; save->v25
              mov     r12            , 80             ; load->v29; null; save->v29
              mov     r10            , qword [rsp+200]; load->v25
              mov     r11            , r12            ; load->v29
              cmp     r10d           , r11d           
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , r13            ; load->v30
              setl    r10b                            
              mov     r13            , r10            ; save->v30; load->v30
              and     r10            , 255            
              mov     r13            , r10            ; save->v30
_text__sha1_for1_init_check:
              mov     r10            , r13            ; load->v30
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v30
              je      _text__sha1_for1_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_for1_start:
              mov     qword [rsp+248], 0              ; load->v31; null; save->v31
              mov     r10            , qword [rsp+256]; load->v32
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+264]; load->v33
              mov     qword [rsp+264], r14            ; load->v24; null; save->v33
              mov     r10            , qword [rsp+264]; load->v33
              imul    r10            , 8              
              mov     qword [rsp+264], r10            ; save->v33; load->v33
              add     r10            , 8              
              mov     qword [rsp+264], r10            ; save->v33; load->v33
              mov     r11            , qword [rsp+256]; load->v32
              add     r10            , r11            
              mov     qword [rsp+264], r10            ; save->v33
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+264]; translate->qword [v33]
              mov     r10            , qword [r11]    
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+280]; load->v35
              mov     r10            , qword [rsp+200]; load->v25; null
              mov     qword [rsp+280], r10            ; save->v35; load->v35
              imul    r10            , 8              
              mov     qword [rsp+280], r10            ; save->v35; load->v35
              add     r10            , 8              
              mov     qword [rsp+280], r10            ; save->v35; load->v35
              mov     r11            , qword [rsp+272]; load->v34
              add     r10            , r11            
              mov     qword [rsp+280], r10            ; save->v35
              mov     r10            , qword [rsp+288]; load->v36
              mov     r11            , qword [rsp+280]; translate->qword [v35]
              mov     r10            , qword [r11]    
              mov     qword [rsp+288], r10            ; save->v36
              mov     r10            , qword [rsp+280]; translate->qword [v35]
              mov     r11            , qword [rsp+248]; load->v31
              mov     qword [r10]    , r11            ; assign->chunks[i][j]
_text__sha1_for1_continue:
              mov     r10            , qword [rsp+296]; load->v37
              mov     r10            , qword [rsp+200]; load->v25; null
              mov     qword [rsp+296], r10            ; save->v37
              mov     qword [rsp+304], 1              ; load->v38; null; save->v38
              mov     r10            , qword [rsp+312]; load->v39
              mov     r10            , qword [rsp+200]; load->v25; null
              mov     qword [rsp+312], r10            ; save->v39; load->v39
              mov     r11            , qword [rsp+304]; load->v38
              add     r10            , r11            
              mov     qword [rsp+312], r10            ; save->v39
              mov     r10            , qword [rsp+200]; load->v25
              mov     r10            , qword [rsp+312]; load->v39; assign->j
              mov     qword [rsp+200], r10            ; save->v25
              mov     qword [rsp+320], 80             ; load->v40; null; save->v40
              mov     r10            , qword [rsp+200]; load->v25
              mov     r11            , qword [rsp+320]; load->v40
              cmp     r10d           , r11d           
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+328]; load->v41
              setl    r10b                            
              mov     qword [rsp+328], r10            ; save->v41; load->v41
              and     r10            , 255            
              mov     qword [rsp+328], r10            ; save->v41; load->v41
              cmp     r10b           , 0              
              mov     qword [rsp+328], r10            ; save->v41
              jne     _text__sha1_for1_start                 
;----------------------------------]
;[----------------------------------
_text__sha1_for1_end:
_text__sha1_for0_continue:
              mov     r10            , qword [rsp+336]; load->v42
              mov     qword [rsp+336], r14            ; load->v24; null; save->v42
              mov     qword [rsp+344], 1              ; load->v43; null; save->v43
              mov     r10            , qword [rsp+352]; load->v44
              mov     qword [rsp+352], r14            ; load->v24; null; save->v44
              mov     r10            , qword [rsp+352]; load->v44
              mov     r11            , qword [rsp+344]; load->v43
              add     r10            , r11            
              mov     qword [rsp+352], r10            ; save->v44
              mov     r10            , r14            ; load->v24
              mov     r14            , qword [rsp+352]; load->v44; assign->i; save->v24
              mov     r10            , r14            ; load->v24
              mov     r11            , qword [rsp+144]; load->v18
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v24
              mov     r10            , qword [rsp+360]; load->v45
              setl    r10b                            
              mov     qword [rsp+360], r10            ; save->v45; load->v45
              and     r10            , 255            
              mov     qword [rsp+360], r10            ; save->v45; load->v45
              cmp     r10b           , 0              
              mov     qword [rsp+360], r10            ; save->v45
              jne     _text__sha1_for0_start                 
;----------------------------------]
;[----------------------------------
_text__sha1_for0_end:
_text__sha1_for2_init:
              mov     rbx            , 0              ; load->v46; null; save->v46
              mov     r10            , r14            ; load->v24
              mov     r14            , rbx            ; load->v46; assign->i; save->v24
              mov     r10            , r14            ; load->v24
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v24
              mov     r10            , r12            ; load->v47
              setl    r10b                            
              mov     r12            , r10            ; save->v47; load->v47
              and     r10            , 255            
              mov     r12            , r10            ; save->v47
_text__sha1_for2_init_check:
              mov     r10            , r12            ; load->v47
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v47
              je      _text__sha1_for2_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_for2_start:
              mov     r10            , r13            ; load->v48
              mov     r13            , [_data_bss_chunks]; null; save->v48
              mov     qword [rsp+392], 64             ; load->v49; null; save->v49
              mov     qword [rsp+408], rdx            ; load->v51; null; save->v51
              mov     qword [rsp+416], rax            ; load->v52; null; save->v52
              mov     rax            , r14            ; load->v24; null
              and     rax            , -1             
              mov     r10            , qword [rsp+392]; load->v49
              and     r10d           , -1             
              mov     qword [rsp+392], r10            ; save->v49
              cqo                                     
              mov     r10            , qword [rsp+392]; load->v49
              idiv    r10d                            
              mov     qword [rsp+392], r10            ; save->v49
              mov     qword [rsp+400], rax            ; load->v50; null; save->v50
              mov     rdx            , qword [rsp+408]; load->v51; null
              mov     rax            , qword [rsp+416]; load->v52; null
              mov     r10            , qword [rsp+424]; load->v53
              mov     r10            , qword [rsp+400]; load->v50; null
              mov     qword [rsp+424], r10            ; save->v53; load->v53
              imul    r10            , 8              
              mov     qword [rsp+424], r10            ; save->v53; load->v53
              add     r10            , 8              
              mov     qword [rsp+424], r10            ; save->v53; load->v53
              mov     r11            , r13            ; load->v48
              add     r10            , r11            
              mov     qword [rsp+424], r10            ; save->v53
              mov     r10            , qword [rsp+432]; load->v54
              mov     r11            , qword [rsp+424]; translate->qword [v53]
              mov     r10            , qword [r11]    
              mov     qword [rsp+432], r10            ; save->v54
              mov     qword [rsp+440], 64             ; load->v55; null; save->v55
              mov     qword [rsp+456], rdx            ; load->v57; null; save->v57
              mov     qword [rsp+464], rax            ; load->v58; null; save->v58
              mov     rax            , r14            ; load->v24; null
              and     rax            , -1             
              mov     r10            , qword [rsp+440]; load->v55
              and     r10d           , -1             
              mov     qword [rsp+440], r10            ; save->v55
              cqo                                     
              mov     r10            , qword [rsp+440]; load->v55
              idiv    r10d                            
              mov     qword [rsp+440], r10            ; save->v55
              mov     qword [rsp+448], rdx            ; load->v56; null; save->v56
              mov     rdx            , qword [rsp+456]; load->v57; null
              mov     rax            , qword [rsp+464]; load->v58; null
              mov     qword [rsp+472], 4              ; load->v59; null; save->v59
              mov     qword [rsp+488], rdx            ; load->v61; null; save->v61
              mov     qword [rsp+496], rax            ; load->v62; null; save->v62
              mov     rax            , qword [rsp+448]; load->v56; null
              and     rax            , -1             
              mov     r10            , qword [rsp+472]; load->v59
              and     r10d           , -1             
              mov     qword [rsp+472], r10            ; save->v59
              cqo                                     
              mov     r10            , qword [rsp+472]; load->v59
              idiv    r10d                            
              mov     qword [rsp+472], r10            ; save->v59
              mov     qword [rsp+480], rax            ; load->v60; null; save->v60
              mov     rdx            , qword [rsp+488]; load->v61; null
              mov     rax            , qword [rsp+496]; load->v62; null
              mov     r10            , qword [rsp+504]; load->v63
              mov     r10            , qword [rsp+480]; load->v60; null
              mov     qword [rsp+504], r10            ; save->v63; load->v63
              imul    r10            , 8              
              mov     qword [rsp+504], r10            ; save->v63; load->v63
              add     r10            , 8              
              mov     qword [rsp+504], r10            ; save->v63; load->v63
              mov     r11            , qword [rsp+432]; load->v54
              add     r10            , r11            
              mov     qword [rsp+504], r10            ; save->v63
              mov     r10            , qword [rsp+512]; load->v64
              mov     r11            , qword [rsp+504]; translate->qword [v63]
              mov     r10            , qword [r11]    
              mov     qword [rsp+512], r10            ; save->v64
              mov     r10            , qword [rsp+520]; load->v65
              mov     qword [rsp+520], r14            ; load->v24; null; save->v65
              mov     r10            , qword [rsp+520]; load->v65
              imul    r10            , 8              
              mov     qword [rsp+520], r10            ; save->v65; load->v65
              add     r10            , 8              
              mov     qword [rsp+520], r10            ; save->v65; load->v65
              mov     r11            , qword [rsp+48] ; load->v6
              add     r10            , r11            
              mov     qword [rsp+520], r10            ; save->v65
              mov     r10            , qword [rsp+528]; load->v66
              mov     r11            , qword [rsp+520]; translate->qword [v65]
              mov     r10            , qword [r11]    
              mov     qword [rsp+528], r10            ; save->v66
              mov     qword [rsp+536], 3              ; load->v67; null; save->v67
              mov     qword [rsp+544], 4              ; load->v68; null; save->v68
              mov     qword [rsp+560], rdx            ; load->v70; null; save->v70
              mov     qword [rsp+568], rax            ; load->v71; null; save->v71
              mov     rax            , r14            ; load->v24; null
              and     rax            , -1             
              mov     r10            , qword [rsp+544]; load->v68
              and     r10d           , -1             
              mov     qword [rsp+544], r10            ; save->v68
              cqo                                     
              mov     r10            , qword [rsp+544]; load->v68
              idiv    r10d                            
              mov     qword [rsp+544], r10            ; save->v68
              mov     qword [rsp+552], rdx            ; load->v69; null; save->v69
              mov     rdx            , qword [rsp+560]; load->v70; null
              mov     rax            , qword [rsp+568]; load->v71; null
              mov     r10            , qword [rsp+576]; load->v72
              mov     r10            , qword [rsp+536]; load->v67; null
              mov     qword [rsp+576], r10            ; save->v72; load->v72
              mov     r11            , qword [rsp+552]; load->v69
              sub     r10            , r11            
              mov     qword [rsp+576], r10            ; save->v72
              mov     qword [rsp+584], 8              ; load->v73; null; save->v73
              mov     r10            , qword [rsp+592]; load->v74
              mov     r10            , qword [rsp+576]; load->v72; null
              mov     qword [rsp+592], r10            ; save->v74; load->v74
              mov     r11            , qword [rsp+584]; load->v73
              imul    r10            , r11            
              mov     qword [rsp+592], r10            ; save->v74; load->v74
              and     r10            , -1             
              mov     qword [rsp+592], r10            ; save->v74
              mov     qword [rsp+608], rcx            ; load->v76; null; save->v76
              mov     r10            , qword [rsp+600]; load->v75
              mov     r10            , qword [rsp+528]; load->v66; null
              mov     qword [rsp+600], r10            ; save->v75
              mov     rcx            , qword [rsp+592]; load->v74; null
              mov     r10            , qword [rsp+600]; load->v75
              and     r10            , -1             
              mov     qword [rsp+600], r10            ; save->v75; load->v75
              sal     r10d           , cl             
              mov     qword [rsp+600], r10            ; save->v75
              mov     rcx            , qword [rsp+608]; load->v76; null
              mov     r10            , qword [rsp+616]; load->v77
              mov     r10            , qword [rsp+512]; load->v64; null
              mov     qword [rsp+616], r10            ; save->v77; load->v77
              mov     r11            , qword [rsp+600]; load->v75
              or      r10            , r11            
              mov     qword [rsp+616], r10            ; save->v77
              mov     r10            , qword [rsp+624]; load->v78
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+624], r10            ; save->v78
              mov     qword [rsp+632], 64             ; load->v79; null; save->v79
              mov     qword [rsp+648], rdx            ; load->v81; null; save->v81
              mov     qword [rsp+656], rax            ; load->v82; null; save->v82
              mov     rax            , r14            ; load->v24; null
              and     rax            , -1             
              mov     r10            , qword [rsp+632]; load->v79
              and     r10d           , -1             
              mov     qword [rsp+632], r10            ; save->v79
              cqo                                     
              mov     r10            , qword [rsp+632]; load->v79
              idiv    r10d                            
              mov     qword [rsp+632], r10            ; save->v79
              mov     qword [rsp+640], rax            ; load->v80; null; save->v80
              mov     rdx            , qword [rsp+648]; load->v81; null
              mov     rax            , qword [rsp+656]; load->v82; null
              mov     r10            , qword [rsp+664]; load->v83
              mov     r10            , qword [rsp+640]; load->v80; null
              mov     qword [rsp+664], r10            ; save->v83; load->v83
              imul    r10            , 8              
              mov     qword [rsp+664], r10            ; save->v83; load->v83
              add     r10            , 8              
              mov     qword [rsp+664], r10            ; save->v83; load->v83
              mov     r11            , qword [rsp+624]; load->v78
              add     r10            , r11            
              mov     qword [rsp+664], r10            ; save->v83
              mov     r10            , qword [rsp+672]; load->v84
              mov     r11            , qword [rsp+664]; translate->qword [v83]
              mov     r10            , qword [r11]    
              mov     qword [rsp+672], r10            ; save->v84
              mov     qword [rsp+680], 64             ; load->v85; null; save->v85
              mov     qword [rsp+696], rdx            ; load->v87; null; save->v87
              mov     qword [rsp+704], rax            ; load->v88; null; save->v88
              mov     rax            , r14            ; load->v24; null
              and     rax            , -1             
              mov     r10            , qword [rsp+680]; load->v85
              and     r10d           , -1             
              mov     qword [rsp+680], r10            ; save->v85
              cqo                                     
              mov     r10            , qword [rsp+680]; load->v85
              idiv    r10d                            
              mov     qword [rsp+680], r10            ; save->v85
              mov     qword [rsp+688], rdx            ; load->v86; null; save->v86
              mov     rdx            , qword [rsp+696]; load->v87; null
              mov     rax            , qword [rsp+704]; load->v88; null
              mov     qword [rsp+712], 4              ; load->v89; null; save->v89
              mov     qword [rsp+728], rdx            ; load->v91; null; save->v91
              mov     qword [rsp+736], rax            ; load->v92; null; save->v92
              mov     rax            , qword [rsp+688]; load->v86; null
              and     rax            , -1             
              mov     r10            , qword [rsp+712]; load->v89
              and     r10d           , -1             
              mov     qword [rsp+712], r10            ; save->v89
              cqo                                     
              mov     r10            , qword [rsp+712]; load->v89
              idiv    r10d                            
              mov     qword [rsp+712], r10            ; save->v89
              mov     qword [rsp+720], rax            ; load->v90; null; save->v90
              mov     rdx            , qword [rsp+728]; load->v91; null
              mov     rax            , qword [rsp+736]; load->v92; null
              mov     r10            , qword [rsp+744]; load->v93
              mov     r10            , qword [rsp+720]; load->v90; null
              mov     qword [rsp+744], r10            ; save->v93; load->v93
              imul    r10            , 8              
              mov     qword [rsp+744], r10            ; save->v93; load->v93
              add     r10            , 8              
              mov     qword [rsp+744], r10            ; save->v93; load->v93
              mov     r11            , qword [rsp+672]; load->v84
              add     r10            , r11            
              mov     qword [rsp+744], r10            ; save->v93
              mov     r10            , qword [rsp+752]; load->v94
              mov     r11            , qword [rsp+744]; translate->qword [v93]
              mov     r10            , qword [r11]    
              mov     qword [rsp+752], r10            ; save->v94
              mov     r10            , qword [rsp+744]; translate->qword [v93]
              mov     r11            , qword [rsp+616]; load->v77
              mov     qword [r10]    , r11            ; assign->chunks[i/64][i%64/4]
_text__sha1_for2_continue:
              mov     r10            , qword [rsp+760]; load->v95
              mov     qword [rsp+760], r14            ; load->v24; null; save->v95
              mov     qword [rsp+768], 1              ; load->v96; null; save->v96
              mov     r10            , qword [rsp+776]; load->v97
              mov     qword [rsp+776], r14            ; load->v24; null; save->v97
              mov     r10            , qword [rsp+776]; load->v97
              mov     r11            , qword [rsp+768]; load->v96
              add     r10            , r11            
              mov     qword [rsp+776], r10            ; save->v97
              mov     r10            , r14            ; load->v24
              mov     r14            , qword [rsp+776]; load->v97; assign->i; save->v24
              mov     r10            , r14            ; load->v24
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v24
              mov     r10            , qword [rsp+784]; load->v98
              setl    r10b                            
              mov     qword [rsp+784], r10            ; save->v98; load->v98
              and     r10            , 255            
              mov     qword [rsp+784], r10            ; save->v98; load->v98
              cmp     r10b           , 0              
              mov     qword [rsp+784], r10            ; save->v98
              jne     _text__sha1_for2_start                 
;----------------------------------]
;[----------------------------------
_text__sha1_for2_end:
              mov     r10            , rbx            ; load->v99
              mov     rbx            , [_data_bss_chunks]; null; save->v99
              mov     r12            , 64             ; load->v100; null; save->v100
              mov     r13            , rdx            ; load->v102; null; save->v102
              mov     qword [rsp+824], rax            ; load->v103; null; save->v103
              mov     rax            , r14            ; load->v24; null
              and     rax            , -1             
              mov     r10            , r12            ; load->v100
              and     r10d           , -1             
              mov     r12            , r10            ; save->v100
              cqo                                     
              mov     r10            , r12            ; load->v100
              idiv    r10d                            
              mov     r12            , rax            ; save->v100; load->v101; null; save->v101
              mov     rdx            , r13            ; load->v102; null
              mov     rax            , qword [rsp+824]; load->v103; null
              mov     r10            , r13            ; load->v104
              mov     r13            , r12            ; load->v101; null; save->v104
              mov     r10            , r13            ; load->v104
              imul    r10            , 8              
              mov     r13            , r10            ; save->v104; load->v104
              add     r10            , 8              
              mov     r13            , r10            ; save->v104; load->v104
              mov     r11            , rbx            ; load->v99
              add     r10            , r11            
              mov     r13            , r10            ; save->v104
              mov     r10            , rbx            ; load->v105
              mov     r11            , r13            ; translate->qword [v104]
              mov     rbx            , qword [r11]    ; null; save->v105
              mov     r12            , 64             ; load->v106; null; save->v106
              mov     r13            , rdx            ; load->v108; null; save->v108
              mov     qword [rsp+872], rax            ; load->v109; null; save->v109
              mov     rax            , r14            ; load->v24; null
              and     rax            , -1             
              mov     r10            , r12            ; load->v106
              and     r10d           , -1             
              mov     r12            , r10            ; save->v106
              cqo                                     
              mov     r10            , r12            ; load->v106
              idiv    r10d                            
              mov     r12            , rdx            ; save->v106; load->v107; null; save->v107
              mov     rdx            , r13            ; load->v108; null
              mov     rax            , qword [rsp+872]; load->v109; null
              mov     r13            , 4              ; load->v110; null; save->v110
              mov     qword [rsp+896], rdx            ; load->v112; null; save->v112
              mov     qword [rsp+904], rax            ; load->v113; null; save->v113
              mov     rax            , r12            ; load->v107; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v110
              and     r10d           , -1             
              mov     r13            , r10            ; save->v110
              cqo                                     
              mov     r10            , r13            ; load->v110
              idiv    r10d                            
              mov     r13            , r10            ; save->v110
              mov     r12            , rax            ; load->v111; null; save->v111
              mov     rdx            , qword [rsp+896]; load->v112; null
              mov     rax            , qword [rsp+904]; load->v113; null
              mov     r10            , r13            ; load->v114
              mov     r13            , r12            ; load->v111; null; save->v114
              mov     r10            , r13            ; load->v114
              imul    r10            , 8              
              mov     r13            , r10            ; save->v114; load->v114
              add     r10            , 8              
              mov     r13            , r10            ; save->v114; load->v114
              mov     r11            , rbx            ; load->v105
              add     r10            , r11            
              mov     r13            , r10            ; save->v114
              mov     r10            , rbx            ; load->v115
              mov     r11            , r13            ; translate->qword [v114]
              mov     rbx            , qword [r11]    ; null; save->v115
              mov     r12            , 128            ; load->v116; null; save->v116
              mov     qword [rsp+936], 3              ; load->v117; null; save->v117
              mov     r13            , 4              ; load->v118; null; save->v118
              mov     qword [rsp+960], rdx            ; load->v120; null; save->v120
              mov     qword [rsp+968], rax            ; load->v121; null; save->v121
              mov     rax            , r14            ; load->v24; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v118
              and     r10d           , -1             
              mov     r13            , r10            ; save->v118
              cqo                                     
              mov     r10            , r13            ; load->v118
              idiv    r10d                            
              mov     r13            , rdx            ; save->v118; load->v119; null; save->v119
              mov     rdx            , qword [rsp+960]; load->v120; null
              mov     rax            , qword [rsp+968]; load->v121; null
              mov     r10            , qword [rsp+976]; load->v122
              mov     r10            , qword [rsp+936]; load->v117; null
              mov     qword [rsp+976], r10            ; save->v122; load->v122
              mov     r11            , r13            ; load->v119
              sub     r10            , r11            
              mov     qword [rsp+976], r10            ; save->v122
              mov     r13            , 8              ; load->v123; null; save->v123
              mov     r10            , qword [rsp+992]; load->v124
              mov     r10            , qword [rsp+976]; load->v122; null
              mov     qword [rsp+992], r10            ; save->v124; load->v124
              mov     r11            , r13            ; load->v123
              imul    r10            , r11            
              mov     qword [rsp+992], r10            ; save->v124; load->v124
              and     r10            , -1             
              mov     qword [rsp+992], r10            ; save->v124
              mov     r13            , rcx            ; load->v126; null; save->v126
              mov     r10            , qword [rsp+1000]; load->v125
              mov     qword [rsp+1000], r12            ; load->v116; null; save->v125
              mov     rcx            , qword [rsp+992]; load->v124; null
              mov     r10            , qword [rsp+1000]; load->v125
              and     r10            , -1             
              mov     qword [rsp+1000], r10            ; save->v125; load->v125
              sal     r10d           , cl             
              mov     qword [rsp+1000], r10            ; save->v125
              mov     rcx            , r13            ; load->v126; null
              mov     r10            , r12            ; load->v127
              mov     r12            , rbx            ; load->v115; null; save->v127
              mov     r10            , r12            ; load->v127
              mov     r11            , qword [rsp+1000]; load->v125
              or      r10            , r11            
              mov     r12            , r10            ; save->v127
              mov     r10            , rbx            ; load->v128
              mov     rbx            , [_data_bss_chunks]; null; save->v128
              mov     r13            , 64             ; load->v129; null; save->v129
              mov     qword [rsp+1048], rdx            ; load->v131; null; save->v131
              mov     qword [rsp+1056], rax            ; load->v132; null; save->v132
              mov     rax            , r14            ; load->v24; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v129
              and     r10d           , -1             
              mov     r13            , r10            ; save->v129
              cqo                                     
              mov     r10            , r13            ; load->v129
              idiv    r10d                            
              mov     r13            , rax            ; save->v129; load->v130; null; save->v130
              mov     rdx            , qword [rsp+1048]; load->v131; null
              mov     rax            , qword [rsp+1056]; load->v132; null
              mov     r10            , qword [rsp+1064]; load->v133
              mov     qword [rsp+1064], r13            ; load->v130; null; save->v133
              mov     r10            , qword [rsp+1064]; load->v133
              imul    r10            , 8              
              mov     qword [rsp+1064], r10            ; save->v133; load->v133
              add     r10            , 8              
              mov     qword [rsp+1064], r10            ; save->v133; load->v133
              mov     r11            , rbx            ; load->v128
              add     r10            , r11            
              mov     qword [rsp+1064], r10            ; save->v133
              mov     r10            , rbx            ; load->v134
              mov     r11            , qword [rsp+1064]; translate->qword [v133]
              mov     rbx            , qword [r11]    ; null; save->v134
              mov     r13            , 64             ; load->v135; null; save->v135
              mov     qword [rsp+1096], rdx            ; load->v137; null; save->v137
              mov     qword [rsp+1104], rax            ; load->v138; null; save->v138
              mov     rax            , r14            ; load->v24; null
              and     rax            , -1             
              mov     r10            , r13            ; load->v135
              and     r10d           , -1             
              mov     r13            , r10            ; save->v135
              cqo                                     
              mov     r10            , r13            ; load->v135
              idiv    r10d                            
              mov     r13            , rdx            ; save->v135; load->v136; null; save->v136
              mov     rdx            , qword [rsp+1096]; load->v137; null
              mov     rax            , qword [rsp+1104]; load->v138; null
              mov     qword [rsp+1112], 4              ; load->v139; null; save->v139
              mov     qword [rsp+1128], rdx            ; load->v141; null; save->v141
              mov     qword [rsp+1136], rax            ; load->v142; null; save->v142
              mov     rax            , r13            ; load->v136; null
              and     rax            , -1             
              mov     r10            , qword [rsp+1112]; load->v139
              and     r10d           , -1             
              mov     qword [rsp+1112], r10            ; save->v139
              cqo                                     
              mov     r10            , qword [rsp+1112]; load->v139
              idiv    r10d                            
              mov     qword [rsp+1112], r10            ; save->v139
              mov     r13            , rax            ; load->v140; null; save->v140
              mov     rdx            , qword [rsp+1128]; load->v141; null
              mov     rax            , qword [rsp+1136]; load->v142; null
              mov     r10            , qword [rsp+1144]; load->v143
              mov     qword [rsp+1144], r13            ; load->v140; null; save->v143
              mov     r10            , qword [rsp+1144]; load->v143
              imul    r10            , 8              
              mov     qword [rsp+1144], r10            ; save->v143; load->v143
              add     r10            , 8              
              mov     qword [rsp+1144], r10            ; save->v143; load->v143
              mov     r11            , rbx            ; load->v134
              add     r10            , r11            
              mov     qword [rsp+1144], r10            ; save->v143
              mov     r10            , rbx            ; load->v144
              mov     r11            , qword [rsp+1144]; translate->qword [v143]
              mov     rbx            , qword [r11]    ; null; save->v144
              mov     r10            , qword [rsp+1144]; translate->qword [v143]
              mov     qword [r10]    , r12            ; load->v127; assign->chunks[i/64][i%64/4]
              mov     rbx            , 3              ; load->v145; null; save->v145
              mov     r12            , rcx            ; load->v147; null; save->v147
              mov     r10            , r13            ; load->v146
              mov     r13            , qword [rsp+56] ; load->v7; null; save->v146
              mov     rcx            , rbx            ; load->v145; null
              mov     r10            , r13            ; load->v146
              and     r10            , -1             
              mov     r13            , r10            ; save->v146; load->v146
              sal     r10d           , cl             
              mov     r13            , r10            ; save->v146
              mov     rcx            , r12            ; load->v147; null
              mov     r10            , rbx            ; load->v148
              mov     rbx            , [_data_bss_chunks]; null; save->v148
              mov     r12            , 1              ; load->v149; null; save->v149
              mov     r10            , qword [rsp+1200]; load->v150
              mov     r10            , qword [rsp+144]; load->v18; null
              mov     qword [rsp+1200], r10            ; save->v150; load->v150
              mov     r11            , r12            ; load->v149
              sub     r10            , r11            
              mov     qword [rsp+1200], r10            ; save->v150
              mov     r10            , r12            ; load->v151
              mov     r12            , qword [rsp+1200]; load->v150; null; save->v151
              mov     r10            , r12            ; load->v151
              imul    r10            , 8              
              mov     r12            , r10            ; save->v151; load->v151
              add     r10            , 8              
              mov     r12            , r10            ; save->v151; load->v151
              mov     r11            , rbx            ; load->v148
              add     r10            , r11            
              mov     r12            , r10            ; save->v151
              mov     r10            , rbx            ; load->v152
              mov     r11            , r12            ; translate->qword [v151]
              mov     rbx            , qword [r11]    ; null; save->v152
              mov     r12            , 15             ; load->v153; null; save->v153
              mov     r10            , qword [rsp+1232]; load->v154
              mov     qword [rsp+1232], r12            ; load->v153; null; save->v154
              mov     r10            , qword [rsp+1232]; load->v154
              imul    r10            , 8              
              mov     qword [rsp+1232], r10            ; save->v154; load->v154
              add     r10            , 8              
              mov     qword [rsp+1232], r10            ; save->v154; load->v154
              mov     r11            , rbx            ; load->v152
              add     r10            , r11            
              mov     qword [rsp+1232], r10            ; save->v154
              mov     r10            , rbx            ; load->v155
              mov     r11            , qword [rsp+1232]; translate->qword [v154]
              mov     rbx            , qword [r11]    ; null; save->v155
              mov     r10            , qword [rsp+1232]; translate->qword [v154]
              mov     qword [r10]    , r13            ; load->v146; assign->chunks[nChunk-1][15]
              mov     rbx            , 29             ; load->v156; null; save->v156
              mov     r12            , rcx            ; load->v158; null; save->v158
              mov     r10            , r13            ; load->v157
              mov     r13            , qword [rsp+56] ; load->v7; null; save->v157
              mov     rcx            , rbx            ; load->v156; null
              mov     r10            , r13            ; load->v157
              and     r10            , -1             
              mov     r13            , r10            ; save->v157; load->v157
              sar     r10d           , cl             
              mov     r13            , r10            ; save->v157
              mov     rcx            , r12            ; load->v158; null
              mov     rbx            , 7              ; load->v159; null; save->v159
              mov     r10            , r12            ; load->v160
              mov     r12            , r13            ; load->v157; null; save->v160
              mov     r10            , r12            ; load->v160
              mov     r11            , rbx            ; load->v159
              and     r10            , r11            
              mov     r12            , r10            ; save->v160
              mov     r10            , rbx            ; load->v161
              mov     rbx            , [_data_bss_chunks]; null; save->v161
              mov     r13            , 1              ; load->v162; null; save->v162
              mov     r10            , qword [rsp+1304]; load->v163
              mov     r10            , qword [rsp+144]; load->v18; null
              mov     qword [rsp+1304], r10            ; save->v163; load->v163
              mov     r11            , r13            ; load->v162
              sub     r10            , r11            
              mov     qword [rsp+1304], r10            ; save->v163
              mov     r10            , r13            ; load->v164
              mov     r13            , qword [rsp+1304]; load->v163; null; save->v164
              mov     r10            , r13            ; load->v164
              imul    r10            , 8              
              mov     r13            , r10            ; save->v164; load->v164
              add     r10            , 8              
              mov     r13            , r10            ; save->v164; load->v164
              mov     r11            , rbx            ; load->v161
              add     r10            , r11            
              mov     r13            , r10            ; save->v164
              mov     r10            , rbx            ; load->v165
              mov     r11            , r13            ; translate->qword [v164]
              mov     rbx            , qword [r11]    ; null; save->v165
              mov     r13            , 14             ; load->v166; null; save->v166
              mov     r10            , qword [rsp+1336]; load->v167
              mov     qword [rsp+1336], r13            ; load->v166; null; save->v167
              mov     r10            , qword [rsp+1336]; load->v167
              imul    r10            , 8              
              mov     qword [rsp+1336], r10            ; save->v167; load->v167
              add     r10            , 8              
              mov     qword [rsp+1336], r10            ; save->v167; load->v167
              mov     r11            , rbx            ; load->v165
              add     r10            , r11            
              mov     qword [rsp+1336], r10            ; save->v167
              mov     r10            , rbx            ; load->v168
              mov     r11            , qword [rsp+1336]; translate->qword [v167]
              mov     rbx            , qword [r11]    ; null; save->v168
              mov     r10            , qword [rsp+1336]; translate->qword [v167]
              mov     qword [r10]    , r12            ; load->v160; assign->chunks[nChunk-1][14]
              mov     rbx            , 1732584193     ; load->v169; null; save->v169
              mov     r10            , qword [rsp+1360]; load->v170
              mov     qword [rsp+1360], rbx            ; load->v169; init->h0; save->v170
              mov     rbx            , 43913          ; load->v171; null; save->v171
              mov     r13            , 61389          ; load->v172; null; save->v172
_text__sha1_call1:
              mov     rdi            , rbx            ; load->v171; null
              mov     rsi            , r13            ; load->v172; null
              call    _text__lohi                     
              mov     rbx            , rax            ; load->v173; null; save->v173
              mov     r10            , qword [rsp+1392]; load->v174
              mov     qword [rsp+1392], rbx            ; load->v173; init->h1; save->v174
              mov     rbx            , 56574          ; load->v175; null; save->v175
              mov     qword [rsp+1408], 39098          ; load->v176; null; save->v176
_text__sha1_call2:
              mov     rdi            , rbx            ; load->v175; null
              mov     rsi            , qword [rsp+1408]; load->v176; null
              call    _text__lohi                     
              mov     qword [rsp+1416], rax            ; load->v177; null; save->v177
              mov     r10            , qword [rsp+1424]; load->v178
              mov     r10            , qword [rsp+1416]; load->v177; init->h2
              mov     qword [rsp+1424], r10            ; save->v178
              mov     qword [rsp+1432], 271733878      ; load->v179; null; save->v179
              mov     r10            , qword [rsp+1440]; load->v180
              mov     r10            , qword [rsp+1432]; load->v179; init->h3
              mov     qword [rsp+1440], r10            ; save->v180
              mov     r13            , 57840          ; load->v181; null; save->v181
              mov     qword [rsp+1456], 50130          ; load->v182; null; save->v182
_text__sha1_call3:
              mov     rdi            , r13            ; load->v181; null
              mov     rsi            , qword [rsp+1456]; load->v182; null
              call    _text__lohi                     
              mov     qword [rsp+1464], rax            ; load->v183; null; save->v183
              mov     r10            , qword [rsp+1472]; load->v184
              mov     r10            , qword [rsp+1464]; load->v183; init->h4
              mov     qword [rsp+1472], r10            ; save->v184
_text__sha1_for3_init:
              mov     qword [rsp+1480], 0              ; load->v185; null; save->v185
              mov     r10            , r14            ; load->v24
              mov     r14            , qword [rsp+1480]; load->v185; assign->i; save->v24
              mov     r10            , r14            ; load->v24
              mov     r11            , qword [rsp+144]; load->v18
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v24
              mov     r10            , qword [rsp+1488]; load->v186
              setl    r10b                            
              mov     qword [rsp+1488], r10            ; save->v186; load->v186
              and     r10            , 255            
              mov     qword [rsp+1488], r10            ; save->v186
_text__sha1_for3_init_check:
              mov     r10            , qword [rsp+1488]; load->v186
              cmp     r10b           , 0              
              mov     qword [rsp+1488], r10            ; save->v186
              je      _text__sha1_for3_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_for3_start:
_text__sha1_for4_init:
              mov     r15            , 16             ; load->v187; null; save->v187
              mov     r10            , qword [rsp+200]; load->v25
              mov     qword [rsp+200], r15            ; load->v187; assign->j; save->v25
              mov     qword [rsp+1504], 80             ; load->v188; null; save->v188
              mov     r10            , qword [rsp+200]; load->v25
              mov     r11            , qword [rsp+1504]; load->v188
              cmp     r10d           , r11d           
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+1512]; load->v189
              setl    r10b                            
              mov     qword [rsp+1512], r10            ; save->v189; load->v189
              and     r10            , 255            
              mov     qword [rsp+1512], r10            ; save->v189
_text__sha1_for4_init_check:
              mov     r10            , qword [rsp+1512]; load->v189
              cmp     r10b           , 0              
              mov     qword [rsp+1512], r10            ; save->v189
              je      _text__sha1_for4_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_for4_start:
              mov     r10            , qword [rsp+1520]; load->v190
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+1520], r10            ; save->v190
              mov     r10            , qword [rsp+1528]; load->v191
              mov     qword [rsp+1528], r14            ; load->v24; null; save->v191
              mov     r10            , qword [rsp+1528]; load->v191
              imul    r10            , 8              
              mov     qword [rsp+1528], r10            ; save->v191; load->v191
              add     r10            , 8              
              mov     qword [rsp+1528], r10            ; save->v191; load->v191
              mov     r11            , qword [rsp+1520]; load->v190
              add     r10            , r11            
              mov     qword [rsp+1528], r10            ; save->v191
              mov     r10            , qword [rsp+1536]; load->v192
              mov     r11            , qword [rsp+1528]; translate->qword [v191]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1536], r10            ; save->v192
              mov     qword [rsp+1544], 3              ; load->v193; null; save->v193
              mov     r10            , qword [rsp+1552]; load->v194
              mov     r10            , qword [rsp+200]; load->v25; null
              mov     qword [rsp+1552], r10            ; save->v194; load->v194
              mov     r11            , qword [rsp+1544]; load->v193
              sub     r10            , r11            
              mov     qword [rsp+1552], r10            ; save->v194
              mov     r10            , qword [rsp+1560]; load->v195
              mov     r10            , qword [rsp+1552]; load->v194; null
              mov     qword [rsp+1560], r10            ; save->v195; load->v195
              imul    r10            , 8              
              mov     qword [rsp+1560], r10            ; save->v195; load->v195
              add     r10            , 8              
              mov     qword [rsp+1560], r10            ; save->v195; load->v195
              mov     r11            , qword [rsp+1536]; load->v192
              add     r10            , r11            
              mov     qword [rsp+1560], r10            ; save->v195
              mov     r10            , qword [rsp+1568]; load->v196
              mov     r11            , qword [rsp+1560]; translate->qword [v195]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1568], r10            ; save->v196
              mov     r10            , qword [rsp+1576]; load->v197
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+1576], r10            ; save->v197
              mov     r10            , qword [rsp+1584]; load->v198
              mov     qword [rsp+1584], r14            ; load->v24; null; save->v198
              mov     r10            , qword [rsp+1584]; load->v198
              imul    r10            , 8              
              mov     qword [rsp+1584], r10            ; save->v198; load->v198
              add     r10            , 8              
              mov     qword [rsp+1584], r10            ; save->v198; load->v198
              mov     r11            , qword [rsp+1576]; load->v197
              add     r10            , r11            
              mov     qword [rsp+1584], r10            ; save->v198
              mov     r10            , qword [rsp+1592]; load->v199
              mov     r11            , qword [rsp+1584]; translate->qword [v198]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1592], r10            ; save->v199
              mov     qword [rsp+1600], 8              ; load->v200; null; save->v200
              mov     r10            , qword [rsp+1608]; load->v201
              mov     r10            , qword [rsp+200]; load->v25; null
              mov     qword [rsp+1608], r10            ; save->v201; load->v201
              mov     r11            , qword [rsp+1600]; load->v200
              sub     r10            , r11            
              mov     qword [rsp+1608], r10            ; save->v201
              mov     r10            , qword [rsp+1616]; load->v202
              mov     r10            , qword [rsp+1608]; load->v201; null
              mov     qword [rsp+1616], r10            ; save->v202; load->v202
              imul    r10            , 8              
              mov     qword [rsp+1616], r10            ; save->v202; load->v202
              add     r10            , 8              
              mov     qword [rsp+1616], r10            ; save->v202; load->v202
              mov     r11            , qword [rsp+1592]; load->v199
              add     r10            , r11            
              mov     qword [rsp+1616], r10            ; save->v202
              mov     r10            , qword [rsp+1624]; load->v203
              mov     r11            , qword [rsp+1616]; translate->qword [v202]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1624], r10            ; save->v203
              mov     r10            , qword [rsp+1632]; load->v204
              mov     r10            , qword [rsp+1568]; load->v196; null
              mov     qword [rsp+1632], r10            ; save->v204; load->v204
              mov     r11            , qword [rsp+1624]; load->v203
              xor     r10            , r11            
              mov     qword [rsp+1632], r10            ; save->v204; load->v204
              and     r10            , -1             
              mov     qword [rsp+1632], r10            ; save->v204
              mov     r10            , qword [rsp+1640]; load->v205
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+1640], r10            ; save->v205
              mov     r10            , qword [rsp+1648]; load->v206
              mov     qword [rsp+1648], r14            ; load->v24; null; save->v206
              mov     r10            , qword [rsp+1648]; load->v206
              imul    r10            , 8              
              mov     qword [rsp+1648], r10            ; save->v206; load->v206
              add     r10            , 8              
              mov     qword [rsp+1648], r10            ; save->v206; load->v206
              mov     r11            , qword [rsp+1640]; load->v205
              add     r10            , r11            
              mov     qword [rsp+1648], r10            ; save->v206
              mov     r10            , qword [rsp+1656]; load->v207
              mov     r11            , qword [rsp+1648]; translate->qword [v206]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1656], r10            ; save->v207
              mov     qword [rsp+1664], 14             ; load->v208; null; save->v208
              mov     r10            , qword [rsp+1672]; load->v209
              mov     r10            , qword [rsp+200]; load->v25; null
              mov     qword [rsp+1672], r10            ; save->v209; load->v209
              mov     r11            , qword [rsp+1664]; load->v208
              sub     r10            , r11            
              mov     qword [rsp+1672], r10            ; save->v209
              mov     r10            , qword [rsp+1680]; load->v210
              mov     r10            , qword [rsp+1672]; load->v209; null
              mov     qword [rsp+1680], r10            ; save->v210; load->v210
              imul    r10            , 8              
              mov     qword [rsp+1680], r10            ; save->v210; load->v210
              add     r10            , 8              
              mov     qword [rsp+1680], r10            ; save->v210; load->v210
              mov     r11            , qword [rsp+1656]; load->v207
              add     r10            , r11            
              mov     qword [rsp+1680], r10            ; save->v210
              mov     r10            , qword [rsp+1688]; load->v211
              mov     r11            , qword [rsp+1680]; translate->qword [v210]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1688], r10            ; save->v211
              mov     r10            , qword [rsp+1696]; load->v212
              mov     r10            , qword [rsp+1632]; load->v204; null
              mov     qword [rsp+1696], r10            ; save->v212; load->v212
              mov     r11            , qword [rsp+1688]; load->v211
              xor     r10            , r11            
              mov     qword [rsp+1696], r10            ; save->v212; load->v212
              and     r10            , -1             
              mov     qword [rsp+1696], r10            ; save->v212
              mov     r10            , qword [rsp+1704]; load->v213
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+1704], r10            ; save->v213
              mov     r10            , qword [rsp+1712]; load->v214
              mov     qword [rsp+1712], r14            ; load->v24; null; save->v214
              mov     r10            , qword [rsp+1712]; load->v214
              imul    r10            , 8              
              mov     qword [rsp+1712], r10            ; save->v214; load->v214
              add     r10            , 8              
              mov     qword [rsp+1712], r10            ; save->v214; load->v214
              mov     r11            , qword [rsp+1704]; load->v213
              add     r10            , r11            
              mov     qword [rsp+1712], r10            ; save->v214
              mov     r10            , qword [rsp+1720]; load->v215
              mov     r11            , qword [rsp+1712]; translate->qword [v214]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1720], r10            ; save->v215
              mov     qword [rsp+1728], 16             ; load->v216; null; save->v216
              mov     r10            , qword [rsp+1736]; load->v217
              mov     r10            , qword [rsp+200]; load->v25; null
              mov     qword [rsp+1736], r10            ; save->v217; load->v217
              mov     r11            , qword [rsp+1728]; load->v216
              sub     r10            , r11            
              mov     qword [rsp+1736], r10            ; save->v217
              mov     r10            , qword [rsp+1744]; load->v218
              mov     r10            , qword [rsp+1736]; load->v217; null
              mov     qword [rsp+1744], r10            ; save->v218; load->v218
              imul    r10            , 8              
              mov     qword [rsp+1744], r10            ; save->v218; load->v218
              add     r10            , 8              
              mov     qword [rsp+1744], r10            ; save->v218; load->v218
              mov     r11            , qword [rsp+1720]; load->v215
              add     r10            , r11            
              mov     qword [rsp+1744], r10            ; save->v218
              mov     r10            , qword [rsp+1752]; load->v219
              mov     r11            , qword [rsp+1744]; translate->qword [v218]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1752], r10            ; save->v219
              mov     r10            , qword [rsp+1760]; load->v220
              mov     r10            , qword [rsp+1696]; load->v212; null
              mov     qword [rsp+1760], r10            ; save->v220; load->v220
              mov     r11            , qword [rsp+1752]; load->v219
              xor     r10            , r11            
              mov     qword [rsp+1760], r10            ; save->v220; load->v220
              and     r10            , -1             
              mov     qword [rsp+1760], r10            ; save->v220
              mov     qword [rsp+1768], 1              ; load->v221; null; save->v221
_text__sha1_call4:
              mov     rdi            , qword [rsp+1760]; load->v220; null
              mov     rsi            , qword [rsp+1768]; load->v221; null
              call    _text__rotate_left                 
              mov     qword [rsp+1776], rax            ; load->v222; null; save->v222
              mov     r10            , qword [rsp+1784]; load->v223
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+1784], r10            ; save->v223
              mov     r10            , qword [rsp+1792]; load->v224
              mov     qword [rsp+1792], r14            ; load->v24; null; save->v224
              mov     r10            , qword [rsp+1792]; load->v224
              imul    r10            , 8              
              mov     qword [rsp+1792], r10            ; save->v224; load->v224
              add     r10            , 8              
              mov     qword [rsp+1792], r10            ; save->v224; load->v224
              mov     r11            , qword [rsp+1784]; load->v223
              add     r10            , r11            
              mov     qword [rsp+1792], r10            ; save->v224
              mov     r10            , qword [rsp+1800]; load->v225
              mov     r11            , qword [rsp+1792]; translate->qword [v224]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1800], r10            ; save->v225
              mov     r10            , qword [rsp+1808]; load->v226
              mov     r10            , qword [rsp+200]; load->v25; null
              mov     qword [rsp+1808], r10            ; save->v226; load->v226
              imul    r10            , 8              
              mov     qword [rsp+1808], r10            ; save->v226; load->v226
              add     r10            , 8              
              mov     qword [rsp+1808], r10            ; save->v226; load->v226
              mov     r11            , qword [rsp+1800]; load->v225
              add     r10            , r11            
              mov     qword [rsp+1808], r10            ; save->v226
              mov     r10            , qword [rsp+1816]; load->v227
              mov     r11            , qword [rsp+1808]; translate->qword [v226]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1816], r10            ; save->v227
              mov     r10            , qword [rsp+1808]; translate->qword [v226]
              mov     r11            , qword [rsp+1776]; load->v222
              mov     qword [r10]    , r11            ; assign->chunks[i][j]
_text__sha1_for4_continue:
              mov     r10            , qword [rsp+1824]; load->v228
              mov     r10            , qword [rsp+200]; load->v25; null
              mov     qword [rsp+1824], r10            ; save->v228
              mov     qword [rsp+1832], 1              ; load->v229; null; save->v229
              mov     r10            , qword [rsp+1840]; load->v230
              mov     r10            , qword [rsp+200]; load->v25; null
              mov     qword [rsp+1840], r10            ; save->v230; load->v230
              mov     r11            , qword [rsp+1832]; load->v229
              add     r10            , r11            
              mov     qword [rsp+1840], r10            ; save->v230
              mov     r10            , qword [rsp+200]; load->v25
              mov     r10            , qword [rsp+1840]; load->v230; assign->j
              mov     qword [rsp+200], r10            ; save->v25
              mov     qword [rsp+1848], 80             ; load->v231; null; save->v231
              mov     r10            , qword [rsp+200]; load->v25
              mov     r11            , qword [rsp+1848]; load->v231
              cmp     r10d           , r11d           
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+1856]; load->v232
              setl    r10b                            
              mov     qword [rsp+1856], r10            ; save->v232; load->v232
              and     r10            , 255            
              mov     qword [rsp+1856], r10            ; save->v232; load->v232
              cmp     r10b           , 0              
              mov     qword [rsp+1856], r10            ; save->v232
              jne     _text__sha1_for4_start                 
;----------------------------------]
;[----------------------------------
_text__sha1_for4_end:
              mov     r10            , rbx            ; load->v233
              mov     rbx            , qword [rsp+1360]; load->v170; init->a; save->v233
              mov     r10            , r12            ; load->v234
              mov     r12            , qword [rsp+1392]; load->v174; init->b; save->v234
              mov     r10            , r13            ; load->v235
              mov     r13            , qword [rsp+1424]; load->v178; init->c; save->v235
              mov     r10            , qword [rsp+1888]; load->v236
              mov     r10            , qword [rsp+1440]; load->v180; init->d
              mov     qword [rsp+1888], r10            ; save->v236
              mov     r10            , qword [rsp+1896]; load->v237
              mov     r10            , qword [rsp+1472]; load->v184; init->e
              mov     qword [rsp+1896], r10            ; save->v237
_text__sha1_for5_init:
              mov     r15            , 0              ; load->v238; null; save->v238
              mov     r10            , qword [rsp+200]; load->v25
              mov     qword [rsp+200], r15            ; load->v238; assign->j; save->v25
              mov     qword [rsp+1912], 80             ; load->v239; null; save->v239
              mov     r10            , qword [rsp+200]; load->v25
              mov     r11            , qword [rsp+1912]; load->v239
              cmp     r10d           , r11d           
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+1920]; load->v240
              setl    r10b                            
              mov     qword [rsp+1920], r10            ; save->v240; load->v240
              and     r10            , 255            
              mov     qword [rsp+1920], r10            ; save->v240
_text__sha1_for5_init_check:
              mov     r10            , qword [rsp+1920]; load->v240
              cmp     r10b           , 0              
              mov     qword [rsp+1920], r10            ; save->v240
              je      _text__sha1_for5_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_for5_start:
_text__sha1_if1_init:
              mov     qword [rsp+1944], 20             ; load->v243; null; save->v243
              mov     r10            , qword [rsp+200]; load->v25
              mov     r11            , qword [rsp+1944]; load->v243
              cmp     r10d           , r11d           
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+1952]; load->v244
              setl    r10b                            
              mov     qword [rsp+1952], r10            ; save->v244; load->v244
              and     r10            , 255            
              mov     qword [rsp+1952], r10            ; save->v244
_text__sha1_if1_check:
              mov     r10            , qword [rsp+1952]; load->v244
              cmp     r10b           , 0              
              mov     qword [rsp+1952], r10            ; save->v244
              je      _text__sha1_if1_else                 
;----------------------------------]
;[----------------------------------
_text__sha1_if1_start:
              mov     r10            , qword [rsp+1960]; load->v245
              mov     qword [rsp+1960], r12            ; load->v234; null; save->v245
              mov     r10            , qword [rsp+1960]; load->v245
              mov     r11            , r13            ; load->v235
              and     r10            , r11            
              mov     qword [rsp+1960], r10            ; save->v245
              mov     r10            , qword [rsp+1968]; load->v246
              mov     qword [rsp+1968], r12            ; load->v234; null; save->v246
              mov     r10            , qword [rsp+1968]; load->v246
              not     r10                             
              mov     qword [rsp+1968], r10            ; save->v246; load->v246
              and     r10            , -1             
              mov     qword [rsp+1968], r10            ; save->v246
              mov     r10            , qword [rsp+1976]; load->v247
              mov     r10            , qword [rsp+1968]; load->v246; null
              mov     qword [rsp+1976], r10            ; save->v247; load->v247
              mov     r11            , qword [rsp+1888]; load->v236
              and     r10            , r11            
              mov     qword [rsp+1976], r10            ; save->v247
              mov     r10            , qword [rsp+1984]; load->v248
              mov     r10            , qword [rsp+1960]; load->v245; null
              mov     qword [rsp+1984], r10            ; save->v248; load->v248
              mov     r11            , qword [rsp+1976]; load->v247
              or      r10            , r11            
              mov     qword [rsp+1984], r10            ; save->v248
              mov     r10            , qword [rsp+1928]; load->v241
              mov     r10            , qword [rsp+1984]; load->v248; assign->f
              mov     qword [rsp+1928], r10            ; save->v241
              mov     qword [rsp+1992], 1518500249     ; load->v249; null; save->v249
              mov     r10            , qword [rsp+1936]; load->v242
              mov     r10            , qword [rsp+1992]; load->v249; assign->k
              mov     qword [rsp+1936], r10            ; save->v242
              jmp     _text__sha1_if1_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_if1_else:
_text__sha1_if2_init:
              mov     qword [rsp+2000], 40             ; load->v250; null; save->v250
              mov     r10            , qword [rsp+200]; load->v25
              mov     r11            , qword [rsp+2000]; load->v250
              cmp     r10d           , r11d           
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+2008]; load->v251
              setl    r10b                            
              mov     qword [rsp+2008], r10            ; save->v251; load->v251
              and     r10            , 255            
              mov     qword [rsp+2008], r10            ; save->v251
_text__sha1_if2_check:
              mov     r10            , qword [rsp+2008]; load->v251
              cmp     r10b           , 0              
              mov     qword [rsp+2008], r10            ; save->v251
              je      _text__sha1_if2_else                 
;----------------------------------]
;[----------------------------------
_text__sha1_if2_start:
              mov     r10            , qword [rsp+2016]; load->v252
              mov     qword [rsp+2016], r12            ; load->v234; null; save->v252
              mov     r10            , qword [rsp+2016]; load->v252
              mov     r11            , r13            ; load->v235
              xor     r10            , r11            
              mov     qword [rsp+2016], r10            ; save->v252; load->v252
              and     r10            , -1             
              mov     qword [rsp+2016], r10            ; save->v252
              mov     r10            , qword [rsp+2024]; load->v253
              mov     r10            , qword [rsp+2016]; load->v252; null
              mov     qword [rsp+2024], r10            ; save->v253; load->v253
              mov     r11            , qword [rsp+1888]; load->v236
              xor     r10            , r11            
              mov     qword [rsp+2024], r10            ; save->v253; load->v253
              and     r10            , -1             
              mov     qword [rsp+2024], r10            ; save->v253
              mov     r10            , qword [rsp+1928]; load->v241
              mov     r10            , qword [rsp+2024]; load->v253; assign->f
              mov     qword [rsp+1928], r10            ; save->v241
              mov     qword [rsp+2032], 1859775393     ; load->v254; null; save->v254
              mov     r10            , qword [rsp+1936]; load->v242
              mov     r10            , qword [rsp+2032]; load->v254; assign->k
              mov     qword [rsp+1936], r10            ; save->v242
              jmp     _text__sha1_if2_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_if2_else:
_text__sha1_if3_init:
              mov     qword [rsp+2040], 60             ; load->v255; null; save->v255
              mov     r10            , qword [rsp+200]; load->v25
              mov     r11            , qword [rsp+2040]; load->v255
              cmp     r10d           , r11d           
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+2048]; load->v256
              setl    r10b                            
              mov     qword [rsp+2048], r10            ; save->v256; load->v256
              and     r10            , 255            
              mov     qword [rsp+2048], r10            ; save->v256
_text__sha1_if3_check:
              mov     r10            , qword [rsp+2048]; load->v256
              cmp     r10b           , 0              
              mov     qword [rsp+2048], r10            ; save->v256
              je      _text__sha1_if3_else                 
;----------------------------------]
;[----------------------------------
_text__sha1_if3_start:
              mov     r10            , qword [rsp+2056]; load->v257
              mov     qword [rsp+2056], r12            ; load->v234; null; save->v257
              mov     r10            , qword [rsp+2056]; load->v257
              mov     r11            , r13            ; load->v235
              and     r10            , r11            
              mov     qword [rsp+2056], r10            ; save->v257
              mov     r10            , qword [rsp+2064]; load->v258
              mov     qword [rsp+2064], r12            ; load->v234; null; save->v258
              mov     r10            , qword [rsp+2064]; load->v258
              mov     r11            , qword [rsp+1888]; load->v236
              and     r10            , r11            
              mov     qword [rsp+2064], r10            ; save->v258
              mov     r10            , qword [rsp+2072]; load->v259
              mov     r10            , qword [rsp+2056]; load->v257; null
              mov     qword [rsp+2072], r10            ; save->v259; load->v259
              mov     r11            , qword [rsp+2064]; load->v258
              or      r10            , r11            
              mov     qword [rsp+2072], r10            ; save->v259
              mov     r10            , qword [rsp+2080]; load->v260
              mov     qword [rsp+2080], r13            ; load->v235; null; save->v260
              mov     r10            , qword [rsp+2080]; load->v260
              mov     r11            , qword [rsp+1888]; load->v236
              and     r10            , r11            
              mov     qword [rsp+2080], r10            ; save->v260
              mov     r10            , qword [rsp+2088]; load->v261
              mov     r10            , qword [rsp+2072]; load->v259; null
              mov     qword [rsp+2088], r10            ; save->v261; load->v261
              mov     r11            , qword [rsp+2080]; load->v260
              or      r10            , r11            
              mov     qword [rsp+2088], r10            ; save->v261
              mov     r10            , qword [rsp+1928]; load->v241
              mov     r10            , qword [rsp+2088]; load->v261; assign->f
              mov     qword [rsp+1928], r10            ; save->v241
              mov     qword [rsp+2096], 48348          ; load->v262; null; save->v262
              mov     qword [rsp+2104], 36635          ; load->v263; null; save->v263
_text__sha1_call5:
              mov     rdi            , qword [rsp+2096]; load->v262; null
              mov     rsi            , qword [rsp+2104]; load->v263; null
              call    _text__lohi                     
              mov     qword [rsp+2112], rax            ; load->v264; null; save->v264
              mov     r10            , qword [rsp+1936]; load->v242
              mov     r10            , qword [rsp+2112]; load->v264; assign->k
              mov     qword [rsp+1936], r10            ; save->v242
              jmp     _text__sha1_if3_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_if3_else:
              mov     r10            , qword [rsp+2120]; load->v265
              mov     qword [rsp+2120], r12            ; load->v234; null; save->v265
              mov     r10            , qword [rsp+2120]; load->v265
              mov     r11            , r13            ; load->v235
              xor     r10            , r11            
              mov     qword [rsp+2120], r10            ; save->v265; load->v265
              and     r10            , -1             
              mov     qword [rsp+2120], r10            ; save->v265
              mov     r10            , qword [rsp+2128]; load->v266
              mov     r10            , qword [rsp+2120]; load->v265; null
              mov     qword [rsp+2128], r10            ; save->v266; load->v266
              mov     r11            , qword [rsp+1888]; load->v236
              xor     r10            , r11            
              mov     qword [rsp+2128], r10            ; save->v266; load->v266
              and     r10            , -1             
              mov     qword [rsp+2128], r10            ; save->v266
              mov     r10            , qword [rsp+1928]; load->v241
              mov     r10            , qword [rsp+2128]; load->v266; assign->f
              mov     qword [rsp+1928], r10            ; save->v241
              mov     qword [rsp+2136], 49622          ; load->v267; null; save->v267
              mov     qword [rsp+2144], 51810          ; load->v268; null; save->v268
_text__sha1_call6:
              mov     rdi            , qword [rsp+2136]; load->v267; null
              mov     rsi            , qword [rsp+2144]; load->v268; null
              call    _text__lohi                     
              mov     qword [rsp+2152], rax            ; load->v269; null; save->v269
              mov     r10            , qword [rsp+1936]; load->v242
              mov     r10            , qword [rsp+2152]; load->v269; assign->k
              mov     qword [rsp+1936], r10            ; save->v242
_text__sha1_if3_end:
_text__sha1_if2_end:
_text__sha1_if1_end:
              mov     qword [rsp+2160], 5              ; load->v270; null; save->v270
_text__sha1_call7:
              mov     rdi            , rbx            ; load->v233; null
              mov     rsi            , qword [rsp+2160]; load->v270; null
              call    _text__rotate_left                 
              mov     qword [rsp+2168], rax            ; load->v271; null; save->v271
_text__sha1_call8:
              mov     rdi            , qword [rsp+2168]; load->v271; null
              mov     rsi            , qword [rsp+1896]; load->v237; null
              call    _text__add                      
              mov     qword [rsp+2176], rax            ; load->v272; null; save->v272
_text__sha1_call9:
              mov     rdi            , qword [rsp+1928]; load->v241; null
              mov     rsi            , qword [rsp+1936]; load->v242; null
              call    _text__add                      
              mov     qword [rsp+2184], rax            ; load->v273; null; save->v273
_text__sha1_call10:
              mov     rdi            , qword [rsp+2176]; load->v272; null
              mov     rsi            , qword [rsp+2184]; load->v273; null
              call    _text__add                      
              mov     qword [rsp+2192], rax            ; load->v274; null; save->v274
              mov     r10            , qword [rsp+2200]; load->v275
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+2200], r10            ; save->v275
              mov     r10            , qword [rsp+2208]; load->v276
              mov     qword [rsp+2208], r14            ; load->v24; null; save->v276
              mov     r10            , qword [rsp+2208]; load->v276
              imul    r10            , 8              
              mov     qword [rsp+2208], r10            ; save->v276; load->v276
              add     r10            , 8              
              mov     qword [rsp+2208], r10            ; save->v276; load->v276
              mov     r11            , qword [rsp+2200]; load->v275
              add     r10            , r11            
              mov     qword [rsp+2208], r10            ; save->v276
              mov     r10            , qword [rsp+2216]; load->v277
              mov     r11            , qword [rsp+2208]; translate->qword [v276]
              mov     r10            , qword [r11]    
              mov     qword [rsp+2216], r10            ; save->v277
              mov     r10            , qword [rsp+2224]; load->v278
              mov     r10            , qword [rsp+200]; load->v25; null
              mov     qword [rsp+2224], r10            ; save->v278; load->v278
              imul    r10            , 8              
              mov     qword [rsp+2224], r10            ; save->v278; load->v278
              add     r10            , 8              
              mov     qword [rsp+2224], r10            ; save->v278; load->v278
              mov     r11            , qword [rsp+2216]; load->v277
              add     r10            , r11            
              mov     qword [rsp+2224], r10            ; save->v278
              mov     r10            , qword [rsp+2232]; load->v279
              mov     r11            , qword [rsp+2224]; translate->qword [v278]
              mov     r10            , qword [r11]    
              mov     qword [rsp+2232], r10            ; save->v279
_text__sha1_call11:
              mov     rdi            , qword [rsp+2192]; load->v274; null
              mov     rsi            , qword [rsp+2232]; load->v279; null
              call    _text__add                      
              mov     qword [rsp+2240], rax            ; load->v280; null; save->v280
              mov     r10            , qword [rsp+2248]; load->v281
              mov     r10            , qword [rsp+2240]; load->v280; init->temp
              mov     qword [rsp+2248], r10            ; save->v281
              mov     r10            , qword [rsp+1896]; load->v237
              mov     r10            , qword [rsp+1888]; load->v236; assign->e
              mov     qword [rsp+1896], r10            ; save->v237
              mov     r10            , qword [rsp+1888]; load->v236
              mov     qword [rsp+1888], r13            ; load->v235; assign->d; save->v236
              mov     qword [rsp+2256], 30             ; load->v282; null; save->v282
_text__sha1_call12:
              mov     rdi            , r12            ; load->v234; null
              mov     rsi            , qword [rsp+2256]; load->v282; null
              call    _text__rotate_left                 
              mov     qword [rsp+2264], rax            ; load->v283; null; save->v283
              mov     r10            , r13            ; load->v235
              mov     r13            , qword [rsp+2264]; load->v283; assign->c; save->v235
              mov     r10            , r12            ; load->v234
              mov     r12            , rbx            ; load->v233; assign->b; save->v234
              mov     r10            , rbx            ; load->v233
              mov     rbx            , qword [rsp+2248]; load->v281; assign->a; save->v233
_text__sha1_for5_continue:
              mov     r10            , qword [rsp+2272]; load->v284
              mov     r10            , qword [rsp+200]; load->v25; null
              mov     qword [rsp+2272], r10            ; save->v284
              mov     qword [rsp+2280], 1              ; load->v285; null; save->v285
              mov     r10            , qword [rsp+2288]; load->v286
              mov     r10            , qword [rsp+200]; load->v25; null
              mov     qword [rsp+2288], r10            ; save->v286; load->v286
              mov     r11            , qword [rsp+2280]; load->v285
              add     r10            , r11            
              mov     qword [rsp+2288], r10            ; save->v286
              mov     r10            , qword [rsp+200]; load->v25
              mov     r10            , qword [rsp+2288]; load->v286; assign->j
              mov     qword [rsp+200], r10            ; save->v25
              mov     qword [rsp+2296], 80             ; load->v287; null; save->v287
              mov     r10            , qword [rsp+200]; load->v25
              mov     r11            , qword [rsp+2296]; load->v287
              cmp     r10d           , r11d           
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+2304]; load->v288
              setl    r10b                            
              mov     qword [rsp+2304], r10            ; save->v288; load->v288
              and     r10            , 255            
              mov     qword [rsp+2304], r10            ; save->v288; load->v288
              cmp     r10b           , 0              
              mov     qword [rsp+2304], r10            ; save->v288
              jne     _text__sha1_for5_start                 
;----------------------------------]
;[----------------------------------
_text__sha1_for5_end:
_text__sha1_call13:
              mov     rdi            , qword [rsp+1360]; load->v170; null
              mov     rsi            , rbx            ; load->v233; null
              call    _text__add                      
              mov     qword [rsp+2312], rax            ; load->v289; null; save->v289
              mov     r10            , qword [rsp+1360]; load->v170
              mov     r10            , qword [rsp+2312]; load->v289; assign->h0
              mov     qword [rsp+1360], r10            ; save->v170
_text__sha1_call14:
              mov     rdi            , qword [rsp+1392]; load->v174; null
              mov     rsi            , r12            ; load->v234; null
              call    _text__add                      
              mov     qword [rsp+2320], rax            ; load->v290; null; save->v290
              mov     r10            , qword [rsp+1392]; load->v174
              mov     r10            , qword [rsp+2320]; load->v290; assign->h1
              mov     qword [rsp+1392], r10            ; save->v174
_text__sha1_call15:
              mov     rdi            , qword [rsp+1424]; load->v178; null
              mov     rsi            , r13            ; load->v235; null
              call    _text__add                      
              mov     qword [rsp+2328], rax            ; load->v291; null; save->v291
              mov     r10            , qword [rsp+1424]; load->v178
              mov     r10            , qword [rsp+2328]; load->v291; assign->h2
              mov     qword [rsp+1424], r10            ; save->v178
_text__sha1_call16:
              mov     rdi            , qword [rsp+1440]; load->v180; null
              mov     rsi            , qword [rsp+1888]; load->v236; null
              call    _text__add                      
              mov     qword [rsp+2336], rax            ; load->v292; null; save->v292
              mov     r10            , qword [rsp+1440]; load->v180
              mov     r10            , qword [rsp+2336]; load->v292; assign->h3
              mov     qword [rsp+1440], r10            ; save->v180
_text__sha1_call17:
              mov     rdi            , qword [rsp+1472]; load->v184; null
              mov     rsi            , qword [rsp+1896]; load->v237; null
              call    _text__add                      
              mov     qword [rsp+2344], rax            ; load->v293; null; save->v293
              mov     r10            , qword [rsp+1472]; load->v184
              mov     r10            , qword [rsp+2344]; load->v293; assign->h4
              mov     qword [rsp+1472], r10            ; save->v184
_text__sha1_for3_continue:
              mov     r10            , qword [rsp+2352]; load->v294
              mov     qword [rsp+2352], r14            ; load->v24; null; save->v294
              mov     qword [rsp+2360], 1              ; load->v295; null; save->v295
              mov     r10            , qword [rsp+2368]; load->v296
              mov     qword [rsp+2368], r14            ; load->v24; null; save->v296
              mov     r10            , qword [rsp+2368]; load->v296
              mov     r11            , qword [rsp+2360]; load->v295
              add     r10            , r11            
              mov     qword [rsp+2368], r10            ; save->v296
              mov     r10            , r14            ; load->v24
              mov     r14            , qword [rsp+2368]; load->v296; assign->i; save->v24
              mov     r10            , r14            ; load->v24
              mov     r11            , qword [rsp+144]; load->v18
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v24
              mov     r10            , qword [rsp+2376]; load->v297
              setl    r10b                            
              mov     qword [rsp+2376], r10            ; save->v297; load->v297
              and     r10            , 255            
              mov     qword [rsp+2376], r10            ; save->v297; load->v297
              cmp     r10b           , 0              
              mov     qword [rsp+2376], r10            ; save->v297
              jne     _text__sha1_for3_start                 
;----------------------------------]
;[----------------------------------
_text__sha1_for3_end:
              mov     r10            , rbx            ; load->v298
              mov     rbx            , [_data_bss_outputBuffer]; null; save->v298
              mov     r12            , 0              ; load->v299; null; save->v299
              mov     r10            , r13            ; load->v300
              mov     r13            , r12            ; load->v299; null; save->v300
              mov     r10            , r13            ; load->v300
              imul    r10            , 8              
              mov     r13            , r10            ; save->v300; load->v300
              add     r10            , 8              
              mov     r13            , r10            ; save->v300; load->v300
              mov     r11            , rbx            ; load->v298
              add     r10            , r11            
              mov     r13            , r10            ; save->v300
              mov     r10            , rbx            ; load->v301
              mov     r11            , r13            ; translate->qword [v300]
              mov     rbx            , qword [r11]    ; null; save->v301
              mov     r10            , r13            ; translate->qword [v300]
              mov     r11            , qword [rsp+1360]; load->v170
              mov     qword [r10]    , r11            ; assign->outputBuffer[0]
              mov     r10            , rbx            ; load->v302
              mov     rbx            , [_data_bss_outputBuffer]; null; save->v302
              mov     r12            , 1              ; load->v303; null; save->v303
              mov     r10            , r13            ; load->v304
              mov     r13            , r12            ; load->v303; null; save->v304
              mov     r10            , r13            ; load->v304
              imul    r10            , 8              
              mov     r13            , r10            ; save->v304; load->v304
              add     r10            , 8              
              mov     r13            , r10            ; save->v304; load->v304
              mov     r11            , rbx            ; load->v302
              add     r10            , r11            
              mov     r13            , r10            ; save->v304
              mov     r10            , rbx            ; load->v305
              mov     r11            , r13            ; translate->qword [v304]
              mov     rbx            , qword [r11]    ; null; save->v305
              mov     r10            , r13            ; translate->qword [v304]
              mov     r11            , qword [rsp+1392]; load->v174
              mov     qword [r10]    , r11            ; assign->outputBuffer[1]
              mov     r10            , rbx            ; load->v306
              mov     rbx            , [_data_bss_outputBuffer]; null; save->v306
              mov     r12            , 2              ; load->v307; null; save->v307
              mov     r10            , r13            ; load->v308
              mov     r13            , r12            ; load->v307; null; save->v308
              mov     r10            , r13            ; load->v308
              imul    r10            , 8              
              mov     r13            , r10            ; save->v308; load->v308
              add     r10            , 8              
              mov     r13            , r10            ; save->v308; load->v308
              mov     r11            , rbx            ; load->v306
              add     r10            , r11            
              mov     r13            , r10            ; save->v308
              mov     r10            , rbx            ; load->v309
              mov     r11            , r13            ; translate->qword [v308]
              mov     rbx            , qword [r11]    ; null; save->v309
              mov     r10            , r13            ; translate->qword [v308]
              mov     r11            , qword [rsp+1424]; load->v178
              mov     qword [r10]    , r11            ; assign->outputBuffer[2]
              mov     r10            , rbx            ; load->v310
              mov     rbx            , [_data_bss_outputBuffer]; null; save->v310
              mov     r12            , 3              ; load->v311; null; save->v311
              mov     r10            , r13            ; load->v312
              mov     r13            , r12            ; load->v311; null; save->v312
              mov     r10            , r13            ; load->v312
              imul    r10            , 8              
              mov     r13            , r10            ; save->v312; load->v312
              add     r10            , 8              
              mov     r13            , r10            ; save->v312; load->v312
              mov     r11            , rbx            ; load->v310
              add     r10            , r11            
              mov     r13            , r10            ; save->v312
              mov     r10            , rbx            ; load->v313
              mov     r11            , r13            ; translate->qword [v312]
              mov     rbx            , qword [r11]    ; null; save->v313
              mov     r10            , r13            ; translate->qword [v312]
              mov     r11            , qword [rsp+1440]; load->v180
              mov     qword [r10]    , r11            ; assign->outputBuffer[3]
              mov     r10            , rbx            ; load->v314
              mov     rbx            , [_data_bss_outputBuffer]; null; save->v314
              mov     r12            , 4              ; load->v315; null; save->v315
              mov     r10            , r13            ; load->v316
              mov     r13            , r12            ; load->v315; null; save->v316
              mov     r10            , r13            ; load->v316
              imul    r10            , 8              
              mov     r13            , r10            ; save->v316; load->v316
              add     r10            , 8              
              mov     r13            , r10            ; save->v316; load->v316
              mov     r11            , rbx            ; load->v314
              add     r10            , r11            
              mov     r13            , r10            ; save->v316
              mov     r10            , rbx            ; load->v317
              mov     r11            , r13            ; translate->qword [v316]
              mov     rbx            , qword [r11]    ; null; save->v317
              mov     r10            , r13            ; translate->qword [v316]
              mov     r11            , qword [rsp+1472]; load->v184
              mov     qword [r10]    , r11            ; assign->outputBuffer[4]
              mov     r10            , rbx            ; load->v318
              mov     rbx            , [_data_bss_outputBuffer]; null; save->v318
_text__sha1_ret1:
              mov     rax            , rbx            ; load->v318; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 2552           
              ret                                     
;----------------------------------]
;[----------------------------------
_text__sha1_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 2552           
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__computeSHA1 ] ---
;[----------------------------------
_text__computeSHA1:
              sub     rsp            , 312            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbx            , rdi            ; load->v6; null; save->v6
_text__computeSHA1_for0_init:
              mov     r13            , 0              ; load->v8; null; save->v8
              mov     r10            , r12            ; load->v7
              mov     r12            , r13            ; load->v8; assign->i; save->v7
_text__computeSHA1_call0:
              mov     rdi            , rbx            ; load->v6; null
              call    _text_built_in_string_length                 
              mov     qword [rsp+72] , rax            ; load->v9; null; save->v9
              mov     r10            , r12            ; load->v7
              mov     r11            , qword [rsp+72] ; load->v9
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , r14            ; load->v10
              setl    r10b                            
              mov     r14            , r10            ; save->v10; load->v10
              and     r10            , 255            
              mov     r14            , r10            ; save->v10
_text__computeSHA1_for0_init_check:
              mov     r10            , r14            ; load->v10
              cmp     r10b           , 0              
              mov     r14            , r10            ; save->v10
              je      _text__computeSHA1_for0_end                 
;----------------------------------]
;[----------------------------------
_text__computeSHA1_for0_start:
_text__computeSHA1_call1:
              mov     rdi            , rbx            ; load->v6; null
              mov     rsi            , r12            ; load->v7; null
              call    _text_built_in_string_ord                 
              mov     qword [rsp+88] , rax            ; load->v11; null; save->v11
              mov     r10            , r15            ; load->v12
              mov     r15            , [_data_bss_inputBuffer]; null; save->v12
              mov     r10            , qword [rsp+104]; load->v13
              mov     qword [rsp+104], r12            ; load->v7; null; save->v13
              mov     r10            , qword [rsp+104]; load->v13
              imul    r10            , 8              
              mov     qword [rsp+104], r10            ; save->v13; load->v13
              add     r10            , 8              
              mov     qword [rsp+104], r10            ; save->v13; load->v13
              mov     r11            , r15            ; load->v12
              add     r10            , r11            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+104]; translate->qword [v13]
              mov     r10            , qword [r11]    
              mov     qword [rsp+112], r10            ; save->v14
              mov     r10            , qword [rsp+104]; translate->qword [v13]
              mov     r11            , qword [rsp+88] ; load->v11
              mov     qword [r10]    , r11            ; assign->inputBuffer[i]
_text__computeSHA1_for0_continue:
              mov     r10            , qword [rsp+120]; load->v15
              mov     qword [rsp+120], r12            ; load->v7; null; save->v15
              mov     qword [rsp+128], 1              ; load->v16; null; save->v16
              mov     r10            , qword [rsp+136]; load->v17
              mov     qword [rsp+136], r12            ; load->v7; null; save->v17
              mov     r10            , qword [rsp+136]; load->v17
              mov     r11            , qword [rsp+128]; load->v16
              add     r10            , r11            
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , r12            ; load->v7
              mov     r12            , qword [rsp+136]; load->v17; assign->i; save->v7
_text__computeSHA1_call2:
              mov     rdi            , rbx            ; load->v6; null
              call    _text_built_in_string_length                 
              mov     qword [rsp+144], rax            ; load->v18; null; save->v18
              mov     r10            , r12            ; load->v7
              mov     r11            , qword [rsp+144]; load->v18
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , qword [rsp+152]; load->v19
              setl    r10b                            
              mov     qword [rsp+152], r10            ; save->v19; load->v19
              and     r10            , 255            
              mov     qword [rsp+152], r10            ; save->v19; load->v19
              cmp     r10b           , 0              
              mov     qword [rsp+152], r10            ; save->v19
              jne     _text__computeSHA1_for0_start                 
;----------------------------------]
;[----------------------------------
_text__computeSHA1_for0_end:
              mov     r10            , r13            ; load->v20
              mov     r13            , [_data_bss_inputBuffer]; null; save->v20
_text__computeSHA1_call3:
              mov     rdi            , rbx            ; load->v6; null
              call    _text_built_in_string_length                 
              mov     qword [rsp+168], rax            ; load->v21; null; save->v21
_text__computeSHA1_call4:
              mov     rdi            , r13            ; load->v20; null
              mov     rsi            , qword [rsp+168]; load->v21; null
              call    _text__sha1                     
              mov     rbx            , rax            ; load->v22; null; save->v22
              mov     r10            , r13            ; load->v23
              mov     r13            , rbx            ; load->v22; init->result; save->v23
_text__computeSHA1_for1_init:
              mov     rbx            , 0              ; load->v24; null; save->v24
              mov     r10            , r12            ; load->v7
              mov     r12            , rbx            ; load->v24; assign->i; save->v7
_text__computeSHA1_call5:
              mov     rdi            , r13            ; load->v23; null
              call    _text_built_in_array_size                 
              mov     qword [rsp+200], rax            ; load->v25; null; save->v25
              mov     r10            , r12            ; load->v7
              mov     r11            , qword [rsp+200]; load->v25
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , r14            ; load->v26
              setl    r10b                            
              mov     r14            , r10            ; save->v26; load->v26
              and     r10            , 255            
              mov     r14            , r10            ; save->v26
_text__computeSHA1_for1_init_check:
              mov     r10            , r14            ; load->v26
              cmp     r10b           , 0              
              mov     r14            , r10            ; save->v26
              je      _text__computeSHA1_for1_end                 
;----------------------------------]
;[----------------------------------
_text__computeSHA1_for1_start:
              mov     r10            , r15            ; load->v27
              mov     r15            , r12            ; load->v7; null; save->v27
              mov     r10            , r15            ; load->v27
              imul    r10            , 8              
              mov     r15            , r10            ; save->v27; load->v27
              add     r10            , 8              
              mov     r15            , r10            ; save->v27; load->v27
              mov     r11            , r13            ; load->v23
              add     r10            , r11            
              mov     r15            , r10            ; save->v27
              mov     r10            , qword [rsp+224]; load->v28
              mov     r11            , r15            ; translate->qword [v27]
              mov     r10            , qword [r11]    
              mov     qword [rsp+224], r10            ; save->v28
_text__computeSHA1_call6:
              mov     rdi            , qword [rsp+224]; load->v28; null
              call    _text__toStringHex                 
              mov     qword [rsp+232], rax            ; load->v29; null; save->v29
_text__computeSHA1_call7:
              mov     rdi            , qword [rsp+232]; load->v29; null
              call    _text__print                    
              mov     qword [rsp+240], rax            ; load->v30; null; save->v30
_text__computeSHA1_for1_continue:
              mov     r10            , qword [rsp+248]; load->v31
              mov     qword [rsp+248], r12            ; load->v7; null; save->v31
              mov     qword [rsp+256], 1              ; load->v32; null; save->v32
              mov     r10            , qword [rsp+264]; load->v33
              mov     qword [rsp+264], r12            ; load->v7; null; save->v33
              mov     r10            , qword [rsp+264]; load->v33
              mov     r11            , qword [rsp+256]; load->v32
              add     r10            , r11            
              mov     qword [rsp+264], r10            ; save->v33
              mov     r10            , r12            ; load->v7
              mov     r12            , qword [rsp+264]; load->v33; assign->i; save->v7
_text__computeSHA1_call8:
              mov     rdi            , r13            ; load->v23; null
              call    _text_built_in_array_size                 
              mov     qword [rsp+272], rax            ; load->v34; null; save->v34
              mov     r10            , r12            ; load->v7
              mov     r11            , qword [rsp+272]; load->v34
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , qword [rsp+280]; load->v35
              setl    r10b                            
              mov     qword [rsp+280], r10            ; save->v35; load->v35
              and     r10            , 255            
              mov     qword [rsp+280], r10            ; save->v35; load->v35
              cmp     r10b           , 0              
              mov     qword [rsp+280], r10            ; save->v35
              jne     _text__computeSHA1_for1_start                 
;----------------------------------]
;[----------------------------------
_text__computeSHA1_for1_end:
              mov     rbx            , _data_s3       ; load->v36; null; save->v36
_text__computeSHA1_call9:
              mov     rdi            , rbx            ; load->v36; null
              call    _text__println                  
              mov     rbx            , rax            ; load->v37; null; save->v37
_text__computeSHA1_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 312            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__nextLetter ] ---
;[----------------------------------
_text__nextLetter:
              sub     rsp            , 152            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbx            , rdi            ; load->v6; null; save->v6
_text__nextLetter_if0_init:
              mov     r12            , 122            ; load->v7; null; save->v7
              mov     r10            , rbx            ; load->v6
              mov     r11            , r12            ; load->v7
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , r12            ; load->v8
              sete    r10b                            
              mov     r12            , r10            ; save->v8; load->v8
              and     r10            , 255            
              mov     r12            , r10            ; save->v8
_text__nextLetter_if0_check:
              mov     r10            , r12            ; load->v8
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v8
              je      _text__nextLetter_if0_else                 
;----------------------------------]
;[----------------------------------
_text__nextLetter_if0_start:
              mov     r12            , 1              ; load->v9; null; save->v9
              mov     r10            , r13            ; load->v10
              mov     r13            , r12            ; load->v9; null; save->v10
              mov     r10            , r13            ; load->v10
              neg     r10                             
              mov     r13            , r10            ; save->v10
_text__nextLetter_ret0:
              mov     rax            , r13            ; load->v10; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 152            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__nextLetter_if0_end                 
;----------------------------------]
;[----------------------------------
_text__nextLetter_if0_else:
_text__nextLetter_if0_end:
_text__nextLetter_if1_init:
              mov     r12            , 90             ; load->v11; null; save->v11
              mov     r10            , rbx            ; load->v6
              mov     r11            , r12            ; load->v11
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , r12            ; load->v12
              sete    r10b                            
              mov     r12            , r10            ; save->v12; load->v12
              and     r10            , 255            
              mov     r12            , r10            ; save->v12
_text__nextLetter_if1_check:
              mov     r10            , r12            ; load->v12
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v12
              je      _text__nextLetter_if1_else                 
;----------------------------------]
;[----------------------------------
_text__nextLetter_if1_start:
              mov     r12            , 97             ; load->v13; null; save->v13
_text__nextLetter_ret1:
              mov     rax            , r12            ; load->v13; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 152            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__nextLetter_if1_end                 
;----------------------------------]
;[----------------------------------
_text__nextLetter_if1_else:
_text__nextLetter_if1_end:
_text__nextLetter_if2_init:
              mov     r12            , 57             ; load->v14; null; save->v14
              mov     r10            , rbx            ; load->v6
              mov     r11            , r12            ; load->v14
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , r12            ; load->v15
              sete    r10b                            
              mov     r12            , r10            ; save->v15; load->v15
              and     r10            , 255            
              mov     r12            , r10            ; save->v15
_text__nextLetter_if2_check:
              mov     r10            , r12            ; load->v15
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v15
              je      _text__nextLetter_if2_else                 
;----------------------------------]
;[----------------------------------
_text__nextLetter_if2_start:
              mov     r12            , 65             ; load->v16; null; save->v16
_text__nextLetter_ret2:
              mov     rax            , r12            ; load->v16; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 152            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__nextLetter_if2_end                 
;----------------------------------]
;[----------------------------------
_text__nextLetter_if2_else:
_text__nextLetter_if2_end:
              mov     r12            , 1              ; load->v17; null; save->v17
              mov     r10            , r13            ; load->v18
              mov     r13            , rbx            ; load->v6; null; save->v18
              mov     r10            , r13            ; load->v18
              mov     r11            , r12            ; load->v17
              add     r10            , r11            
              mov     r13            , r10            ; save->v18
_text__nextLetter_ret3:
              mov     rax            , r13            ; load->v18; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 152            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__nextLetter_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 152            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__nextText ] ---
;[----------------------------------
_text__nextText:
              sub     rsp            , 264            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbx            , rdi            ; load->v6; null; save->v6
              mov     r12            , rsi            ; load->v7; null; save->v7
_text__nextText_for0_init:
              mov     r14            , 1              ; load->v9; null; save->v9
              mov     r10            , r15            ; load->v10
              mov     r15            , r12            ; load->v7; null; save->v10
              mov     r10            , r15            ; load->v10
              mov     r11            , r14            ; load->v9
              sub     r10            , r11            
              mov     r15            , r10            ; save->v10
              mov     r10            , r13            ; load->v8
              mov     r13            , r15            ; load->v10; assign->i; save->v8
              mov     qword [rsp+88] , 0              ; load->v11; null; save->v11
              mov     r10            , r13            ; load->v8
              mov     r11            , qword [rsp+88] ; load->v11
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v8
              mov     r10            , qword [rsp+96] ; load->v12
              setge   r10b                            
              mov     qword [rsp+96] , r10            ; save->v12; load->v12
              and     r10            , 255            
              mov     qword [rsp+96] , r10            ; save->v12
_text__nextText_for0_init_check:
              mov     r10            , qword [rsp+96] ; load->v12
              cmp     r10b           , 0              
              mov     qword [rsp+96] , r10            ; save->v12
              je      _text__nextText_for0_end                 
;----------------------------------]
;[----------------------------------
_text__nextText_for0_start:
              mov     r10            , qword [rsp+104]; load->v13
              mov     qword [rsp+104], r13            ; load->v8; null; save->v13
              mov     r10            , qword [rsp+104]; load->v13
              imul    r10            , 8              
              mov     qword [rsp+104], r10            ; save->v13; load->v13
              add     r10            , 8              
              mov     qword [rsp+104], r10            ; save->v13; load->v13
              mov     r11            , rbx            ; load->v6
              add     r10            , r11            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+104]; translate->qword [v13]
              mov     r10            , qword [r11]    
              mov     qword [rsp+112], r10            ; save->v14
_text__nextText_call0:
              mov     rdi            , qword [rsp+112]; load->v14; null
              call    _text__nextLetter                 
              mov     qword [rsp+120], rax            ; load->v15; null; save->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     qword [rsp+128], r13            ; load->v8; null; save->v16
              mov     r10            , qword [rsp+128]; load->v16
              imul    r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16; load->v16
              add     r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16; load->v16
              mov     r11            , rbx            ; load->v6
              add     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+136]; load->v17
              mov     r11            , qword [rsp+128]; translate->qword [v16]
              mov     r10            , qword [r11]    
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+128]; translate->qword [v16]
              mov     r11            , qword [rsp+120]; load->v15
              mov     qword [r10]    , r11            ; assign->now[i]
_text__nextText_if0_init:
              mov     r10            , qword [rsp+144]; load->v18
              mov     qword [rsp+144], r13            ; load->v8; null; save->v18
              mov     r10            , qword [rsp+144]; load->v18
              imul    r10            , 8              
              mov     qword [rsp+144], r10            ; save->v18; load->v18
              add     r10            , 8              
              mov     qword [rsp+144], r10            ; save->v18; load->v18
              mov     r11            , rbx            ; load->v6
              add     r10            , r11            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r11            , qword [rsp+144]; translate->qword [v18]
              mov     r10            , qword [r11]    
              mov     qword [rsp+152], r10            ; save->v19
              mov     qword [rsp+160], 1              ; load->v20; null; save->v20
              mov     r10            , qword [rsp+168]; load->v21
              mov     r10            , qword [rsp+160]; load->v20; null
              mov     qword [rsp+168], r10            ; save->v21; load->v21
              neg     r10                             
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+152]; load->v19
              mov     r11            , qword [rsp+168]; load->v21
              cmp     r10d           , r11d           
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+176]; load->v22
              sete    r10b                            
              mov     qword [rsp+176], r10            ; save->v22; load->v22
              and     r10            , 255            
              mov     qword [rsp+176], r10            ; save->v22
_text__nextText_if0_check:
              mov     r10            , qword [rsp+176]; load->v22
              cmp     r10b           , 0              
              mov     qword [rsp+176], r10            ; save->v22
              je      _text__nextText_if0_else                 
;----------------------------------]
;[----------------------------------
_text__nextText_if0_start:
              mov     qword [rsp+184], 48             ; load->v23; null; save->v23
              mov     r10            , qword [rsp+192]; load->v24
              mov     qword [rsp+192], r13            ; load->v8; null; save->v24
              mov     r10            , qword [rsp+192]; load->v24
              imul    r10            , 8              
              mov     qword [rsp+192], r10            ; save->v24; load->v24
              add     r10            , 8              
              mov     qword [rsp+192], r10            ; save->v24; load->v24
              mov     r11            , rbx            ; load->v6
              add     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , qword [rsp+200]; load->v25
              mov     r11            , qword [rsp+192]; translate->qword [v24]
              mov     r10            , qword [r11]    
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+192]; translate->qword [v24]
              mov     r11            , qword [rsp+184]; load->v23
              mov     qword [r10]    , r11            ; assign->now[i]
              jmp     _text__nextText_if0_end                 
;----------------------------------]
;[----------------------------------
_text__nextText_if0_else:
              mov     qword [rsp+208], 255            ; load->v26; null; save->v26
_text__nextText_ret0:
              mov     rax            , qword [rsp+208]; load->v26; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 264            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__nextText_if0_end:
_text__nextText_for0_continue:
              mov     r10            , qword [rsp+216]; load->v27
              mov     qword [rsp+216], r13            ; load->v8; null; save->v27
              mov     qword [rsp+224], 1              ; load->v28; null; save->v28
              mov     r10            , qword [rsp+232]; load->v29
              mov     qword [rsp+232], r13            ; load->v8; null; save->v29
              mov     r10            , qword [rsp+232]; load->v29
              mov     r11            , qword [rsp+224]; load->v28
              sub     r10            , r11            
              mov     qword [rsp+232], r10            ; save->v29
              mov     r10            , r13            ; load->v8
              mov     r13            , qword [rsp+232]; load->v29; assign->i; save->v8
              mov     qword [rsp+240], 0              ; load->v30; null; save->v30
              mov     r10            , r13            ; load->v8
              mov     r11            , qword [rsp+240]; load->v30
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v8
              mov     r10            , qword [rsp+248]; load->v31
              setge   r10b                            
              mov     qword [rsp+248], r10            ; save->v31; load->v31
              and     r10            , 255            
              mov     qword [rsp+248], r10            ; save->v31; load->v31
              cmp     r10b           , 0              
              mov     qword [rsp+248], r10            ; save->v31
              jne     _text__nextText_for0_start                 
;----------------------------------]
;[----------------------------------
_text__nextText_for0_end:
              mov     rbx            , 0              ; load->v32; null; save->v32
_text__nextText_ret1:
              mov     rax            , rbx            ; load->v32; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 264            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__nextText_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 264            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__array_equal ] ---
;[----------------------------------
_text__array_equal:
              sub     rsp            , 232            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbx            , rdi            ; load->v6; null; save->v6
              mov     r12            , rsi            ; load->v7; null; save->v7
_text__array_equal_if0_init:
_text__array_equal_call0:
              mov     rdi            , rbx            ; load->v6; null
              call    _text_built_in_array_size                 
              mov     qword [rsp+64] , rax            ; load->v8; null; save->v8
_text__array_equal_call1:
              mov     rdi            , r12            ; load->v7; null
              call    _text_built_in_array_size                 
              mov     qword [rsp+72] , rax            ; load->v9; null; save->v9
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r11            , qword [rsp+72] ; load->v9
              cmp     r10d           , r11d           
              mov     qword [rsp+64] , r10            ; save->v8
              mov     r10            , r13            ; load->v10
              setne   r10b                            
              mov     r13            , r10            ; save->v10; load->v10
              and     r10            , 255            
              mov     r13            , r10            ; save->v10
_text__array_equal_if0_check:
              mov     r10            , r13            ; load->v10
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v10
              je      _text__array_equal_if0_else                 
;----------------------------------]
;[----------------------------------
_text__array_equal_if0_start:
              mov     r13            , 0              ; load->v11; null; save->v11
_text__array_equal_ret0:
              mov     rax            , r13            ; load->v11; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 232            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__array_equal_if0_end                 
;----------------------------------]
;[----------------------------------
_text__array_equal_if0_else:
_text__array_equal_if0_end:
_text__array_equal_for0_init:
              mov     r14            , 0              ; load->v13; null; save->v13
              mov     r10            , r13            ; load->v12
              mov     r13            , r14            ; load->v13; assign->i; save->v12
_text__array_equal_call2:
              mov     rdi            , rbx            ; load->v6; null
              call    _text_built_in_array_size                 
              mov     qword [rsp+112], rax            ; load->v14; null; save->v14
              mov     r10            , r13            ; load->v12
              mov     r11            , qword [rsp+112]; load->v14
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v12
              mov     r10            , r15            ; load->v15
              setl    r10b                            
              mov     r15            , r10            ; save->v15; load->v15
              and     r10            , 255            
              mov     r15            , r10            ; save->v15
_text__array_equal_for0_init_check:
              mov     r10            , r15            ; load->v15
              cmp     r10b           , 0              
              mov     r15            , r10            ; save->v15
              je      _text__array_equal_for0_end                 
;----------------------------------]
;[----------------------------------
_text__array_equal_for0_start:
_text__array_equal_if1_init:
              mov     r10            , qword [rsp+128]; load->v16
              mov     qword [rsp+128], r13            ; load->v12; null; save->v16
              mov     r10            , qword [rsp+128]; load->v16
              imul    r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16; load->v16
              add     r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16; load->v16
              mov     r11            , rbx            ; load->v6
              add     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+136]; load->v17
              mov     r11            , qword [rsp+128]; translate->qword [v16]
              mov     r10            , qword [r11]    
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+144]; load->v18
              mov     qword [rsp+144], r13            ; load->v12; null; save->v18
              mov     r10            , qword [rsp+144]; load->v18
              imul    r10            , 8              
              mov     qword [rsp+144], r10            ; save->v18; load->v18
              add     r10            , 8              
              mov     qword [rsp+144], r10            ; save->v18; load->v18
              mov     r11            , r12            ; load->v7
              add     r10            , r11            
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , qword [rsp+152]; load->v19
              mov     r11            , qword [rsp+144]; translate->qword [v18]
              mov     r10            , qword [r11]    
              mov     qword [rsp+152], r10            ; save->v19
              mov     r10            , qword [rsp+136]; load->v17
              mov     r11            , qword [rsp+152]; load->v19
              cmp     r10d           , r11d           
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+160]; load->v20
              setne   r10b                            
              mov     qword [rsp+160], r10            ; save->v20; load->v20
              and     r10            , 255            
              mov     qword [rsp+160], r10            ; save->v20
_text__array_equal_if1_check:
              mov     r10            , qword [rsp+160]; load->v20
              cmp     r10b           , 0              
              mov     qword [rsp+160], r10            ; save->v20
              je      _text__array_equal_if1_else                 
;----------------------------------]
;[----------------------------------
_text__array_equal_if1_start:
              mov     qword [rsp+168], 0              ; load->v21; null; save->v21
_text__array_equal_ret1:
              mov     rax            , qword [rsp+168]; load->v21; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 232            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__array_equal_if1_end                 
;----------------------------------]
;[----------------------------------
_text__array_equal_if1_else:
_text__array_equal_if1_end:
_text__array_equal_for0_continue:
              mov     r10            , qword [rsp+176]; load->v22
              mov     qword [rsp+176], r13            ; load->v12; null; save->v22
              mov     qword [rsp+184], 1              ; load->v23; null; save->v23
              mov     r10            , qword [rsp+192]; load->v24
              mov     qword [rsp+192], r13            ; load->v12; null; save->v24
              mov     r10            , qword [rsp+192]; load->v24
              mov     r11            , qword [rsp+184]; load->v23
              add     r10            , r11            
              mov     qword [rsp+192], r10            ; save->v24
              mov     r10            , r13            ; load->v12
              mov     r13            , qword [rsp+192]; load->v24; assign->i; save->v12
_text__array_equal_call3:
              mov     rdi            , rbx            ; load->v6; null
              call    _text_built_in_array_size                 
              mov     qword [rsp+200], rax            ; load->v25; null; save->v25
              mov     r10            , r13            ; load->v12
              mov     r11            , qword [rsp+200]; load->v25
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v12
              mov     r10            , qword [rsp+208]; load->v26
              setl    r10b                            
              mov     qword [rsp+208], r10            ; save->v26; load->v26
              and     r10            , 255            
              mov     qword [rsp+208], r10            ; save->v26; load->v26
              cmp     r10b           , 0              
              mov     qword [rsp+208], r10            ; save->v26
              jne     _text__array_equal_for0_start                 
;----------------------------------]
;[----------------------------------
_text__array_equal_for0_end:
              mov     rbx            , 255            ; load->v27; null; save->v27
_text__array_equal_ret2:
              mov     rax            , rbx            ; load->v27; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 232            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__array_equal_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 232            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__crackSHA1 ] ---
;[----------------------------------
_text__crackSHA1:
              sub     rsp            , 872            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     qword [rsp+16] , r12            ; load->v2; null; save->v2
              mov     qword [rsp+24] , r13            ; load->v3; null; save->v3
              mov     qword [rsp+32] , r14            ; load->v4; null; save->v4
              mov     qword [rsp+40] , r15            ; load->v5; null; save->v5
              mov     rbx            , rdi            ; load->v6; null; save->v6
              mov     qword [rsp+56] , 5              ; load->v7; null; save->v7
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , qword [rsp+56] ; load->v7; null
              mov     qword [rsp+64] , r10            ; save->v8; load->v8
              imul    r10            , 8              
              mov     qword [rsp+64] , r10            ; save->v8; load->v8
              add     r10            , 8              
              mov     qword [rsp+64] , r10            ; save->v8
              mov     rdi            , qword [rsp+64] ; load->v8; null
              call    malloc                          
              mov     qword [rsp+72] , rax            ; load->v9; null; save->v9
              mov     r11            , qword [rsp+56] ; load->v7
              mov     qword [rax]    , r11            
              mov     r10            , qword [rsp+80] ; load->v10
              mov     r10            , qword [rsp+72] ; load->v9; init->target
              mov     qword [rsp+80] , r10            ; save->v10
_text__crackSHA1_if0_init:
_text__crackSHA1_call0:
              mov     rdi            , rbx            ; load->v6; null
              call    _text_built_in_string_length                 
              mov     qword [rsp+88] , rax            ; load->v11; null; save->v11
              mov     r13            , 40             ; load->v12; null; save->v12
              mov     r10            , qword [rsp+88] ; load->v11
              mov     r11            , r13            ; load->v12
              cmp     r10d           , r11d           
              mov     qword [rsp+88] , r10            ; save->v11
              mov     r10            , r13            ; load->v13
              setne   r10b                            
              mov     r13            , r10            ; save->v13; load->v13
              and     r10            , 255            
              mov     r13            , r10            ; save->v13
_text__crackSHA1_if0_check:
              mov     r10            , r13            ; load->v13
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v13
              je      _text__crackSHA1_if0_else                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_if0_start:
              mov     r13            , _data_s5       ; load->v14; null; save->v14
_text__crackSHA1_call1:
              mov     rdi            , r13            ; load->v14; null
              call    _text__println                  
              mov     r13            , rax            ; load->v15; null; save->v15
_text__crackSHA1_ret0:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 872            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__crackSHA1_if0_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_if0_else:
_text__crackSHA1_if0_end:
_text__crackSHA1_for0_init:
              mov     r14            , 0              ; load->v17; null; save->v17
              mov     r10            , r13            ; load->v16
              mov     r13            , r14            ; load->v17; assign->i; save->v16
              mov     r15            , 5              ; load->v18; null; save->v18
              mov     r10            , r13            ; load->v16
              mov     r11            , r15            ; load->v18
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v16
              mov     r10            , qword [rsp+152]; load->v19
              setl    r10b                            
              mov     qword [rsp+152], r10            ; save->v19; load->v19
              and     r10            , 255            
              mov     qword [rsp+152], r10            ; save->v19
_text__crackSHA1_for0_init_check:
              mov     r10            , qword [rsp+152]; load->v19
              cmp     r10b           , 0              
              mov     qword [rsp+152], r10            ; save->v19
              je      _text__crackSHA1_for0_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for0_start:
              mov     qword [rsp+160], 0              ; load->v20; null; save->v20
              mov     r10            , qword [rsp+168]; load->v21
              mov     qword [rsp+168], r13            ; load->v16; null; save->v21
              mov     r10            , qword [rsp+168]; load->v21
              imul    r10            , 8              
              mov     qword [rsp+168], r10            ; save->v21; load->v21
              add     r10            , 8              
              mov     qword [rsp+168], r10            ; save->v21; load->v21
              mov     r11            , qword [rsp+80] ; load->v10
              add     r10            , r11            
              mov     qword [rsp+168], r10            ; save->v21
              mov     r10            , qword [rsp+176]; load->v22
              mov     r11            , qword [rsp+168]; translate->qword [v21]
              mov     r10            , qword [r11]    
              mov     qword [rsp+176], r10            ; save->v22
              mov     r10            , qword [rsp+168]; translate->qword [v21]
              mov     r11            , qword [rsp+160]; load->v20
              mov     qword [r10]    , r11            ; assign->target[i]
_text__crackSHA1_for0_continue:
              mov     r10            , qword [rsp+184]; load->v23
              mov     qword [rsp+184], r13            ; load->v16; null; save->v23
              mov     qword [rsp+192], 1              ; load->v24; null; save->v24
              mov     r10            , qword [rsp+200]; load->v25
              mov     qword [rsp+200], r13            ; load->v16; null; save->v25
              mov     r10            , qword [rsp+200]; load->v25
              mov     r11            , qword [rsp+192]; load->v24
              add     r10            , r11            
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , r13            ; load->v16
              mov     r13            , qword [rsp+200]; load->v25; assign->i; save->v16
              mov     qword [rsp+208], 5              ; load->v26; null; save->v26
              mov     r10            , r13            ; load->v16
              mov     r11            , qword [rsp+208]; load->v26
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v16
              mov     r10            , qword [rsp+216]; load->v27
              setl    r10b                            
              mov     qword [rsp+216], r10            ; save->v27; load->v27
              and     r10            , 255            
              mov     qword [rsp+216], r10            ; save->v27; load->v27
              cmp     r10b           , 0              
              mov     qword [rsp+216], r10            ; save->v27
              jne     _text__crackSHA1_for0_start                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for0_end:
_text__crackSHA1_for1_init:
              mov     r14            , 0              ; load->v28; null; save->v28
              mov     r10            , r13            ; load->v16
              mov     r13            , r14            ; load->v28; assign->i; save->v16
              mov     r15            , 40             ; load->v29; null; save->v29
              mov     r10            , r13            ; load->v16
              mov     r11            , r15            ; load->v29
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v16
              mov     r10            , qword [rsp+240]; load->v30
              setl    r10b                            
              mov     qword [rsp+240], r10            ; save->v30; load->v30
              and     r10            , 255            
              mov     qword [rsp+240], r10            ; save->v30
_text__crackSHA1_for1_init_check:
              mov     r10            , qword [rsp+240]; load->v30
              cmp     r10b           , 0              
              mov     qword [rsp+240], r10            ; save->v30
              je      _text__crackSHA1_for1_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for1_start:
              mov     qword [rsp+248], 8              ; load->v31; null; save->v31
              mov     qword [rsp+264], rdx            ; load->v33; null; save->v33
              mov     qword [rsp+272], rax            ; load->v34; null; save->v34
              mov     rax            , r13            ; load->v16; null
              and     rax            , -1             
              mov     r10            , qword [rsp+248]; load->v31
              and     r10d           , -1             
              mov     qword [rsp+248], r10            ; save->v31
              cqo                                     
              mov     r10            , qword [rsp+248]; load->v31
              idiv    r10d                            
              mov     qword [rsp+248], r10            ; save->v31
              mov     qword [rsp+256], rax            ; load->v32; null; save->v32
              mov     rdx            , qword [rsp+264]; load->v33; null
              mov     rax            , qword [rsp+272]; load->v34; null
              mov     r10            , qword [rsp+280]; load->v35
              mov     r10            , qword [rsp+256]; load->v32; null
              mov     qword [rsp+280], r10            ; save->v35; load->v35
              imul    r10            , 8              
              mov     qword [rsp+280], r10            ; save->v35; load->v35
              add     r10            , 8              
              mov     qword [rsp+280], r10            ; save->v35; load->v35
              mov     r11            , qword [rsp+80] ; load->v10
              add     r10            , r11            
              mov     qword [rsp+280], r10            ; save->v35
              mov     r10            , qword [rsp+288]; load->v36
              mov     r11            , qword [rsp+280]; translate->qword [v35]
              mov     r10            , qword [r11]    
              mov     qword [rsp+288], r10            ; save->v36
              mov     qword [rsp+296], 3              ; load->v37; null; save->v37
              mov     r10            , qword [rsp+304]; load->v38
              mov     qword [rsp+304], r13            ; load->v16; null; save->v38
              mov     r10            , qword [rsp+304]; load->v38
              mov     r11            , qword [rsp+296]; load->v37
              add     r10            , r11            
              mov     qword [rsp+304], r10            ; save->v38
_text__crackSHA1_call2:
              mov     rdi            , rbx            ; load->v6; null
              mov     rsi            , r13            ; load->v16; null
              mov     rdx            , qword [rsp+304]; load->v38; null
              call    _text_built_in_string_substring                 
              mov     qword [rsp+312], rax            ; load->v39; null; save->v39
_text__crackSHA1_call3:
              mov     rdi            , qword [rsp+312]; load->v39; null
              call    _text__hex2int                  
              mov     qword [rsp+320], rax            ; load->v40; null; save->v40
              mov     qword [rsp+328], 1              ; load->v41; null; save->v41
              mov     qword [rsp+336], 4              ; load->v42; null; save->v42
              mov     qword [rsp+352], rdx            ; load->v44; null; save->v44
              mov     qword [rsp+360], rax            ; load->v45; null; save->v45
              mov     rax            , r13            ; load->v16; null
              and     rax            , -1             
              mov     r10            , qword [rsp+336]; load->v42
              and     r10d           , -1             
              mov     qword [rsp+336], r10            ; save->v42
              cqo                                     
              mov     r10            , qword [rsp+336]; load->v42
              idiv    r10d                            
              mov     qword [rsp+336], r10            ; save->v42
              mov     qword [rsp+344], rax            ; load->v43; null; save->v43
              mov     rdx            , qword [rsp+352]; load->v44; null
              mov     rax            , qword [rsp+360]; load->v45; null
              mov     qword [rsp+368], 2              ; load->v46; null; save->v46
              mov     qword [rsp+384], rdx            ; load->v48; null; save->v48
              mov     qword [rsp+392], rax            ; load->v49; null; save->v49
              mov     rax            , qword [rsp+344]; load->v43; null
              and     rax            , -1             
              mov     r10            , qword [rsp+368]; load->v46
              and     r10d           , -1             
              mov     qword [rsp+368], r10            ; save->v46
              cqo                                     
              mov     r10            , qword [rsp+368]; load->v46
              idiv    r10d                            
              mov     qword [rsp+368], r10            ; save->v46
              mov     qword [rsp+376], rdx            ; load->v47; null; save->v47
              mov     rdx            , qword [rsp+384]; load->v48; null
              mov     rax            , qword [rsp+392]; load->v49; null
              mov     r10            , qword [rsp+400]; load->v50
              mov     r10            , qword [rsp+328]; load->v41; null
              mov     qword [rsp+400], r10            ; save->v50; load->v50
              mov     r11            , qword [rsp+376]; load->v47
              sub     r10            , r11            
              mov     qword [rsp+400], r10            ; save->v50
              mov     qword [rsp+408], 16             ; load->v51; null; save->v51
              mov     r10            , qword [rsp+416]; load->v52
              mov     r10            , qword [rsp+400]; load->v50; null
              mov     qword [rsp+416], r10            ; save->v52; load->v52
              mov     r11            , qword [rsp+408]; load->v51
              imul    r10            , r11            
              mov     qword [rsp+416], r10            ; save->v52; load->v52
              and     r10            , -1             
              mov     qword [rsp+416], r10            ; save->v52
              mov     qword [rsp+432], rcx            ; load->v54; null; save->v54
              mov     r10            , qword [rsp+424]; load->v53
              mov     r10            , qword [rsp+320]; load->v40; null
              mov     qword [rsp+424], r10            ; save->v53
              mov     rcx            , qword [rsp+416]; load->v52; null
              mov     r10            , qword [rsp+424]; load->v53
              and     r10            , -1             
              mov     qword [rsp+424], r10            ; save->v53; load->v53
              sal     r10d           , cl             
              mov     qword [rsp+424], r10            ; save->v53
              mov     rcx            , qword [rsp+432]; load->v54; null
              mov     r10            , qword [rsp+440]; load->v55
              mov     r10            , qword [rsp+288]; load->v36; null
              mov     qword [rsp+440], r10            ; save->v55; load->v55
              mov     r11            , qword [rsp+424]; load->v53
              or      r10            , r11            
              mov     qword [rsp+440], r10            ; save->v55
              mov     qword [rsp+448], 8              ; load->v56; null; save->v56
              mov     qword [rsp+464], rdx            ; load->v58; null; save->v58
              mov     qword [rsp+472], rax            ; load->v59; null; save->v59
              mov     rax            , r13            ; load->v16; null
              and     rax            , -1             
              mov     r10            , qword [rsp+448]; load->v56
              and     r10d           , -1             
              mov     qword [rsp+448], r10            ; save->v56
              cqo                                     
              mov     r10            , qword [rsp+448]; load->v56
              idiv    r10d                            
              mov     qword [rsp+448], r10            ; save->v56
              mov     qword [rsp+456], rax            ; load->v57; null; save->v57
              mov     rdx            , qword [rsp+464]; load->v58; null
              mov     rax            , qword [rsp+472]; load->v59; null
              mov     r10            , qword [rsp+480]; load->v60
              mov     r10            , qword [rsp+456]; load->v57; null
              mov     qword [rsp+480], r10            ; save->v60; load->v60
              imul    r10            , 8              
              mov     qword [rsp+480], r10            ; save->v60; load->v60
              add     r10            , 8              
              mov     qword [rsp+480], r10            ; save->v60; load->v60
              mov     r11            , qword [rsp+80] ; load->v10
              add     r10            , r11            
              mov     qword [rsp+480], r10            ; save->v60
              mov     r10            , qword [rsp+488]; load->v61
              mov     r11            , qword [rsp+480]; translate->qword [v60]
              mov     r10            , qword [r11]    
              mov     qword [rsp+488], r10            ; save->v61
              mov     r10            , qword [rsp+480]; translate->qword [v60]
              mov     r11            , qword [rsp+440]; load->v55
              mov     qword [r10]    , r11            ; assign->target[i/8]
_text__crackSHA1_for1_continue:
              mov     qword [rsp+496], 4              ; load->v62; null; save->v62
              mov     r10            , qword [rsp+504]; load->v63
              mov     qword [rsp+504], r13            ; load->v16; null; save->v63
              mov     r10            , qword [rsp+504]; load->v63
              mov     r11            , qword [rsp+496]; load->v62
              add     r10            , r11            
              mov     qword [rsp+504], r10            ; save->v63
              mov     r10            , r13            ; load->v16
              mov     r13            , qword [rsp+504]; load->v63; assign->i; save->v16
              mov     qword [rsp+512], 40             ; load->v64; null; save->v64
              mov     r10            , r13            ; load->v16
              mov     r11            , qword [rsp+512]; load->v64
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v16
              mov     r10            , qword [rsp+520]; load->v65
              setl    r10b                            
              mov     qword [rsp+520], r10            ; save->v65; load->v65
              and     r10            , 255            
              mov     qword [rsp+520], r10            ; save->v65; load->v65
              cmp     r10b           , 0              
              mov     qword [rsp+520], r10            ; save->v65
              jne     _text__crackSHA1_for1_start                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for1_end:
              mov     rbx            , 4              ; load->v66; null; save->v66
              mov     r10            , qword [rsp+536]; load->v67
              mov     qword [rsp+536], rbx            ; load->v66; init->MAXDIGIT; save->v67
_text__crackSHA1_for2_init:
              mov     qword [rsp+552], 1              ; load->v69; null; save->v69
              mov     r10            , rbx            ; load->v68
              mov     rbx            , qword [rsp+552]; load->v69; assign->digit; save->v68
              mov     r10            , rbx            ; load->v68
              mov     r11            , qword [rsp+536]; load->v67
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v68
              mov     r10            , qword [rsp+560]; load->v70
              setle   r10b                            
              mov     qword [rsp+560], r10            ; save->v70; load->v70
              and     r10            , 255            
              mov     qword [rsp+560], r10            ; save->v70
_text__crackSHA1_for2_init_check:
              mov     r10            , qword [rsp+560]; load->v70
              cmp     r10b           , 0              
              mov     qword [rsp+560], r10            ; save->v70
              je      _text__crackSHA1_for2_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for2_start:
_text__crackSHA1_for3_init:
              mov     r14            , 0              ; load->v71; null; save->v71
              mov     r10            , r13            ; load->v16
              mov     r13            , r14            ; load->v71; assign->i; save->v16
              mov     r10            , r13            ; load->v16
              mov     r11            , rbx            ; load->v68
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v16
              mov     r10            , r15            ; load->v72
              setl    r10b                            
              mov     r15            , r10            ; save->v72; load->v72
              and     r10            , 255            
              mov     r15            , r10            ; save->v72
_text__crackSHA1_for3_init_check:
              mov     r10            , r15            ; load->v72
              cmp     r10b           , 0              
              mov     r15            , r10            ; save->v72
              je      _text__crackSHA1_for3_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for3_start:
              mov     qword [rsp+584], 48             ; load->v73; null; save->v73
              mov     r10            , qword [rsp+592]; load->v74
              mov     r10            , [_data_bss_inputBuffer]
              mov     qword [rsp+592], r10            ; save->v74
              mov     r10            , qword [rsp+600]; load->v75
              mov     qword [rsp+600], r13            ; load->v16; null; save->v75
              mov     r10            , qword [rsp+600]; load->v75
              imul    r10            , 8              
              mov     qword [rsp+600], r10            ; save->v75; load->v75
              add     r10            , 8              
              mov     qword [rsp+600], r10            ; save->v75; load->v75
              mov     r11            , qword [rsp+592]; load->v74
              add     r10            , r11            
              mov     qword [rsp+600], r10            ; save->v75
              mov     r10            , qword [rsp+608]; load->v76
              mov     r11            , qword [rsp+600]; translate->qword [v75]
              mov     r10            , qword [r11]    
              mov     qword [rsp+608], r10            ; save->v76
              mov     r10            , qword [rsp+600]; translate->qword [v75]
              mov     r11            , qword [rsp+584]; load->v73
              mov     qword [r10]    , r11            ; assign->inputBuffer[i]
_text__crackSHA1_for3_continue:
              mov     r10            , qword [rsp+616]; load->v77
              mov     qword [rsp+616], r13            ; load->v16; null; save->v77
              mov     qword [rsp+624], 1              ; load->v78; null; save->v78
              mov     r10            , qword [rsp+632]; load->v79
              mov     qword [rsp+632], r13            ; load->v16; null; save->v79
              mov     r10            , qword [rsp+632]; load->v79
              mov     r11            , qword [rsp+624]; load->v78
              add     r10            , r11            
              mov     qword [rsp+632], r10            ; save->v79
              mov     r10            , r13            ; load->v16
              mov     r13            , qword [rsp+632]; load->v79; assign->i; save->v16
              mov     r10            , r13            ; load->v16
              mov     r11            , rbx            ; load->v68
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v16
              mov     r10            , qword [rsp+640]; load->v80
              setl    r10b                            
              mov     qword [rsp+640], r10            ; save->v80; load->v80
              and     r10            , 255            
              mov     qword [rsp+640], r10            ; save->v80; load->v80
              cmp     r10b           , 0              
              mov     qword [rsp+640], r10            ; save->v80
              jne     _text__crackSHA1_for3_start                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for3_end:
_text__crackSHA1_for4_init:
              mov     qword [rsp+648], 255            ; load->v81; null; save->v81
_text__crackSHA1_for4_init_check:
              mov     r10            , qword [rsp+648]; load->v81
              cmp     r10b           , 0              
              mov     qword [rsp+648], r10            ; save->v81
              je      _text__crackSHA1_for4_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for4_start:
              mov     r10            , qword [rsp+656]; load->v82
              mov     r10            , [_data_bss_inputBuffer]
              mov     qword [rsp+656], r10            ; save->v82
_text__crackSHA1_call4:
              mov     rdi            , qword [rsp+656]; load->v82; null
              mov     rsi            , rbx            ; load->v68; null
              call    _text__sha1                     
              mov     qword [rsp+664], rax            ; load->v83; null; save->v83
              mov     r10            , qword [rsp+672]; load->v84
              mov     r10            , qword [rsp+664]; load->v83; init->out
              mov     qword [rsp+672], r10            ; save->v84
_text__crackSHA1_if1_init:
_text__crackSHA1_call5:
              mov     rdi            , qword [rsp+672]; load->v84; null
              mov     rsi            , qword [rsp+80] ; load->v10; null
              call    _text__array_equal                 
              mov     qword [rsp+680], rax            ; load->v85; null; save->v85
_text__crackSHA1_if1_check:
              mov     r10            , qword [rsp+680]; load->v85
              cmp     r10b           , 0              
              mov     qword [rsp+680], r10            ; save->v85
              je      _text__crackSHA1_if1_else                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_if1_start:
_text__crackSHA1_for5_init:
              mov     r12            , 0              ; load->v86; null; save->v86
              mov     r10            , r13            ; load->v16
              mov     r13            , r12            ; load->v86; assign->i; save->v16
              mov     r10            , r13            ; load->v16
              mov     r11            , rbx            ; load->v68
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v16
              mov     r10            , r15            ; load->v87
              setl    r10b                            
              mov     r15            , r10            ; save->v87; load->v87
              and     r10            , 255            
              mov     r15            , r10            ; save->v87
_text__crackSHA1_for5_init_check:
              mov     r10            , r15            ; load->v87
              cmp     r10b           , 0              
              mov     r15            , r10            ; save->v87
              je      _text__crackSHA1_for5_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for5_start:
              mov     r10            , r14            ; load->v88
              mov     r14            , [_data_bss_inputBuffer]; null; save->v88
              mov     r10            , qword [rsp+712]; load->v89
              mov     qword [rsp+712], r13            ; load->v16; null; save->v89
              mov     r10            , qword [rsp+712]; load->v89
              imul    r10            , 8              
              mov     qword [rsp+712], r10            ; save->v89; load->v89
              add     r10            , 8              
              mov     qword [rsp+712], r10            ; save->v89; load->v89
              mov     r11            , r14            ; load->v88
              add     r10            , r11            
              mov     qword [rsp+712], r10            ; save->v89
              mov     r10            , qword [rsp+720]; load->v90
              mov     r11            , qword [rsp+712]; translate->qword [v89]
              mov     r10            , qword [r11]    
              mov     qword [rsp+720], r10            ; save->v90
_text__crackSHA1_call6:
              mov     rdi            , qword [rsp+720]; load->v90; null
              call    _text__int2chr                  
              mov     qword [rsp+728], rax            ; load->v91; null; save->v91
_text__crackSHA1_call7:
              mov     rdi            , qword [rsp+728]; load->v91; null
              call    _text__print                    
              mov     qword [rsp+736], rax            ; load->v92; null; save->v92
_text__crackSHA1_for5_continue:
              mov     r10            , qword [rsp+744]; load->v93
              mov     qword [rsp+744], r13            ; load->v16; null; save->v93
              mov     qword [rsp+752], 1              ; load->v94; null; save->v94
              mov     r10            , qword [rsp+760]; load->v95
              mov     qword [rsp+760], r13            ; load->v16; null; save->v95
              mov     r10            , qword [rsp+760]; load->v95
              mov     r11            , qword [rsp+752]; load->v94
              add     r10            , r11            
              mov     qword [rsp+760], r10            ; save->v95
              mov     r10            , r13            ; load->v16
              mov     r13            , qword [rsp+760]; load->v95; assign->i; save->v16
              mov     r10            , r13            ; load->v16
              mov     r11            , rbx            ; load->v68
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v16
              mov     r10            , qword [rsp+768]; load->v96
              setl    r10b                            
              mov     qword [rsp+768], r10            ; save->v96; load->v96
              and     r10            , 255            
              mov     qword [rsp+768], r10            ; save->v96; load->v96
              cmp     r10b           , 0              
              mov     qword [rsp+768], r10            ; save->v96
              jne     _text__crackSHA1_for5_start                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for5_end:
              mov     qword [rsp+776], _data_s3       ; load->v97; null; save->v97
_text__crackSHA1_call8:
              mov     rdi            , qword [rsp+776]; load->v97; null
              call    _text__println                  
              mov     qword [rsp+784], rax            ; load->v98; null; save->v98
_text__crackSHA1_ret1:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 872            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__crackSHA1_if1_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_if1_else:
_text__crackSHA1_if1_end:
_text__crackSHA1_if2_init:
              mov     r10            , qword [rsp+792]; load->v99
              mov     r10            , [_data_bss_inputBuffer]
              mov     qword [rsp+792], r10            ; save->v99
_text__crackSHA1_call9:
              mov     rdi            , qword [rsp+792]; load->v99; null
              mov     rsi            , rbx            ; load->v68; null
              call    _text__nextText                 
              mov     qword [rsp+800], rax            ; load->v100; null; save->v100
              mov     r10            , qword [rsp+808]; load->v101
              mov     r10            , qword [rsp+800]; load->v100; null
              mov     qword [rsp+808], r10            ; save->v101; load->v101
              not     r10                             
              mov     qword [rsp+808], r10            ; save->v101; load->v101
              and     r10            , -1             
              mov     qword [rsp+808], r10            ; save->v101
_text__crackSHA1_if2_check:
              mov     r10            , qword [rsp+808]; load->v101
              cmp     r10b           , 0              
              mov     qword [rsp+808], r10            ; save->v101
              je      _text__crackSHA1_if2_else                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_if2_start:
_text__crackSHA1_for4_break0:
              jmp     _text__crackSHA1_for4_end                 
;----------------------------------]
;[----------------------------------
              jmp     _text__crackSHA1_if2_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_if2_else:
_text__crackSHA1_if2_end:
_text__crackSHA1_for4_continue:
              mov     qword [rsp+816], 255            ; load->v102; null; save->v102
              mov     r10            , qword [rsp+816]; load->v102
              cmp     r10b           , 0              
              mov     qword [rsp+816], r10            ; save->v102
              jne     _text__crackSHA1_for4_start                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for4_end:
_text__crackSHA1_for2_continue:
              mov     r10            , qword [rsp+824]; load->v103
              mov     qword [rsp+824], rbx            ; load->v68; null; save->v103
              mov     qword [rsp+832], 1              ; load->v104; null; save->v104
              mov     r10            , qword [rsp+840]; load->v105
              mov     qword [rsp+840], rbx            ; load->v68; null; save->v105
              mov     r10            , qword [rsp+840]; load->v105
              mov     r11            , qword [rsp+832]; load->v104
              add     r10            , r11            
              mov     qword [rsp+840], r10            ; save->v105
              mov     r10            , rbx            ; load->v68
              mov     rbx            , qword [rsp+840]; load->v105; assign->digit; save->v68
              mov     r10            , rbx            ; load->v68
              mov     r11            , qword [rsp+536]; load->v67
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v68
              mov     r10            , qword [rsp+848]; load->v106
              setle   r10b                            
              mov     qword [rsp+848], r10            ; save->v106; load->v106
              and     r10            , 255            
              mov     qword [rsp+848], r10            ; save->v106; load->v106
              cmp     r10b           , 0              
              mov     qword [rsp+848], r10            ; save->v106
              jne     _text__crackSHA1_for2_start                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for2_end:
              mov     rbx            , _data_s6       ; load->v107; null; save->v107
_text__crackSHA1_call10:
              mov     rdi            , rbx            ; load->v107; null
              call    _text__println                  
              mov     rbx            , rax            ; load->v108; null; save->v108
_text__crackSHA1_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 872            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 184            
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
_text__main_for0_init:
              mov     r13            , 255            ; load->v8; null; save->v8
_text__main_for0_init_check:
              mov     r10            , r13            ; load->v8
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v8
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
_text__main_call0:
              call    _text__getInt                   
              mov     r14            , rax            ; load->v9; null; save->v9
              mov     r10            , rbx            ; load->v6
              mov     rbx            , r14            ; load->v9; assign->op; save->v6
_text__main_if0_init:
              mov     r15            , 0              ; load->v10; null; save->v10
              mov     r10            , rbx            ; load->v6
              mov     r11            , r15            ; load->v10
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , qword [rsp+88] ; load->v11
              sete    r10b                            
              mov     qword [rsp+88] , r10            ; save->v11; load->v11
              and     r10            , 255            
              mov     qword [rsp+88] , r10            ; save->v11
_text__main_if0_check:
              mov     r10            , qword [rsp+88] ; load->v11
              cmp     r10b           , 0              
              mov     qword [rsp+88] , r10            ; save->v11
              je      _text__main_if0_else                 
;----------------------------------]
;[----------------------------------
_text__main_if0_start:
_text__main_for0_break0:
              jmp     _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
              jmp     _text__main_if0_end                 
;----------------------------------]
;[----------------------------------
_text__main_if0_else:
_text__main_if0_end:
_text__main_if1_init:
              mov     qword [rsp+96] , 1              ; load->v12; null; save->v12
              mov     r10            , rbx            ; load->v6
              mov     r11            , qword [rsp+96] ; load->v12
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , qword [rsp+104]; load->v13
              sete    r10b                            
              mov     qword [rsp+104], r10            ; save->v13; load->v13
              and     r10            , 255            
              mov     qword [rsp+104], r10            ; save->v13
_text__main_if1_check:
              mov     r10            , qword [rsp+104]; load->v13
              cmp     r10b           , 0              
              mov     qword [rsp+104], r10            ; save->v13
              je      _text__main_if1_else                 
;----------------------------------]
;[----------------------------------
_text__main_if1_start:
_text__main_call1:
              call    _text__getString                 
              mov     qword [rsp+112], rax            ; load->v14; null; save->v14
              mov     r10            , r12            ; load->v7
              mov     r12            , qword [rsp+112]; load->v14; assign->input; save->v7
_text__main_call2:
              mov     rdi            , r12            ; load->v7; null
              call    _text__computeSHA1                 
              mov     qword [rsp+120], rax            ; load->v15; null; save->v15
              jmp     _text__main_if1_end                 
;----------------------------------]
;[----------------------------------
_text__main_if1_else:
_text__main_if2_init:
              mov     qword [rsp+128], 2              ; load->v16; null; save->v16
              mov     r10            , rbx            ; load->v6
              mov     r11            , qword [rsp+128]; load->v16
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , qword [rsp+136]; load->v17
              sete    r10b                            
              mov     qword [rsp+136], r10            ; save->v17; load->v17
              and     r10            , 255            
              mov     qword [rsp+136], r10            ; save->v17
_text__main_if2_check:
              mov     r10            , qword [rsp+136]; load->v17
              cmp     r10b           , 0              
              mov     qword [rsp+136], r10            ; save->v17
              je      _text__main_if2_else                 
;----------------------------------]
;[----------------------------------
_text__main_if2_start:
_text__main_call3:
              call    _text__getString                 
              mov     qword [rsp+144], rax            ; load->v18; null; save->v18
              mov     r10            , r12            ; load->v7
              mov     r12            , qword [rsp+144]; load->v18; assign->input; save->v7
_text__main_call4:
              mov     rdi            , r12            ; load->v7; null
              call    _text__crackSHA1                 
              mov     qword [rsp+152], rax            ; load->v19; null; save->v19
              jmp     _text__main_if2_end                 
;----------------------------------]
;[----------------------------------
_text__main_if2_else:
_text__main_if2_end:
_text__main_if1_end:
_text__main_for0_continue:
              mov     qword [rsp+160], 255            ; load->v20; null; save->v20
              mov     r10            , qword [rsp+160]; load->v20
              cmp     r10b           , 0              
              mov     qword [rsp+160], r10            ; save->v20
              jne     _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
              mov     rbx            , 0              ; load->v21; null; save->v21
_text__main_ret0:
              mov     rax            , rbx            ; load->v21; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 184            
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
              add     rsp            , 184            
              ret                                     
;----------------------------------]
                                                      
