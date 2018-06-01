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
              mov     rbx            , rax            ; load->v17
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
              mov     rbx            , rdi            ; load->v6
              mov     r12            , _data_s1       ; load->v7
_text__println_call0:
              mov     rdi            , r12            ; load->v7
              mov     rsi            , rbx            ; load->v6
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
              mov     rbx            , rax            ; load->v17
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
              sub     rsp            , 520            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     rbx            , _data_s2       ; load->v6
              mov     [_data_bss_asciiTable], rbx            ; load->v6
              mov     rbx            , 100            ; load->v7
              mov     [_data_bss_MAXCHUNK], rbx            ; load->v7
              mov     r10            , rbx            ; load->v8
              mov     rbx            , [_data_bss_MAXCHUNK]
              mov     r12            , 1              ; load->v9
              mov     r10            , r13            ; load->v10
              mov     r13            , rbx            ; load->v8
              mov     r10            , r13            ; load->v10
              mov     r11            , r12            ; load->v9
              sub     r10            , r11            
              mov     r13            , r10            ; save->v10
              mov     rbx            , 64             ; load->v11
              mov     r10            , r12            ; load->v12
              mov     r12            , r13            ; load->v10
              mov     r10            , r12            ; load->v12
              mov     r11            , rbx            ; load->v11
              imul    r10            , r11            
              mov     r12            , r10            ; save->v12
              and     r10            , -1             
              mov     r12            , r10            ; save->v12
              mov     rbx            , 16             ; load->v13
              mov     r10            , r13            ; load->v14
              mov     r13            , r12            ; load->v12
              mov     r10            , r13            ; load->v14
              mov     r11            , rbx            ; load->v13
              sub     r10            , r11            
              mov     r13            , r10            ; save->v14
              mov     [_data_bss_MAXLENGTH], r13            ; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r10            , [_data_bss_MAXCHUNK]
              mov     qword [rsp+120], r10            ; save->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , qword [rsp+120]; load->v15
              mov     qword [rsp+128], r10            ; save->v16
              imul    r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16
              add     r10            , 8              
              mov     qword [rsp+128], r10            ; save->v16
_datainit_saveReg0_save:
              mov     qword [rsp+136], rax            ; load->v17
              mov     qword [rsp+144], rdi            ; load->v18
              mov     qword [rsp+152], rsi            ; load->v19
              mov     qword [rsp+160], rdx            ; load->v20
              mov     qword [rsp+168], rcx            ; load->v21
              mov     qword [rsp+176], r8             ; load->v22
              mov     qword [rsp+184], r9             ; load->v23
              mov     r10            , qword [rsp+192]; load->v24
              mov     qword [rsp+200], r11            ; load->v25
              mov     rdi            , qword [rsp+128]; load->v16
              call    malloc                          
              mov     qword [rsp+208], rax            ; load->v26
              mov     r11            , qword [rsp+120]; load->v15
              mov     qword [rax]    , r11            
_datainit_saveReg0_load:
              mov     rax            , qword [rsp+136]; load->v17
              mov     rdi            , qword [rsp+144]; load->v18
              mov     rsi            , qword [rsp+152]; load->v19
              mov     rdx            , qword [rsp+160]; load->v20
              mov     rcx            , qword [rsp+168]; load->v21
              mov     r8             , qword [rsp+176]; load->v22
              mov     r9             , qword [rsp+184]; load->v23
              mov     r10            , qword [rsp+192]; load->v24
              mov     r11            , qword [rsp+200]; load->v25
              mov     r10            , rbx            ; load->v27
              mov     rbx            , qword [rsp+120]; load->v15
              mov     r10            , r12            ; load->v28
              mov     r12            , qword [rsp+208]; load->v26
              mov     r10            , r12            ; load->v28
              add     r10            , 8              
              mov     r12            , r10            ; save->v28
_datainit_new0_expand_start:
              mov     qword [rsp+232], 80             ; load->v29
              mov     r10            , qword [rsp+240]; load->v30
              mov     r10            , qword [rsp+232]; load->v29
              mov     qword [rsp+240], r10            ; save->v30
              imul    r10            , 8              
              mov     qword [rsp+240], r10            ; save->v30
              add     r10            , 8              
              mov     qword [rsp+240], r10            ; save->v30
_datainit_saveReg1_save:
              mov     qword [rsp+248], rax            ; load->v31
              mov     qword [rsp+256], rdi            ; load->v32
              mov     qword [rsp+264], rsi            ; load->v33
              mov     qword [rsp+272], rdx            ; load->v34
              mov     qword [rsp+280], rcx            ; load->v35
              mov     qword [rsp+288], r8             ; load->v36
              mov     qword [rsp+296], r9             ; load->v37
              mov     r10            , qword [rsp+304]; load->v38
              mov     qword [rsp+312], r11            ; load->v39
              mov     rdi            , qword [rsp+240]; load->v30
              call    malloc                          
              mov     qword [rsp+320], rax            ; load->v40
              mov     r11            , qword [rsp+232]; load->v29
              mov     qword [rax]    , r11            
_datainit_saveReg1_load:
              mov     rax            , qword [rsp+248]; load->v31
              mov     rdi            , qword [rsp+256]; load->v32
              mov     rsi            , qword [rsp+264]; load->v33
              mov     rdx            , qword [rsp+272]; load->v34
              mov     rcx            , qword [rsp+280]; load->v35
              mov     r8             , qword [rsp+288]; load->v36
              mov     r9             , qword [rsp+296]; load->v37
              mov     r10            , qword [rsp+304]; load->v38
              mov     r11            , qword [rsp+312]; load->v39
              mov     r10            , r12            ; translate->qword [v28]
              mov     r11            , qword [rsp+320]; load->v40
              mov     qword [r10]    , r11            
              mov     r10            , r12            ; load->v28
              add     r10            , 8              
              mov     r12            , r10            ; save->v28
              mov     r10            , rbx            ; load->v27
              sub     r10            , 1              
              mov     rbx            , r10            ; save->v27
              cmp     r10            , 0              
              mov     rbx            , r10            ; save->v27
              jne     _datainit_new0_expand_start                 
_datainit_new0_expand_end:
              mov     r11            , qword [rsp+208]; load->v26
              mov     [_data_bss_chunks], r11            
              mov     r10            , qword [rsp+328]; load->v41
              mov     r10            , [_data_bss_MAXLENGTH]
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+336]; load->v42
              mov     r10            , qword [rsp+328]; load->v41
              mov     qword [rsp+336], r10            ; save->v42
              imul    r10            , 8              
              mov     qword [rsp+336], r10            ; save->v42
              add     r10            , 8              
              mov     qword [rsp+336], r10            ; save->v42
_datainit_saveReg2_save:
              mov     qword [rsp+344], rax            ; load->v43
              mov     qword [rsp+352], rdi            ; load->v44
              mov     qword [rsp+360], rsi            ; load->v45
              mov     qword [rsp+368], rdx            ; load->v46
              mov     qword [rsp+376], rcx            ; load->v47
              mov     qword [rsp+384], r8             ; load->v48
              mov     qword [rsp+392], r9             ; load->v49
              mov     r10            , qword [rsp+400]; load->v50
              mov     qword [rsp+408], r11            ; load->v51
              mov     rdi            , qword [rsp+336]; load->v42
              call    malloc                          
              mov     qword [rsp+416], rax            ; load->v52
              mov     r11            , qword [rsp+328]; load->v41
              mov     qword [rax]    , r11            
_datainit_saveReg2_load:
              mov     rax            , qword [rsp+344]; load->v43
              mov     rdi            , qword [rsp+352]; load->v44
              mov     rsi            , qword [rsp+360]; load->v45
              mov     rdx            , qword [rsp+368]; load->v46
              mov     rcx            , qword [rsp+376]; load->v47
              mov     r8             , qword [rsp+384]; load->v48
              mov     r9             , qword [rsp+392]; load->v49
              mov     r10            , qword [rsp+400]; load->v50
              mov     r11            , qword [rsp+408]; load->v51
              mov     r11            , qword [rsp+416]; load->v52
              mov     [_data_bss_inputBuffer], r11            
              mov     qword [rsp+424], 5              ; load->v53
              mov     r10            , qword [rsp+432]; load->v54
              mov     r10            , qword [rsp+424]; load->v53
              mov     qword [rsp+432], r10            ; save->v54
              imul    r10            , 8              
              mov     qword [rsp+432], r10            ; save->v54
              add     r10            , 8              
              mov     qword [rsp+432], r10            ; save->v54
_datainit_saveReg3_save:
              mov     qword [rsp+440], rax            ; load->v55
              mov     qword [rsp+448], rdi            ; load->v56
              mov     qword [rsp+456], rsi            ; load->v57
              mov     qword [rsp+464], rdx            ; load->v58
              mov     qword [rsp+472], rcx            ; load->v59
              mov     qword [rsp+480], r8             ; load->v60
              mov     qword [rsp+488], r9             ; load->v61
              mov     r10            , qword [rsp+496]; load->v62
              mov     qword [rsp+504], r11            ; load->v63
              mov     rdi            , qword [rsp+432]; load->v54
              call    malloc                          
              mov     qword [rsp+512], rax            ; load->v64
              mov     r11            , qword [rsp+424]; load->v53
              mov     qword [rax]    , r11            
_datainit_saveReg3_load:
              mov     rax            , qword [rsp+440]; load->v55
              mov     rdi            , qword [rsp+448]; load->v56
              mov     rsi            , qword [rsp+456]; load->v57
              mov     rdx            , qword [rsp+464]; load->v58
              mov     rcx            , qword [rsp+472]; load->v59
              mov     r8             , qword [rsp+480]; load->v60
              mov     r9             , qword [rsp+488]; load->v61
              mov     r10            , qword [rsp+496]; load->v62
              mov     r11            , qword [rsp+504]; load->v63
              mov     r11            , qword [rsp+512]; load->v64
              mov     [_data_bss_outputBuffer], r11            
_datainit_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 520            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__hex2int ] ---
;[----------------------------------
_text__hex2int:
              sub     rsp            , 664            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     rbx            , rdi            ; load->v6
              mov     r12            , 0              ; load->v8
              mov     r10            , r13            ; load->v9
              mov     r13            , r12            ; load->v8
_text__hex2int_for0_init:
              mov     r14            , 0              ; load->v10
              mov     r10            , r12            ; load->v7
              mov     r12            , r14            ; load->v10
_text__hex2int_call0:
              mov     rdi            , rbx            ; load->v6
_text__hex2int_saveReg0_save:
              mov     qword [rsp+88] , rax            ; load->v11
              mov     qword [rsp+96] , rdi            ; load->v12
              mov     qword [rsp+104], rsi            ; load->v13
              mov     qword [rsp+112], rdx            ; load->v14
              mov     qword [rsp+120], rcx            ; load->v15
              mov     qword [rsp+128], r8             ; load->v16
              mov     qword [rsp+136], r9             ; load->v17
              mov     r10            , qword [rsp+144]; load->v18
              mov     qword [rsp+152], r11            ; load->v19
              call    _text_built_in_string_length                 
              mov     qword [rsp+160], rax            ; load->v20
_text__hex2int_saveReg0_load:
              mov     rax            , qword [rsp+88] ; load->v11
              mov     rdi            , qword [rsp+96] ; load->v12
              mov     rsi            , qword [rsp+104]; load->v13
              mov     rdx            , qword [rsp+112]; load->v14
              mov     rcx            , qword [rsp+120]; load->v15
              mov     r8             , qword [rsp+128]; load->v16
              mov     r9             , qword [rsp+136]; load->v17
              mov     r10            , qword [rsp+144]; load->v18
              mov     r11            , qword [rsp+152]; load->v19
              mov     r10            , r12            ; load->v7
              mov     r11            , qword [rsp+160]; load->v20
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , r15            ; load->v21
              setl    r10b                            
              mov     r15            , r10            ; save->v21
              and     r10            , 255            
              mov     r15            , r10            ; save->v21
_text__hex2int_for0_init_check:
              mov     r10            , r15            ; load->v21
              cmp     r10b           , 0              
              mov     r15            , r10            ; save->v21
              je      _text__hex2int_for0_end                 
;----------------------------------]
;[----------------------------------
_text__hex2int_for0_start:
_text__hex2int_call1:
              mov     rdi            , rbx            ; load->v6
              mov     rsi            , r12            ; load->v7
_text__hex2int_saveReg1_save:
              mov     qword [rsp+176], rax            ; load->v22
              mov     qword [rsp+184], rdi            ; load->v23
              mov     qword [rsp+192], rsi            ; load->v24
              mov     qword [rsp+200], rdx            ; load->v25
              mov     qword [rsp+208], rcx            ; load->v26
              mov     qword [rsp+216], r8             ; load->v27
              mov     qword [rsp+224], r9             ; load->v28
              mov     r10            , qword [rsp+232]; load->v29
              mov     qword [rsp+240], r11            ; load->v30
              call    _text_built_in_string_ord                 
              mov     qword [rsp+248], rax            ; load->v31
_text__hex2int_saveReg1_load:
              mov     rax            , qword [rsp+176]; load->v22
              mov     rdi            , qword [rsp+184]; load->v23
              mov     rsi            , qword [rsp+192]; load->v24
              mov     rdx            , qword [rsp+200]; load->v25
              mov     rcx            , qword [rsp+208]; load->v26
              mov     r8             , qword [rsp+216]; load->v27
              mov     r9             , qword [rsp+224]; load->v28
              mov     r10            , qword [rsp+232]; load->v29
              mov     r11            , qword [rsp+240]; load->v30
              mov     r10            , qword [rsp+256]; load->v32
              mov     r10            , qword [rsp+248]; load->v31
              mov     qword [rsp+256], r10            ; save->v32
_text__hex2int_if0_init:
_text__hex2int_and0_lvalue:
              mov     qword [rsp+264], 0              ; load->v33
              mov     qword [rsp+272], 48             ; load->v34
              mov     r10            , qword [rsp+256]; load->v32
              mov     r11            , qword [rsp+272]; load->v34
              cmp     r10d           , r11d           
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+280]; load->v35
              setge   r10b                            
              mov     qword [rsp+280], r10            ; save->v35
              and     r10            , 255            
              mov     qword [rsp+280], r10            ; save->v35
              cmp     r10            , 0              
              mov     qword [rsp+280], r10            ; save->v35
              je      _text__hex2int_and0_end                 
;----------------------------------]
;[----------------------------------
_text__hex2int_and0_rvalue:
              mov     qword [rsp+288], 57             ; load->v36
              mov     r10            , qword [rsp+256]; load->v32
              mov     r11            , qword [rsp+288]; load->v36
              cmp     r10d           , r11d           
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+296]; load->v37
              setle   r10b                            
              mov     qword [rsp+296], r10            ; save->v37
              and     r10            , 255            
              mov     qword [rsp+296], r10            ; save->v37
              cmp     r10            , 0              
              mov     qword [rsp+296], r10            ; save->v37
              je      _text__hex2int_and0_end                 
              mov     qword [rsp+264], 255            ; load->v33
_text__hex2int_and0_end:
_text__hex2int_if0_check:
              mov     r10            , qword [rsp+264]; load->v33
              cmp     r10b           , 0              
              mov     qword [rsp+264], r10            ; save->v33
              je      _text__hex2int_if0_else                 
;----------------------------------]
;[----------------------------------
_text__hex2int_if0_start:
              mov     qword [rsp+304], 16             ; load->v38
              mov     r10            , qword [rsp+312]; load->v39
              mov     qword [rsp+312], r13            ; load->v9
              mov     r10            , qword [rsp+312]; load->v39
              mov     r11            , qword [rsp+304]; load->v38
              imul    r10            , r11            
              mov     qword [rsp+312], r10            ; save->v39
              and     r10            , -1             
              mov     qword [rsp+312], r10            ; save->v39
              mov     r10            , qword [rsp+320]; load->v40
              mov     r10            , qword [rsp+312]; load->v39
              mov     qword [rsp+320], r10            ; save->v40
              mov     r11            , qword [rsp+256]; load->v32
              add     r10            , r11            
              mov     qword [rsp+320], r10            ; save->v40
              mov     qword [rsp+328], 48             ; load->v41
              mov     r10            , qword [rsp+336]; load->v42
              mov     r10            , qword [rsp+320]; load->v40
              mov     qword [rsp+336], r10            ; save->v42
              mov     r11            , qword [rsp+328]; load->v41
              sub     r10            , r11            
              mov     qword [rsp+336], r10            ; save->v42
              mov     r10            , r13            ; load->v9
              mov     r13            , qword [rsp+336]; load->v42
              jmp     _text__hex2int_if0_end                 
;----------------------------------]
;[----------------------------------
_text__hex2int_if0_else:
_text__hex2int_if1_init:
_text__hex2int_and1_lvalue:
              mov     qword [rsp+344], 0              ; load->v43
              mov     qword [rsp+352], 65             ; load->v44
              mov     r10            , qword [rsp+256]; load->v32
              mov     r11            , qword [rsp+352]; load->v44
              cmp     r10d           , r11d           
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+360]; load->v45
              setge   r10b                            
              mov     qword [rsp+360], r10            ; save->v45
              and     r10            , 255            
              mov     qword [rsp+360], r10            ; save->v45
              cmp     r10            , 0              
              mov     qword [rsp+360], r10            ; save->v45
              je      _text__hex2int_and1_end                 
;----------------------------------]
;[----------------------------------
_text__hex2int_and1_rvalue:
              mov     qword [rsp+368], 70             ; load->v46
              mov     r10            , qword [rsp+256]; load->v32
              mov     r11            , qword [rsp+368]; load->v46
              cmp     r10d           , r11d           
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+376]; load->v47
              setle   r10b                            
              mov     qword [rsp+376], r10            ; save->v47
              and     r10            , 255            
              mov     qword [rsp+376], r10            ; save->v47
              cmp     r10            , 0              
              mov     qword [rsp+376], r10            ; save->v47
              je      _text__hex2int_and1_end                 
              mov     qword [rsp+344], 255            ; load->v43
_text__hex2int_and1_end:
_text__hex2int_if1_check:
              mov     r10            , qword [rsp+344]; load->v43
              cmp     r10b           , 0              
              mov     qword [rsp+344], r10            ; save->v43
              je      _text__hex2int_if1_else                 
;----------------------------------]
;[----------------------------------
_text__hex2int_if1_start:
              mov     qword [rsp+384], 16             ; load->v48
              mov     r10            , qword [rsp+392]; load->v49
              mov     qword [rsp+392], r13            ; load->v9
              mov     r10            , qword [rsp+392]; load->v49
              mov     r11            , qword [rsp+384]; load->v48
              imul    r10            , r11            
              mov     qword [rsp+392], r10            ; save->v49
              and     r10            , -1             
              mov     qword [rsp+392], r10            ; save->v49
              mov     r10            , qword [rsp+400]; load->v50
              mov     r10            , qword [rsp+392]; load->v49
              mov     qword [rsp+400], r10            ; save->v50
              mov     r11            , qword [rsp+256]; load->v32
              add     r10            , r11            
              mov     qword [rsp+400], r10            ; save->v50
              mov     qword [rsp+408], 65             ; load->v51
              mov     r10            , qword [rsp+416]; load->v52
              mov     r10            , qword [rsp+400]; load->v50
              mov     qword [rsp+416], r10            ; save->v52
              mov     r11            , qword [rsp+408]; load->v51
              sub     r10            , r11            
              mov     qword [rsp+416], r10            ; save->v52
              mov     qword [rsp+424], 10             ; load->v53
              mov     r10            , qword [rsp+432]; load->v54
              mov     r10            , qword [rsp+416]; load->v52
              mov     qword [rsp+432], r10            ; save->v54
              mov     r11            , qword [rsp+424]; load->v53
              add     r10            , r11            
              mov     qword [rsp+432], r10            ; save->v54
              mov     r10            , r13            ; load->v9
              mov     r13            , qword [rsp+432]; load->v54
              jmp     _text__hex2int_if1_end                 
;----------------------------------]
;[----------------------------------
_text__hex2int_if1_else:
_text__hex2int_if2_init:
_text__hex2int_and2_lvalue:
              mov     qword [rsp+440], 0              ; load->v55
              mov     qword [rsp+448], 97             ; load->v56
              mov     r10            , qword [rsp+256]; load->v32
              mov     r11            , qword [rsp+448]; load->v56
              cmp     r10d           , r11d           
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+456]; load->v57
              setge   r10b                            
              mov     qword [rsp+456], r10            ; save->v57
              and     r10            , 255            
              mov     qword [rsp+456], r10            ; save->v57
              cmp     r10            , 0              
              mov     qword [rsp+456], r10            ; save->v57
              je      _text__hex2int_and2_end                 
;----------------------------------]
;[----------------------------------
_text__hex2int_and2_rvalue:
              mov     qword [rsp+464], 102            ; load->v58
              mov     r10            , qword [rsp+256]; load->v32
              mov     r11            , qword [rsp+464]; load->v58
              cmp     r10d           , r11d           
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+472]; load->v59
              setle   r10b                            
              mov     qword [rsp+472], r10            ; save->v59
              and     r10            , 255            
              mov     qword [rsp+472], r10            ; save->v59
              cmp     r10            , 0              
              mov     qword [rsp+472], r10            ; save->v59
              je      _text__hex2int_and2_end                 
              mov     qword [rsp+440], 255            ; load->v55
_text__hex2int_and2_end:
_text__hex2int_if2_check:
              mov     r10            , qword [rsp+440]; load->v55
              cmp     r10b           , 0              
              mov     qword [rsp+440], r10            ; save->v55
              je      _text__hex2int_if2_else                 
;----------------------------------]
;[----------------------------------
_text__hex2int_if2_start:
              mov     qword [rsp+480], 16             ; load->v60
              mov     r10            , qword [rsp+488]; load->v61
              mov     qword [rsp+488], r13            ; load->v9
              mov     r10            , qword [rsp+488]; load->v61
              mov     r11            , qword [rsp+480]; load->v60
              imul    r10            , r11            
              mov     qword [rsp+488], r10            ; save->v61
              and     r10            , -1             
              mov     qword [rsp+488], r10            ; save->v61
              mov     r10            , qword [rsp+496]; load->v62
              mov     r10            , qword [rsp+488]; load->v61
              mov     qword [rsp+496], r10            ; save->v62
              mov     r11            , qword [rsp+256]; load->v32
              add     r10            , r11            
              mov     qword [rsp+496], r10            ; save->v62
              mov     qword [rsp+504], 97             ; load->v63
              mov     r10            , qword [rsp+512]; load->v64
              mov     r10            , qword [rsp+496]; load->v62
              mov     qword [rsp+512], r10            ; save->v64
              mov     r11            , qword [rsp+504]; load->v63
              sub     r10            , r11            
              mov     qword [rsp+512], r10            ; save->v64
              mov     qword [rsp+520], 10             ; load->v65
              mov     r10            , qword [rsp+528]; load->v66
              mov     r10            , qword [rsp+512]; load->v64
              mov     qword [rsp+528], r10            ; save->v66
              mov     r11            , qword [rsp+520]; load->v65
              add     r10            , r11            
              mov     qword [rsp+528], r10            ; save->v66
              mov     r10            , r13            ; load->v9
              mov     r13            , qword [rsp+528]; load->v66
              jmp     _text__hex2int_if2_end                 
;----------------------------------]
;[----------------------------------
_text__hex2int_if2_else:
              mov     qword [rsp+536], 0              ; load->v67
_text__hex2int_ret0:
              mov     rax            , qword [rsp+536]; load->v67
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 664            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__hex2int_if2_end:
_text__hex2int_if1_end:
_text__hex2int_if0_end:
_text__hex2int_for0_continue:
              mov     r10            , qword [rsp+544]; load->v68
              mov     qword [rsp+544], r12            ; load->v7
              mov     qword [rsp+552], 1              ; load->v69
              mov     r10            , qword [rsp+560]; load->v70
              mov     qword [rsp+560], r12            ; load->v7
              mov     r10            , qword [rsp+560]; load->v70
              mov     r11            , qword [rsp+552]; load->v69
              add     r10            , r11            
              mov     qword [rsp+560], r10            ; save->v70
              mov     r10            , r12            ; load->v7
              mov     r12            , qword [rsp+560]; load->v70
_text__hex2int_call2:
              mov     rdi            , rbx            ; load->v6
_text__hex2int_saveReg2_save:
              mov     qword [rsp+568], rax            ; load->v71
              mov     qword [rsp+576], rdi            ; load->v72
              mov     qword [rsp+584], rsi            ; load->v73
              mov     qword [rsp+592], rdx            ; load->v74
              mov     qword [rsp+600], rcx            ; load->v75
              mov     qword [rsp+608], r8             ; load->v76
              mov     qword [rsp+616], r9             ; load->v77
              mov     r10            , qword [rsp+624]; load->v78
              mov     qword [rsp+632], r11            ; load->v79
              call    _text_built_in_string_length                 
              mov     qword [rsp+640], rax            ; load->v80
_text__hex2int_saveReg2_load:
              mov     rax            , qword [rsp+568]; load->v71
              mov     rdi            , qword [rsp+576]; load->v72
              mov     rsi            , qword [rsp+584]; load->v73
              mov     rdx            , qword [rsp+592]; load->v74
              mov     rcx            , qword [rsp+600]; load->v75
              mov     r8             , qword [rsp+608]; load->v76
              mov     r9             , qword [rsp+616]; load->v77
              mov     r10            , qword [rsp+624]; load->v78
              mov     r11            , qword [rsp+632]; load->v79
              mov     r10            , r12            ; load->v7
              mov     r11            , qword [rsp+640]; load->v80
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , qword [rsp+648]; load->v81
              setl    r10b                            
              mov     qword [rsp+648], r10            ; save->v81
              and     r10            , 255            
              mov     qword [rsp+648], r10            ; save->v81
              cmp     r10b           , 0              
              mov     qword [rsp+648], r10            ; save->v81
              jne     _text__hex2int_for0_start                 
;----------------------------------]
;[----------------------------------
_text__hex2int_for0_end:
_text__hex2int_ret1:
              mov     rax            , r13            ; load->v9
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 664            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__hex2int_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 664            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__int2chr ] ---
;[----------------------------------
_text__int2chr:
              sub     rsp            , 232            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     rbx            , rdi            ; load->v6
_text__int2chr_if0_init:
_text__int2chr_and0_lvalue:
              mov     r12            , 0              ; load->v7
              mov     r13            , 32             ; load->v8
              mov     r10            , rbx            ; load->v6
              mov     r11            , r13            ; load->v8
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , r13            ; load->v9
              setge   r10b                            
              mov     r13            , r10            ; save->v9
              and     r10            , 255            
              mov     r13            , r10            ; save->v9
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v9
              je      _text__int2chr_and0_end                 
;----------------------------------]
;[----------------------------------
_text__int2chr_and0_rvalue:
              mov     r13            , 126            ; load->v10
              mov     r10            , rbx            ; load->v6
              mov     r11            , r13            ; load->v10
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , r13            ; load->v11
              setle   r10b                            
              mov     r13            , r10            ; save->v11
              and     r10            , 255            
              mov     r13            , r10            ; save->v11
              cmp     r10            , 0              
              mov     r13            , r10            ; save->v11
              je      _text__int2chr_and0_end                 
              mov     r12            , 255            ; load->v7
_text__int2chr_and0_end:
_text__int2chr_if0_check:
              mov     r10            , r12            ; load->v7
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v7
              je      _text__int2chr_if0_else                 
;----------------------------------]
;[----------------------------------
_text__int2chr_if0_start:
              mov     r12            , 32             ; load->v12
              mov     r10            , r13            ; load->v13
              mov     r13            , rbx            ; load->v6
              mov     r10            , r13            ; load->v13
              mov     r11            , r12            ; load->v12
              sub     r10            , r11            
              mov     r13            , r10            ; save->v13
              mov     r12            , 32             ; load->v14
              mov     r10            , r14            ; load->v15
              mov     r14            , rbx            ; load->v6
              mov     r10            , r14            ; load->v15
              mov     r11            , r12            ; load->v14
              sub     r10            , r11            
              mov     r14            , r10            ; save->v15
              mov     r10            , rbx            ; load->v16
              mov     rbx            , [_data_bss_asciiTable]
_text__int2chr_call0:
              mov     rdi            , rbx            ; load->v16
              mov     rsi            , r13            ; load->v13
              mov     rdx            , r14            ; load->v15
_text__int2chr_saveReg0_save:
              mov     qword [rsp+136], rax            ; load->v17
              mov     qword [rsp+144], rdi            ; load->v18
              mov     qword [rsp+152], rsi            ; load->v19
              mov     qword [rsp+160], rdx            ; load->v20
              mov     qword [rsp+168], rcx            ; load->v21
              mov     qword [rsp+176], r8             ; load->v22
              mov     qword [rsp+184], r9             ; load->v23
              mov     r10            , qword [rsp+192]; load->v24
              mov     qword [rsp+200], r11            ; load->v25
              call    _text_built_in_string_substring                 
              mov     qword [rsp+208], rax            ; load->v26
_text__int2chr_saveReg0_load:
              mov     rax            , qword [rsp+136]; load->v17
              mov     rdi            , qword [rsp+144]; load->v18
              mov     rsi            , qword [rsp+152]; load->v19
              mov     rdx            , qword [rsp+160]; load->v20
              mov     rcx            , qword [rsp+168]; load->v21
              mov     r8             , qword [rsp+176]; load->v22
              mov     r9             , qword [rsp+184]; load->v23
              mov     r10            , qword [rsp+192]; load->v24
              mov     r11            , qword [rsp+200]; load->v25
_text__int2chr_ret0:
              mov     rax            , qword [rsp+208]; load->v26
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 232            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__int2chr_if0_end                 
;----------------------------------]
;[----------------------------------
_text__int2chr_if0_else:
_text__int2chr_if0_end:
              mov     rbx            , _data_s3       ; load->v27
_text__int2chr_ret1:
              mov     rax            , rbx            ; load->v27
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 232            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__int2chr_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 232            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__toStringHex ] ---
;[----------------------------------
_text__toStringHex:
              sub     rsp            , 600            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     rbx            , rdi            ; load->v6
              mov     r12            , _data_s3       ; load->v7
              mov     r10            , qword [rsp+64] ; load->v8
              mov     qword [rsp+64] , r12            ; load->v7
_text__toStringHex_for0_init:
              mov     r13            , 28             ; load->v10
              mov     r10            , r12            ; load->v9
              mov     r12            , r13            ; load->v10
              mov     r14            , 0              ; load->v11
              mov     r10            , r12            ; load->v9
              mov     r11            , r14            ; load->v11
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v9
              mov     r10            , r15            ; load->v12
              setge   r10b                            
              mov     r15            , r10            ; save->v12
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
              mov     qword [rsp+112], rcx            ; load->v14
              mov     r10            , qword [rsp+104]; load->v13
              mov     qword [rsp+104], rbx            ; load->v6
              mov     rcx            , r12            ; load->v9
              mov     r10            , qword [rsp+104]; load->v13
              and     r10            , -1             
              mov     qword [rsp+104], r10            ; save->v13
              sar     r10d           , cl             
              mov     qword [rsp+104], r10            ; save->v13
              mov     rcx            , qword [rsp+112]; load->v14
              mov     qword [rsp+120], 15             ; load->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r10            , qword [rsp+104]; load->v13
              mov     qword [rsp+128], r10            ; save->v16
              mov     r11            , qword [rsp+120]; load->v15
              and     r10            , r11            
              mov     qword [rsp+128], r10            ; save->v16
              mov     r10            , qword [rsp+136]; load->v17
              mov     r10            , qword [rsp+128]; load->v16
              mov     qword [rsp+136], r10            ; save->v17
_text__toStringHex_if0_init:
              mov     qword [rsp+144], 10             ; load->v18
              mov     r10            , qword [rsp+136]; load->v17
              mov     r11            , qword [rsp+144]; load->v18
              cmp     r10d           , r11d           
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , qword [rsp+152]; load->v19
              setl    r10b                            
              mov     qword [rsp+152], r10            ; save->v19
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
              mov     qword [rsp+160], 48             ; load->v20
              mov     r10            , qword [rsp+168]; load->v21
              mov     r10            , qword [rsp+160]; load->v20
              mov     qword [rsp+168], r10            ; save->v21
              mov     r11            , qword [rsp+136]; load->v17
              add     r10            , r11            
              mov     qword [rsp+168], r10            ; save->v21
_text__toStringHex_call0:
              mov     rdi            , qword [rsp+168]; load->v21
_text__toStringHex_saveReg0_save:
              mov     qword [rsp+176], rax            ; load->v22
              mov     qword [rsp+184], rdi            ; load->v23
              mov     qword [rsp+192], rsi            ; load->v24
              mov     qword [rsp+200], rdx            ; load->v25
              mov     qword [rsp+208], rcx            ; load->v26
              mov     qword [rsp+216], r8             ; load->v27
              mov     qword [rsp+224], r9             ; load->v28
              mov     r10            , qword [rsp+232]; load->v29
              mov     qword [rsp+240], r11            ; load->v30
              call    _text__int2chr                  
              mov     qword [rsp+248], rax            ; load->v31
_text__toStringHex_saveReg0_load:
              mov     rax            , qword [rsp+176]; load->v22
              mov     rdi            , qword [rsp+184]; load->v23
              mov     rsi            , qword [rsp+192]; load->v24
              mov     rdx            , qword [rsp+200]; load->v25
              mov     rcx            , qword [rsp+208]; load->v26
              mov     r8             , qword [rsp+216]; load->v27
              mov     r9             , qword [rsp+224]; load->v28
              mov     r10            , qword [rsp+232]; load->v29
              mov     r11            , qword [rsp+240]; load->v30
_text__toStringHex_saveReg1_save:
              mov     qword [rsp+256], rax            ; load->v32
              mov     qword [rsp+264], rdi            ; load->v33
              mov     qword [rsp+272], rsi            ; load->v34
              mov     qword [rsp+280], rdx            ; load->v35
              mov     qword [rsp+288], rcx            ; load->v36
              mov     qword [rsp+296], r8             ; load->v37
              mov     qword [rsp+304], r9             ; load->v38
              mov     r10            , qword [rsp+312]; load->v39
              mov     qword [rsp+320], r11            ; load->v40
              mov     rdi            , qword [rsp+64] ; load->v8
              call    strlen                          
              mov     qword [rsp+328], rax            ; load->v41
              mov     rdi            , qword [rsp+248]; load->v31
              call    strlen                          
              mov     qword [rsp+336], rax            ; load->v42
              mov     r10            , qword [rsp+336]; load->v42
              mov     r11            , qword [rsp+328]; load->v41
              add     r10            , r11            
              mov     qword [rsp+336], r10            ; save->v42
              add     r10            , 1              
              mov     qword [rsp+336], r10            ; save->v42
              mov     rdi            , qword [rsp+336]; load->v42
              call    malloc                          
              mov     qword [rsp+344], rax            ; load->v43
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+64] ; load->v8
              call    strcpy                          
              mov     rdi            , qword [rsp+344]; load->v43
              mov     r11            , qword [rsp+328]; load->v41
              add     rdi            , r11            
              mov     rsi            , qword [rsp+248]; load->v31
              call    strcpy                          
_text__toStringHex_saveReg1_load:
              mov     rax            , qword [rsp+256]; load->v32
              mov     rdi            , qword [rsp+264]; load->v33
              mov     rsi            , qword [rsp+272]; load->v34
              mov     rdx            , qword [rsp+280]; load->v35
              mov     rcx            , qword [rsp+288]; load->v36
              mov     r8             , qword [rsp+296]; load->v37
              mov     r9             , qword [rsp+304]; load->v38
              mov     r10            , qword [rsp+312]; load->v39
              mov     r11            , qword [rsp+320]; load->v40
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , qword [rsp+344]; load->v43
              mov     qword [rsp+64] , r10            ; save->v8
              jmp     _text__toStringHex_if0_end                 
;----------------------------------]
;[----------------------------------
_text__toStringHex_if0_else:
              mov     qword [rsp+352], 65             ; load->v44
              mov     r10            , qword [rsp+360]; load->v45
              mov     r10            , qword [rsp+352]; load->v44
              mov     qword [rsp+360], r10            ; save->v45
              mov     r11            , qword [rsp+136]; load->v17
              add     r10            , r11            
              mov     qword [rsp+360], r10            ; save->v45
              mov     qword [rsp+368], 10             ; load->v46
              mov     r10            , qword [rsp+376]; load->v47
              mov     r10            , qword [rsp+360]; load->v45
              mov     qword [rsp+376], r10            ; save->v47
              mov     r11            , qword [rsp+368]; load->v46
              sub     r10            , r11            
              mov     qword [rsp+376], r10            ; save->v47
_text__toStringHex_call1:
              mov     rdi            , qword [rsp+376]; load->v47
_text__toStringHex_saveReg2_save:
              mov     qword [rsp+384], rax            ; load->v48
              mov     qword [rsp+392], rdi            ; load->v49
              mov     qword [rsp+400], rsi            ; load->v50
              mov     qword [rsp+408], rdx            ; load->v51
              mov     qword [rsp+416], rcx            ; load->v52
              mov     qword [rsp+424], r8             ; load->v53
              mov     qword [rsp+432], r9             ; load->v54
              mov     r10            , qword [rsp+440]; load->v55
              mov     qword [rsp+448], r11            ; load->v56
              call    _text__int2chr                  
              mov     qword [rsp+456], rax            ; load->v57
_text__toStringHex_saveReg2_load:
              mov     rax            , qword [rsp+384]; load->v48
              mov     rdi            , qword [rsp+392]; load->v49
              mov     rsi            , qword [rsp+400]; load->v50
              mov     rdx            , qword [rsp+408]; load->v51
              mov     rcx            , qword [rsp+416]; load->v52
              mov     r8             , qword [rsp+424]; load->v53
              mov     r9             , qword [rsp+432]; load->v54
              mov     r10            , qword [rsp+440]; load->v55
              mov     r11            , qword [rsp+448]; load->v56
_text__toStringHex_saveReg3_save:
              mov     qword [rsp+464], rax            ; load->v58
              mov     qword [rsp+472], rdi            ; load->v59
              mov     qword [rsp+480], rsi            ; load->v60
              mov     qword [rsp+488], rdx            ; load->v61
              mov     qword [rsp+496], rcx            ; load->v62
              mov     qword [rsp+504], r8             ; load->v63
              mov     qword [rsp+512], r9             ; load->v64
              mov     r10            , qword [rsp+520]; load->v65
              mov     qword [rsp+528], r11            ; load->v66
              mov     rdi            , qword [rsp+64] ; load->v8
              call    strlen                          
              mov     qword [rsp+536], rax            ; load->v67
              mov     rdi            , qword [rsp+456]; load->v57
              call    strlen                          
              mov     qword [rsp+544], rax            ; load->v68
              mov     r10            , qword [rsp+544]; load->v68
              mov     r11            , qword [rsp+536]; load->v67
              add     r10            , r11            
              mov     qword [rsp+544], r10            ; save->v68
              add     r10            , 1              
              mov     qword [rsp+544], r10            ; save->v68
              mov     rdi            , qword [rsp+544]; load->v68
              call    malloc                          
              mov     qword [rsp+552], rax            ; load->v69
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+64] ; load->v8
              call    strcpy                          
              mov     rdi            , qword [rsp+552]; load->v69
              mov     r11            , qword [rsp+536]; load->v67
              add     rdi            , r11            
              mov     rsi            , qword [rsp+456]; load->v57
              call    strcpy                          
_text__toStringHex_saveReg3_load:
              mov     rax            , qword [rsp+464]; load->v58
              mov     rdi            , qword [rsp+472]; load->v59
              mov     rsi            , qword [rsp+480]; load->v60
              mov     rdx            , qword [rsp+488]; load->v61
              mov     rcx            , qword [rsp+496]; load->v62
              mov     r8             , qword [rsp+504]; load->v63
              mov     r9             , qword [rsp+512]; load->v64
              mov     r10            , qword [rsp+520]; load->v65
              mov     r11            , qword [rsp+528]; load->v66
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , qword [rsp+552]; load->v69
              mov     qword [rsp+64] , r10            ; save->v8
_text__toStringHex_if0_end:
_text__toStringHex_for0_continue:
              mov     qword [rsp+560], 4              ; load->v70
              mov     r10            , qword [rsp+568]; load->v71
              mov     qword [rsp+568], r12            ; load->v9
              mov     r10            , qword [rsp+568]; load->v71
              mov     r11            , qword [rsp+560]; load->v70
              sub     r10            , r11            
              mov     qword [rsp+568], r10            ; save->v71
              mov     r10            , r12            ; load->v9
              mov     r12            , qword [rsp+568]; load->v71
              mov     qword [rsp+576], 0              ; load->v72
              mov     r10            , r12            ; load->v9
              mov     r11            , qword [rsp+576]; load->v72
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v9
              mov     r10            , qword [rsp+584]; load->v73
              setge   r10b                            
              mov     qword [rsp+584], r10            ; save->v73
              and     r10            , 255            
              mov     qword [rsp+584], r10            ; save->v73
              cmp     r10b           , 0              
              mov     qword [rsp+584], r10            ; save->v73
              jne     _text__toStringHex_for0_start                 
;----------------------------------]
;[----------------------------------
_text__toStringHex_for0_end:
_text__toStringHex_ret0:
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 600            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__toStringHex_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 600            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__rotate_left ] ---
;[----------------------------------
_text__rotate_left:
              sub     rsp            , 440            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     rbx            , rdi            ; load->v6
              mov     r12            , rsi            ; load->v7
_text__rotate_left_if0_init:
              mov     r13            , 1              ; load->v8
              mov     r10            , r12            ; load->v7
              mov     r11            , r13            ; load->v8
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , r13            ; load->v9
              sete    r10b                            
              mov     r13            , r10            ; save->v9
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
              mov     r13            , 2147483647     ; load->v10
              mov     r10            , r14            ; load->v11
              mov     r14            , rbx            ; load->v6
              mov     r10            , r14            ; load->v11
              mov     r11            , r13            ; load->v10
              and     r10            , r11            
              mov     r14            , r10            ; save->v11
              mov     r13            , 1              ; load->v12
              mov     r15            , rcx            ; load->v14
              mov     r10            , qword [rsp+104]; load->v13
              mov     qword [rsp+104], r14            ; load->v11
              mov     rcx            , r13            ; load->v12
              mov     r10            , qword [rsp+104]; load->v13
              and     r10            , -1             
              mov     qword [rsp+104], r10            ; save->v13
              sal     r10d           , cl             
              mov     qword [rsp+104], r10            ; save->v13
              mov     rcx            , r15            ; load->v14
              mov     r13            , 31             ; load->v15
              mov     r14            , rcx            ; load->v17
              mov     r10            , r15            ; load->v16
              mov     r15            , rbx            ; load->v6
              mov     rcx            , r13            ; load->v15
              mov     r10            , r15            ; load->v16
              and     r10            , -1             
              mov     r15            , r10            ; save->v16
              sar     r10d           , cl             
              mov     r15            , r10            ; save->v16
              mov     rcx            , r14            ; load->v17
              mov     r13            , 1              ; load->v18
              mov     r10            , r14            ; load->v19
              mov     r14            , r15            ; load->v16
              mov     r10            , r14            ; load->v19
              mov     r11            , r13            ; load->v18
              and     r10            , r11            
              mov     r14            , r10            ; save->v19
              mov     r10            , r13            ; load->v20
              mov     r13            , qword [rsp+104]; load->v13
              mov     r10            , r13            ; load->v20
              mov     r11            , r14            ; load->v19
              or      r10            , r11            
              mov     r13            , r10            ; save->v20
_text__rotate_left_ret0:
              mov     rax            , r13            ; load->v20
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
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
              mov     r13            , 31             ; load->v21
              mov     r10            , r12            ; load->v7
              mov     r11            , r13            ; load->v21
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , r13            ; load->v22
              sete    r10b                            
              mov     r13            , r10            ; save->v22
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
              mov     r13            , 1              ; load->v23
              mov     r10            , r14            ; load->v24
              mov     r14            , rbx            ; load->v6
              mov     r10            , r14            ; load->v24
              mov     r11            , r13            ; load->v23
              and     r10            , r11            
              mov     r14            , r10            ; save->v24
              mov     r13            , 31             ; load->v25
              mov     r15            , rcx            ; load->v27
              mov     r10            , qword [rsp+208]; load->v26
              mov     qword [rsp+208], r14            ; load->v24
              mov     rcx            , r13            ; load->v25
              mov     r10            , qword [rsp+208]; load->v26
              and     r10            , -1             
              mov     qword [rsp+208], r10            ; save->v26
              sal     r10d           , cl             
              mov     qword [rsp+208], r10            ; save->v26
              mov     rcx            , r15            ; load->v27
              mov     r13            , 1              ; load->v28
              mov     r14            , rcx            ; load->v30
              mov     r10            , r15            ; load->v29
              mov     r15            , rbx            ; load->v6
              mov     rcx            , r13            ; load->v28
              mov     r10            , r15            ; load->v29
              and     r10            , -1             
              mov     r15            , r10            ; save->v29
              sar     r10d           , cl             
              mov     r15            , r10            ; save->v29
              mov     rcx            , r14            ; load->v30
              mov     r13            , 2147483647     ; load->v31
              mov     r10            , r14            ; load->v32
              mov     r14            , r15            ; load->v29
              mov     r10            , r14            ; load->v32
              mov     r11            , r13            ; load->v31
              and     r10            , r11            
              mov     r14            , r10            ; save->v32
              mov     r10            , r13            ; load->v33
              mov     r13            , qword [rsp+208]; load->v26
              mov     r10            , r13            ; load->v33
              mov     r11            , r14            ; load->v32
              or      r10            , r11            
              mov     r13            , r10            ; save->v33
_text__rotate_left_ret1:
              mov     rax            , r13            ; load->v33
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 440            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__rotate_left_if1_end                 
;----------------------------------]
;[----------------------------------
_text__rotate_left_if1_else:
_text__rotate_left_if1_end:
              mov     r13            , 1              ; load->v34
              mov     r14            , 32             ; load->v35
              mov     r10            , r15            ; load->v36
              mov     r15            , r14            ; load->v35
              mov     r10            , r15            ; load->v36
              mov     r11            , r12            ; load->v7
              sub     r10            , r11            
              mov     r15            , r10            ; save->v36
              mov     r14            , rcx            ; load->v38
              mov     r10            , qword [rsp+296]; load->v37
              mov     qword [rsp+296], r13            ; load->v34
              mov     rcx            , r15            ; load->v36
              mov     r10            , qword [rsp+296]; load->v37
              and     r10            , -1             
              mov     qword [rsp+296], r10            ; save->v37
              sal     r10d           , cl             
              mov     qword [rsp+296], r10            ; save->v37
              mov     rcx            , r14            ; load->v38
              mov     r13            , 1              ; load->v39
              mov     r10            , r14            ; load->v40
              mov     r14            , qword [rsp+296]; load->v37
              mov     r10            , r14            ; load->v40
              mov     r11            , r13            ; load->v39
              sub     r10            , r11            
              mov     r14            , r10            ; save->v40
              mov     r10            , r13            ; load->v41
              mov     r13            , rbx            ; load->v6
              mov     r10            , r13            ; load->v41
              mov     r11            , r14            ; load->v40
              and     r10            , r11            
              mov     r13            , r10            ; save->v41
              mov     r14            , rcx            ; load->v43
              mov     r10            , r15            ; load->v42
              mov     r15            , r13            ; load->v41
              mov     rcx            , r12            ; load->v7
              mov     r10            , r15            ; load->v42
              and     r10            , -1             
              mov     r15            , r10            ; save->v42
              sal     r10d           , cl             
              mov     r15            , r10            ; save->v42
              mov     rcx            , r14            ; load->v43
              mov     r13            , 32             ; load->v44
              mov     r10            , r14            ; load->v45
              mov     r14            , r13            ; load->v44
              mov     r10            , r14            ; load->v45
              mov     r11            , r12            ; load->v7
              sub     r10            , r11            
              mov     r14            , r10            ; save->v45
              mov     r13            , rcx            ; load->v47
              mov     r10            , qword [rsp+368]; load->v46
              mov     qword [rsp+368], rbx            ; load->v6
              mov     rcx            , r14            ; load->v45
              mov     r10            , qword [rsp+368]; load->v46
              and     r10            , -1             
              mov     qword [rsp+368], r10            ; save->v46
              sar     r10d           , cl             
              mov     qword [rsp+368], r10            ; save->v46
              mov     rcx            , r13            ; load->v47
              mov     rbx            , 1              ; load->v48
              mov     r13            , rcx            ; load->v50
              mov     r10            , r14            ; load->v49
              mov     r14            , rbx            ; load->v48
              mov     rcx            , r12            ; load->v7
              mov     r10            , r14            ; load->v49
              and     r10            , -1             
              mov     r14            , r10            ; save->v49
              sal     r10d           , cl             
              mov     r14            , r10            ; save->v49
              mov     rcx            , r13            ; load->v50
              mov     rbx            , 1              ; load->v51
              mov     r10            , r12            ; load->v52
              mov     r12            , r14            ; load->v49
              mov     r10            , r12            ; load->v52
              mov     r11            , rbx            ; load->v51
              sub     r10            , r11            
              mov     r12            , r10            ; save->v52
              mov     r10            , rbx            ; load->v53
              mov     rbx            , qword [rsp+368]; load->v46
              mov     r10            , rbx            ; load->v53
              mov     r11            , r12            ; load->v52
              and     r10            , r11            
              mov     rbx            , r10            ; save->v53
              mov     r10            , r12            ; load->v54
              mov     r12            , r15            ; load->v42
              mov     r10            , r12            ; load->v54
              mov     r11            , rbx            ; load->v53
              or      r10            , r11            
              mov     r12            , r10            ; save->v54
_text__rotate_left_ret2:
              mov     rax            , r12            ; load->v54
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 440            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__rotate_left_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 440            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__add ] ---
;[----------------------------------
_text__add:
              sub     rsp            , 312            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     rbx            , rdi            ; load->v6
              mov     r12            , rsi            ; load->v7
              mov     r13            , 65535          ; load->v8
              mov     r10            , r14            ; load->v9
              mov     r14            , rbx            ; load->v6
              mov     r10            , r14            ; load->v9
              mov     r11            , r13            ; load->v8
              and     r10            , r11            
              mov     r14            , r10            ; save->v9
              mov     r13            , 65535          ; load->v10
              mov     r10            , r15            ; load->v11
              mov     r15            , r12            ; load->v7
              mov     r10            , r15            ; load->v11
              mov     r11            , r13            ; load->v10
              and     r10            , r11            
              mov     r15            , r10            ; save->v11
              mov     r10            , r13            ; load->v12
              mov     r13            , r14            ; load->v9
              mov     r10            , r13            ; load->v12
              mov     r11            , r15            ; load->v11
              add     r10            , r11            
              mov     r13            , r10            ; save->v12
              mov     r10            , r14            ; load->v13
              mov     r14            , r13            ; load->v12
              mov     r13            , 16             ; load->v14
              mov     r15            , rcx            ; load->v16
              mov     r10            , qword [rsp+120]; load->v15
              mov     qword [rsp+120], rbx            ; load->v6
              mov     rcx            , r13            ; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              and     r10            , -1             
              mov     qword [rsp+120], r10            ; save->v15
              sar     r10d           , cl             
              mov     qword [rsp+120], r10            ; save->v15
              mov     rcx            , r15            ; load->v16
              mov     rbx            , 65535          ; load->v17
              mov     r10            , r13            ; load->v18
              mov     r13            , qword [rsp+120]; load->v15
              mov     r10            , r13            ; load->v18
              mov     r11            , rbx            ; load->v17
              and     r10            , r11            
              mov     r13            , r10            ; save->v18
              mov     rbx            , 16             ; load->v19
              mov     r15            , rcx            ; load->v21
              mov     r10            , qword [rsp+160]; load->v20
              mov     qword [rsp+160], r12            ; load->v7
              mov     rcx            , rbx            ; load->v19
              mov     r10            , qword [rsp+160]; load->v20
              and     r10            , -1             
              mov     qword [rsp+160], r10            ; save->v20
              sar     r10d           , cl             
              mov     qword [rsp+160], r10            ; save->v20
              mov     rcx            , r15            ; load->v21
              mov     rbx            , 65535          ; load->v22
              mov     r10            , r12            ; load->v23
              mov     r12            , qword [rsp+160]; load->v20
              mov     r10            , r12            ; load->v23
              mov     r11            , rbx            ; load->v22
              and     r10            , r11            
              mov     r12            , r10            ; save->v23
              mov     r10            , rbx            ; load->v24
              mov     rbx            , r13            ; load->v18
              mov     r10            , rbx            ; load->v24
              mov     r11            , r12            ; load->v23
              add     r10            , r11            
              mov     rbx            , r10            ; save->v24
              mov     r12            , 16             ; load->v25
              mov     r13            , rcx            ; load->v27
              mov     r10            , r15            ; load->v26
              mov     r15            , r14            ; load->v13
              mov     rcx            , r12            ; load->v25
              mov     r10            , r15            ; load->v26
              and     r10            , -1             
              mov     r15            , r10            ; save->v26
              sar     r10d           , cl             
              mov     r15            , r10            ; save->v26
              mov     rcx            , r13            ; load->v27
              mov     r10            , r12            ; load->v28
              mov     r12            , rbx            ; load->v24
              mov     r10            , r12            ; load->v28
              mov     r11            , r15            ; load->v26
              add     r10            , r11            
              mov     r12            , r10            ; save->v28
              mov     rbx            , 65535          ; load->v29
              mov     r10            , r13            ; load->v30
              mov     r13            , r12            ; load->v28
              mov     r10            , r13            ; load->v30
              mov     r11            , rbx            ; load->v29
              and     r10            , r11            
              mov     r13            , r10            ; save->v30
              mov     r10            , rbx            ; load->v31
              mov     rbx            , r13            ; load->v30
              mov     r12            , 16             ; load->v32
              mov     r13            , rcx            ; load->v34
              mov     r10            , r15            ; load->v33
              mov     r15            , rbx            ; load->v31
              mov     rcx            , r12            ; load->v32
              mov     r10            , r15            ; load->v33
              and     r10            , -1             
              mov     r15            , r10            ; save->v33
              sal     r10d           , cl             
              mov     r15            , r10            ; save->v33
              mov     rcx            , r13            ; load->v34
              mov     rbx            , 65535          ; load->v35
              mov     r10            , r12            ; load->v36
              mov     r12            , r14            ; load->v13
              mov     r10            , r12            ; load->v36
              mov     r11            , rbx            ; load->v35
              and     r10            , r11            
              mov     r12            , r10            ; save->v36
              mov     r10            , rbx            ; load->v37
              mov     rbx            , r15            ; load->v33
              mov     r10            , rbx            ; load->v37
              mov     r11            , r12            ; load->v36
              or      r10            , r11            
              mov     rbx            , r10            ; save->v37
_text__add_ret0:
              mov     rax            , rbx            ; load->v37
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 312            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__add_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 312            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__lohi ] ---
;[----------------------------------
_text__lohi:
              sub     rsp            , 104            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     rbx            , rdi            ; load->v6
              mov     r12            , rsi            ; load->v7
              mov     r13            , 16             ; load->v8
              mov     r14            , rcx            ; load->v10
              mov     r10            , r15            ; load->v9
              mov     r15            , r12            ; load->v7
              mov     rcx            , r13            ; load->v8
              mov     r10            , r15            ; load->v9
              and     r10            , -1             
              mov     r15            , r10            ; save->v9
              sal     r10d           , cl             
              mov     r15            , r10            ; save->v9
              mov     rcx            , r14            ; load->v10
              mov     r10            , r12            ; load->v11
              mov     r12            , rbx            ; load->v6
              mov     r10            , r12            ; load->v11
              mov     r11            , r15            ; load->v9
              or      r10            , r11            
              mov     r12            , r10            ; save->v11
_text__lohi_ret0:
              mov     rax            , r12            ; load->v11
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 104            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__lohi_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 104            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__sha1 ] ---
;[----------------------------------
_text__sha1:
              sub     rsp            , 3848           
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     qword [rsp+48] , rdi            ; load->v6
              mov     qword [rsp+56] , rsi            ; load->v7
              mov     r13            , 64             ; load->v8
              mov     r10            , r14            ; load->v9
              mov     r14            , qword [rsp+56] ; load->v7
              mov     r10            , r14            ; load->v9
              mov     r11            , r13            ; load->v8
              add     r10            , r11            
              mov     r14            , r10            ; save->v9
              mov     r13            , 56             ; load->v10
              mov     r10            , r15            ; load->v11
              mov     r15            , r14            ; load->v9
              mov     r10            , r15            ; load->v11
              mov     r11            , r13            ; load->v10
              sub     r10            , r11            
              mov     r15            , r10            ; save->v11
              mov     r13            , 64             ; load->v12
              mov     r14            , rdx            ; load->v14
              mov     qword [rsp+120], rax            ; load->v15
              mov     rax            , r15            ; load->v11
              and     rax            , -1             
              mov     r10            , r13            ; load->v12
              and     r10d           , -1             
              mov     r13            , r10            ; save->v12
              cqo                                     
              mov     r10            , r13            ; load->v12
              idiv    r10d                            
              mov     r13            , rax            ; save->v12
              mov     rdx            , r14            ; load->v14
              mov     rax            , qword [rsp+120]; load->v15
              mov     r14            , 1              ; load->v16
              mov     r10            , r15            ; load->v17
              mov     r15            , r13            ; load->v13
              mov     r10            , r15            ; load->v17
              mov     r11            , r14            ; load->v16
              add     r10            , r11            
              mov     r15            , r10            ; save->v17
              mov     r10            , qword [rsp+144]; load->v18
              mov     qword [rsp+144], r15            ; load->v17
_text__sha1_if0_init:
              mov     r10            , r14            ; load->v19
              mov     r14            , [_data_bss_MAXCHUNK]
              mov     r10            , qword [rsp+144]; load->v18
              mov     r11            , r14            ; load->v19
              cmp     r10d           , r11d           
              mov     qword [rsp+144], r10            ; save->v18
              mov     r10            , r14            ; load->v20
              setg    r10b                            
              mov     r14            , r10            ; save->v20
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
              mov     r14            , _data_s4       ; load->v21
_text__sha1_call0:
              mov     rdi            , r14            ; load->v21
_text__sha1_saveReg0_save:
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
              mov     r14            , rax            ; load->v31
_text__sha1_saveReg0_load:
              mov     rax            , qword [rsp+176]; load->v22
              mov     rdi            , qword [rsp+184]; load->v23
              mov     rsi            , qword [rsp+192]; load->v24
              mov     rdx            , qword [rsp+200]; load->v25
              mov     rcx            , qword [rsp+208]; load->v26
              mov     r8             , qword [rsp+216]; load->v27
              mov     r9             , qword [rsp+224]; load->v28
              mov     r10            , qword [rsp+232]; load->v29
              mov     r11            , qword [rsp+240]; load->v30
              mov     r14            , 0              ; load->v32
_text__sha1_ret0:
              mov     rax            , r14            ; load->v32
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 3848           
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__sha1_if0_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_if0_else:
_text__sha1_if0_end:
_text__sha1_for0_init:
              mov     qword [rsp+280], 0              ; load->v35
              mov     r10            , r14            ; load->v33
              mov     r14            , qword [rsp+280]; load->v35
              mov     r10            , r14            ; load->v33
              mov     r11            , qword [rsp+144]; load->v18
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v33
              mov     r10            , qword [rsp+288]; load->v36
              setl    r10b                            
              mov     qword [rsp+288], r10            ; save->v36
              and     r10            , 255            
              mov     qword [rsp+288], r10            ; save->v36
_text__sha1_for0_init_check:
              mov     r10            , qword [rsp+288]; load->v36
              cmp     r10b           , 0              
              mov     qword [rsp+288], r10            ; save->v36
              je      _text__sha1_for0_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_for0_start:
_text__sha1_for1_init:
              mov     rbx            , 0              ; load->v37
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+272], rbx            ; load->v37
              mov     r12            , 80             ; load->v38
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , r12            ; load->v38
              cmp     r10d           , r11d           
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , r13            ; load->v39
              setl    r10b                            
              mov     r13            , r10            ; save->v39
              and     r10            , 255            
              mov     r13            , r10            ; save->v39
_text__sha1_for1_init_check:
              mov     r10            , r13            ; load->v39
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v39
              je      _text__sha1_for1_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_for1_start:
              mov     qword [rsp+320], 0              ; load->v40
              mov     r10            , qword [rsp+328]; load->v41
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+328], r10            ; save->v41
              mov     r10            , qword [rsp+336]; load->v42
              mov     qword [rsp+336], r14            ; load->v33
              mov     r10            , qword [rsp+336]; load->v42
              imul    r10            , 8              
              mov     qword [rsp+336], r10            ; save->v42
              add     r10            , 8              
              mov     qword [rsp+336], r10            ; save->v42
              mov     r11            , qword [rsp+328]; load->v41
              add     r10            , r11            
              mov     qword [rsp+336], r10            ; save->v42
              mov     r10            , qword [rsp+344]; load->v43
              mov     r11            , qword [rsp+336]; translate->qword [v42]
              mov     r10            , qword [r11]    
              mov     qword [rsp+344], r10            ; save->v43
              mov     r10            , qword [rsp+352]; load->v44
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+352], r10            ; save->v44
              imul    r10            , 8              
              mov     qword [rsp+352], r10            ; save->v44
              add     r10            , 8              
              mov     qword [rsp+352], r10            ; save->v44
              mov     r11            , qword [rsp+344]; load->v43
              add     r10            , r11            
              mov     qword [rsp+352], r10            ; save->v44
              mov     r10            , qword [rsp+360]; load->v45
              mov     r11            , qword [rsp+352]; translate->qword [v44]
              mov     r10            , qword [r11]    
              mov     qword [rsp+360], r10            ; save->v45
              mov     r10            , qword [rsp+352]; translate->qword [v44]
              mov     r11            , qword [rsp+320]; load->v40
              mov     qword [r10]    , r11            ; assign->chunks[i][j]
_text__sha1_for1_continue:
              mov     r10            , qword [rsp+368]; load->v46
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+368], r10            ; save->v46
              mov     qword [rsp+376], 1              ; load->v47
              mov     r10            , qword [rsp+384]; load->v48
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+384], r10            ; save->v48
              mov     r11            , qword [rsp+376]; load->v47
              add     r10            , r11            
              mov     qword [rsp+384], r10            ; save->v48
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , qword [rsp+384]; load->v48
              mov     qword [rsp+272], r10            ; save->v34
              mov     qword [rsp+392], 80             ; load->v49
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+392]; load->v49
              cmp     r10d           , r11d           
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+400]; load->v50
              setl    r10b                            
              mov     qword [rsp+400], r10            ; save->v50
              and     r10            , 255            
              mov     qword [rsp+400], r10            ; save->v50
              cmp     r10b           , 0              
              mov     qword [rsp+400], r10            ; save->v50
              jne     _text__sha1_for1_start                 
;----------------------------------]
;[----------------------------------
_text__sha1_for1_end:
_text__sha1_for0_continue:
              mov     r10            , qword [rsp+408]; load->v51
              mov     qword [rsp+408], r14            ; load->v33
              mov     qword [rsp+416], 1              ; load->v52
              mov     r10            , qword [rsp+424]; load->v53
              mov     qword [rsp+424], r14            ; load->v33
              mov     r10            , qword [rsp+424]; load->v53
              mov     r11            , qword [rsp+416]; load->v52
              add     r10            , r11            
              mov     qword [rsp+424], r10            ; save->v53
              mov     r10            , r14            ; load->v33
              mov     r14            , qword [rsp+424]; load->v53
              mov     r10            , r14            ; load->v33
              mov     r11            , qword [rsp+144]; load->v18
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v33
              mov     r10            , qword [rsp+432]; load->v54
              setl    r10b                            
              mov     qword [rsp+432], r10            ; save->v54
              and     r10            , 255            
              mov     qword [rsp+432], r10            ; save->v54
              cmp     r10b           , 0              
              mov     qword [rsp+432], r10            ; save->v54
              jne     _text__sha1_for0_start                 
;----------------------------------]
;[----------------------------------
_text__sha1_for0_end:
_text__sha1_for2_init:
              mov     rbx            , 0              ; load->v55
              mov     r10            , r14            ; load->v33
              mov     r14            , rbx            ; load->v55
              mov     r10            , r14            ; load->v33
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v33
              mov     r10            , r12            ; load->v56
              setl    r10b                            
              mov     r12            , r10            ; save->v56
              and     r10            , 255            
              mov     r12            , r10            ; save->v56
_text__sha1_for2_init_check:
              mov     r10            , r12            ; load->v56
              cmp     r10b           , 0              
              mov     r12            , r10            ; save->v56
              je      _text__sha1_for2_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_for2_start:
              mov     r10            , r13            ; load->v57
              mov     r13            , [_data_bss_chunks]
              mov     qword [rsp+464], 64             ; load->v58
              mov     qword [rsp+480], rdx            ; load->v60
              mov     qword [rsp+488], rax            ; load->v61
              mov     rax            , r14            ; load->v33
              and     rax            , -1             
              mov     r10            , qword [rsp+464]; load->v58
              and     r10d           , -1             
              mov     qword [rsp+464], r10            ; save->v58
              cqo                                     
              mov     r10            , qword [rsp+464]; load->v58
              idiv    r10d                            
              mov     qword [rsp+464], r10            ; save->v58
              mov     qword [rsp+472], rax            ; load->v59
              mov     rdx            , qword [rsp+480]; load->v60
              mov     rax            , qword [rsp+488]; load->v61
              mov     r10            , qword [rsp+496]; load->v62
              mov     r10            , qword [rsp+472]; load->v59
              mov     qword [rsp+496], r10            ; save->v62
              imul    r10            , 8              
              mov     qword [rsp+496], r10            ; save->v62
              add     r10            , 8              
              mov     qword [rsp+496], r10            ; save->v62
              mov     r11            , r13            ; load->v57
              add     r10            , r11            
              mov     qword [rsp+496], r10            ; save->v62
              mov     r10            , qword [rsp+504]; load->v63
              mov     r11            , qword [rsp+496]; translate->qword [v62]
              mov     r10            , qword [r11]    
              mov     qword [rsp+504], r10            ; save->v63
              mov     qword [rsp+512], 64             ; load->v64
              mov     qword [rsp+528], rdx            ; load->v66
              mov     qword [rsp+536], rax            ; load->v67
              mov     rax            , r14            ; load->v33
              and     rax            , -1             
              mov     r10            , qword [rsp+512]; load->v64
              and     r10d           , -1             
              mov     qword [rsp+512], r10            ; save->v64
              cqo                                     
              mov     r10            , qword [rsp+512]; load->v64
              idiv    r10d                            
              mov     qword [rsp+512], r10            ; save->v64
              mov     qword [rsp+520], rdx            ; load->v65
              mov     rdx            , qword [rsp+528]; load->v66
              mov     rax            , qword [rsp+536]; load->v67
              mov     qword [rsp+544], 4              ; load->v68
              mov     qword [rsp+560], rdx            ; load->v70
              mov     qword [rsp+568], rax            ; load->v71
              mov     rax            , qword [rsp+520]; load->v65
              and     rax            , -1             
              mov     r10            , qword [rsp+544]; load->v68
              and     r10d           , -1             
              mov     qword [rsp+544], r10            ; save->v68
              cqo                                     
              mov     r10            , qword [rsp+544]; load->v68
              idiv    r10d                            
              mov     qword [rsp+544], r10            ; save->v68
              mov     qword [rsp+552], rax            ; load->v69
              mov     rdx            , qword [rsp+560]; load->v70
              mov     rax            , qword [rsp+568]; load->v71
              mov     r10            , qword [rsp+576]; load->v72
              mov     r10            , qword [rsp+552]; load->v69
              mov     qword [rsp+576], r10            ; save->v72
              imul    r10            , 8              
              mov     qword [rsp+576], r10            ; save->v72
              add     r10            , 8              
              mov     qword [rsp+576], r10            ; save->v72
              mov     r11            , qword [rsp+504]; load->v63
              add     r10            , r11            
              mov     qword [rsp+576], r10            ; save->v72
              mov     r10            , qword [rsp+584]; load->v73
              mov     r11            , qword [rsp+576]; translate->qword [v72]
              mov     r10            , qword [r11]    
              mov     qword [rsp+584], r10            ; save->v73
              mov     r10            , qword [rsp+592]; load->v74
              mov     qword [rsp+592], r14            ; load->v33
              mov     r10            , qword [rsp+592]; load->v74
              imul    r10            , 8              
              mov     qword [rsp+592], r10            ; save->v74
              add     r10            , 8              
              mov     qword [rsp+592], r10            ; save->v74
              mov     r11            , qword [rsp+48] ; load->v6
              add     r10            , r11            
              mov     qword [rsp+592], r10            ; save->v74
              mov     r10            , qword [rsp+600]; load->v75
              mov     r11            , qword [rsp+592]; translate->qword [v74]
              mov     r10            , qword [r11]    
              mov     qword [rsp+600], r10            ; save->v75
              mov     qword [rsp+608], 3              ; load->v76
              mov     qword [rsp+616], 4              ; load->v77
              mov     qword [rsp+632], rdx            ; load->v79
              mov     qword [rsp+640], rax            ; load->v80
              mov     rax            , r14            ; load->v33
              and     rax            , -1             
              mov     r10            , qword [rsp+616]; load->v77
              and     r10d           , -1             
              mov     qword [rsp+616], r10            ; save->v77
              cqo                                     
              mov     r10            , qword [rsp+616]; load->v77
              idiv    r10d                            
              mov     qword [rsp+616], r10            ; save->v77
              mov     qword [rsp+624], rdx            ; load->v78
              mov     rdx            , qword [rsp+632]; load->v79
              mov     rax            , qword [rsp+640]; load->v80
              mov     r10            , qword [rsp+648]; load->v81
              mov     r10            , qword [rsp+608]; load->v76
              mov     qword [rsp+648], r10            ; save->v81
              mov     r11            , qword [rsp+624]; load->v78
              sub     r10            , r11            
              mov     qword [rsp+648], r10            ; save->v81
              mov     qword [rsp+656], 8              ; load->v82
              mov     r10            , qword [rsp+664]; load->v83
              mov     r10            , qword [rsp+648]; load->v81
              mov     qword [rsp+664], r10            ; save->v83
              mov     r11            , qword [rsp+656]; load->v82
              imul    r10            , r11            
              mov     qword [rsp+664], r10            ; save->v83
              and     r10            , -1             
              mov     qword [rsp+664], r10            ; save->v83
              mov     qword [rsp+680], rcx            ; load->v85
              mov     r10            , qword [rsp+672]; load->v84
              mov     r10            , qword [rsp+600]; load->v75
              mov     qword [rsp+672], r10            ; save->v84
              mov     rcx            , qword [rsp+664]; load->v83
              mov     r10            , qword [rsp+672]; load->v84
              and     r10            , -1             
              mov     qword [rsp+672], r10            ; save->v84
              sal     r10d           , cl             
              mov     qword [rsp+672], r10            ; save->v84
              mov     rcx            , qword [rsp+680]; load->v85
              mov     r10            , qword [rsp+688]; load->v86
              mov     r10            , qword [rsp+584]; load->v73
              mov     qword [rsp+688], r10            ; save->v86
              mov     r11            , qword [rsp+672]; load->v84
              or      r10            , r11            
              mov     qword [rsp+688], r10            ; save->v86
              mov     r10            , qword [rsp+696]; load->v87
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+696], r10            ; save->v87
              mov     qword [rsp+704], 64             ; load->v88
              mov     qword [rsp+720], rdx            ; load->v90
              mov     qword [rsp+728], rax            ; load->v91
              mov     rax            , r14            ; load->v33
              and     rax            , -1             
              mov     r10            , qword [rsp+704]; load->v88
              and     r10d           , -1             
              mov     qword [rsp+704], r10            ; save->v88
              cqo                                     
              mov     r10            , qword [rsp+704]; load->v88
              idiv    r10d                            
              mov     qword [rsp+704], r10            ; save->v88
              mov     qword [rsp+712], rax            ; load->v89
              mov     rdx            , qword [rsp+720]; load->v90
              mov     rax            , qword [rsp+728]; load->v91
              mov     r10            , qword [rsp+736]; load->v92
              mov     r10            , qword [rsp+712]; load->v89
              mov     qword [rsp+736], r10            ; save->v92
              imul    r10            , 8              
              mov     qword [rsp+736], r10            ; save->v92
              add     r10            , 8              
              mov     qword [rsp+736], r10            ; save->v92
              mov     r11            , qword [rsp+696]; load->v87
              add     r10            , r11            
              mov     qword [rsp+736], r10            ; save->v92
              mov     r10            , qword [rsp+744]; load->v93
              mov     r11            , qword [rsp+736]; translate->qword [v92]
              mov     r10            , qword [r11]    
              mov     qword [rsp+744], r10            ; save->v93
              mov     qword [rsp+752], 64             ; load->v94
              mov     qword [rsp+768], rdx            ; load->v96
              mov     qword [rsp+776], rax            ; load->v97
              mov     rax            , r14            ; load->v33
              and     rax            , -1             
              mov     r10            , qword [rsp+752]; load->v94
              and     r10d           , -1             
              mov     qword [rsp+752], r10            ; save->v94
              cqo                                     
              mov     r10            , qword [rsp+752]; load->v94
              idiv    r10d                            
              mov     qword [rsp+752], r10            ; save->v94
              mov     qword [rsp+760], rdx            ; load->v95
              mov     rdx            , qword [rsp+768]; load->v96
              mov     rax            , qword [rsp+776]; load->v97
              mov     qword [rsp+784], 4              ; load->v98
              mov     qword [rsp+800], rdx            ; load->v100
              mov     qword [rsp+808], rax            ; load->v101
              mov     rax            , qword [rsp+760]; load->v95
              and     rax            , -1             
              mov     r10            , qword [rsp+784]; load->v98
              and     r10d           , -1             
              mov     qword [rsp+784], r10            ; save->v98
              cqo                                     
              mov     r10            , qword [rsp+784]; load->v98
              idiv    r10d                            
              mov     qword [rsp+784], r10            ; save->v98
              mov     qword [rsp+792], rax            ; load->v99
              mov     rdx            , qword [rsp+800]; load->v100
              mov     rax            , qword [rsp+808]; load->v101
              mov     r10            , qword [rsp+816]; load->v102
              mov     r10            , qword [rsp+792]; load->v99
              mov     qword [rsp+816], r10            ; save->v102
              imul    r10            , 8              
              mov     qword [rsp+816], r10            ; save->v102
              add     r10            , 8              
              mov     qword [rsp+816], r10            ; save->v102
              mov     r11            , qword [rsp+744]; load->v93
              add     r10            , r11            
              mov     qword [rsp+816], r10            ; save->v102
              mov     r10            , qword [rsp+824]; load->v103
              mov     r11            , qword [rsp+816]; translate->qword [v102]
              mov     r10            , qword [r11]    
              mov     qword [rsp+824], r10            ; save->v103
              mov     r10            , qword [rsp+816]; translate->qword [v102]
              mov     r11            , qword [rsp+688]; load->v86
              mov     qword [r10]    , r11            ; assign->chunks[i/64][i%64/4]
_text__sha1_for2_continue:
              mov     r10            , qword [rsp+832]; load->v104
              mov     qword [rsp+832], r14            ; load->v33
              mov     qword [rsp+840], 1              ; load->v105
              mov     r10            , qword [rsp+848]; load->v106
              mov     qword [rsp+848], r14            ; load->v33
              mov     r10            , qword [rsp+848]; load->v106
              mov     r11            , qword [rsp+840]; load->v105
              add     r10            , r11            
              mov     qword [rsp+848], r10            ; save->v106
              mov     r10            , r14            ; load->v33
              mov     r14            , qword [rsp+848]; load->v106
              mov     r10            , r14            ; load->v33
              mov     r11            , qword [rsp+56] ; load->v7
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v33
              mov     r10            , qword [rsp+856]; load->v107
              setl    r10b                            
              mov     qword [rsp+856], r10            ; save->v107
              and     r10            , 255            
              mov     qword [rsp+856], r10            ; save->v107
              cmp     r10b           , 0              
              mov     qword [rsp+856], r10            ; save->v107
              jne     _text__sha1_for2_start                 
;----------------------------------]
;[----------------------------------
_text__sha1_for2_end:
              mov     r10            , rbx            ; load->v108
              mov     rbx            , [_data_bss_chunks]
              mov     r12            , 64             ; load->v109
              mov     r13            , rdx            ; load->v111
              mov     qword [rsp+896], rax            ; load->v112
              mov     rax            , r14            ; load->v33
              and     rax            , -1             
              mov     r10            , r12            ; load->v109
              and     r10d           , -1             
              mov     r12            , r10            ; save->v109
              cqo                                     
              mov     r10            , r12            ; load->v109
              idiv    r10d                            
              mov     r12            , rax            ; save->v109
              mov     rdx            , r13            ; load->v111
              mov     rax            , qword [rsp+896]; load->v112
              mov     r10            , r13            ; load->v113
              mov     r13            , r12            ; load->v110
              mov     r10            , r13            ; load->v113
              imul    r10            , 8              
              mov     r13            , r10            ; save->v113
              add     r10            , 8              
              mov     r13            , r10            ; save->v113
              mov     r11            , rbx            ; load->v108
              add     r10            , r11            
              mov     r13            , r10            ; save->v113
              mov     r10            , rbx            ; load->v114
              mov     r11            , r13            ; translate->qword [v113]
              mov     rbx            , qword [r11]    
              mov     r12            , 64             ; load->v115
              mov     r13            , rdx            ; load->v117
              mov     qword [rsp+944], rax            ; load->v118
              mov     rax            , r14            ; load->v33
              and     rax            , -1             
              mov     r10            , r12            ; load->v115
              and     r10d           , -1             
              mov     r12            , r10            ; save->v115
              cqo                                     
              mov     r10            , r12            ; load->v115
              idiv    r10d                            
              mov     r12            , rdx            ; save->v115
              mov     rdx            , r13            ; load->v117
              mov     rax            , qword [rsp+944]; load->v118
              mov     r13            , 4              ; load->v119
              mov     qword [rsp+968], rdx            ; load->v121
              mov     qword [rsp+976], rax            ; load->v122
              mov     rax            , r12            ; load->v116
              and     rax            , -1             
              mov     r10            , r13            ; load->v119
              and     r10d           , -1             
              mov     r13            , r10            ; save->v119
              cqo                                     
              mov     r10            , r13            ; load->v119
              idiv    r10d                            
              mov     r13            , r10            ; save->v119
              mov     r12            , rax            ; load->v120
              mov     rdx            , qword [rsp+968]; load->v121
              mov     rax            , qword [rsp+976]; load->v122
              mov     r10            , r13            ; load->v123
              mov     r13            , r12            ; load->v120
              mov     r10            , r13            ; load->v123
              imul    r10            , 8              
              mov     r13            , r10            ; save->v123
              add     r10            , 8              
              mov     r13            , r10            ; save->v123
              mov     r11            , rbx            ; load->v114
              add     r10            , r11            
              mov     r13            , r10            ; save->v123
              mov     r10            , rbx            ; load->v124
              mov     r11            , r13            ; translate->qword [v123]
              mov     rbx            , qword [r11]    
              mov     r12            , 128            ; load->v125
              mov     qword [rsp+1008], 3              ; load->v126
              mov     r13            , 4              ; load->v127
              mov     qword [rsp+1032], rdx            ; load->v129
              mov     qword [rsp+1040], rax            ; load->v130
              mov     rax            , r14            ; load->v33
              and     rax            , -1             
              mov     r10            , r13            ; load->v127
              and     r10d           , -1             
              mov     r13            , r10            ; save->v127
              cqo                                     
              mov     r10            , r13            ; load->v127
              idiv    r10d                            
              mov     r13            , rdx            ; save->v127
              mov     rdx            , qword [rsp+1032]; load->v129
              mov     rax            , qword [rsp+1040]; load->v130
              mov     r10            , qword [rsp+1048]; load->v131
              mov     r10            , qword [rsp+1008]; load->v126
              mov     qword [rsp+1048], r10            ; save->v131
              mov     r11            , r13            ; load->v128
              sub     r10            , r11            
              mov     qword [rsp+1048], r10            ; save->v131
              mov     r13            , 8              ; load->v132
              mov     r10            , qword [rsp+1064]; load->v133
              mov     r10            , qword [rsp+1048]; load->v131
              mov     qword [rsp+1064], r10            ; save->v133
              mov     r11            , r13            ; load->v132
              imul    r10            , r11            
              mov     qword [rsp+1064], r10            ; save->v133
              and     r10            , -1             
              mov     qword [rsp+1064], r10            ; save->v133
              mov     r13            , rcx            ; load->v135
              mov     r10            , qword [rsp+1072]; load->v134
              mov     qword [rsp+1072], r12            ; load->v125
              mov     rcx            , qword [rsp+1064]; load->v133
              mov     r10            , qword [rsp+1072]; load->v134
              and     r10            , -1             
              mov     qword [rsp+1072], r10            ; save->v134
              sal     r10d           , cl             
              mov     qword [rsp+1072], r10            ; save->v134
              mov     rcx            , r13            ; load->v135
              mov     r10            , r12            ; load->v136
              mov     r12            , rbx            ; load->v124
              mov     r10            , r12            ; load->v136
              mov     r11            , qword [rsp+1072]; load->v134
              or      r10            , r11            
              mov     r12            , r10            ; save->v136
              mov     r10            , rbx            ; load->v137
              mov     rbx            , [_data_bss_chunks]
              mov     r13            , 64             ; load->v138
              mov     qword [rsp+1120], rdx            ; load->v140
              mov     qword [rsp+1128], rax            ; load->v141
              mov     rax            , r14            ; load->v33
              and     rax            , -1             
              mov     r10            , r13            ; load->v138
              and     r10d           , -1             
              mov     r13            , r10            ; save->v138
              cqo                                     
              mov     r10            , r13            ; load->v138
              idiv    r10d                            
              mov     r13            , rax            ; save->v138
              mov     rdx            , qword [rsp+1120]; load->v140
              mov     rax            , qword [rsp+1128]; load->v141
              mov     r10            , qword [rsp+1136]; load->v142
              mov     qword [rsp+1136], r13            ; load->v139
              mov     r10            , qword [rsp+1136]; load->v142
              imul    r10            , 8              
              mov     qword [rsp+1136], r10            ; save->v142
              add     r10            , 8              
              mov     qword [rsp+1136], r10            ; save->v142
              mov     r11            , rbx            ; load->v137
              add     r10            , r11            
              mov     qword [rsp+1136], r10            ; save->v142
              mov     r10            , rbx            ; load->v143
              mov     r11            , qword [rsp+1136]; translate->qword [v142]
              mov     rbx            , qword [r11]    
              mov     r13            , 64             ; load->v144
              mov     qword [rsp+1168], rdx            ; load->v146
              mov     qword [rsp+1176], rax            ; load->v147
              mov     rax            , r14            ; load->v33
              and     rax            , -1             
              mov     r10            , r13            ; load->v144
              and     r10d           , -1             
              mov     r13            , r10            ; save->v144
              cqo                                     
              mov     r10            , r13            ; load->v144
              idiv    r10d                            
              mov     r13            , rdx            ; save->v144
              mov     rdx            , qword [rsp+1168]; load->v146
              mov     rax            , qword [rsp+1176]; load->v147
              mov     qword [rsp+1184], 4              ; load->v148
              mov     qword [rsp+1200], rdx            ; load->v150
              mov     qword [rsp+1208], rax            ; load->v151
              mov     rax            , r13            ; load->v145
              and     rax            , -1             
              mov     r10            , qword [rsp+1184]; load->v148
              and     r10d           , -1             
              mov     qword [rsp+1184], r10            ; save->v148
              cqo                                     
              mov     r10            , qword [rsp+1184]; load->v148
              idiv    r10d                            
              mov     qword [rsp+1184], r10            ; save->v148
              mov     r13            , rax            ; load->v149
              mov     rdx            , qword [rsp+1200]; load->v150
              mov     rax            , qword [rsp+1208]; load->v151
              mov     r10            , qword [rsp+1216]; load->v152
              mov     qword [rsp+1216], r13            ; load->v149
              mov     r10            , qword [rsp+1216]; load->v152
              imul    r10            , 8              
              mov     qword [rsp+1216], r10            ; save->v152
              add     r10            , 8              
              mov     qword [rsp+1216], r10            ; save->v152
              mov     r11            , rbx            ; load->v143
              add     r10            , r11            
              mov     qword [rsp+1216], r10            ; save->v152
              mov     r10            , rbx            ; load->v153
              mov     r11            , qword [rsp+1216]; translate->qword [v152]
              mov     rbx            , qword [r11]    
              mov     r10            , qword [rsp+1216]; translate->qword [v152]
              mov     qword [r10]    , r12            ; load->v136
              mov     rbx            , 3              ; load->v154
              mov     r12            , rcx            ; load->v156
              mov     r10            , r13            ; load->v155
              mov     r13            , qword [rsp+56] ; load->v7
              mov     rcx            , rbx            ; load->v154
              mov     r10            , r13            ; load->v155
              and     r10            , -1             
              mov     r13            , r10            ; save->v155
              sal     r10d           , cl             
              mov     r13            , r10            ; save->v155
              mov     rcx            , r12            ; load->v156
              mov     r10            , rbx            ; load->v157
              mov     rbx            , [_data_bss_chunks]
              mov     r12            , 1              ; load->v158
              mov     r10            , qword [rsp+1272]; load->v159
              mov     r10            , qword [rsp+144]; load->v18
              mov     qword [rsp+1272], r10            ; save->v159
              mov     r11            , r12            ; load->v158
              sub     r10            , r11            
              mov     qword [rsp+1272], r10            ; save->v159
              mov     r10            , r12            ; load->v160
              mov     r12            , qword [rsp+1272]; load->v159
              mov     r10            , r12            ; load->v160
              imul    r10            , 8              
              mov     r12            , r10            ; save->v160
              add     r10            , 8              
              mov     r12            , r10            ; save->v160
              mov     r11            , rbx            ; load->v157
              add     r10            , r11            
              mov     r12            , r10            ; save->v160
              mov     r10            , rbx            ; load->v161
              mov     r11            , r12            ; translate->qword [v160]
              mov     rbx            , qword [r11]    
              mov     r12            , 15             ; load->v162
              mov     r10            , qword [rsp+1304]; load->v163
              mov     qword [rsp+1304], r12            ; load->v162
              mov     r10            , qword [rsp+1304]; load->v163
              imul    r10            , 8              
              mov     qword [rsp+1304], r10            ; save->v163
              add     r10            , 8              
              mov     qword [rsp+1304], r10            ; save->v163
              mov     r11            , rbx            ; load->v161
              add     r10            , r11            
              mov     qword [rsp+1304], r10            ; save->v163
              mov     r10            , rbx            ; load->v164
              mov     r11            , qword [rsp+1304]; translate->qword [v163]
              mov     rbx            , qword [r11]    
              mov     r10            , qword [rsp+1304]; translate->qword [v163]
              mov     qword [r10]    , r13            ; load->v155
              mov     rbx            , 29             ; load->v165
              mov     r12            , rcx            ; load->v167
              mov     r10            , r13            ; load->v166
              mov     r13            , qword [rsp+56] ; load->v7
              mov     rcx            , rbx            ; load->v165
              mov     r10            , r13            ; load->v166
              and     r10            , -1             
              mov     r13            , r10            ; save->v166
              sar     r10d           , cl             
              mov     r13            , r10            ; save->v166
              mov     rcx            , r12            ; load->v167
              mov     rbx            , 7              ; load->v168
              mov     r10            , r12            ; load->v169
              mov     r12            , r13            ; load->v166
              mov     r10            , r12            ; load->v169
              mov     r11            , rbx            ; load->v168
              and     r10            , r11            
              mov     r12            , r10            ; save->v169
              mov     r10            , rbx            ; load->v170
              mov     rbx            , [_data_bss_chunks]
              mov     r13            , 1              ; load->v171
              mov     r10            , qword [rsp+1376]; load->v172
              mov     r10            , qword [rsp+144]; load->v18
              mov     qword [rsp+1376], r10            ; save->v172
              mov     r11            , r13            ; load->v171
              sub     r10            , r11            
              mov     qword [rsp+1376], r10            ; save->v172
              mov     r10            , r13            ; load->v173
              mov     r13            , qword [rsp+1376]; load->v172
              mov     r10            , r13            ; load->v173
              imul    r10            , 8              
              mov     r13            , r10            ; save->v173
              add     r10            , 8              
              mov     r13            , r10            ; save->v173
              mov     r11            , rbx            ; load->v170
              add     r10            , r11            
              mov     r13            , r10            ; save->v173
              mov     r10            , rbx            ; load->v174
              mov     r11            , r13            ; translate->qword [v173]
              mov     rbx            , qword [r11]    
              mov     r13            , 14             ; load->v175
              mov     r10            , qword [rsp+1408]; load->v176
              mov     qword [rsp+1408], r13            ; load->v175
              mov     r10            , qword [rsp+1408]; load->v176
              imul    r10            , 8              
              mov     qword [rsp+1408], r10            ; save->v176
              add     r10            , 8              
              mov     qword [rsp+1408], r10            ; save->v176
              mov     r11            , rbx            ; load->v174
              add     r10            , r11            
              mov     qword [rsp+1408], r10            ; save->v176
              mov     r10            , rbx            ; load->v177
              mov     r11            , qword [rsp+1408]; translate->qword [v176]
              mov     rbx            , qword [r11]    
              mov     r10            , qword [rsp+1408]; translate->qword [v176]
              mov     qword [r10]    , r12            ; load->v169
              mov     rbx            , 1732584193     ; load->v178
              mov     r10            , qword [rsp+1432]; load->v179
              mov     qword [rsp+1432], rbx            ; load->v178
              mov     rbx            , 43913          ; load->v180
              mov     r13            , 61389          ; load->v181
_text__sha1_call1:
              mov     rdi            , rbx            ; load->v180
              mov     rsi            , r13            ; load->v181
_text__sha1_saveReg1_save:
              mov     qword [rsp+1456], rax            ; load->v182
              mov     qword [rsp+1464], rdi            ; load->v183
              mov     qword [rsp+1472], rsi            ; load->v184
              mov     qword [rsp+1480], rdx            ; load->v185
              mov     qword [rsp+1488], rcx            ; load->v186
              mov     qword [rsp+1496], r8             ; load->v187
              mov     qword [rsp+1504], r9             ; load->v188
              mov     r10            , qword [rsp+1512]; load->v189
              mov     qword [rsp+1520], r11            ; load->v190
              call    _text__lohi                     
              mov     rbx            , rax            ; load->v191
_text__sha1_saveReg1_load:
              mov     rax            , qword [rsp+1456]; load->v182
              mov     rdi            , qword [rsp+1464]; load->v183
              mov     rsi            , qword [rsp+1472]; load->v184
              mov     rdx            , qword [rsp+1480]; load->v185
              mov     rcx            , qword [rsp+1488]; load->v186
              mov     r8             , qword [rsp+1496]; load->v187
              mov     r9             , qword [rsp+1504]; load->v188
              mov     r10            , qword [rsp+1512]; load->v189
              mov     r11            , qword [rsp+1520]; load->v190
              mov     r10            , qword [rsp+1536]; load->v192
              mov     qword [rsp+1536], rbx            ; load->v191
              mov     rbx            , 56574          ; load->v193
              mov     qword [rsp+1552], 39098          ; load->v194
_text__sha1_call2:
              mov     rdi            , rbx            ; load->v193
              mov     rsi            , qword [rsp+1552]; load->v194
_text__sha1_saveReg2_save:
              mov     qword [rsp+1560], rax            ; load->v195
              mov     qword [rsp+1568], rdi            ; load->v196
              mov     qword [rsp+1576], rsi            ; load->v197
              mov     qword [rsp+1584], rdx            ; load->v198
              mov     qword [rsp+1592], rcx            ; load->v199
              mov     qword [rsp+1600], r8             ; load->v200
              mov     qword [rsp+1608], r9             ; load->v201
              mov     r10            , qword [rsp+1616]; load->v202
              mov     qword [rsp+1624], r11            ; load->v203
              call    _text__lohi                     
              mov     qword [rsp+1632], rax            ; load->v204
_text__sha1_saveReg2_load:
              mov     rax            , qword [rsp+1560]; load->v195
              mov     rdi            , qword [rsp+1568]; load->v196
              mov     rsi            , qword [rsp+1576]; load->v197
              mov     rdx            , qword [rsp+1584]; load->v198
              mov     rcx            , qword [rsp+1592]; load->v199
              mov     r8             , qword [rsp+1600]; load->v200
              mov     r9             , qword [rsp+1608]; load->v201
              mov     r10            , qword [rsp+1616]; load->v202
              mov     r11            , qword [rsp+1624]; load->v203
              mov     r10            , qword [rsp+1640]; load->v205
              mov     r10            , qword [rsp+1632]; load->v204
              mov     qword [rsp+1640], r10            ; save->v205
              mov     qword [rsp+1648], 271733878      ; load->v206
              mov     r10            , qword [rsp+1656]; load->v207
              mov     r10            , qword [rsp+1648]; load->v206
              mov     qword [rsp+1656], r10            ; save->v207
              mov     r13            , 57840          ; load->v208
              mov     qword [rsp+1672], 50130          ; load->v209
_text__sha1_call3:
              mov     rdi            , r13            ; load->v208
              mov     rsi            , qword [rsp+1672]; load->v209
_text__sha1_saveReg3_save:
              mov     qword [rsp+1680], rax            ; load->v210
              mov     qword [rsp+1688], rdi            ; load->v211
              mov     qword [rsp+1696], rsi            ; load->v212
              mov     qword [rsp+1704], rdx            ; load->v213
              mov     qword [rsp+1712], rcx            ; load->v214
              mov     qword [rsp+1720], r8             ; load->v215
              mov     qword [rsp+1728], r9             ; load->v216
              mov     r10            , qword [rsp+1736]; load->v217
              mov     qword [rsp+1744], r11            ; load->v218
              call    _text__lohi                     
              mov     qword [rsp+1752], rax            ; load->v219
_text__sha1_saveReg3_load:
              mov     rax            , qword [rsp+1680]; load->v210
              mov     rdi            , qword [rsp+1688]; load->v211
              mov     rsi            , qword [rsp+1696]; load->v212
              mov     rdx            , qword [rsp+1704]; load->v213
              mov     rcx            , qword [rsp+1712]; load->v214
              mov     r8             , qword [rsp+1720]; load->v215
              mov     r9             , qword [rsp+1728]; load->v216
              mov     r10            , qword [rsp+1736]; load->v217
              mov     r11            , qword [rsp+1744]; load->v218
              mov     r10            , qword [rsp+1760]; load->v220
              mov     r10            , qword [rsp+1752]; load->v219
              mov     qword [rsp+1760], r10            ; save->v220
_text__sha1_for3_init:
              mov     qword [rsp+1768], 0              ; load->v221
              mov     r10            , r14            ; load->v33
              mov     r14            , qword [rsp+1768]; load->v221
              mov     r10            , r14            ; load->v33
              mov     r11            , qword [rsp+144]; load->v18
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v33
              mov     r10            , qword [rsp+1776]; load->v222
              setl    r10b                            
              mov     qword [rsp+1776], r10            ; save->v222
              and     r10            , 255            
              mov     qword [rsp+1776], r10            ; save->v222
_text__sha1_for3_init_check:
              mov     r10            , qword [rsp+1776]; load->v222
              cmp     r10b           , 0              
              mov     qword [rsp+1776], r10            ; save->v222
              je      _text__sha1_for3_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_for3_start:
_text__sha1_for4_init:
              mov     r15            , 16             ; load->v223
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+272], r15            ; load->v223
              mov     qword [rsp+1792], 80             ; load->v224
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+1792]; load->v224
              cmp     r10d           , r11d           
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+1800]; load->v225
              setl    r10b                            
              mov     qword [rsp+1800], r10            ; save->v225
              and     r10            , 255            
              mov     qword [rsp+1800], r10            ; save->v225
_text__sha1_for4_init_check:
              mov     r10            , qword [rsp+1800]; load->v225
              cmp     r10b           , 0              
              mov     qword [rsp+1800], r10            ; save->v225
              je      _text__sha1_for4_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_for4_start:
              mov     r10            , qword [rsp+1808]; load->v226
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+1808], r10            ; save->v226
              mov     r10            , qword [rsp+1816]; load->v227
              mov     qword [rsp+1816], r14            ; load->v33
              mov     r10            , qword [rsp+1816]; load->v227
              imul    r10            , 8              
              mov     qword [rsp+1816], r10            ; save->v227
              add     r10            , 8              
              mov     qword [rsp+1816], r10            ; save->v227
              mov     r11            , qword [rsp+1808]; load->v226
              add     r10            , r11            
              mov     qword [rsp+1816], r10            ; save->v227
              mov     r10            , qword [rsp+1824]; load->v228
              mov     r11            , qword [rsp+1816]; translate->qword [v227]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1824], r10            ; save->v228
              mov     qword [rsp+1832], 3              ; load->v229
              mov     r10            , qword [rsp+1840]; load->v230
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+1840], r10            ; save->v230
              mov     r11            , qword [rsp+1832]; load->v229
              sub     r10            , r11            
              mov     qword [rsp+1840], r10            ; save->v230
              mov     r10            , qword [rsp+1848]; load->v231
              mov     r10            , qword [rsp+1840]; load->v230
              mov     qword [rsp+1848], r10            ; save->v231
              imul    r10            , 8              
              mov     qword [rsp+1848], r10            ; save->v231
              add     r10            , 8              
              mov     qword [rsp+1848], r10            ; save->v231
              mov     r11            , qword [rsp+1824]; load->v228
              add     r10            , r11            
              mov     qword [rsp+1848], r10            ; save->v231
              mov     r10            , qword [rsp+1856]; load->v232
              mov     r11            , qword [rsp+1848]; translate->qword [v231]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1856], r10            ; save->v232
              mov     r10            , qword [rsp+1864]; load->v233
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+1864], r10            ; save->v233
              mov     r10            , qword [rsp+1872]; load->v234
              mov     qword [rsp+1872], r14            ; load->v33
              mov     r10            , qword [rsp+1872]; load->v234
              imul    r10            , 8              
              mov     qword [rsp+1872], r10            ; save->v234
              add     r10            , 8              
              mov     qword [rsp+1872], r10            ; save->v234
              mov     r11            , qword [rsp+1864]; load->v233
              add     r10            , r11            
              mov     qword [rsp+1872], r10            ; save->v234
              mov     r10            , qword [rsp+1880]; load->v235
              mov     r11            , qword [rsp+1872]; translate->qword [v234]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1880], r10            ; save->v235
              mov     qword [rsp+1888], 8              ; load->v236
              mov     r10            , qword [rsp+1896]; load->v237
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+1896], r10            ; save->v237
              mov     r11            , qword [rsp+1888]; load->v236
              sub     r10            , r11            
              mov     qword [rsp+1896], r10            ; save->v237
              mov     r10            , qword [rsp+1904]; load->v238
              mov     r10            , qword [rsp+1896]; load->v237
              mov     qword [rsp+1904], r10            ; save->v238
              imul    r10            , 8              
              mov     qword [rsp+1904], r10            ; save->v238
              add     r10            , 8              
              mov     qword [rsp+1904], r10            ; save->v238
              mov     r11            , qword [rsp+1880]; load->v235
              add     r10            , r11            
              mov     qword [rsp+1904], r10            ; save->v238
              mov     r10            , qword [rsp+1912]; load->v239
              mov     r11            , qword [rsp+1904]; translate->qword [v238]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1912], r10            ; save->v239
              mov     r10            , qword [rsp+1920]; load->v240
              mov     r10            , qword [rsp+1856]; load->v232
              mov     qword [rsp+1920], r10            ; save->v240
              mov     r11            , qword [rsp+1912]; load->v239
              xor     r10            , r11            
              mov     qword [rsp+1920], r10            ; save->v240
              and     r10            , -1             
              mov     qword [rsp+1920], r10            ; save->v240
              mov     r10            , qword [rsp+1928]; load->v241
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+1928], r10            ; save->v241
              mov     r10            , qword [rsp+1936]; load->v242
              mov     qword [rsp+1936], r14            ; load->v33
              mov     r10            , qword [rsp+1936]; load->v242
              imul    r10            , 8              
              mov     qword [rsp+1936], r10            ; save->v242
              add     r10            , 8              
              mov     qword [rsp+1936], r10            ; save->v242
              mov     r11            , qword [rsp+1928]; load->v241
              add     r10            , r11            
              mov     qword [rsp+1936], r10            ; save->v242
              mov     r10            , qword [rsp+1944]; load->v243
              mov     r11            , qword [rsp+1936]; translate->qword [v242]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1944], r10            ; save->v243
              mov     qword [rsp+1952], 14             ; load->v244
              mov     r10            , qword [rsp+1960]; load->v245
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+1960], r10            ; save->v245
              mov     r11            , qword [rsp+1952]; load->v244
              sub     r10            , r11            
              mov     qword [rsp+1960], r10            ; save->v245
              mov     r10            , qword [rsp+1968]; load->v246
              mov     r10            , qword [rsp+1960]; load->v245
              mov     qword [rsp+1968], r10            ; save->v246
              imul    r10            , 8              
              mov     qword [rsp+1968], r10            ; save->v246
              add     r10            , 8              
              mov     qword [rsp+1968], r10            ; save->v246
              mov     r11            , qword [rsp+1944]; load->v243
              add     r10            , r11            
              mov     qword [rsp+1968], r10            ; save->v246
              mov     r10            , qword [rsp+1976]; load->v247
              mov     r11            , qword [rsp+1968]; translate->qword [v246]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1976], r10            ; save->v247
              mov     r10            , qword [rsp+1984]; load->v248
              mov     r10            , qword [rsp+1920]; load->v240
              mov     qword [rsp+1984], r10            ; save->v248
              mov     r11            , qword [rsp+1976]; load->v247
              xor     r10            , r11            
              mov     qword [rsp+1984], r10            ; save->v248
              and     r10            , -1             
              mov     qword [rsp+1984], r10            ; save->v248
              mov     r10            , qword [rsp+1992]; load->v249
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+1992], r10            ; save->v249
              mov     r10            , qword [rsp+2000]; load->v250
              mov     qword [rsp+2000], r14            ; load->v33
              mov     r10            , qword [rsp+2000]; load->v250
              imul    r10            , 8              
              mov     qword [rsp+2000], r10            ; save->v250
              add     r10            , 8              
              mov     qword [rsp+2000], r10            ; save->v250
              mov     r11            , qword [rsp+1992]; load->v249
              add     r10            , r11            
              mov     qword [rsp+2000], r10            ; save->v250
              mov     r10            , qword [rsp+2008]; load->v251
              mov     r11            , qword [rsp+2000]; translate->qword [v250]
              mov     r10            , qword [r11]    
              mov     qword [rsp+2008], r10            ; save->v251
              mov     qword [rsp+2016], 16             ; load->v252
              mov     r10            , qword [rsp+2024]; load->v253
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+2024], r10            ; save->v253
              mov     r11            , qword [rsp+2016]; load->v252
              sub     r10            , r11            
              mov     qword [rsp+2024], r10            ; save->v253
              mov     r10            , qword [rsp+2032]; load->v254
              mov     r10            , qword [rsp+2024]; load->v253
              mov     qword [rsp+2032], r10            ; save->v254
              imul    r10            , 8              
              mov     qword [rsp+2032], r10            ; save->v254
              add     r10            , 8              
              mov     qword [rsp+2032], r10            ; save->v254
              mov     r11            , qword [rsp+2008]; load->v251
              add     r10            , r11            
              mov     qword [rsp+2032], r10            ; save->v254
              mov     r10            , qword [rsp+2040]; load->v255
              mov     r11            , qword [rsp+2032]; translate->qword [v254]
              mov     r10            , qword [r11]    
              mov     qword [rsp+2040], r10            ; save->v255
              mov     r10            , qword [rsp+2048]; load->v256
              mov     r10            , qword [rsp+1984]; load->v248
              mov     qword [rsp+2048], r10            ; save->v256
              mov     r11            , qword [rsp+2040]; load->v255
              xor     r10            , r11            
              mov     qword [rsp+2048], r10            ; save->v256
              and     r10            , -1             
              mov     qword [rsp+2048], r10            ; save->v256
              mov     qword [rsp+2056], 1              ; load->v257
_text__sha1_call4:
              mov     rdi            , qword [rsp+2048]; load->v256
              mov     rsi            , qword [rsp+2056]; load->v257
_text__sha1_saveReg4_save:
              mov     qword [rsp+2064], rax            ; load->v258
              mov     qword [rsp+2072], rdi            ; load->v259
              mov     qword [rsp+2080], rsi            ; load->v260
              mov     qword [rsp+2088], rdx            ; load->v261
              mov     qword [rsp+2096], rcx            ; load->v262
              mov     qword [rsp+2104], r8             ; load->v263
              mov     qword [rsp+2112], r9             ; load->v264
              mov     r10            , qword [rsp+2120]; load->v265
              mov     qword [rsp+2128], r11            ; load->v266
              call    _text__rotate_left                 
              mov     qword [rsp+2136], rax            ; load->v267
_text__sha1_saveReg4_load:
              mov     rax            , qword [rsp+2064]; load->v258
              mov     rdi            , qword [rsp+2072]; load->v259
              mov     rsi            , qword [rsp+2080]; load->v260
              mov     rdx            , qword [rsp+2088]; load->v261
              mov     rcx            , qword [rsp+2096]; load->v262
              mov     r8             , qword [rsp+2104]; load->v263
              mov     r9             , qword [rsp+2112]; load->v264
              mov     r10            , qword [rsp+2120]; load->v265
              mov     r11            , qword [rsp+2128]; load->v266
              mov     r10            , qword [rsp+2144]; load->v268
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+2144], r10            ; save->v268
              mov     r10            , qword [rsp+2152]; load->v269
              mov     qword [rsp+2152], r14            ; load->v33
              mov     r10            , qword [rsp+2152]; load->v269
              imul    r10            , 8              
              mov     qword [rsp+2152], r10            ; save->v269
              add     r10            , 8              
              mov     qword [rsp+2152], r10            ; save->v269
              mov     r11            , qword [rsp+2144]; load->v268
              add     r10            , r11            
              mov     qword [rsp+2152], r10            ; save->v269
              mov     r10            , qword [rsp+2160]; load->v270
              mov     r11            , qword [rsp+2152]; translate->qword [v269]
              mov     r10            , qword [r11]    
              mov     qword [rsp+2160], r10            ; save->v270
              mov     r10            , qword [rsp+2168]; load->v271
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+2168], r10            ; save->v271
              imul    r10            , 8              
              mov     qword [rsp+2168], r10            ; save->v271
              add     r10            , 8              
              mov     qword [rsp+2168], r10            ; save->v271
              mov     r11            , qword [rsp+2160]; load->v270
              add     r10            , r11            
              mov     qword [rsp+2168], r10            ; save->v271
              mov     r10            , qword [rsp+2176]; load->v272
              mov     r11            , qword [rsp+2168]; translate->qword [v271]
              mov     r10            , qword [r11]    
              mov     qword [rsp+2176], r10            ; save->v272
              mov     r10            , qword [rsp+2168]; translate->qword [v271]
              mov     r11            , qword [rsp+2136]; load->v267
              mov     qword [r10]    , r11            ; assign->chunks[i][j]
_text__sha1_for4_continue:
              mov     r10            , qword [rsp+2184]; load->v273
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+2184], r10            ; save->v273
              mov     qword [rsp+2192], 1              ; load->v274
              mov     r10            , qword [rsp+2200]; load->v275
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+2200], r10            ; save->v275
              mov     r11            , qword [rsp+2192]; load->v274
              add     r10            , r11            
              mov     qword [rsp+2200], r10            ; save->v275
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , qword [rsp+2200]; load->v275
              mov     qword [rsp+272], r10            ; save->v34
              mov     qword [rsp+2208], 80             ; load->v276
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+2208]; load->v276
              cmp     r10d           , r11d           
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+2216]; load->v277
              setl    r10b                            
              mov     qword [rsp+2216], r10            ; save->v277
              and     r10            , 255            
              mov     qword [rsp+2216], r10            ; save->v277
              cmp     r10b           , 0              
              mov     qword [rsp+2216], r10            ; save->v277
              jne     _text__sha1_for4_start                 
;----------------------------------]
;[----------------------------------
_text__sha1_for4_end:
              mov     r10            , rbx            ; load->v278
              mov     rbx            , qword [rsp+1432]; load->v179
              mov     r10            , r12            ; load->v279
              mov     r12            , qword [rsp+1536]; load->v192
              mov     r10            , r13            ; load->v280
              mov     r13            , qword [rsp+1640]; load->v205
              mov     r10            , qword [rsp+2248]; load->v281
              mov     r10            , qword [rsp+1656]; load->v207
              mov     qword [rsp+2248], r10            ; save->v281
              mov     r10            , qword [rsp+2256]; load->v282
              mov     r10            , qword [rsp+1760]; load->v220
              mov     qword [rsp+2256], r10            ; save->v282
_text__sha1_for5_init:
              mov     r15            , 0              ; load->v283
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+272], r15            ; load->v283
              mov     qword [rsp+2272], 80             ; load->v284
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+2272]; load->v284
              cmp     r10d           , r11d           
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+2280]; load->v285
              setl    r10b                            
              mov     qword [rsp+2280], r10            ; save->v285
              and     r10            , 255            
              mov     qword [rsp+2280], r10            ; save->v285
_text__sha1_for5_init_check:
              mov     r10            , qword [rsp+2280]; load->v285
              cmp     r10b           , 0              
              mov     qword [rsp+2280], r10            ; save->v285
              je      _text__sha1_for5_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_for5_start:
_text__sha1_if1_init:
              mov     qword [rsp+2304], 20             ; load->v288
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+2304]; load->v288
              cmp     r10d           , r11d           
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+2312]; load->v289
              setl    r10b                            
              mov     qword [rsp+2312], r10            ; save->v289
              and     r10            , 255            
              mov     qword [rsp+2312], r10            ; save->v289
_text__sha1_if1_check:
              mov     r10            , qword [rsp+2312]; load->v289
              cmp     r10b           , 0              
              mov     qword [rsp+2312], r10            ; save->v289
              je      _text__sha1_if1_else                 
;----------------------------------]
;[----------------------------------
_text__sha1_if1_start:
              mov     r10            , qword [rsp+2320]; load->v290
              mov     qword [rsp+2320], r12            ; load->v279
              mov     r10            , qword [rsp+2320]; load->v290
              mov     r11            , r13            ; load->v280
              and     r10            , r11            
              mov     qword [rsp+2320], r10            ; save->v290
              mov     r10            , qword [rsp+2328]; load->v291
              mov     qword [rsp+2328], r12            ; load->v279
              mov     r10            , qword [rsp+2328]; load->v291
              not     r10                             
              mov     qword [rsp+2328], r10            ; save->v291
              and     r10            , -1             
              mov     qword [rsp+2328], r10            ; save->v291
              mov     r10            , qword [rsp+2336]; load->v292
              mov     r10            , qword [rsp+2328]; load->v291
              mov     qword [rsp+2336], r10            ; save->v292
              mov     r11            , qword [rsp+2248]; load->v281
              and     r10            , r11            
              mov     qword [rsp+2336], r10            ; save->v292
              mov     r10            , qword [rsp+2344]; load->v293
              mov     r10            , qword [rsp+2320]; load->v290
              mov     qword [rsp+2344], r10            ; save->v293
              mov     r11            , qword [rsp+2336]; load->v292
              or      r10            , r11            
              mov     qword [rsp+2344], r10            ; save->v293
              mov     r10            , qword [rsp+2288]; load->v286
              mov     r10            , qword [rsp+2344]; load->v293
              mov     qword [rsp+2288], r10            ; save->v286
              mov     qword [rsp+2352], 1518500249     ; load->v294
              mov     r10            , qword [rsp+2296]; load->v287
              mov     r10            , qword [rsp+2352]; load->v294
              mov     qword [rsp+2296], r10            ; save->v287
              jmp     _text__sha1_if1_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_if1_else:
_text__sha1_if2_init:
              mov     qword [rsp+2360], 40             ; load->v295
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+2360]; load->v295
              cmp     r10d           , r11d           
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+2368]; load->v296
              setl    r10b                            
              mov     qword [rsp+2368], r10            ; save->v296
              and     r10            , 255            
              mov     qword [rsp+2368], r10            ; save->v296
_text__sha1_if2_check:
              mov     r10            , qword [rsp+2368]; load->v296
              cmp     r10b           , 0              
              mov     qword [rsp+2368], r10            ; save->v296
              je      _text__sha1_if2_else                 
;----------------------------------]
;[----------------------------------
_text__sha1_if2_start:
              mov     r10            , qword [rsp+2376]; load->v297
              mov     qword [rsp+2376], r12            ; load->v279
              mov     r10            , qword [rsp+2376]; load->v297
              mov     r11            , r13            ; load->v280
              xor     r10            , r11            
              mov     qword [rsp+2376], r10            ; save->v297
              and     r10            , -1             
              mov     qword [rsp+2376], r10            ; save->v297
              mov     r10            , qword [rsp+2384]; load->v298
              mov     r10            , qword [rsp+2376]; load->v297
              mov     qword [rsp+2384], r10            ; save->v298
              mov     r11            , qword [rsp+2248]; load->v281
              xor     r10            , r11            
              mov     qword [rsp+2384], r10            ; save->v298
              and     r10            , -1             
              mov     qword [rsp+2384], r10            ; save->v298
              mov     r10            , qword [rsp+2288]; load->v286
              mov     r10            , qword [rsp+2384]; load->v298
              mov     qword [rsp+2288], r10            ; save->v286
              mov     qword [rsp+2392], 1859775393     ; load->v299
              mov     r10            , qword [rsp+2296]; load->v287
              mov     r10            , qword [rsp+2392]; load->v299
              mov     qword [rsp+2296], r10            ; save->v287
              jmp     _text__sha1_if2_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_if2_else:
_text__sha1_if3_init:
              mov     qword [rsp+2400], 60             ; load->v300
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+2400]; load->v300
              cmp     r10d           , r11d           
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+2408]; load->v301
              setl    r10b                            
              mov     qword [rsp+2408], r10            ; save->v301
              and     r10            , 255            
              mov     qword [rsp+2408], r10            ; save->v301
_text__sha1_if3_check:
              mov     r10            , qword [rsp+2408]; load->v301
              cmp     r10b           , 0              
              mov     qword [rsp+2408], r10            ; save->v301
              je      _text__sha1_if3_else                 
;----------------------------------]
;[----------------------------------
_text__sha1_if3_start:
              mov     r10            , qword [rsp+2416]; load->v302
              mov     qword [rsp+2416], r12            ; load->v279
              mov     r10            , qword [rsp+2416]; load->v302
              mov     r11            , r13            ; load->v280
              and     r10            , r11            
              mov     qword [rsp+2416], r10            ; save->v302
              mov     r10            , qword [rsp+2424]; load->v303
              mov     qword [rsp+2424], r12            ; load->v279
              mov     r10            , qword [rsp+2424]; load->v303
              mov     r11            , qword [rsp+2248]; load->v281
              and     r10            , r11            
              mov     qword [rsp+2424], r10            ; save->v303
              mov     r10            , qword [rsp+2432]; load->v304
              mov     r10            , qword [rsp+2416]; load->v302
              mov     qword [rsp+2432], r10            ; save->v304
              mov     r11            , qword [rsp+2424]; load->v303
              or      r10            , r11            
              mov     qword [rsp+2432], r10            ; save->v304
              mov     r10            , qword [rsp+2440]; load->v305
              mov     qword [rsp+2440], r13            ; load->v280
              mov     r10            , qword [rsp+2440]; load->v305
              mov     r11            , qword [rsp+2248]; load->v281
              and     r10            , r11            
              mov     qword [rsp+2440], r10            ; save->v305
              mov     r10            , qword [rsp+2448]; load->v306
              mov     r10            , qword [rsp+2432]; load->v304
              mov     qword [rsp+2448], r10            ; save->v306
              mov     r11            , qword [rsp+2440]; load->v305
              or      r10            , r11            
              mov     qword [rsp+2448], r10            ; save->v306
              mov     r10            , qword [rsp+2288]; load->v286
              mov     r10            , qword [rsp+2448]; load->v306
              mov     qword [rsp+2288], r10            ; save->v286
              mov     qword [rsp+2456], 48348          ; load->v307
              mov     qword [rsp+2464], 36635          ; load->v308
_text__sha1_call5:
              mov     rdi            , qword [rsp+2456]; load->v307
              mov     rsi            , qword [rsp+2464]; load->v308
_text__sha1_saveReg5_save:
              mov     qword [rsp+2472], rax            ; load->v309
              mov     qword [rsp+2480], rdi            ; load->v310
              mov     qword [rsp+2488], rsi            ; load->v311
              mov     qword [rsp+2496], rdx            ; load->v312
              mov     qword [rsp+2504], rcx            ; load->v313
              mov     qword [rsp+2512], r8             ; load->v314
              mov     qword [rsp+2520], r9             ; load->v315
              mov     r10            , qword [rsp+2528]; load->v316
              mov     qword [rsp+2536], r11            ; load->v317
              call    _text__lohi                     
              mov     qword [rsp+2544], rax            ; load->v318
_text__sha1_saveReg5_load:
              mov     rax            , qword [rsp+2472]; load->v309
              mov     rdi            , qword [rsp+2480]; load->v310
              mov     rsi            , qword [rsp+2488]; load->v311
              mov     rdx            , qword [rsp+2496]; load->v312
              mov     rcx            , qword [rsp+2504]; load->v313
              mov     r8             , qword [rsp+2512]; load->v314
              mov     r9             , qword [rsp+2520]; load->v315
              mov     r10            , qword [rsp+2528]; load->v316
              mov     r11            , qword [rsp+2536]; load->v317
              mov     r10            , qword [rsp+2296]; load->v287
              mov     r10            , qword [rsp+2544]; load->v318
              mov     qword [rsp+2296], r10            ; save->v287
              jmp     _text__sha1_if3_end                 
;----------------------------------]
;[----------------------------------
_text__sha1_if3_else:
              mov     r10            , qword [rsp+2552]; load->v319
              mov     qword [rsp+2552], r12            ; load->v279
              mov     r10            , qword [rsp+2552]; load->v319
              mov     r11            , r13            ; load->v280
              xor     r10            , r11            
              mov     qword [rsp+2552], r10            ; save->v319
              and     r10            , -1             
              mov     qword [rsp+2552], r10            ; save->v319
              mov     r10            , qword [rsp+2560]; load->v320
              mov     r10            , qword [rsp+2552]; load->v319
              mov     qword [rsp+2560], r10            ; save->v320
              mov     r11            , qword [rsp+2248]; load->v281
              xor     r10            , r11            
              mov     qword [rsp+2560], r10            ; save->v320
              and     r10            , -1             
              mov     qword [rsp+2560], r10            ; save->v320
              mov     r10            , qword [rsp+2288]; load->v286
              mov     r10            , qword [rsp+2560]; load->v320
              mov     qword [rsp+2288], r10            ; save->v286
              mov     qword [rsp+2568], 49622          ; load->v321
              mov     qword [rsp+2576], 51810          ; load->v322
_text__sha1_call6:
              mov     rdi            , qword [rsp+2568]; load->v321
              mov     rsi            , qword [rsp+2576]; load->v322
_text__sha1_saveReg6_save:
              mov     qword [rsp+2584], rax            ; load->v323
              mov     qword [rsp+2592], rdi            ; load->v324
              mov     qword [rsp+2600], rsi            ; load->v325
              mov     qword [rsp+2608], rdx            ; load->v326
              mov     qword [rsp+2616], rcx            ; load->v327
              mov     qword [rsp+2624], r8             ; load->v328
              mov     qword [rsp+2632], r9             ; load->v329
              mov     r10            , qword [rsp+2640]; load->v330
              mov     qword [rsp+2648], r11            ; load->v331
              call    _text__lohi                     
              mov     qword [rsp+2656], rax            ; load->v332
_text__sha1_saveReg6_load:
              mov     rax            , qword [rsp+2584]; load->v323
              mov     rdi            , qword [rsp+2592]; load->v324
              mov     rsi            , qword [rsp+2600]; load->v325
              mov     rdx            , qword [rsp+2608]; load->v326
              mov     rcx            , qword [rsp+2616]; load->v327
              mov     r8             , qword [rsp+2624]; load->v328
              mov     r9             , qword [rsp+2632]; load->v329
              mov     r10            , qword [rsp+2640]; load->v330
              mov     r11            , qword [rsp+2648]; load->v331
              mov     r10            , qword [rsp+2296]; load->v287
              mov     r10            , qword [rsp+2656]; load->v332
              mov     qword [rsp+2296], r10            ; save->v287
_text__sha1_if3_end:
_text__sha1_if2_end:
_text__sha1_if1_end:
              mov     qword [rsp+2664], 5              ; load->v333
_text__sha1_call7:
              mov     rdi            , rbx            ; load->v278
              mov     rsi            , qword [rsp+2664]; load->v333
_text__sha1_saveReg7_save:
              mov     qword [rsp+2672], rax            ; load->v334
              mov     qword [rsp+2680], rdi            ; load->v335
              mov     qword [rsp+2688], rsi            ; load->v336
              mov     qword [rsp+2696], rdx            ; load->v337
              mov     qword [rsp+2704], rcx            ; load->v338
              mov     qword [rsp+2712], r8             ; load->v339
              mov     qword [rsp+2720], r9             ; load->v340
              mov     r10            , qword [rsp+2728]; load->v341
              mov     qword [rsp+2736], r11            ; load->v342
              call    _text__rotate_left                 
              mov     qword [rsp+2744], rax            ; load->v343
_text__sha1_saveReg7_load:
              mov     rax            , qword [rsp+2672]; load->v334
              mov     rdi            , qword [rsp+2680]; load->v335
              mov     rsi            , qword [rsp+2688]; load->v336
              mov     rdx            , qword [rsp+2696]; load->v337
              mov     rcx            , qword [rsp+2704]; load->v338
              mov     r8             , qword [rsp+2712]; load->v339
              mov     r9             , qword [rsp+2720]; load->v340
              mov     r10            , qword [rsp+2728]; load->v341
              mov     r11            , qword [rsp+2736]; load->v342
_text__sha1_call8:
              mov     rdi            , qword [rsp+2744]; load->v343
              mov     rsi            , qword [rsp+2256]; load->v282
_text__sha1_saveReg8_save:
              mov     qword [rsp+2752], rax            ; load->v344
              mov     qword [rsp+2760], rdi            ; load->v345
              mov     qword [rsp+2768], rsi            ; load->v346
              mov     qword [rsp+2776], rdx            ; load->v347
              mov     qword [rsp+2784], rcx            ; load->v348
              mov     qword [rsp+2792], r8             ; load->v349
              mov     qword [rsp+2800], r9             ; load->v350
              mov     r10            , qword [rsp+2808]; load->v351
              mov     qword [rsp+2816], r11            ; load->v352
              call    _text__add                      
              mov     qword [rsp+2824], rax            ; load->v353
_text__sha1_saveReg8_load:
              mov     rax            , qword [rsp+2752]; load->v344
              mov     rdi            , qword [rsp+2760]; load->v345
              mov     rsi            , qword [rsp+2768]; load->v346
              mov     rdx            , qword [rsp+2776]; load->v347
              mov     rcx            , qword [rsp+2784]; load->v348
              mov     r8             , qword [rsp+2792]; load->v349
              mov     r9             , qword [rsp+2800]; load->v350
              mov     r10            , qword [rsp+2808]; load->v351
              mov     r11            , qword [rsp+2816]; load->v352
_text__sha1_call9:
              mov     rdi            , qword [rsp+2288]; load->v286
              mov     rsi            , qword [rsp+2296]; load->v287
_text__sha1_saveReg9_save:
              mov     qword [rsp+2832], rax            ; load->v354
              mov     qword [rsp+2840], rdi            ; load->v355
              mov     qword [rsp+2848], rsi            ; load->v356
              mov     qword [rsp+2856], rdx            ; load->v357
              mov     qword [rsp+2864], rcx            ; load->v358
              mov     qword [rsp+2872], r8             ; load->v359
              mov     qword [rsp+2880], r9             ; load->v360
              mov     r10            , qword [rsp+2888]; load->v361
              mov     qword [rsp+2896], r11            ; load->v362
              call    _text__add                      
              mov     qword [rsp+2904], rax            ; load->v363
_text__sha1_saveReg9_load:
              mov     rax            , qword [rsp+2832]; load->v354
              mov     rdi            , qword [rsp+2840]; load->v355
              mov     rsi            , qword [rsp+2848]; load->v356
              mov     rdx            , qword [rsp+2856]; load->v357
              mov     rcx            , qword [rsp+2864]; load->v358
              mov     r8             , qword [rsp+2872]; load->v359
              mov     r9             , qword [rsp+2880]; load->v360
              mov     r10            , qword [rsp+2888]; load->v361
              mov     r11            , qword [rsp+2896]; load->v362
_text__sha1_call10:
              mov     rdi            , qword [rsp+2824]; load->v353
              mov     rsi            , qword [rsp+2904]; load->v363
_text__sha1_saveReg10_save:
              mov     qword [rsp+2912], rax            ; load->v364
              mov     qword [rsp+2920], rdi            ; load->v365
              mov     qword [rsp+2928], rsi            ; load->v366
              mov     qword [rsp+2936], rdx            ; load->v367
              mov     qword [rsp+2944], rcx            ; load->v368
              mov     qword [rsp+2952], r8             ; load->v369
              mov     qword [rsp+2960], r9             ; load->v370
              mov     r10            , qword [rsp+2968]; load->v371
              mov     qword [rsp+2976], r11            ; load->v372
              call    _text__add                      
              mov     qword [rsp+2984], rax            ; load->v373
_text__sha1_saveReg10_load:
              mov     rax            , qword [rsp+2912]; load->v364
              mov     rdi            , qword [rsp+2920]; load->v365
              mov     rsi            , qword [rsp+2928]; load->v366
              mov     rdx            , qword [rsp+2936]; load->v367
              mov     rcx            , qword [rsp+2944]; load->v368
              mov     r8             , qword [rsp+2952]; load->v369
              mov     r9             , qword [rsp+2960]; load->v370
              mov     r10            , qword [rsp+2968]; load->v371
              mov     r11            , qword [rsp+2976]; load->v372
              mov     r10            , qword [rsp+2992]; load->v374
              mov     r10            , [_data_bss_chunks]
              mov     qword [rsp+2992], r10            ; save->v374
              mov     r10            , qword [rsp+3000]; load->v375
              mov     qword [rsp+3000], r14            ; load->v33
              mov     r10            , qword [rsp+3000]; load->v375
              imul    r10            , 8              
              mov     qword [rsp+3000], r10            ; save->v375
              add     r10            , 8              
              mov     qword [rsp+3000], r10            ; save->v375
              mov     r11            , qword [rsp+2992]; load->v374
              add     r10            , r11            
              mov     qword [rsp+3000], r10            ; save->v375
              mov     r10            , qword [rsp+3008]; load->v376
              mov     r11            , qword [rsp+3000]; translate->qword [v375]
              mov     r10            , qword [r11]    
              mov     qword [rsp+3008], r10            ; save->v376
              mov     r10            , qword [rsp+3016]; load->v377
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+3016], r10            ; save->v377
              imul    r10            , 8              
              mov     qword [rsp+3016], r10            ; save->v377
              add     r10            , 8              
              mov     qword [rsp+3016], r10            ; save->v377
              mov     r11            , qword [rsp+3008]; load->v376
              add     r10            , r11            
              mov     qword [rsp+3016], r10            ; save->v377
              mov     r10            , qword [rsp+3024]; load->v378
              mov     r11            , qword [rsp+3016]; translate->qword [v377]
              mov     r10            , qword [r11]    
              mov     qword [rsp+3024], r10            ; save->v378
_text__sha1_call11:
              mov     rdi            , qword [rsp+2984]; load->v373
              mov     rsi            , qword [rsp+3024]; load->v378
_text__sha1_saveReg11_save:
              mov     qword [rsp+3032], rax            ; load->v379
              mov     qword [rsp+3040], rdi            ; load->v380
              mov     qword [rsp+3048], rsi            ; load->v381
              mov     qword [rsp+3056], rdx            ; load->v382
              mov     qword [rsp+3064], rcx            ; load->v383
              mov     qword [rsp+3072], r8             ; load->v384
              mov     qword [rsp+3080], r9             ; load->v385
              mov     r10            , qword [rsp+3088]; load->v386
              mov     qword [rsp+3096], r11            ; load->v387
              call    _text__add                      
              mov     qword [rsp+3104], rax            ; load->v388
_text__sha1_saveReg11_load:
              mov     rax            , qword [rsp+3032]; load->v379
              mov     rdi            , qword [rsp+3040]; load->v380
              mov     rsi            , qword [rsp+3048]; load->v381
              mov     rdx            , qword [rsp+3056]; load->v382
              mov     rcx            , qword [rsp+3064]; load->v383
              mov     r8             , qword [rsp+3072]; load->v384
              mov     r9             , qword [rsp+3080]; load->v385
              mov     r10            , qword [rsp+3088]; load->v386
              mov     r11            , qword [rsp+3096]; load->v387
              mov     r10            , qword [rsp+3112]; load->v389
              mov     r10            , qword [rsp+3104]; load->v388
              mov     qword [rsp+3112], r10            ; save->v389
              mov     r10            , qword [rsp+2256]; load->v282
              mov     r10            , qword [rsp+2248]; load->v281
              mov     qword [rsp+2256], r10            ; save->v282
              mov     r10            , qword [rsp+2248]; load->v281
              mov     qword [rsp+2248], r13            ; load->v280
              mov     qword [rsp+3120], 30             ; load->v390
_text__sha1_call12:
              mov     rdi            , r12            ; load->v279
              mov     rsi            , qword [rsp+3120]; load->v390
_text__sha1_saveReg12_save:
              mov     qword [rsp+3128], rax            ; load->v391
              mov     qword [rsp+3136], rdi            ; load->v392
              mov     qword [rsp+3144], rsi            ; load->v393
              mov     qword [rsp+3152], rdx            ; load->v394
              mov     qword [rsp+3160], rcx            ; load->v395
              mov     qword [rsp+3168], r8             ; load->v396
              mov     qword [rsp+3176], r9             ; load->v397
              mov     r10            , qword [rsp+3184]; load->v398
              mov     qword [rsp+3192], r11            ; load->v399
              call    _text__rotate_left                 
              mov     qword [rsp+3200], rax            ; load->v400
_text__sha1_saveReg12_load:
              mov     rax            , qword [rsp+3128]; load->v391
              mov     rdi            , qword [rsp+3136]; load->v392
              mov     rsi            , qword [rsp+3144]; load->v393
              mov     rdx            , qword [rsp+3152]; load->v394
              mov     rcx            , qword [rsp+3160]; load->v395
              mov     r8             , qword [rsp+3168]; load->v396
              mov     r9             , qword [rsp+3176]; load->v397
              mov     r10            , qword [rsp+3184]; load->v398
              mov     r11            , qword [rsp+3192]; load->v399
              mov     r10            , r13            ; load->v280
              mov     r13            , qword [rsp+3200]; load->v400
              mov     r10            , r12            ; load->v279
              mov     r12            , rbx            ; load->v278
              mov     r10            , rbx            ; load->v278
              mov     rbx            , qword [rsp+3112]; load->v389
_text__sha1_for5_continue:
              mov     r10            , qword [rsp+3208]; load->v401
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+3208], r10            ; save->v401
              mov     qword [rsp+3216], 1              ; load->v402
              mov     r10            , qword [rsp+3224]; load->v403
              mov     r10            , qword [rsp+272]; load->v34
              mov     qword [rsp+3224], r10            ; save->v403
              mov     r11            , qword [rsp+3216]; load->v402
              add     r10            , r11            
              mov     qword [rsp+3224], r10            ; save->v403
              mov     r10            , qword [rsp+272]; load->v34
              mov     r10            , qword [rsp+3224]; load->v403
              mov     qword [rsp+272], r10            ; save->v34
              mov     qword [rsp+3232], 80             ; load->v404
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+3232]; load->v404
              cmp     r10d           , r11d           
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+3240]; load->v405
              setl    r10b                            
              mov     qword [rsp+3240], r10            ; save->v405
              and     r10            , 255            
              mov     qword [rsp+3240], r10            ; save->v405
              cmp     r10b           , 0              
              mov     qword [rsp+3240], r10            ; save->v405
              jne     _text__sha1_for5_start                 
;----------------------------------]
;[----------------------------------
_text__sha1_for5_end:
_text__sha1_call13:
              mov     rdi            , qword [rsp+1432]; load->v179
              mov     rsi            , rbx            ; load->v278
_text__sha1_saveReg13_save:
              mov     qword [rsp+3248], rax            ; load->v406
              mov     qword [rsp+3256], rdi            ; load->v407
              mov     qword [rsp+3264], rsi            ; load->v408
              mov     qword [rsp+3272], rdx            ; load->v409
              mov     qword [rsp+3280], rcx            ; load->v410
              mov     qword [rsp+3288], r8             ; load->v411
              mov     qword [rsp+3296], r9             ; load->v412
              mov     r10            , qword [rsp+3304]; load->v413
              mov     qword [rsp+3312], r11            ; load->v414
              call    _text__add                      
              mov     qword [rsp+3320], rax            ; load->v415
_text__sha1_saveReg13_load:
              mov     rax            , qword [rsp+3248]; load->v406
              mov     rdi            , qword [rsp+3256]; load->v407
              mov     rsi            , qword [rsp+3264]; load->v408
              mov     rdx            , qword [rsp+3272]; load->v409
              mov     rcx            , qword [rsp+3280]; load->v410
              mov     r8             , qword [rsp+3288]; load->v411
              mov     r9             , qword [rsp+3296]; load->v412
              mov     r10            , qword [rsp+3304]; load->v413
              mov     r11            , qword [rsp+3312]; load->v414
              mov     r10            , qword [rsp+1432]; load->v179
              mov     r10            , qword [rsp+3320]; load->v415
              mov     qword [rsp+1432], r10            ; save->v179
_text__sha1_call14:
              mov     rdi            , qword [rsp+1536]; load->v192
              mov     rsi            , r12            ; load->v279
_text__sha1_saveReg14_save:
              mov     qword [rsp+3328], rax            ; load->v416
              mov     qword [rsp+3336], rdi            ; load->v417
              mov     qword [rsp+3344], rsi            ; load->v418
              mov     qword [rsp+3352], rdx            ; load->v419
              mov     qword [rsp+3360], rcx            ; load->v420
              mov     qword [rsp+3368], r8             ; load->v421
              mov     qword [rsp+3376], r9             ; load->v422
              mov     r10            , qword [rsp+3384]; load->v423
              mov     qword [rsp+3392], r11            ; load->v424
              call    _text__add                      
              mov     qword [rsp+3400], rax            ; load->v425
_text__sha1_saveReg14_load:
              mov     rax            , qword [rsp+3328]; load->v416
              mov     rdi            , qword [rsp+3336]; load->v417
              mov     rsi            , qword [rsp+3344]; load->v418
              mov     rdx            , qword [rsp+3352]; load->v419
              mov     rcx            , qword [rsp+3360]; load->v420
              mov     r8             , qword [rsp+3368]; load->v421
              mov     r9             , qword [rsp+3376]; load->v422
              mov     r10            , qword [rsp+3384]; load->v423
              mov     r11            , qword [rsp+3392]; load->v424
              mov     r10            , qword [rsp+1536]; load->v192
              mov     r10            , qword [rsp+3400]; load->v425
              mov     qword [rsp+1536], r10            ; save->v192
_text__sha1_call15:
              mov     rdi            , qword [rsp+1640]; load->v205
              mov     rsi            , r13            ; load->v280
_text__sha1_saveReg15_save:
              mov     qword [rsp+3408], rax            ; load->v426
              mov     qword [rsp+3416], rdi            ; load->v427
              mov     qword [rsp+3424], rsi            ; load->v428
              mov     qword [rsp+3432], rdx            ; load->v429
              mov     qword [rsp+3440], rcx            ; load->v430
              mov     qword [rsp+3448], r8             ; load->v431
              mov     qword [rsp+3456], r9             ; load->v432
              mov     r10            , qword [rsp+3464]; load->v433
              mov     qword [rsp+3472], r11            ; load->v434
              call    _text__add                      
              mov     qword [rsp+3480], rax            ; load->v435
_text__sha1_saveReg15_load:
              mov     rax            , qword [rsp+3408]; load->v426
              mov     rdi            , qword [rsp+3416]; load->v427
              mov     rsi            , qword [rsp+3424]; load->v428
              mov     rdx            , qword [rsp+3432]; load->v429
              mov     rcx            , qword [rsp+3440]; load->v430
              mov     r8             , qword [rsp+3448]; load->v431
              mov     r9             , qword [rsp+3456]; load->v432
              mov     r10            , qword [rsp+3464]; load->v433
              mov     r11            , qword [rsp+3472]; load->v434
              mov     r10            , qword [rsp+1640]; load->v205
              mov     r10            , qword [rsp+3480]; load->v435
              mov     qword [rsp+1640], r10            ; save->v205
_text__sha1_call16:
              mov     rdi            , qword [rsp+1656]; load->v207
              mov     rsi            , qword [rsp+2248]; load->v281
_text__sha1_saveReg16_save:
              mov     qword [rsp+3488], rax            ; load->v436
              mov     qword [rsp+3496], rdi            ; load->v437
              mov     qword [rsp+3504], rsi            ; load->v438
              mov     qword [rsp+3512], rdx            ; load->v439
              mov     qword [rsp+3520], rcx            ; load->v440
              mov     qword [rsp+3528], r8             ; load->v441
              mov     qword [rsp+3536], r9             ; load->v442
              mov     r10            , qword [rsp+3544]; load->v443
              mov     qword [rsp+3552], r11            ; load->v444
              call    _text__add                      
              mov     qword [rsp+3560], rax            ; load->v445
_text__sha1_saveReg16_load:
              mov     rax            , qword [rsp+3488]; load->v436
              mov     rdi            , qword [rsp+3496]; load->v437
              mov     rsi            , qword [rsp+3504]; load->v438
              mov     rdx            , qword [rsp+3512]; load->v439
              mov     rcx            , qword [rsp+3520]; load->v440
              mov     r8             , qword [rsp+3528]; load->v441
              mov     r9             , qword [rsp+3536]; load->v442
              mov     r10            , qword [rsp+3544]; load->v443
              mov     r11            , qword [rsp+3552]; load->v444
              mov     r10            , qword [rsp+1656]; load->v207
              mov     r10            , qword [rsp+3560]; load->v445
              mov     qword [rsp+1656], r10            ; save->v207
_text__sha1_call17:
              mov     rdi            , qword [rsp+1760]; load->v220
              mov     rsi            , qword [rsp+2256]; load->v282
_text__sha1_saveReg17_save:
              mov     qword [rsp+3568], rax            ; load->v446
              mov     qword [rsp+3576], rdi            ; load->v447
              mov     qword [rsp+3584], rsi            ; load->v448
              mov     qword [rsp+3592], rdx            ; load->v449
              mov     qword [rsp+3600], rcx            ; load->v450
              mov     qword [rsp+3608], r8             ; load->v451
              mov     qword [rsp+3616], r9             ; load->v452
              mov     r10            , qword [rsp+3624]; load->v453
              mov     qword [rsp+3632], r11            ; load->v454
              call    _text__add                      
              mov     qword [rsp+3640], rax            ; load->v455
_text__sha1_saveReg17_load:
              mov     rax            , qword [rsp+3568]; load->v446
              mov     rdi            , qword [rsp+3576]; load->v447
              mov     rsi            , qword [rsp+3584]; load->v448
              mov     rdx            , qword [rsp+3592]; load->v449
              mov     rcx            , qword [rsp+3600]; load->v450
              mov     r8             , qword [rsp+3608]; load->v451
              mov     r9             , qword [rsp+3616]; load->v452
              mov     r10            , qword [rsp+3624]; load->v453
              mov     r11            , qword [rsp+3632]; load->v454
              mov     r10            , qword [rsp+1760]; load->v220
              mov     r10            , qword [rsp+3640]; load->v455
              mov     qword [rsp+1760], r10            ; save->v220
_text__sha1_for3_continue:
              mov     r10            , qword [rsp+3648]; load->v456
              mov     qword [rsp+3648], r14            ; load->v33
              mov     qword [rsp+3656], 1              ; load->v457
              mov     r10            , qword [rsp+3664]; load->v458
              mov     qword [rsp+3664], r14            ; load->v33
              mov     r10            , qword [rsp+3664]; load->v458
              mov     r11            , qword [rsp+3656]; load->v457
              add     r10            , r11            
              mov     qword [rsp+3664], r10            ; save->v458
              mov     r10            , r14            ; load->v33
              mov     r14            , qword [rsp+3664]; load->v458
              mov     r10            , r14            ; load->v33
              mov     r11            , qword [rsp+144]; load->v18
              cmp     r10d           , r11d           
              mov     r14            , r10            ; save->v33
              mov     r10            , qword [rsp+3672]; load->v459
              setl    r10b                            
              mov     qword [rsp+3672], r10            ; save->v459
              and     r10            , 255            
              mov     qword [rsp+3672], r10            ; save->v459
              cmp     r10b           , 0              
              mov     qword [rsp+3672], r10            ; save->v459
              jne     _text__sha1_for3_start                 
;----------------------------------]
;[----------------------------------
_text__sha1_for3_end:
              mov     r10            , rbx            ; load->v460
              mov     rbx            , [_data_bss_outputBuffer]
              mov     r12            , 0              ; load->v461
              mov     r10            , r13            ; load->v462
              mov     r13            , r12            ; load->v461
              mov     r10            , r13            ; load->v462
              imul    r10            , 8              
              mov     r13            , r10            ; save->v462
              add     r10            , 8              
              mov     r13            , r10            ; save->v462
              mov     r11            , rbx            ; load->v460
              add     r10            , r11            
              mov     r13            , r10            ; save->v462
              mov     r10            , rbx            ; load->v463
              mov     r11            , r13            ; translate->qword [v462]
              mov     rbx            , qword [r11]    
              mov     r10            , r13            ; translate->qword [v462]
              mov     r11            , qword [rsp+1432]; load->v179
              mov     qword [r10]    , r11            ; assign->outputBuffer[0]
              mov     r10            , rbx            ; load->v464
              mov     rbx            , [_data_bss_outputBuffer]
              mov     r12            , 1              ; load->v465
              mov     r10            , r13            ; load->v466
              mov     r13            , r12            ; load->v465
              mov     r10            , r13            ; load->v466
              imul    r10            , 8              
              mov     r13            , r10            ; save->v466
              add     r10            , 8              
              mov     r13            , r10            ; save->v466
              mov     r11            , rbx            ; load->v464
              add     r10            , r11            
              mov     r13            , r10            ; save->v466
              mov     r10            , rbx            ; load->v467
              mov     r11            , r13            ; translate->qword [v466]
              mov     rbx            , qword [r11]    
              mov     r10            , r13            ; translate->qword [v466]
              mov     r11            , qword [rsp+1536]; load->v192
              mov     qword [r10]    , r11            ; assign->outputBuffer[1]
              mov     r10            , rbx            ; load->v468
              mov     rbx            , [_data_bss_outputBuffer]
              mov     r12            , 2              ; load->v469
              mov     r10            , r13            ; load->v470
              mov     r13            , r12            ; load->v469
              mov     r10            , r13            ; load->v470
              imul    r10            , 8              
              mov     r13            , r10            ; save->v470
              add     r10            , 8              
              mov     r13            , r10            ; save->v470
              mov     r11            , rbx            ; load->v468
              add     r10            , r11            
              mov     r13            , r10            ; save->v470
              mov     r10            , rbx            ; load->v471
              mov     r11            , r13            ; translate->qword [v470]
              mov     rbx            , qword [r11]    
              mov     r10            , r13            ; translate->qword [v470]
              mov     r11            , qword [rsp+1640]; load->v205
              mov     qword [r10]    , r11            ; assign->outputBuffer[2]
              mov     r10            , rbx            ; load->v472
              mov     rbx            , [_data_bss_outputBuffer]
              mov     r12            , 3              ; load->v473
              mov     r10            , r13            ; load->v474
              mov     r13            , r12            ; load->v473
              mov     r10            , r13            ; load->v474
              imul    r10            , 8              
              mov     r13            , r10            ; save->v474
              add     r10            , 8              
              mov     r13            , r10            ; save->v474
              mov     r11            , rbx            ; load->v472
              add     r10            , r11            
              mov     r13            , r10            ; save->v474
              mov     r10            , rbx            ; load->v475
              mov     r11            , r13            ; translate->qword [v474]
              mov     rbx            , qword [r11]    
              mov     r10            , r13            ; translate->qword [v474]
              mov     r11            , qword [rsp+1656]; load->v207
              mov     qword [r10]    , r11            ; assign->outputBuffer[3]
              mov     r10            , rbx            ; load->v476
              mov     rbx            , [_data_bss_outputBuffer]
              mov     r12            , 4              ; load->v477
              mov     r10            , r13            ; load->v478
              mov     r13            , r12            ; load->v477
              mov     r10            , r13            ; load->v478
              imul    r10            , 8              
              mov     r13            , r10            ; save->v478
              add     r10            , 8              
              mov     r13            , r10            ; save->v478
              mov     r11            , rbx            ; load->v476
              add     r10            , r11            
              mov     r13            , r10            ; save->v478
              mov     r10            , rbx            ; load->v479
              mov     r11            , r13            ; translate->qword [v478]
              mov     rbx            , qword [r11]    
              mov     r10            , r13            ; translate->qword [v478]
              mov     r11            , qword [rsp+1760]; load->v220
              mov     qword [r10]    , r11            ; assign->outputBuffer[4]
              mov     r10            , rbx            ; load->v480
              mov     rbx            , [_data_bss_outputBuffer]
_text__sha1_ret1:
              mov     rax            , rbx            ; load->v480
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 3848           
              ret                                     
;----------------------------------]
;[----------------------------------
_text__sha1_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 3848           
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__computeSHA1 ] ---
;[----------------------------------
_text__computeSHA1:
              sub     rsp            , 1032           
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     rbx            , rdi            ; load->v6
_text__computeSHA1_for0_init:
              mov     r13            , 0              ; load->v8
              mov     r10            , r12            ; load->v7
              mov     r12            , r13            ; load->v8
_text__computeSHA1_call0:
              mov     rdi            , rbx            ; load->v6
_text__computeSHA1_saveReg0_save:
              mov     qword [rsp+72] , rax            ; load->v9
              mov     qword [rsp+80] , rdi            ; load->v10
              mov     qword [rsp+88] , rsi            ; load->v11
              mov     qword [rsp+96] , rdx            ; load->v12
              mov     qword [rsp+104], rcx            ; load->v13
              mov     qword [rsp+112], r8             ; load->v14
              mov     qword [rsp+120], r9             ; load->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     qword [rsp+136], r11            ; load->v17
              call    _text_built_in_string_length                 
              mov     qword [rsp+144], rax            ; load->v18
_text__computeSHA1_saveReg0_load:
              mov     rax            , qword [rsp+72] ; load->v9
              mov     rdi            , qword [rsp+80] ; load->v10
              mov     rsi            , qword [rsp+88] ; load->v11
              mov     rdx            , qword [rsp+96] ; load->v12
              mov     rcx            , qword [rsp+104]; load->v13
              mov     r8             , qword [rsp+112]; load->v14
              mov     r9             , qword [rsp+120]; load->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r11            , qword [rsp+136]; load->v17
              mov     r10            , r12            ; load->v7
              mov     r11            , qword [rsp+144]; load->v18
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , r14            ; load->v19
              setl    r10b                            
              mov     r14            , r10            ; save->v19
              and     r10            , 255            
              mov     r14            , r10            ; save->v19
_text__computeSHA1_for0_init_check:
              mov     r10            , r14            ; load->v19
              cmp     r10b           , 0              
              mov     r14            , r10            ; save->v19
              je      _text__computeSHA1_for0_end                 
;----------------------------------]
;[----------------------------------
_text__computeSHA1_for0_start:
_text__computeSHA1_call1:
              mov     rdi            , rbx            ; load->v6
              mov     rsi            , r12            ; load->v7
_text__computeSHA1_saveReg1_save:
              mov     qword [rsp+160], rax            ; load->v20
              mov     qword [rsp+168], rdi            ; load->v21
              mov     qword [rsp+176], rsi            ; load->v22
              mov     qword [rsp+184], rdx            ; load->v23
              mov     qword [rsp+192], rcx            ; load->v24
              mov     qword [rsp+200], r8             ; load->v25
              mov     qword [rsp+208], r9             ; load->v26
              mov     r10            , qword [rsp+216]; load->v27
              mov     qword [rsp+224], r11            ; load->v28
              call    _text_built_in_string_ord                 
              mov     qword [rsp+232], rax            ; load->v29
_text__computeSHA1_saveReg1_load:
              mov     rax            , qword [rsp+160]; load->v20
              mov     rdi            , qword [rsp+168]; load->v21
              mov     rsi            , qword [rsp+176]; load->v22
              mov     rdx            , qword [rsp+184]; load->v23
              mov     rcx            , qword [rsp+192]; load->v24
              mov     r8             , qword [rsp+200]; load->v25
              mov     r9             , qword [rsp+208]; load->v26
              mov     r10            , qword [rsp+216]; load->v27
              mov     r11            , qword [rsp+224]; load->v28
              mov     r10            , r15            ; load->v30
              mov     r15            , [_data_bss_inputBuffer]
              mov     r10            , qword [rsp+248]; load->v31
              mov     qword [rsp+248], r12            ; load->v7
              mov     r10            , qword [rsp+248]; load->v31
              imul    r10            , 8              
              mov     qword [rsp+248], r10            ; save->v31
              add     r10            , 8              
              mov     qword [rsp+248], r10            ; save->v31
              mov     r11            , r15            ; load->v30
              add     r10            , r11            
              mov     qword [rsp+248], r10            ; save->v31
              mov     r10            , qword [rsp+256]; load->v32
              mov     r11            , qword [rsp+248]; translate->qword [v31]
              mov     r10            , qword [r11]    
              mov     qword [rsp+256], r10            ; save->v32
              mov     r10            , qword [rsp+248]; translate->qword [v31]
              mov     r11            , qword [rsp+232]; load->v29
              mov     qword [r10]    , r11            ; assign->inputBuffer[i]
_text__computeSHA1_for0_continue:
              mov     r10            , qword [rsp+264]; load->v33
              mov     qword [rsp+264], r12            ; load->v7
              mov     qword [rsp+272], 1              ; load->v34
              mov     r10            , qword [rsp+280]; load->v35
              mov     qword [rsp+280], r12            ; load->v7
              mov     r10            , qword [rsp+280]; load->v35
              mov     r11            , qword [rsp+272]; load->v34
              add     r10            , r11            
              mov     qword [rsp+280], r10            ; save->v35
              mov     r10            , r12            ; load->v7
              mov     r12            , qword [rsp+280]; load->v35
_text__computeSHA1_call2:
              mov     rdi            , rbx            ; load->v6
_text__computeSHA1_saveReg2_save:
              mov     qword [rsp+288], rax            ; load->v36
              mov     qword [rsp+296], rdi            ; load->v37
              mov     qword [rsp+304], rsi            ; load->v38
              mov     qword [rsp+312], rdx            ; load->v39
              mov     qword [rsp+320], rcx            ; load->v40
              mov     qword [rsp+328], r8             ; load->v41
              mov     qword [rsp+336], r9             ; load->v42
              mov     r10            , qword [rsp+344]; load->v43
              mov     qword [rsp+352], r11            ; load->v44
              call    _text_built_in_string_length                 
              mov     qword [rsp+360], rax            ; load->v45
_text__computeSHA1_saveReg2_load:
              mov     rax            , qword [rsp+288]; load->v36
              mov     rdi            , qword [rsp+296]; load->v37
              mov     rsi            , qword [rsp+304]; load->v38
              mov     rdx            , qword [rsp+312]; load->v39
              mov     rcx            , qword [rsp+320]; load->v40
              mov     r8             , qword [rsp+328]; load->v41
              mov     r9             , qword [rsp+336]; load->v42
              mov     r10            , qword [rsp+344]; load->v43
              mov     r11            , qword [rsp+352]; load->v44
              mov     r10            , r12            ; load->v7
              mov     r11            , qword [rsp+360]; load->v45
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , qword [rsp+368]; load->v46
              setl    r10b                            
              mov     qword [rsp+368], r10            ; save->v46
              and     r10            , 255            
              mov     qword [rsp+368], r10            ; save->v46
              cmp     r10b           , 0              
              mov     qword [rsp+368], r10            ; save->v46
              jne     _text__computeSHA1_for0_start                 
;----------------------------------]
;[----------------------------------
_text__computeSHA1_for0_end:
              mov     r10            , r13            ; load->v47
              mov     r13            , [_data_bss_inputBuffer]
_text__computeSHA1_call3:
              mov     rdi            , rbx            ; load->v6
_text__computeSHA1_saveReg3_save:
              mov     qword [rsp+384], rax            ; load->v48
              mov     qword [rsp+392], rdi            ; load->v49
              mov     qword [rsp+400], rsi            ; load->v50
              mov     qword [rsp+408], rdx            ; load->v51
              mov     qword [rsp+416], rcx            ; load->v52
              mov     qword [rsp+424], r8             ; load->v53
              mov     qword [rsp+432], r9             ; load->v54
              mov     r10            , qword [rsp+440]; load->v55
              mov     qword [rsp+448], r11            ; load->v56
              call    _text_built_in_string_length                 
              mov     qword [rsp+456], rax            ; load->v57
_text__computeSHA1_saveReg3_load:
              mov     rax            , qword [rsp+384]; load->v48
              mov     rdi            , qword [rsp+392]; load->v49
              mov     rsi            , qword [rsp+400]; load->v50
              mov     rdx            , qword [rsp+408]; load->v51
              mov     rcx            , qword [rsp+416]; load->v52
              mov     r8             , qword [rsp+424]; load->v53
              mov     r9             , qword [rsp+432]; load->v54
              mov     r10            , qword [rsp+440]; load->v55
              mov     r11            , qword [rsp+448]; load->v56
_text__computeSHA1_call4:
              mov     rdi            , r13            ; load->v47
              mov     rsi            , qword [rsp+456]; load->v57
_text__computeSHA1_saveReg4_save:
              mov     qword [rsp+464], rax            ; load->v58
              mov     qword [rsp+472], rdi            ; load->v59
              mov     qword [rsp+480], rsi            ; load->v60
              mov     qword [rsp+488], rdx            ; load->v61
              mov     qword [rsp+496], rcx            ; load->v62
              mov     qword [rsp+504], r8             ; load->v63
              mov     qword [rsp+512], r9             ; load->v64
              mov     r10            , qword [rsp+520]; load->v65
              mov     qword [rsp+528], r11            ; load->v66
              call    _text__sha1                     
              mov     rbx            , rax            ; load->v67
_text__computeSHA1_saveReg4_load:
              mov     rax            , qword [rsp+464]; load->v58
              mov     rdi            , qword [rsp+472]; load->v59
              mov     rsi            , qword [rsp+480]; load->v60
              mov     rdx            , qword [rsp+488]; load->v61
              mov     rcx            , qword [rsp+496]; load->v62
              mov     r8             , qword [rsp+504]; load->v63
              mov     r9             , qword [rsp+512]; load->v64
              mov     r10            , qword [rsp+520]; load->v65
              mov     r11            , qword [rsp+528]; load->v66
              mov     r10            , r13            ; load->v68
              mov     r13            , rbx            ; load->v67
_text__computeSHA1_for1_init:
              mov     rbx            , 0              ; load->v69
              mov     r10            , r12            ; load->v7
              mov     r12            , rbx            ; load->v69
_text__computeSHA1_call5:
              mov     rdi            , r13            ; load->v68
_text__computeSHA1_saveReg5_save:
              mov     qword [rsp+560], rax            ; load->v70
              mov     qword [rsp+568], rdi            ; load->v71
              mov     qword [rsp+576], rsi            ; load->v72
              mov     qword [rsp+584], rdx            ; load->v73
              mov     qword [rsp+592], rcx            ; load->v74
              mov     qword [rsp+600], r8             ; load->v75
              mov     qword [rsp+608], r9             ; load->v76
              mov     r10            , qword [rsp+616]; load->v77
              mov     qword [rsp+624], r11            ; load->v78
              call    _text_built_in_array_size                 
              mov     qword [rsp+632], rax            ; load->v79
_text__computeSHA1_saveReg5_load:
              mov     rax            , qword [rsp+560]; load->v70
              mov     rdi            , qword [rsp+568]; load->v71
              mov     rsi            , qword [rsp+576]; load->v72
              mov     rdx            , qword [rsp+584]; load->v73
              mov     rcx            , qword [rsp+592]; load->v74
              mov     r8             , qword [rsp+600]; load->v75
              mov     r9             , qword [rsp+608]; load->v76
              mov     r10            , qword [rsp+616]; load->v77
              mov     r11            , qword [rsp+624]; load->v78
              mov     r10            , r12            ; load->v7
              mov     r11            , qword [rsp+632]; load->v79
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , r14            ; load->v80
              setl    r10b                            
              mov     r14            , r10            ; save->v80
              and     r10            , 255            
              mov     r14            , r10            ; save->v80
_text__computeSHA1_for1_init_check:
              mov     r10            , r14            ; load->v80
              cmp     r10b           , 0              
              mov     r14            , r10            ; save->v80
              je      _text__computeSHA1_for1_end                 
;----------------------------------]
;[----------------------------------
_text__computeSHA1_for1_start:
              mov     r10            , r15            ; load->v81
              mov     r15            , r12            ; load->v7
              mov     r10            , r15            ; load->v81
              imul    r10            , 8              
              mov     r15            , r10            ; save->v81
              add     r10            , 8              
              mov     r15            , r10            ; save->v81
              mov     r11            , r13            ; load->v68
              add     r10            , r11            
              mov     r15            , r10            ; save->v81
              mov     r10            , qword [rsp+656]; load->v82
              mov     r11            , r15            ; translate->qword [v81]
              mov     r10            , qword [r11]    
              mov     qword [rsp+656], r10            ; save->v82
_text__computeSHA1_call6:
              mov     rdi            , qword [rsp+656]; load->v82
_text__computeSHA1_saveReg6_save:
              mov     qword [rsp+664], rax            ; load->v83
              mov     qword [rsp+672], rdi            ; load->v84
              mov     qword [rsp+680], rsi            ; load->v85
              mov     qword [rsp+688], rdx            ; load->v86
              mov     qword [rsp+696], rcx            ; load->v87
              mov     qword [rsp+704], r8             ; load->v88
              mov     qword [rsp+712], r9             ; load->v89
              mov     r10            , qword [rsp+720]; load->v90
              mov     qword [rsp+728], r11            ; load->v91
              call    _text__toStringHex                 
              mov     qword [rsp+736], rax            ; load->v92
_text__computeSHA1_saveReg6_load:
              mov     rax            , qword [rsp+664]; load->v83
              mov     rdi            , qword [rsp+672]; load->v84
              mov     rsi            , qword [rsp+680]; load->v85
              mov     rdx            , qword [rsp+688]; load->v86
              mov     rcx            , qword [rsp+696]; load->v87
              mov     r8             , qword [rsp+704]; load->v88
              mov     r9             , qword [rsp+712]; load->v89
              mov     r10            , qword [rsp+720]; load->v90
              mov     r11            , qword [rsp+728]; load->v91
_text__computeSHA1_call7:
              mov     rdi            , qword [rsp+736]; load->v92
_text__computeSHA1_saveReg7_save:
              mov     qword [rsp+744], rax            ; load->v93
              mov     qword [rsp+752], rdi            ; load->v94
              mov     qword [rsp+760], rsi            ; load->v95
              mov     qword [rsp+768], rdx            ; load->v96
              mov     qword [rsp+776], rcx            ; load->v97
              mov     qword [rsp+784], r8             ; load->v98
              mov     qword [rsp+792], r9             ; load->v99
              mov     r10            , qword [rsp+800]; load->v100
              mov     qword [rsp+808], r11            ; load->v101
              call    _text__print                    
              mov     qword [rsp+816], rax            ; load->v102
_text__computeSHA1_saveReg7_load:
              mov     rax            , qword [rsp+744]; load->v93
              mov     rdi            , qword [rsp+752]; load->v94
              mov     rsi            , qword [rsp+760]; load->v95
              mov     rdx            , qword [rsp+768]; load->v96
              mov     rcx            , qword [rsp+776]; load->v97
              mov     r8             , qword [rsp+784]; load->v98
              mov     r9             , qword [rsp+792]; load->v99
              mov     r10            , qword [rsp+800]; load->v100
              mov     r11            , qword [rsp+808]; load->v101
_text__computeSHA1_for1_continue:
              mov     r10            , qword [rsp+824]; load->v103
              mov     qword [rsp+824], r12            ; load->v7
              mov     qword [rsp+832], 1              ; load->v104
              mov     r10            , qword [rsp+840]; load->v105
              mov     qword [rsp+840], r12            ; load->v7
              mov     r10            , qword [rsp+840]; load->v105
              mov     r11            , qword [rsp+832]; load->v104
              add     r10            , r11            
              mov     qword [rsp+840], r10            ; save->v105
              mov     r10            , r12            ; load->v7
              mov     r12            , qword [rsp+840]; load->v105
_text__computeSHA1_call8:
              mov     rdi            , r13            ; load->v68
_text__computeSHA1_saveReg8_save:
              mov     qword [rsp+848], rax            ; load->v106
              mov     qword [rsp+856], rdi            ; load->v107
              mov     qword [rsp+864], rsi            ; load->v108
              mov     qword [rsp+872], rdx            ; load->v109
              mov     qword [rsp+880], rcx            ; load->v110
              mov     qword [rsp+888], r8             ; load->v111
              mov     qword [rsp+896], r9             ; load->v112
              mov     r10            , qword [rsp+904]; load->v113
              mov     qword [rsp+912], r11            ; load->v114
              call    _text_built_in_array_size                 
              mov     qword [rsp+920], rax            ; load->v115
_text__computeSHA1_saveReg8_load:
              mov     rax            , qword [rsp+848]; load->v106
              mov     rdi            , qword [rsp+856]; load->v107
              mov     rsi            , qword [rsp+864]; load->v108
              mov     rdx            , qword [rsp+872]; load->v109
              mov     rcx            , qword [rsp+880]; load->v110
              mov     r8             , qword [rsp+888]; load->v111
              mov     r9             , qword [rsp+896]; load->v112
              mov     r10            , qword [rsp+904]; load->v113
              mov     r11            , qword [rsp+912]; load->v114
              mov     r10            , r12            ; load->v7
              mov     r11            , qword [rsp+920]; load->v115
              cmp     r10d           , r11d           
              mov     r12            , r10            ; save->v7
              mov     r10            , qword [rsp+928]; load->v116
              setl    r10b                            
              mov     qword [rsp+928], r10            ; save->v116
              and     r10            , 255            
              mov     qword [rsp+928], r10            ; save->v116
              cmp     r10b           , 0              
              mov     qword [rsp+928], r10            ; save->v116
              jne     _text__computeSHA1_for1_start                 
;----------------------------------]
;[----------------------------------
_text__computeSHA1_for1_end:
              mov     rbx            , _data_s3       ; load->v117
_text__computeSHA1_call9:
              mov     rdi            , rbx            ; load->v117
_text__computeSHA1_saveReg9_save:
              mov     qword [rsp+944], rax            ; load->v118
              mov     qword [rsp+952], rdi            ; load->v119
              mov     qword [rsp+960], rsi            ; load->v120
              mov     qword [rsp+968], rdx            ; load->v121
              mov     qword [rsp+976], rcx            ; load->v122
              mov     qword [rsp+984], r8             ; load->v123
              mov     qword [rsp+992], r9             ; load->v124
              mov     r10            , qword [rsp+1000]; load->v125
              mov     qword [rsp+1008], r11            ; load->v126
              call    _text__println                  
              mov     rbx            , rax            ; load->v127
_text__computeSHA1_saveReg9_load:
              mov     rax            , qword [rsp+944]; load->v118
              mov     rdi            , qword [rsp+952]; load->v119
              mov     rsi            , qword [rsp+960]; load->v120
              mov     rdx            , qword [rsp+968]; load->v121
              mov     rcx            , qword [rsp+976]; load->v122
              mov     r8             , qword [rsp+984]; load->v123
              mov     r9             , qword [rsp+992]; load->v124
              mov     r10            , qword [rsp+1000]; load->v125
              mov     r11            , qword [rsp+1008]; load->v126
_text__computeSHA1_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 1032           
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__nextLetter ] ---
;[----------------------------------
_text__nextLetter:
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
_text__nextLetter_if0_init:
              mov     r12            , 122            ; load->v7
              mov     r10            , rbx            ; load->v6
              mov     r11            , r12            ; load->v7
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , r12            ; load->v8
              sete    r10b                            
              mov     r12            , r10            ; save->v8
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
              mov     r12            , 1              ; load->v9
              mov     r10            , r13            ; load->v10
              mov     r13            , r12            ; load->v9
              mov     r10            , r13            ; load->v10
              neg     r10                             
              mov     r13            , r10            ; save->v10
_text__nextLetter_ret0:
              mov     rax            , r13            ; load->v10
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
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
              mov     r12            , 90             ; load->v11
              mov     r10            , rbx            ; load->v6
              mov     r11            , r12            ; load->v11
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , r12            ; load->v12
              sete    r10b                            
              mov     r12            , r10            ; save->v12
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
              mov     r12            , 97             ; load->v13
_text__nextLetter_ret1:
              mov     rax            , r12            ; load->v13
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
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
              mov     r12            , 57             ; load->v14
              mov     r10            , rbx            ; load->v6
              mov     r11            , r12            ; load->v14
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , r12            ; load->v15
              sete    r10b                            
              mov     r12            , r10            ; save->v15
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
              mov     r12            , 65             ; load->v16
_text__nextLetter_ret2:
              mov     rax            , r12            ; load->v16
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 152            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__nextLetter_if2_end                 
;----------------------------------]
;[----------------------------------
_text__nextLetter_if2_else:
_text__nextLetter_if2_end:
              mov     r12            , 1              ; load->v17
              mov     r10            , r13            ; load->v18
              mov     r13            , rbx            ; load->v6
              mov     r10            , r13            ; load->v18
              mov     r11            , r12            ; load->v17
              add     r10            , r11            
              mov     r13            , r10            ; save->v18
_text__nextLetter_ret3:
              mov     rax            , r13            ; load->v18
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 152            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__nextLetter_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 152            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__nextText ] ---
;[----------------------------------
_text__nextText:
              sub     rsp            , 344            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     rbx            , rdi            ; load->v6
              mov     r12            , rsi            ; load->v7
_text__nextText_for0_init:
              mov     r14            , 1              ; load->v9
              mov     r10            , r15            ; load->v10
              mov     r15            , r12            ; load->v7
              mov     r10            , r15            ; load->v10
              mov     r11            , r14            ; load->v9
              sub     r10            , r11            
              mov     r15            , r10            ; save->v10
              mov     r10            , r13            ; load->v8
              mov     r13            , r15            ; load->v10
              mov     qword [rsp+88] , 0              ; load->v11
              mov     r10            , r13            ; load->v8
              mov     r11            , qword [rsp+88] ; load->v11
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v8
              mov     r10            , qword [rsp+96] ; load->v12
              setge   r10b                            
              mov     qword [rsp+96] , r10            ; save->v12
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
              mov     qword [rsp+104], r13            ; load->v8
              mov     r10            , qword [rsp+104]; load->v13
              imul    r10            , 8              
              mov     qword [rsp+104], r10            ; save->v13
              add     r10            , 8              
              mov     qword [rsp+104], r10            ; save->v13
              mov     r11            , rbx            ; load->v6
              add     r10            , r11            
              mov     qword [rsp+104], r10            ; save->v13
              mov     r10            , qword [rsp+112]; load->v14
              mov     r11            , qword [rsp+104]; translate->qword [v13]
              mov     r10            , qword [r11]    
              mov     qword [rsp+112], r10            ; save->v14
_text__nextText_call0:
              mov     rdi            , qword [rsp+112]; load->v14
_text__nextText_saveReg0_save:
              mov     qword [rsp+120], rax            ; load->v15
              mov     qword [rsp+128], rdi            ; load->v16
              mov     qword [rsp+136], rsi            ; load->v17
              mov     qword [rsp+144], rdx            ; load->v18
              mov     qword [rsp+152], rcx            ; load->v19
              mov     qword [rsp+160], r8             ; load->v20
              mov     qword [rsp+168], r9             ; load->v21
              mov     r10            , qword [rsp+176]; load->v22
              mov     qword [rsp+184], r11            ; load->v23
              call    _text__nextLetter                 
              mov     qword [rsp+192], rax            ; load->v24
_text__nextText_saveReg0_load:
              mov     rax            , qword [rsp+120]; load->v15
              mov     rdi            , qword [rsp+128]; load->v16
              mov     rsi            , qword [rsp+136]; load->v17
              mov     rdx            , qword [rsp+144]; load->v18
              mov     rcx            , qword [rsp+152]; load->v19
              mov     r8             , qword [rsp+160]; load->v20
              mov     r9             , qword [rsp+168]; load->v21
              mov     r10            , qword [rsp+176]; load->v22
              mov     r11            , qword [rsp+184]; load->v23
              mov     r10            , qword [rsp+200]; load->v25
              mov     qword [rsp+200], r13            ; load->v8
              mov     r10            , qword [rsp+200]; load->v25
              imul    r10            , 8              
              mov     qword [rsp+200], r10            ; save->v25
              add     r10            , 8              
              mov     qword [rsp+200], r10            ; save->v25
              mov     r11            , rbx            ; load->v6
              add     r10            , r11            
              mov     qword [rsp+200], r10            ; save->v25
              mov     r10            , qword [rsp+208]; load->v26
              mov     r11            , qword [rsp+200]; translate->qword [v25]
              mov     r10            , qword [r11]    
              mov     qword [rsp+208], r10            ; save->v26
              mov     r10            , qword [rsp+200]; translate->qword [v25]
              mov     r11            , qword [rsp+192]; load->v24
              mov     qword [r10]    , r11            ; assign->now[i]
_text__nextText_if0_init:
              mov     r10            , qword [rsp+216]; load->v27
              mov     qword [rsp+216], r13            ; load->v8
              mov     r10            , qword [rsp+216]; load->v27
              imul    r10            , 8              
              mov     qword [rsp+216], r10            ; save->v27
              add     r10            , 8              
              mov     qword [rsp+216], r10            ; save->v27
              mov     r11            , rbx            ; load->v6
              add     r10            , r11            
              mov     qword [rsp+216], r10            ; save->v27
              mov     r10            , qword [rsp+224]; load->v28
              mov     r11            , qword [rsp+216]; translate->qword [v27]
              mov     r10            , qword [r11]    
              mov     qword [rsp+224], r10            ; save->v28
              mov     qword [rsp+232], 1              ; load->v29
              mov     r10            , qword [rsp+240]; load->v30
              mov     r10            , qword [rsp+232]; load->v29
              mov     qword [rsp+240], r10            ; save->v30
              neg     r10                             
              mov     qword [rsp+240], r10            ; save->v30
              mov     r10            , qword [rsp+224]; load->v28
              mov     r11            , qword [rsp+240]; load->v30
              cmp     r10d           , r11d           
              mov     qword [rsp+224], r10            ; save->v28
              mov     r10            , qword [rsp+248]; load->v31
              sete    r10b                            
              mov     qword [rsp+248], r10            ; save->v31
              and     r10            , 255            
              mov     qword [rsp+248], r10            ; save->v31
_text__nextText_if0_check:
              mov     r10            , qword [rsp+248]; load->v31
              cmp     r10b           , 0              
              mov     qword [rsp+248], r10            ; save->v31
              je      _text__nextText_if0_else                 
;----------------------------------]
;[----------------------------------
_text__nextText_if0_start:
              mov     qword [rsp+256], 48             ; load->v32
              mov     r10            , qword [rsp+264]; load->v33
              mov     qword [rsp+264], r13            ; load->v8
              mov     r10            , qword [rsp+264]; load->v33
              imul    r10            , 8              
              mov     qword [rsp+264], r10            ; save->v33
              add     r10            , 8              
              mov     qword [rsp+264], r10            ; save->v33
              mov     r11            , rbx            ; load->v6
              add     r10            , r11            
              mov     qword [rsp+264], r10            ; save->v33
              mov     r10            , qword [rsp+272]; load->v34
              mov     r11            , qword [rsp+264]; translate->qword [v33]
              mov     r10            , qword [r11]    
              mov     qword [rsp+272], r10            ; save->v34
              mov     r10            , qword [rsp+264]; translate->qword [v33]
              mov     r11            , qword [rsp+256]; load->v32
              mov     qword [r10]    , r11            ; assign->now[i]
              jmp     _text__nextText_if0_end                 
;----------------------------------]
;[----------------------------------
_text__nextText_if0_else:
              mov     qword [rsp+280], 255            ; load->v35
_text__nextText_ret0:
              mov     rax            , qword [rsp+280]; load->v35
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 344            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__nextText_if0_end:
_text__nextText_for0_continue:
              mov     r10            , qword [rsp+288]; load->v36
              mov     qword [rsp+288], r13            ; load->v8
              mov     qword [rsp+296], 1              ; load->v37
              mov     r10            , qword [rsp+304]; load->v38
              mov     qword [rsp+304], r13            ; load->v8
              mov     r10            , qword [rsp+304]; load->v38
              mov     r11            , qword [rsp+296]; load->v37
              sub     r10            , r11            
              mov     qword [rsp+304], r10            ; save->v38
              mov     r10            , r13            ; load->v8
              mov     r13            , qword [rsp+304]; load->v38
              mov     qword [rsp+312], 0              ; load->v39
              mov     r10            , r13            ; load->v8
              mov     r11            , qword [rsp+312]; load->v39
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v8
              mov     r10            , qword [rsp+320]; load->v40
              setge   r10b                            
              mov     qword [rsp+320], r10            ; save->v40
              and     r10            , 255            
              mov     qword [rsp+320], r10            ; save->v40
              cmp     r10b           , 0              
              mov     qword [rsp+320], r10            ; save->v40
              jne     _text__nextText_for0_start                 
;----------------------------------]
;[----------------------------------
_text__nextText_for0_end:
              mov     rbx            , 0              ; load->v41
_text__nextText_ret1:
              mov     rax            , rbx            ; load->v41
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 344            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__nextText_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 344            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__array_equal ] ---
;[----------------------------------
_text__array_equal:
              sub     rsp            , 520            
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     rbx            , rdi            ; load->v6
              mov     r12            , rsi            ; load->v7
_text__array_equal_if0_init:
_text__array_equal_call0:
              mov     rdi            , rbx            ; load->v6
_text__array_equal_saveReg0_save:
              mov     qword [rsp+64] , rax            ; load->v8
              mov     qword [rsp+72] , rdi            ; load->v9
              mov     qword [rsp+80] , rsi            ; load->v10
              mov     qword [rsp+88] , rdx            ; load->v11
              mov     qword [rsp+96] , rcx            ; load->v12
              mov     qword [rsp+104], r8             ; load->v13
              mov     qword [rsp+112], r9             ; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     qword [rsp+128], r11            ; load->v16
              call    _text_built_in_array_size                 
              mov     qword [rsp+136], rax            ; load->v17
_text__array_equal_saveReg0_load:
              mov     rax            , qword [rsp+64] ; load->v8
              mov     rdi            , qword [rsp+72] ; load->v9
              mov     rsi            , qword [rsp+80] ; load->v10
              mov     rdx            , qword [rsp+88] ; load->v11
              mov     rcx            , qword [rsp+96] ; load->v12
              mov     r8             , qword [rsp+104]; load->v13
              mov     r9             , qword [rsp+112]; load->v14
              mov     r10            , qword [rsp+120]; load->v15
              mov     r11            , qword [rsp+128]; load->v16
_text__array_equal_call1:
              mov     rdi            , r12            ; load->v7
_text__array_equal_saveReg1_save:
              mov     qword [rsp+144], rax            ; load->v18
              mov     qword [rsp+152], rdi            ; load->v19
              mov     qword [rsp+160], rsi            ; load->v20
              mov     qword [rsp+168], rdx            ; load->v21
              mov     qword [rsp+176], rcx            ; load->v22
              mov     qword [rsp+184], r8             ; load->v23
              mov     qword [rsp+192], r9             ; load->v24
              mov     r10            , qword [rsp+200]; load->v25
              mov     qword [rsp+208], r11            ; load->v26
              call    _text_built_in_array_size                 
              mov     qword [rsp+216], rax            ; load->v27
_text__array_equal_saveReg1_load:
              mov     rax            , qword [rsp+144]; load->v18
              mov     rdi            , qword [rsp+152]; load->v19
              mov     rsi            , qword [rsp+160]; load->v20
              mov     rdx            , qword [rsp+168]; load->v21
              mov     rcx            , qword [rsp+176]; load->v22
              mov     r8             , qword [rsp+184]; load->v23
              mov     r9             , qword [rsp+192]; load->v24
              mov     r10            , qword [rsp+200]; load->v25
              mov     r11            , qword [rsp+208]; load->v26
              mov     r10            , qword [rsp+136]; load->v17
              mov     r11            , qword [rsp+216]; load->v27
              cmp     r10d           , r11d           
              mov     qword [rsp+136], r10            ; save->v17
              mov     r10            , r13            ; load->v28
              setne   r10b                            
              mov     r13            , r10            ; save->v28
              and     r10            , 255            
              mov     r13            , r10            ; save->v28
_text__array_equal_if0_check:
              mov     r10            , r13            ; load->v28
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v28
              je      _text__array_equal_if0_else                 
;----------------------------------]
;[----------------------------------
_text__array_equal_if0_start:
              mov     r13            , 0              ; load->v29
_text__array_equal_ret0:
              mov     rax            , r13            ; load->v29
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 520            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__array_equal_if0_end                 
;----------------------------------]
;[----------------------------------
_text__array_equal_if0_else:
_text__array_equal_if0_end:
_text__array_equal_for0_init:
              mov     r14            , 0              ; load->v31
              mov     r10            , r13            ; load->v30
              mov     r13            , r14            ; load->v31
_text__array_equal_call2:
              mov     rdi            , rbx            ; load->v6
_text__array_equal_saveReg2_save:
              mov     qword [rsp+256], rax            ; load->v32
              mov     qword [rsp+264], rdi            ; load->v33
              mov     qword [rsp+272], rsi            ; load->v34
              mov     qword [rsp+280], rdx            ; load->v35
              mov     qword [rsp+288], rcx            ; load->v36
              mov     qword [rsp+296], r8             ; load->v37
              mov     qword [rsp+304], r9             ; load->v38
              mov     r10            , qword [rsp+312]; load->v39
              mov     qword [rsp+320], r11            ; load->v40
              call    _text_built_in_array_size                 
              mov     qword [rsp+328], rax            ; load->v41
_text__array_equal_saveReg2_load:
              mov     rax            , qword [rsp+256]; load->v32
              mov     rdi            , qword [rsp+264]; load->v33
              mov     rsi            , qword [rsp+272]; load->v34
              mov     rdx            , qword [rsp+280]; load->v35
              mov     rcx            , qword [rsp+288]; load->v36
              mov     r8             , qword [rsp+296]; load->v37
              mov     r9             , qword [rsp+304]; load->v38
              mov     r10            , qword [rsp+312]; load->v39
              mov     r11            , qword [rsp+320]; load->v40
              mov     r10            , r13            ; load->v30
              mov     r11            , qword [rsp+328]; load->v41
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v30
              mov     r10            , r15            ; load->v42
              setl    r10b                            
              mov     r15            , r10            ; save->v42
              and     r10            , 255            
              mov     r15            , r10            ; save->v42
_text__array_equal_for0_init_check:
              mov     r10            , r15            ; load->v42
              cmp     r10b           , 0              
              mov     r15            , r10            ; save->v42
              je      _text__array_equal_for0_end                 
;----------------------------------]
;[----------------------------------
_text__array_equal_for0_start:
_text__array_equal_if1_init:
              mov     r10            , qword [rsp+344]; load->v43
              mov     qword [rsp+344], r13            ; load->v30
              mov     r10            , qword [rsp+344]; load->v43
              imul    r10            , 8              
              mov     qword [rsp+344], r10            ; save->v43
              add     r10            , 8              
              mov     qword [rsp+344], r10            ; save->v43
              mov     r11            , rbx            ; load->v6
              add     r10            , r11            
              mov     qword [rsp+344], r10            ; save->v43
              mov     r10            , qword [rsp+352]; load->v44
              mov     r11            , qword [rsp+344]; translate->qword [v43]
              mov     r10            , qword [r11]    
              mov     qword [rsp+352], r10            ; save->v44
              mov     r10            , qword [rsp+360]; load->v45
              mov     qword [rsp+360], r13            ; load->v30
              mov     r10            , qword [rsp+360]; load->v45
              imul    r10            , 8              
              mov     qword [rsp+360], r10            ; save->v45
              add     r10            , 8              
              mov     qword [rsp+360], r10            ; save->v45
              mov     r11            , r12            ; load->v7
              add     r10            , r11            
              mov     qword [rsp+360], r10            ; save->v45
              mov     r10            , qword [rsp+368]; load->v46
              mov     r11            , qword [rsp+360]; translate->qword [v45]
              mov     r10            , qword [r11]    
              mov     qword [rsp+368], r10            ; save->v46
              mov     r10            , qword [rsp+352]; load->v44
              mov     r11            , qword [rsp+368]; load->v46
              cmp     r10d           , r11d           
              mov     qword [rsp+352], r10            ; save->v44
              mov     r10            , qword [rsp+376]; load->v47
              setne   r10b                            
              mov     qword [rsp+376], r10            ; save->v47
              and     r10            , 255            
              mov     qword [rsp+376], r10            ; save->v47
_text__array_equal_if1_check:
              mov     r10            , qword [rsp+376]; load->v47
              cmp     r10b           , 0              
              mov     qword [rsp+376], r10            ; save->v47
              je      _text__array_equal_if1_else                 
;----------------------------------]
;[----------------------------------
_text__array_equal_if1_start:
              mov     qword [rsp+384], 0              ; load->v48
_text__array_equal_ret1:
              mov     rax            , qword [rsp+384]; load->v48
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 520            
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__array_equal_if1_end                 
;----------------------------------]
;[----------------------------------
_text__array_equal_if1_else:
_text__array_equal_if1_end:
_text__array_equal_for0_continue:
              mov     r10            , qword [rsp+392]; load->v49
              mov     qword [rsp+392], r13            ; load->v30
              mov     qword [rsp+400], 1              ; load->v50
              mov     r10            , qword [rsp+408]; load->v51
              mov     qword [rsp+408], r13            ; load->v30
              mov     r10            , qword [rsp+408]; load->v51
              mov     r11            , qword [rsp+400]; load->v50
              add     r10            , r11            
              mov     qword [rsp+408], r10            ; save->v51
              mov     r10            , r13            ; load->v30
              mov     r13            , qword [rsp+408]; load->v51
_text__array_equal_call3:
              mov     rdi            , rbx            ; load->v6
_text__array_equal_saveReg3_save:
              mov     qword [rsp+416], rax            ; load->v52
              mov     qword [rsp+424], rdi            ; load->v53
              mov     qword [rsp+432], rsi            ; load->v54
              mov     qword [rsp+440], rdx            ; load->v55
              mov     qword [rsp+448], rcx            ; load->v56
              mov     qword [rsp+456], r8             ; load->v57
              mov     qword [rsp+464], r9             ; load->v58
              mov     r10            , qword [rsp+472]; load->v59
              mov     qword [rsp+480], r11            ; load->v60
              call    _text_built_in_array_size                 
              mov     qword [rsp+488], rax            ; load->v61
_text__array_equal_saveReg3_load:
              mov     rax            , qword [rsp+416]; load->v52
              mov     rdi            , qword [rsp+424]; load->v53
              mov     rsi            , qword [rsp+432]; load->v54
              mov     rdx            , qword [rsp+440]; load->v55
              mov     rcx            , qword [rsp+448]; load->v56
              mov     r8             , qword [rsp+456]; load->v57
              mov     r9             , qword [rsp+464]; load->v58
              mov     r10            , qword [rsp+472]; load->v59
              mov     r11            , qword [rsp+480]; load->v60
              mov     r10            , r13            ; load->v30
              mov     r11            , qword [rsp+488]; load->v61
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v30
              mov     r10            , qword [rsp+496]; load->v62
              setl    r10b                            
              mov     qword [rsp+496], r10            ; save->v62
              and     r10            , 255            
              mov     qword [rsp+496], r10            ; save->v62
              cmp     r10b           , 0              
              mov     qword [rsp+496], r10            ; save->v62
              jne     _text__array_equal_for0_start                 
;----------------------------------]
;[----------------------------------
_text__array_equal_for0_end:
              mov     rbx            , 255            ; load->v63
_text__array_equal_ret2:
              mov     rax            , rbx            ; load->v63
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 520            
              ret                                     
;----------------------------------]
;[----------------------------------
_text__array_equal_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 520            
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__crackSHA1 ] ---
;[----------------------------------
_text__crackSHA1:
              sub     rsp            , 1736           
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
              mov     rbx            , rdi            ; load->v6
              mov     qword [rsp+56] , 5              ; load->v7
              mov     r10            , qword [rsp+64] ; load->v8
              mov     r10            , qword [rsp+56] ; load->v7
              mov     qword [rsp+64] , r10            ; save->v8
              imul    r10            , 8              
              mov     qword [rsp+64] , r10            ; save->v8
              add     r10            , 8              
              mov     qword [rsp+64] , r10            ; save->v8
_text__crackSHA1_saveReg0_save:
              mov     qword [rsp+72] , rax            ; load->v9
              mov     qword [rsp+80] , rdi            ; load->v10
              mov     qword [rsp+88] , rsi            ; load->v11
              mov     qword [rsp+96] , rdx            ; load->v12
              mov     qword [rsp+104], rcx            ; load->v13
              mov     qword [rsp+112], r8             ; load->v14
              mov     qword [rsp+120], r9             ; load->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     qword [rsp+136], r11            ; load->v17
              mov     rdi            , qword [rsp+64] ; load->v8
              call    malloc                          
              mov     qword [rsp+144], rax            ; load->v18
              mov     r11            , qword [rsp+56] ; load->v7
              mov     qword [rax]    , r11            
_text__crackSHA1_saveReg0_load:
              mov     rax            , qword [rsp+72] ; load->v9
              mov     rdi            , qword [rsp+80] ; load->v10
              mov     rsi            , qword [rsp+88] ; load->v11
              mov     rdx            , qword [rsp+96] ; load->v12
              mov     rcx            , qword [rsp+104]; load->v13
              mov     r8             , qword [rsp+112]; load->v14
              mov     r9             , qword [rsp+120]; load->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r11            , qword [rsp+136]; load->v17
              mov     r10            , qword [rsp+152]; load->v19
              mov     r10            , qword [rsp+144]; load->v18
              mov     qword [rsp+152], r10            ; save->v19
_text__crackSHA1_if0_init:
_text__crackSHA1_call0:
              mov     rdi            , rbx            ; load->v6
_text__crackSHA1_saveReg1_save:
              mov     qword [rsp+160], rax            ; load->v20
              mov     qword [rsp+168], rdi            ; load->v21
              mov     qword [rsp+176], rsi            ; load->v22
              mov     qword [rsp+184], rdx            ; load->v23
              mov     qword [rsp+192], rcx            ; load->v24
              mov     qword [rsp+200], r8             ; load->v25
              mov     qword [rsp+208], r9             ; load->v26
              mov     r10            , qword [rsp+216]; load->v27
              mov     qword [rsp+224], r11            ; load->v28
              call    _text_built_in_string_length                 
              mov     qword [rsp+232], rax            ; load->v29
_text__crackSHA1_saveReg1_load:
              mov     rax            , qword [rsp+160]; load->v20
              mov     rdi            , qword [rsp+168]; load->v21
              mov     rsi            , qword [rsp+176]; load->v22
              mov     rdx            , qword [rsp+184]; load->v23
              mov     rcx            , qword [rsp+192]; load->v24
              mov     r8             , qword [rsp+200]; load->v25
              mov     r9             , qword [rsp+208]; load->v26
              mov     r10            , qword [rsp+216]; load->v27
              mov     r11            , qword [rsp+224]; load->v28
              mov     r13            , 40             ; load->v30
              mov     r10            , qword [rsp+232]; load->v29
              mov     r11            , r13            ; load->v30
              cmp     r10d           , r11d           
              mov     qword [rsp+232], r10            ; save->v29
              mov     r10            , r13            ; load->v31
              setne   r10b                            
              mov     r13            , r10            ; save->v31
              and     r10            , 255            
              mov     r13            , r10            ; save->v31
_text__crackSHA1_if0_check:
              mov     r10            , r13            ; load->v31
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v31
              je      _text__crackSHA1_if0_else                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_if0_start:
              mov     r13            , _data_s5       ; load->v32
_text__crackSHA1_call1:
              mov     rdi            , r13            ; load->v32
_text__crackSHA1_saveReg2_save:
              mov     qword [rsp+264], rax            ; load->v33
              mov     qword [rsp+272], rdi            ; load->v34
              mov     qword [rsp+280], rsi            ; load->v35
              mov     qword [rsp+288], rdx            ; load->v36
              mov     qword [rsp+296], rcx            ; load->v37
              mov     qword [rsp+304], r8             ; load->v38
              mov     qword [rsp+312], r9             ; load->v39
              mov     r10            , qword [rsp+320]; load->v40
              mov     qword [rsp+328], r11            ; load->v41
              call    _text__println                  
              mov     r13            , rax            ; load->v42
_text__crackSHA1_saveReg2_load:
              mov     rax            , qword [rsp+264]; load->v33
              mov     rdi            , qword [rsp+272]; load->v34
              mov     rsi            , qword [rsp+280]; load->v35
              mov     rdx            , qword [rsp+288]; load->v36
              mov     rcx            , qword [rsp+296]; load->v37
              mov     r8             , qword [rsp+304]; load->v38
              mov     r9             , qword [rsp+312]; load->v39
              mov     r10            , qword [rsp+320]; load->v40
              mov     r11            , qword [rsp+328]; load->v41
_text__crackSHA1_ret0:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 1736           
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__crackSHA1_if0_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_if0_else:
_text__crackSHA1_if0_end:
_text__crackSHA1_for0_init:
              mov     r14            , 0              ; load->v44
              mov     r10            , r13            ; load->v43
              mov     r13            , r14            ; load->v44
              mov     r15            , 5              ; load->v45
              mov     r10            , r13            ; load->v43
              mov     r11            , r15            ; load->v45
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v43
              mov     r10            , qword [rsp+368]; load->v46
              setl    r10b                            
              mov     qword [rsp+368], r10            ; save->v46
              and     r10            , 255            
              mov     qword [rsp+368], r10            ; save->v46
_text__crackSHA1_for0_init_check:
              mov     r10            , qword [rsp+368]; load->v46
              cmp     r10b           , 0              
              mov     qword [rsp+368], r10            ; save->v46
              je      _text__crackSHA1_for0_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for0_start:
              mov     qword [rsp+376], 0              ; load->v47
              mov     r10            , qword [rsp+384]; load->v48
              mov     qword [rsp+384], r13            ; load->v43
              mov     r10            , qword [rsp+384]; load->v48
              imul    r10            , 8              
              mov     qword [rsp+384], r10            ; save->v48
              add     r10            , 8              
              mov     qword [rsp+384], r10            ; save->v48
              mov     r11            , qword [rsp+152]; load->v19
              add     r10            , r11            
              mov     qword [rsp+384], r10            ; save->v48
              mov     r10            , qword [rsp+392]; load->v49
              mov     r11            , qword [rsp+384]; translate->qword [v48]
              mov     r10            , qword [r11]    
              mov     qword [rsp+392], r10            ; save->v49
              mov     r10            , qword [rsp+384]; translate->qword [v48]
              mov     r11            , qword [rsp+376]; load->v47
              mov     qword [r10]    , r11            ; assign->target[i]
_text__crackSHA1_for0_continue:
              mov     r10            , qword [rsp+400]; load->v50
              mov     qword [rsp+400], r13            ; load->v43
              mov     qword [rsp+408], 1              ; load->v51
              mov     r10            , qword [rsp+416]; load->v52
              mov     qword [rsp+416], r13            ; load->v43
              mov     r10            , qword [rsp+416]; load->v52
              mov     r11            , qword [rsp+408]; load->v51
              add     r10            , r11            
              mov     qword [rsp+416], r10            ; save->v52
              mov     r10            , r13            ; load->v43
              mov     r13            , qword [rsp+416]; load->v52
              mov     qword [rsp+424], 5              ; load->v53
              mov     r10            , r13            ; load->v43
              mov     r11            , qword [rsp+424]; load->v53
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v43
              mov     r10            , qword [rsp+432]; load->v54
              setl    r10b                            
              mov     qword [rsp+432], r10            ; save->v54
              and     r10            , 255            
              mov     qword [rsp+432], r10            ; save->v54
              cmp     r10b           , 0              
              mov     qword [rsp+432], r10            ; save->v54
              jne     _text__crackSHA1_for0_start                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for0_end:
_text__crackSHA1_for1_init:
              mov     r14            , 0              ; load->v55
              mov     r10            , r13            ; load->v43
              mov     r13            , r14            ; load->v55
              mov     r15            , 40             ; load->v56
              mov     r10            , r13            ; load->v43
              mov     r11            , r15            ; load->v56
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v43
              mov     r10            , qword [rsp+456]; load->v57
              setl    r10b                            
              mov     qword [rsp+456], r10            ; save->v57
              and     r10            , 255            
              mov     qword [rsp+456], r10            ; save->v57
_text__crackSHA1_for1_init_check:
              mov     r10            , qword [rsp+456]; load->v57
              cmp     r10b           , 0              
              mov     qword [rsp+456], r10            ; save->v57
              je      _text__crackSHA1_for1_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for1_start:
              mov     qword [rsp+464], 8              ; load->v58
              mov     qword [rsp+480], rdx            ; load->v60
              mov     qword [rsp+488], rax            ; load->v61
              mov     rax            , r13            ; load->v43
              and     rax            , -1             
              mov     r10            , qword [rsp+464]; load->v58
              and     r10d           , -1             
              mov     qword [rsp+464], r10            ; save->v58
              cqo                                     
              mov     r10            , qword [rsp+464]; load->v58
              idiv    r10d                            
              mov     qword [rsp+464], r10            ; save->v58
              mov     qword [rsp+472], rax            ; load->v59
              mov     rdx            , qword [rsp+480]; load->v60
              mov     rax            , qword [rsp+488]; load->v61
              mov     r10            , qword [rsp+496]; load->v62
              mov     r10            , qword [rsp+472]; load->v59
              mov     qword [rsp+496], r10            ; save->v62
              imul    r10            , 8              
              mov     qword [rsp+496], r10            ; save->v62
              add     r10            , 8              
              mov     qword [rsp+496], r10            ; save->v62
              mov     r11            , qword [rsp+152]; load->v19
              add     r10            , r11            
              mov     qword [rsp+496], r10            ; save->v62
              mov     r10            , qword [rsp+504]; load->v63
              mov     r11            , qword [rsp+496]; translate->qword [v62]
              mov     r10            , qword [r11]    
              mov     qword [rsp+504], r10            ; save->v63
              mov     qword [rsp+512], 3              ; load->v64
              mov     r10            , qword [rsp+520]; load->v65
              mov     qword [rsp+520], r13            ; load->v43
              mov     r10            , qword [rsp+520]; load->v65
              mov     r11            , qword [rsp+512]; load->v64
              add     r10            , r11            
              mov     qword [rsp+520], r10            ; save->v65
_text__crackSHA1_call2:
              mov     rdi            , rbx            ; load->v6
              mov     rsi            , r13            ; load->v43
              mov     rdx            , qword [rsp+520]; load->v65
_text__crackSHA1_saveReg3_save:
              mov     qword [rsp+528], rax            ; load->v66
              mov     qword [rsp+536], rdi            ; load->v67
              mov     qword [rsp+544], rsi            ; load->v68
              mov     qword [rsp+552], rdx            ; load->v69
              mov     qword [rsp+560], rcx            ; load->v70
              mov     qword [rsp+568], r8             ; load->v71
              mov     qword [rsp+576], r9             ; load->v72
              mov     r10            , qword [rsp+584]; load->v73
              mov     qword [rsp+592], r11            ; load->v74
              call    _text_built_in_string_substring                 
              mov     qword [rsp+600], rax            ; load->v75
_text__crackSHA1_saveReg3_load:
              mov     rax            , qword [rsp+528]; load->v66
              mov     rdi            , qword [rsp+536]; load->v67
              mov     rsi            , qword [rsp+544]; load->v68
              mov     rdx            , qword [rsp+552]; load->v69
              mov     rcx            , qword [rsp+560]; load->v70
              mov     r8             , qword [rsp+568]; load->v71
              mov     r9             , qword [rsp+576]; load->v72
              mov     r10            , qword [rsp+584]; load->v73
              mov     r11            , qword [rsp+592]; load->v74
_text__crackSHA1_call3:
              mov     rdi            , qword [rsp+600]; load->v75
_text__crackSHA1_saveReg4_save:
              mov     qword [rsp+608], rax            ; load->v76
              mov     qword [rsp+616], rdi            ; load->v77
              mov     qword [rsp+624], rsi            ; load->v78
              mov     qword [rsp+632], rdx            ; load->v79
              mov     qword [rsp+640], rcx            ; load->v80
              mov     qword [rsp+648], r8             ; load->v81
              mov     qword [rsp+656], r9             ; load->v82
              mov     r10            , qword [rsp+664]; load->v83
              mov     qword [rsp+672], r11            ; load->v84
              call    _text__hex2int                  
              mov     qword [rsp+680], rax            ; load->v85
_text__crackSHA1_saveReg4_load:
              mov     rax            , qword [rsp+608]; load->v76
              mov     rdi            , qword [rsp+616]; load->v77
              mov     rsi            , qword [rsp+624]; load->v78
              mov     rdx            , qword [rsp+632]; load->v79
              mov     rcx            , qword [rsp+640]; load->v80
              mov     r8             , qword [rsp+648]; load->v81
              mov     r9             , qword [rsp+656]; load->v82
              mov     r10            , qword [rsp+664]; load->v83
              mov     r11            , qword [rsp+672]; load->v84
              mov     qword [rsp+688], 1              ; load->v86
              mov     qword [rsp+696], 4              ; load->v87
              mov     qword [rsp+712], rdx            ; load->v89
              mov     qword [rsp+720], rax            ; load->v90
              mov     rax            , r13            ; load->v43
              and     rax            , -1             
              mov     r10            , qword [rsp+696]; load->v87
              and     r10d           , -1             
              mov     qword [rsp+696], r10            ; save->v87
              cqo                                     
              mov     r10            , qword [rsp+696]; load->v87
              idiv    r10d                            
              mov     qword [rsp+696], r10            ; save->v87
              mov     qword [rsp+704], rax            ; load->v88
              mov     rdx            , qword [rsp+712]; load->v89
              mov     rax            , qword [rsp+720]; load->v90
              mov     qword [rsp+728], 2              ; load->v91
              mov     qword [rsp+744], rdx            ; load->v93
              mov     qword [rsp+752], rax            ; load->v94
              mov     rax            , qword [rsp+704]; load->v88
              and     rax            , -1             
              mov     r10            , qword [rsp+728]; load->v91
              and     r10d           , -1             
              mov     qword [rsp+728], r10            ; save->v91
              cqo                                     
              mov     r10            , qword [rsp+728]; load->v91
              idiv    r10d                            
              mov     qword [rsp+728], r10            ; save->v91
              mov     qword [rsp+736], rdx            ; load->v92
              mov     rdx            , qword [rsp+744]; load->v93
              mov     rax            , qword [rsp+752]; load->v94
              mov     r10            , qword [rsp+760]; load->v95
              mov     r10            , qword [rsp+688]; load->v86
              mov     qword [rsp+760], r10            ; save->v95
              mov     r11            , qword [rsp+736]; load->v92
              sub     r10            , r11            
              mov     qword [rsp+760], r10            ; save->v95
              mov     qword [rsp+768], 16             ; load->v96
              mov     r10            , qword [rsp+776]; load->v97
              mov     r10            , qword [rsp+760]; load->v95
              mov     qword [rsp+776], r10            ; save->v97
              mov     r11            , qword [rsp+768]; load->v96
              imul    r10            , r11            
              mov     qword [rsp+776], r10            ; save->v97
              and     r10            , -1             
              mov     qword [rsp+776], r10            ; save->v97
              mov     qword [rsp+792], rcx            ; load->v99
              mov     r10            , qword [rsp+784]; load->v98
              mov     r10            , qword [rsp+680]; load->v85
              mov     qword [rsp+784], r10            ; save->v98
              mov     rcx            , qword [rsp+776]; load->v97
              mov     r10            , qword [rsp+784]; load->v98
              and     r10            , -1             
              mov     qword [rsp+784], r10            ; save->v98
              sal     r10d           , cl             
              mov     qword [rsp+784], r10            ; save->v98
              mov     rcx            , qword [rsp+792]; load->v99
              mov     r10            , qword [rsp+800]; load->v100
              mov     r10            , qword [rsp+504]; load->v63
              mov     qword [rsp+800], r10            ; save->v100
              mov     r11            , qword [rsp+784]; load->v98
              or      r10            , r11            
              mov     qword [rsp+800], r10            ; save->v100
              mov     qword [rsp+808], 8              ; load->v101
              mov     qword [rsp+824], rdx            ; load->v103
              mov     qword [rsp+832], rax            ; load->v104
              mov     rax            , r13            ; load->v43
              and     rax            , -1             
              mov     r10            , qword [rsp+808]; load->v101
              and     r10d           , -1             
              mov     qword [rsp+808], r10            ; save->v101
              cqo                                     
              mov     r10            , qword [rsp+808]; load->v101
              idiv    r10d                            
              mov     qword [rsp+808], r10            ; save->v101
              mov     qword [rsp+816], rax            ; load->v102
              mov     rdx            , qword [rsp+824]; load->v103
              mov     rax            , qword [rsp+832]; load->v104
              mov     r10            , qword [rsp+840]; load->v105
              mov     r10            , qword [rsp+816]; load->v102
              mov     qword [rsp+840], r10            ; save->v105
              imul    r10            , 8              
              mov     qword [rsp+840], r10            ; save->v105
              add     r10            , 8              
              mov     qword [rsp+840], r10            ; save->v105
              mov     r11            , qword [rsp+152]; load->v19
              add     r10            , r11            
              mov     qword [rsp+840], r10            ; save->v105
              mov     r10            , qword [rsp+848]; load->v106
              mov     r11            , qword [rsp+840]; translate->qword [v105]
              mov     r10            , qword [r11]    
              mov     qword [rsp+848], r10            ; save->v106
              mov     r10            , qword [rsp+840]; translate->qword [v105]
              mov     r11            , qword [rsp+800]; load->v100
              mov     qword [r10]    , r11            ; assign->target[i/8]
_text__crackSHA1_for1_continue:
              mov     qword [rsp+856], 4              ; load->v107
              mov     r10            , qword [rsp+864]; load->v108
              mov     qword [rsp+864], r13            ; load->v43
              mov     r10            , qword [rsp+864]; load->v108
              mov     r11            , qword [rsp+856]; load->v107
              add     r10            , r11            
              mov     qword [rsp+864], r10            ; save->v108
              mov     r10            , r13            ; load->v43
              mov     r13            , qword [rsp+864]; load->v108
              mov     qword [rsp+872], 40             ; load->v109
              mov     r10            , r13            ; load->v43
              mov     r11            , qword [rsp+872]; load->v109
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v43
              mov     r10            , qword [rsp+880]; load->v110
              setl    r10b                            
              mov     qword [rsp+880], r10            ; save->v110
              and     r10            , 255            
              mov     qword [rsp+880], r10            ; save->v110
              cmp     r10b           , 0              
              mov     qword [rsp+880], r10            ; save->v110
              jne     _text__crackSHA1_for1_start                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for1_end:
              mov     rbx            , 4              ; load->v111
              mov     r10            , qword [rsp+896]; load->v112
              mov     qword [rsp+896], rbx            ; load->v111
_text__crackSHA1_for2_init:
              mov     qword [rsp+912], 1              ; load->v114
              mov     r10            , rbx            ; load->v113
              mov     rbx            , qword [rsp+912]; load->v114
              mov     r10            , rbx            ; load->v113
              mov     r11            , qword [rsp+896]; load->v112
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v113
              mov     r10            , qword [rsp+920]; load->v115
              setle   r10b                            
              mov     qword [rsp+920], r10            ; save->v115
              and     r10            , 255            
              mov     qword [rsp+920], r10            ; save->v115
_text__crackSHA1_for2_init_check:
              mov     r10            , qword [rsp+920]; load->v115
              cmp     r10b           , 0              
              mov     qword [rsp+920], r10            ; save->v115
              je      _text__crackSHA1_for2_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for2_start:
_text__crackSHA1_for3_init:
              mov     r14            , 0              ; load->v116
              mov     r10            , r13            ; load->v43
              mov     r13            , r14            ; load->v116
              mov     r10            , r13            ; load->v43
              mov     r11            , rbx            ; load->v113
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v43
              mov     r10            , r15            ; load->v117
              setl    r10b                            
              mov     r15            , r10            ; save->v117
              and     r10            , 255            
              mov     r15            , r10            ; save->v117
_text__crackSHA1_for3_init_check:
              mov     r10            , r15            ; load->v117
              cmp     r10b           , 0              
              mov     r15            , r10            ; save->v117
              je      _text__crackSHA1_for3_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for3_start:
              mov     qword [rsp+944], 48             ; load->v118
              mov     r10            , qword [rsp+952]; load->v119
              mov     r10            , [_data_bss_inputBuffer]
              mov     qword [rsp+952], r10            ; save->v119
              mov     r10            , qword [rsp+960]; load->v120
              mov     qword [rsp+960], r13            ; load->v43
              mov     r10            , qword [rsp+960]; load->v120
              imul    r10            , 8              
              mov     qword [rsp+960], r10            ; save->v120
              add     r10            , 8              
              mov     qword [rsp+960], r10            ; save->v120
              mov     r11            , qword [rsp+952]; load->v119
              add     r10            , r11            
              mov     qword [rsp+960], r10            ; save->v120
              mov     r10            , qword [rsp+968]; load->v121
              mov     r11            , qword [rsp+960]; translate->qword [v120]
              mov     r10            , qword [r11]    
              mov     qword [rsp+968], r10            ; save->v121
              mov     r10            , qword [rsp+960]; translate->qword [v120]
              mov     r11            , qword [rsp+944]; load->v118
              mov     qword [r10]    , r11            ; assign->inputBuffer[i]
_text__crackSHA1_for3_continue:
              mov     r10            , qword [rsp+976]; load->v122
              mov     qword [rsp+976], r13            ; load->v43
              mov     qword [rsp+984], 1              ; load->v123
              mov     r10            , qword [rsp+992]; load->v124
              mov     qword [rsp+992], r13            ; load->v43
              mov     r10            , qword [rsp+992]; load->v124
              mov     r11            , qword [rsp+984]; load->v123
              add     r10            , r11            
              mov     qword [rsp+992], r10            ; save->v124
              mov     r10            , r13            ; load->v43
              mov     r13            , qword [rsp+992]; load->v124
              mov     r10            , r13            ; load->v43
              mov     r11            , rbx            ; load->v113
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v43
              mov     r10            , qword [rsp+1000]; load->v125
              setl    r10b                            
              mov     qword [rsp+1000], r10            ; save->v125
              and     r10            , 255            
              mov     qword [rsp+1000], r10            ; save->v125
              cmp     r10b           , 0              
              mov     qword [rsp+1000], r10            ; save->v125
              jne     _text__crackSHA1_for3_start                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for3_end:
_text__crackSHA1_for4_init:
              mov     qword [rsp+1008], 255            ; load->v126
_text__crackSHA1_for4_init_check:
              mov     r10            , qword [rsp+1008]; load->v126
              cmp     r10b           , 0              
              mov     qword [rsp+1008], r10            ; save->v126
              je      _text__crackSHA1_for4_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for4_start:
              mov     r10            , qword [rsp+1016]; load->v127
              mov     r10            , [_data_bss_inputBuffer]
              mov     qword [rsp+1016], r10            ; save->v127
_text__crackSHA1_call4:
              mov     rdi            , qword [rsp+1016]; load->v127
              mov     rsi            , rbx            ; load->v113
_text__crackSHA1_saveReg5_save:
              mov     qword [rsp+1024], rax            ; load->v128
              mov     qword [rsp+1032], rdi            ; load->v129
              mov     qword [rsp+1040], rsi            ; load->v130
              mov     qword [rsp+1048], rdx            ; load->v131
              mov     qword [rsp+1056], rcx            ; load->v132
              mov     qword [rsp+1064], r8             ; load->v133
              mov     qword [rsp+1072], r9             ; load->v134
              mov     r10            , qword [rsp+1080]; load->v135
              mov     qword [rsp+1088], r11            ; load->v136
              call    _text__sha1                     
              mov     qword [rsp+1096], rax            ; load->v137
_text__crackSHA1_saveReg5_load:
              mov     rax            , qword [rsp+1024]; load->v128
              mov     rdi            , qword [rsp+1032]; load->v129
              mov     rsi            , qword [rsp+1040]; load->v130
              mov     rdx            , qword [rsp+1048]; load->v131
              mov     rcx            , qword [rsp+1056]; load->v132
              mov     r8             , qword [rsp+1064]; load->v133
              mov     r9             , qword [rsp+1072]; load->v134
              mov     r10            , qword [rsp+1080]; load->v135
              mov     r11            , qword [rsp+1088]; load->v136
              mov     r10            , qword [rsp+1104]; load->v138
              mov     r10            , qword [rsp+1096]; load->v137
              mov     qword [rsp+1104], r10            ; save->v138
_text__crackSHA1_if1_init:
_text__crackSHA1_call5:
              mov     rdi            , qword [rsp+1104]; load->v138
              mov     rsi            , qword [rsp+152]; load->v19
_text__crackSHA1_saveReg6_save:
              mov     qword [rsp+1112], rax            ; load->v139
              mov     qword [rsp+1120], rdi            ; load->v140
              mov     qword [rsp+1128], rsi            ; load->v141
              mov     qword [rsp+1136], rdx            ; load->v142
              mov     qword [rsp+1144], rcx            ; load->v143
              mov     qword [rsp+1152], r8             ; load->v144
              mov     qword [rsp+1160], r9             ; load->v145
              mov     r10            , qword [rsp+1168]; load->v146
              mov     qword [rsp+1176], r11            ; load->v147
              call    _text__array_equal                 
              mov     qword [rsp+1184], rax            ; load->v148
_text__crackSHA1_saveReg6_load:
              mov     rax            , qword [rsp+1112]; load->v139
              mov     rdi            , qword [rsp+1120]; load->v140
              mov     rsi            , qword [rsp+1128]; load->v141
              mov     rdx            , qword [rsp+1136]; load->v142
              mov     rcx            , qword [rsp+1144]; load->v143
              mov     r8             , qword [rsp+1152]; load->v144
              mov     r9             , qword [rsp+1160]; load->v145
              mov     r10            , qword [rsp+1168]; load->v146
              mov     r11            , qword [rsp+1176]; load->v147
_text__crackSHA1_if1_check:
              mov     r10            , qword [rsp+1184]; load->v148
              cmp     r10b           , 0              
              mov     qword [rsp+1184], r10            ; save->v148
              je      _text__crackSHA1_if1_else                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_if1_start:
_text__crackSHA1_for5_init:
              mov     r12            , 0              ; load->v149
              mov     r10            , r13            ; load->v43
              mov     r13            , r12            ; load->v149
              mov     r10            , r13            ; load->v43
              mov     r11            , rbx            ; load->v113
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v43
              mov     r10            , r15            ; load->v150
              setl    r10b                            
              mov     r15            , r10            ; save->v150
              and     r10            , 255            
              mov     r15            , r10            ; save->v150
_text__crackSHA1_for5_init_check:
              mov     r10            , r15            ; load->v150
              cmp     r10b           , 0              
              mov     r15            , r10            ; save->v150
              je      _text__crackSHA1_for5_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for5_start:
              mov     r10            , r14            ; load->v151
              mov     r14            , [_data_bss_inputBuffer]
              mov     r10            , qword [rsp+1216]; load->v152
              mov     qword [rsp+1216], r13            ; load->v43
              mov     r10            , qword [rsp+1216]; load->v152
              imul    r10            , 8              
              mov     qword [rsp+1216], r10            ; save->v152
              add     r10            , 8              
              mov     qword [rsp+1216], r10            ; save->v152
              mov     r11            , r14            ; load->v151
              add     r10            , r11            
              mov     qword [rsp+1216], r10            ; save->v152
              mov     r10            , qword [rsp+1224]; load->v153
              mov     r11            , qword [rsp+1216]; translate->qword [v152]
              mov     r10            , qword [r11]    
              mov     qword [rsp+1224], r10            ; save->v153
_text__crackSHA1_call6:
              mov     rdi            , qword [rsp+1224]; load->v153
_text__crackSHA1_saveReg7_save:
              mov     qword [rsp+1232], rax            ; load->v154
              mov     qword [rsp+1240], rdi            ; load->v155
              mov     qword [rsp+1248], rsi            ; load->v156
              mov     qword [rsp+1256], rdx            ; load->v157
              mov     qword [rsp+1264], rcx            ; load->v158
              mov     qword [rsp+1272], r8             ; load->v159
              mov     qword [rsp+1280], r9             ; load->v160
              mov     r10            , qword [rsp+1288]; load->v161
              mov     qword [rsp+1296], r11            ; load->v162
              call    _text__int2chr                  
              mov     qword [rsp+1304], rax            ; load->v163
_text__crackSHA1_saveReg7_load:
              mov     rax            , qword [rsp+1232]; load->v154
              mov     rdi            , qword [rsp+1240]; load->v155
              mov     rsi            , qword [rsp+1248]; load->v156
              mov     rdx            , qword [rsp+1256]; load->v157
              mov     rcx            , qword [rsp+1264]; load->v158
              mov     r8             , qword [rsp+1272]; load->v159
              mov     r9             , qword [rsp+1280]; load->v160
              mov     r10            , qword [rsp+1288]; load->v161
              mov     r11            , qword [rsp+1296]; load->v162
_text__crackSHA1_call7:
              mov     rdi            , qword [rsp+1304]; load->v163
_text__crackSHA1_saveReg8_save:
              mov     qword [rsp+1312], rax            ; load->v164
              mov     qword [rsp+1320], rdi            ; load->v165
              mov     qword [rsp+1328], rsi            ; load->v166
              mov     qword [rsp+1336], rdx            ; load->v167
              mov     qword [rsp+1344], rcx            ; load->v168
              mov     qword [rsp+1352], r8             ; load->v169
              mov     qword [rsp+1360], r9             ; load->v170
              mov     r10            , qword [rsp+1368]; load->v171
              mov     qword [rsp+1376], r11            ; load->v172
              call    _text__print                    
              mov     qword [rsp+1384], rax            ; load->v173
_text__crackSHA1_saveReg8_load:
              mov     rax            , qword [rsp+1312]; load->v164
              mov     rdi            , qword [rsp+1320]; load->v165
              mov     rsi            , qword [rsp+1328]; load->v166
              mov     rdx            , qword [rsp+1336]; load->v167
              mov     rcx            , qword [rsp+1344]; load->v168
              mov     r8             , qword [rsp+1352]; load->v169
              mov     r9             , qword [rsp+1360]; load->v170
              mov     r10            , qword [rsp+1368]; load->v171
              mov     r11            , qword [rsp+1376]; load->v172
_text__crackSHA1_for5_continue:
              mov     r10            , qword [rsp+1392]; load->v174
              mov     qword [rsp+1392], r13            ; load->v43
              mov     qword [rsp+1400], 1              ; load->v175
              mov     r10            , qword [rsp+1408]; load->v176
              mov     qword [rsp+1408], r13            ; load->v43
              mov     r10            , qword [rsp+1408]; load->v176
              mov     r11            , qword [rsp+1400]; load->v175
              add     r10            , r11            
              mov     qword [rsp+1408], r10            ; save->v176
              mov     r10            , r13            ; load->v43
              mov     r13            , qword [rsp+1408]; load->v176
              mov     r10            , r13            ; load->v43
              mov     r11            , rbx            ; load->v113
              cmp     r10d           , r11d           
              mov     r13            , r10            ; save->v43
              mov     r10            , qword [rsp+1416]; load->v177
              setl    r10b                            
              mov     qword [rsp+1416], r10            ; save->v177
              and     r10            , 255            
              mov     qword [rsp+1416], r10            ; save->v177
              cmp     r10b           , 0              
              mov     qword [rsp+1416], r10            ; save->v177
              jne     _text__crackSHA1_for5_start                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for5_end:
              mov     qword [rsp+1424], _data_s3       ; load->v178
_text__crackSHA1_call8:
              mov     rdi            , qword [rsp+1424]; load->v178
_text__crackSHA1_saveReg9_save:
              mov     qword [rsp+1432], rax            ; load->v179
              mov     qword [rsp+1440], rdi            ; load->v180
              mov     qword [rsp+1448], rsi            ; load->v181
              mov     qword [rsp+1456], rdx            ; load->v182
              mov     qword [rsp+1464], rcx            ; load->v183
              mov     qword [rsp+1472], r8             ; load->v184
              mov     qword [rsp+1480], r9             ; load->v185
              mov     r10            , qword [rsp+1488]; load->v186
              mov     qword [rsp+1496], r11            ; load->v187
              call    _text__println                  
              mov     qword [rsp+1504], rax            ; load->v188
_text__crackSHA1_saveReg9_load:
              mov     rax            , qword [rsp+1432]; load->v179
              mov     rdi            , qword [rsp+1440]; load->v180
              mov     rsi            , qword [rsp+1448]; load->v181
              mov     rdx            , qword [rsp+1456]; load->v182
              mov     rcx            , qword [rsp+1464]; load->v183
              mov     r8             , qword [rsp+1472]; load->v184
              mov     r9             , qword [rsp+1480]; load->v185
              mov     r10            , qword [rsp+1488]; load->v186
              mov     r11            , qword [rsp+1496]; load->v187
_text__crackSHA1_ret1:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 1736           
              ret                                     
;----------------------------------]
;[----------------------------------
              jmp     _text__crackSHA1_if1_end                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_if1_else:
_text__crackSHA1_if1_end:
_text__crackSHA1_if2_init:
              mov     r10            , qword [rsp+1512]; load->v189
              mov     r10            , [_data_bss_inputBuffer]
              mov     qword [rsp+1512], r10            ; save->v189
_text__crackSHA1_call9:
              mov     rdi            , qword [rsp+1512]; load->v189
              mov     rsi            , rbx            ; load->v113
_text__crackSHA1_saveReg10_save:
              mov     qword [rsp+1520], rax            ; load->v190
              mov     qword [rsp+1528], rdi            ; load->v191
              mov     qword [rsp+1536], rsi            ; load->v192
              mov     qword [rsp+1544], rdx            ; load->v193
              mov     qword [rsp+1552], rcx            ; load->v194
              mov     qword [rsp+1560], r8             ; load->v195
              mov     qword [rsp+1568], r9             ; load->v196
              mov     r10            , qword [rsp+1576]; load->v197
              mov     qword [rsp+1584], r11            ; load->v198
              call    _text__nextText                 
              mov     qword [rsp+1592], rax            ; load->v199
_text__crackSHA1_saveReg10_load:
              mov     rax            , qword [rsp+1520]; load->v190
              mov     rdi            , qword [rsp+1528]; load->v191
              mov     rsi            , qword [rsp+1536]; load->v192
              mov     rdx            , qword [rsp+1544]; load->v193
              mov     rcx            , qword [rsp+1552]; load->v194
              mov     r8             , qword [rsp+1560]; load->v195
              mov     r9             , qword [rsp+1568]; load->v196
              mov     r10            , qword [rsp+1576]; load->v197
              mov     r11            , qword [rsp+1584]; load->v198
              mov     r10            , qword [rsp+1600]; load->v200
              mov     r10            , qword [rsp+1592]; load->v199
              mov     qword [rsp+1600], r10            ; save->v200
              not     r10                             
              mov     qword [rsp+1600], r10            ; save->v200
              and     r10            , -1             
              mov     qword [rsp+1600], r10            ; save->v200
_text__crackSHA1_if2_check:
              mov     r10            , qword [rsp+1600]; load->v200
              cmp     r10b           , 0              
              mov     qword [rsp+1600], r10            ; save->v200
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
              mov     qword [rsp+1608], 255            ; load->v201
              mov     r10            , qword [rsp+1608]; load->v201
              cmp     r10b           , 0              
              mov     qword [rsp+1608], r10            ; save->v201
              jne     _text__crackSHA1_for4_start                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for4_end:
_text__crackSHA1_for2_continue:
              mov     r10            , qword [rsp+1616]; load->v202
              mov     qword [rsp+1616], rbx            ; load->v113
              mov     qword [rsp+1624], 1              ; load->v203
              mov     r10            , qword [rsp+1632]; load->v204
              mov     qword [rsp+1632], rbx            ; load->v113
              mov     r10            , qword [rsp+1632]; load->v204
              mov     r11            , qword [rsp+1624]; load->v203
              add     r10            , r11            
              mov     qword [rsp+1632], r10            ; save->v204
              mov     r10            , rbx            ; load->v113
              mov     rbx            , qword [rsp+1632]; load->v204
              mov     r10            , rbx            ; load->v113
              mov     r11            , qword [rsp+896]; load->v112
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v113
              mov     r10            , qword [rsp+1640]; load->v205
              setle   r10b                            
              mov     qword [rsp+1640], r10            ; save->v205
              and     r10            , 255            
              mov     qword [rsp+1640], r10            ; save->v205
              cmp     r10b           , 0              
              mov     qword [rsp+1640], r10            ; save->v205
              jne     _text__crackSHA1_for2_start                 
;----------------------------------]
;[----------------------------------
_text__crackSHA1_for2_end:
              mov     rbx            , _data_s6       ; load->v206
_text__crackSHA1_call10:
              mov     rdi            , rbx            ; load->v206
_text__crackSHA1_saveReg11_save:
              mov     qword [rsp+1656], rax            ; load->v207
              mov     qword [rsp+1664], rdi            ; load->v208
              mov     qword [rsp+1672], rsi            ; load->v209
              mov     qword [rsp+1680], rdx            ; load->v210
              mov     qword [rsp+1688], rcx            ; load->v211
              mov     qword [rsp+1696], r8             ; load->v212
              mov     qword [rsp+1704], r9             ; load->v213
              mov     r10            , qword [rsp+1712]; load->v214
              mov     qword [rsp+1720], r11            ; load->v215
              call    _text__println                  
              mov     rbx            , rax            ; load->v216
_text__crackSHA1_saveReg11_load:
              mov     rax            , qword [rsp+1656]; load->v207
              mov     rdi            , qword [rsp+1664]; load->v208
              mov     rsi            , qword [rsp+1672]; load->v209
              mov     rdx            , qword [rsp+1680]; load->v210
              mov     rcx            , qword [rsp+1688]; load->v211
              mov     r8             , qword [rsp+1696]; load->v212
              mov     r9             , qword [rsp+1704]; load->v213
              mov     r10            , qword [rsp+1712]; load->v214
              mov     r11            , qword [rsp+1720]; load->v215
_text__crackSHA1_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 1736           
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 536            
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
_text__main_for0_init:
              mov     r13            , 255            ; load->v8
_text__main_for0_init_check:
              mov     r10            , r13            ; load->v8
              cmp     r10b           , 0              
              mov     r13            , r10            ; save->v8
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
_text__main_call0:
_text__main_saveReg0_save:
              mov     qword [rsp+72] , rax            ; load->v9
              mov     qword [rsp+80] , rdi            ; load->v10
              mov     qword [rsp+88] , rsi            ; load->v11
              mov     qword [rsp+96] , rdx            ; load->v12
              mov     qword [rsp+104], rcx            ; load->v13
              mov     qword [rsp+112], r8             ; load->v14
              mov     qword [rsp+120], r9             ; load->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     qword [rsp+136], r11            ; load->v17
              call    _text__getInt                   
              mov     r14            , rax            ; load->v18
_text__main_saveReg0_load:
              mov     rax            , qword [rsp+72] ; load->v9
              mov     rdi            , qword [rsp+80] ; load->v10
              mov     rsi            , qword [rsp+88] ; load->v11
              mov     rdx            , qword [rsp+96] ; load->v12
              mov     rcx            , qword [rsp+104]; load->v13
              mov     r8             , qword [rsp+112]; load->v14
              mov     r9             , qword [rsp+120]; load->v15
              mov     r10            , qword [rsp+128]; load->v16
              mov     r11            , qword [rsp+136]; load->v17
              mov     r10            , rbx            ; load->v6
              mov     rbx            , r14            ; load->v18
_text__main_if0_init:
              mov     r15            , 0              ; load->v19
              mov     r10            , rbx            ; load->v6
              mov     r11            , r15            ; load->v19
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , qword [rsp+160]; load->v20
              sete    r10b                            
              mov     qword [rsp+160], r10            ; save->v20
              and     r10            , 255            
              mov     qword [rsp+160], r10            ; save->v20
_text__main_if0_check:
              mov     r10            , qword [rsp+160]; load->v20
              cmp     r10b           , 0              
              mov     qword [rsp+160], r10            ; save->v20
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
              mov     qword [rsp+168], 1              ; load->v21
              mov     r10            , rbx            ; load->v6
              mov     r11            , qword [rsp+168]; load->v21
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , qword [rsp+176]; load->v22
              sete    r10b                            
              mov     qword [rsp+176], r10            ; save->v22
              and     r10            , 255            
              mov     qword [rsp+176], r10            ; save->v22
_text__main_if1_check:
              mov     r10            , qword [rsp+176]; load->v22
              cmp     r10b           , 0              
              mov     qword [rsp+176], r10            ; save->v22
              je      _text__main_if1_else                 
;----------------------------------]
;[----------------------------------
_text__main_if1_start:
_text__main_call1:
_text__main_saveReg1_save:
              mov     qword [rsp+184], rax            ; load->v23
              mov     qword [rsp+192], rdi            ; load->v24
              mov     qword [rsp+200], rsi            ; load->v25
              mov     qword [rsp+208], rdx            ; load->v26
              mov     qword [rsp+216], rcx            ; load->v27
              mov     qword [rsp+224], r8             ; load->v28
              mov     qword [rsp+232], r9             ; load->v29
              mov     r10            , qword [rsp+240]; load->v30
              mov     qword [rsp+248], r11            ; load->v31
              call    _text__getString                 
              mov     qword [rsp+256], rax            ; load->v32
_text__main_saveReg1_load:
              mov     rax            , qword [rsp+184]; load->v23
              mov     rdi            , qword [rsp+192]; load->v24
              mov     rsi            , qword [rsp+200]; load->v25
              mov     rdx            , qword [rsp+208]; load->v26
              mov     rcx            , qword [rsp+216]; load->v27
              mov     r8             , qword [rsp+224]; load->v28
              mov     r9             , qword [rsp+232]; load->v29
              mov     r10            , qword [rsp+240]; load->v30
              mov     r11            , qword [rsp+248]; load->v31
              mov     r10            , r12            ; load->v7
              mov     r12            , qword [rsp+256]; load->v32
_text__main_call2:
              mov     rdi            , r12            ; load->v7
_text__main_saveReg2_save:
              mov     qword [rsp+264], rax            ; load->v33
              mov     qword [rsp+272], rdi            ; load->v34
              mov     qword [rsp+280], rsi            ; load->v35
              mov     qword [rsp+288], rdx            ; load->v36
              mov     qword [rsp+296], rcx            ; load->v37
              mov     qword [rsp+304], r8             ; load->v38
              mov     qword [rsp+312], r9             ; load->v39
              mov     r10            , qword [rsp+320]; load->v40
              mov     qword [rsp+328], r11            ; load->v41
              call    _text__computeSHA1                 
              mov     qword [rsp+336], rax            ; load->v42
_text__main_saveReg2_load:
              mov     rax            , qword [rsp+264]; load->v33
              mov     rdi            , qword [rsp+272]; load->v34
              mov     rsi            , qword [rsp+280]; load->v35
              mov     rdx            , qword [rsp+288]; load->v36
              mov     rcx            , qword [rsp+296]; load->v37
              mov     r8             , qword [rsp+304]; load->v38
              mov     r9             , qword [rsp+312]; load->v39
              mov     r10            , qword [rsp+320]; load->v40
              mov     r11            , qword [rsp+328]; load->v41
              jmp     _text__main_if1_end                 
;----------------------------------]
;[----------------------------------
_text__main_if1_else:
_text__main_if2_init:
              mov     qword [rsp+344], 2              ; load->v43
              mov     r10            , rbx            ; load->v6
              mov     r11            , qword [rsp+344]; load->v43
              cmp     r10d           , r11d           
              mov     rbx            , r10            ; save->v6
              mov     r10            , qword [rsp+352]; load->v44
              sete    r10b                            
              mov     qword [rsp+352], r10            ; save->v44
              and     r10            , 255            
              mov     qword [rsp+352], r10            ; save->v44
_text__main_if2_check:
              mov     r10            , qword [rsp+352]; load->v44
              cmp     r10b           , 0              
              mov     qword [rsp+352], r10            ; save->v44
              je      _text__main_if2_else                 
;----------------------------------]
;[----------------------------------
_text__main_if2_start:
_text__main_call3:
_text__main_saveReg3_save:
              mov     qword [rsp+360], rax            ; load->v45
              mov     qword [rsp+368], rdi            ; load->v46
              mov     qword [rsp+376], rsi            ; load->v47
              mov     qword [rsp+384], rdx            ; load->v48
              mov     qword [rsp+392], rcx            ; load->v49
              mov     qword [rsp+400], r8             ; load->v50
              mov     qword [rsp+408], r9             ; load->v51
              mov     r10            , qword [rsp+416]; load->v52
              mov     qword [rsp+424], r11            ; load->v53
              call    _text__getString                 
              mov     qword [rsp+432], rax            ; load->v54
_text__main_saveReg3_load:
              mov     rax            , qword [rsp+360]; load->v45
              mov     rdi            , qword [rsp+368]; load->v46
              mov     rsi            , qword [rsp+376]; load->v47
              mov     rdx            , qword [rsp+384]; load->v48
              mov     rcx            , qword [rsp+392]; load->v49
              mov     r8             , qword [rsp+400]; load->v50
              mov     r9             , qword [rsp+408]; load->v51
              mov     r10            , qword [rsp+416]; load->v52
              mov     r11            , qword [rsp+424]; load->v53
              mov     r10            , r12            ; load->v7
              mov     r12            , qword [rsp+432]; load->v54
_text__main_call4:
              mov     rdi            , r12            ; load->v7
_text__main_saveReg4_save:
              mov     qword [rsp+440], rax            ; load->v55
              mov     qword [rsp+448], rdi            ; load->v56
              mov     qword [rsp+456], rsi            ; load->v57
              mov     qword [rsp+464], rdx            ; load->v58
              mov     qword [rsp+472], rcx            ; load->v59
              mov     qword [rsp+480], r8             ; load->v60
              mov     qword [rsp+488], r9             ; load->v61
              mov     r10            , qword [rsp+496]; load->v62
              mov     qword [rsp+504], r11            ; load->v63
              call    _text__crackSHA1                 
              mov     qword [rsp+512], rax            ; load->v64
_text__main_saveReg4_load:
              mov     rax            , qword [rsp+440]; load->v55
              mov     rdi            , qword [rsp+448]; load->v56
              mov     rsi            , qword [rsp+456]; load->v57
              mov     rdx            , qword [rsp+464]; load->v58
              mov     rcx            , qword [rsp+472]; load->v59
              mov     r8             , qword [rsp+480]; load->v60
              mov     r9             , qword [rsp+488]; load->v61
              mov     r10            , qword [rsp+496]; load->v62
              mov     r11            , qword [rsp+504]; load->v63
              jmp     _text__main_if2_end                 
;----------------------------------]
;[----------------------------------
_text__main_if2_else:
_text__main_if2_end:
_text__main_if1_end:
_text__main_for0_continue:
              mov     qword [rsp+520], 255            ; load->v65
              mov     r10            , qword [rsp+520]; load->v65
              cmp     r10b           , 0              
              mov     qword [rsp+520], r10            ; save->v65
              jne     _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
              mov     rbx            , 0              ; load->v66
_text__main_ret0:
              mov     rax            , rbx            ; load->v66
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 536            
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
              add     rsp            , 536            
              ret                                     
;----------------------------------]
                                                      
