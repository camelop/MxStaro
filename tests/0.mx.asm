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
              db      ` `                             
              db      0                               
_data_s1:
              db      `%s\n`                          
              db      0                               
_data_s2:
              db      `p cnf `                        
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
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     rbp            , rdi            ; load->v6; null; save->v6
              mov     rbx            , _data_s0       ; load->v7; null; save->v7
_text__print_call0:
              mov     rdi            , rbx            ; load->v7; null
              mov     rsi            , rbp            ; load->v6; null
              call    _text__printf                   
              mov     rbp            , rax            ; load->v8; null; save->v8
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
              mov     qword [rsp]    , rbp            ; load->v0; null; save->v0
              mov     qword [rsp+8]  , rbx            ; load->v1; null; save->v1
              mov     rbp            , rdi            ; load->v6; null; save->v6
              mov     rbx            , _data_s1       ; load->v7; null; save->v7
_text__println_call0:
              mov     rdi            , rbx            ; load->v7; null
              mov     rsi            , rbp            ; load->v6; null
              call    _text__printf                   
              mov     rbp            , rax            ; load->v8; null; save->v8
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
_datainit_inexplicit_return_void:
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 424            
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
_text__main_call0:
              call    _text__getInt                   
              mov     rbp            , rax            ; load->v7; null; save->v7
              mov     r10            , rbx            ; load->v6
              mov     rbx            , rbp            ; load->v7; assign->k; save->v6
              mov     rbp            , _data_s2       ; load->v8; null; save->v8
_text__main_call1:
              mov     rdi            , rbp            ; load->v8; null
              call    _text__print                    
              mov     rbp            , 2              ; load->v9; null; save->v9; load->v18; null; save->v18
              mov     r10            , r12            ; load->v19
              mov     r12            , rbx            ; load->v6; null; save->v19
              mov     r10            , r12            ; load->v19
              mov     r11            , rbp            ; load->v18
              imul    r10            , r11            
              mov     r12            , r10            ; save->v19; load->v19
              and     r10            , -1             
              mov     r12            , r10            ; save->v19
              mov     rbp            , 1              ; load->v20; null; save->v20
              mov     r10            , r13            ; load->v21
              mov     r13            , r12            ; load->v19; null; save->v21
              mov     r10            , r13            ; load->v21
              mov     r11            , rbp            ; load->v20
              add     r10            , r11            
              mov     r13            , r10            ; save->v21
_text__main_call5:
              mov     rdi            , r13            ; load->v21; null
              call    _text__toString                 
              mov     qword [rsp+112], rax            ; load->v22; null; save->v22
              mov     qword [rsp+120], _data_s3       ; load->v23; null; save->v23
              mov     rdi            , qword [rsp+112]; load->v22; null
              call    strlen                          
              mov     qword [rsp+128], rax            ; load->v24; null; save->v24
              mov     rdi            , qword [rsp+120]; load->v23; null
              call    strlen                          
              mov     qword [rsp+136], rax            ; load->v25; null; save->v25
              mov     r10            , qword [rsp+136]; load->v25
              mov     r11            , qword [rsp+128]; load->v24
              add     r10            , r11            
              mov     qword [rsp+136], r10            ; save->v25; load->v25
              add     r10            , 1              
              mov     qword [rsp+136], r10            ; save->v25
              mov     rdi            , qword [rsp+136]; load->v25; null
              call    malloc                          
              mov     qword [rsp+144], rax            ; load->v26; null; save->v26
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+112]; load->v22; null
              call    strcpy                          
              mov     rdi            , qword [rsp+144]; load->v26; null
              mov     r11            , qword [rsp+128]; load->v24
              add     rdi            , r11            
              mov     rsi            , qword [rsp+120]; load->v23; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
_text__main_call6:
              mov     rdi            , qword [rsp+144]; load->v26; null
              call    _text__print                    
              mov     rbp            , rax            ; load->v27; null; save->v27
_text__main_call7:
              mov     rdi            , rbx            ; load->v6; null
              call    _text__toString                 
              mov     rbp            , rax            ; load->v28; null; save->v28
_text__main_call8:
              mov     rdi            , rbp            ; load->v28; null
              call    _text__println                  
              mov     rbp            , 1              ; load->v29; null; save->v29; load->v32; null; save->v32
              mov     r10            , r12            ; load->v31
              mov     r12            , rbp            ; load->v32; assign->last; save->v31
_text__main_for0_init:
              mov     r14            , 0              ; load->v34; null; save->v34
              mov     r10            , rbp            ; load->v30
              mov     rbp            , r14            ; load->v34; assign->i; save->v30
              mov     r10            , rbp            ; load->v30
              mov     r11            , rbx            ; load->v6
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v30
              mov     r10            , r15            ; load->v35
              setl    r10b                            
              mov     r15            , r10            ; save->v35; load->v35
              and     r10            , 255            
              mov     r15            , r10            ; save->v35
_text__main_for0_init_check:
              mov     r10            , r15            ; load->v35
              cmp     r10b           , 0              
              mov     r15            , r10            ; save->v35
              je      _text__main_for0_end                 
;----------------------------------]
;[----------------------------------
_text__main_for0_start:
_text__main_call9:
              mov     rdi            , r12            ; load->v31; null
              call    _text__toString                 
              mov     qword [rsp+152], rax            ; load->v36; null; save->v36
              mov     qword [rsp+160], _data_s3       ; load->v37; null; save->v37
              mov     rdi            , qword [rsp+152]; load->v36; null
              call    strlen                          
              mov     qword [rsp+168], rax            ; load->v38; null; save->v38
              mov     rdi            , qword [rsp+160]; load->v37; null
              call    strlen                          
              mov     qword [rsp+176], rax            ; load->v39; null; save->v39
              mov     r10            , qword [rsp+176]; load->v39
              mov     r11            , qword [rsp+168]; load->v38
              add     r10            , r11            
              mov     qword [rsp+176], r10            ; save->v39; load->v39
              add     r10            , 1              
              mov     qword [rsp+176], r10            ; save->v39
              mov     rdi            , qword [rsp+176]; load->v39; null
              call    malloc                          
              mov     qword [rsp+184], rax            ; load->v40; null; save->v40
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+152]; load->v36; null
              call    strcpy                          
              mov     rdi            , qword [rsp+184]; load->v40; null
              mov     r11            , qword [rsp+168]; load->v38
              add     rdi            , r11            
              mov     rsi            , qword [rsp+160]; load->v37; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
              mov     qword [rsp+192], 1              ; load->v41; null; save->v41
              mov     r10            , qword [rsp+200]; load->v42
              mov     qword [rsp+200], r12            ; load->v31; null; save->v42
              mov     r10            , qword [rsp+200]; load->v42
              mov     r11            , qword [rsp+192]; load->v41
              add     r10            , r11            
              mov     qword [rsp+200], r10            ; save->v42
_text__main_call10:
              mov     rdi            , qword [rsp+200]; load->v42; null
              call    _text__toString                 
              mov     qword [rsp+208], rax            ; load->v43; null; save->v43
              mov     rdi            , qword [rsp+184]; load->v40; null
              call    strlen                          
              mov     qword [rsp+216], rax            ; load->v44; null; save->v44
              mov     rdi            , qword [rsp+208]; load->v43; null
              call    strlen                          
              mov     qword [rsp+224], rax            ; load->v45; null; save->v45
              mov     r10            , qword [rsp+224]; load->v45
              mov     r11            , qword [rsp+216]; load->v44
              add     r10            , r11            
              mov     qword [rsp+224], r10            ; save->v45; load->v45
              add     r10            , 1              
              mov     qword [rsp+224], r10            ; save->v45
              mov     rdi            , qword [rsp+224]; load->v45; null
              call    malloc                          
              mov     qword [rsp+232], rax            ; load->v46; null; save->v46
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+184]; load->v40; null
              call    strcpy                          
              mov     rdi            , qword [rsp+232]; load->v46; null
              mov     r11            , qword [rsp+216]; load->v44
              add     rdi            , r11            
              mov     rsi            , qword [rsp+208]; load->v43; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
              mov     qword [rsp+240], _data_s3       ; load->v47; null; save->v47
              mov     rdi            , qword [rsp+232]; load->v46; null
              call    strlen                          
              mov     qword [rsp+248], rax            ; load->v48; null; save->v48
              mov     rdi            , qword [rsp+240]; load->v47; null
              call    strlen                          
              mov     qword [rsp+256], rax            ; load->v49; null; save->v49
              mov     r10            , qword [rsp+256]; load->v49
              mov     r11            , qword [rsp+248]; load->v48
              add     r10            , r11            
              mov     qword [rsp+256], r10            ; save->v49; load->v49
              add     r10            , 1              
              mov     qword [rsp+256], r10            ; save->v49
              mov     rdi            , qword [rsp+256]; load->v49; null
              call    malloc                          
              mov     qword [rsp+264], rax            ; load->v50; null; save->v50
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+232]; load->v46; null
              call    strcpy                          
              mov     rdi            , qword [rsp+264]; load->v50; null
              mov     r11            , qword [rsp+248]; load->v48
              add     rdi            , r11            
              mov     rsi            , qword [rsp+240]; load->v47; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
              mov     qword [rsp+272], 2              ; load->v51; null; save->v51
              mov     r10            , qword [rsp+280]; load->v52
              mov     qword [rsp+280], r12            ; load->v31; null; save->v52
              mov     r10            , qword [rsp+280]; load->v52
              mov     r11            , qword [rsp+272]; load->v51
              add     r10            , r11            
              mov     qword [rsp+280], r10            ; save->v52
              mov     r10            , qword [rsp+288]; load->v53
              mov     r10            , qword [rsp+280]; load->v52; null
              mov     qword [rsp+288], r10            ; save->v53; load->v53
              neg     r10                             
              mov     qword [rsp+288], r10            ; save->v53
_text__main_call11:
              mov     rdi            , qword [rsp+288]; load->v53; null
              call    _text__toString                 
              mov     qword [rsp+296], rax            ; load->v54; null; save->v54
              mov     rdi            , qword [rsp+264]; load->v50; null
              call    strlen                          
              mov     qword [rsp+304], rax            ; load->v55; null; save->v55
              mov     rdi            , qword [rsp+296]; load->v54; null
              call    strlen                          
              mov     qword [rsp+312], rax            ; load->v56; null; save->v56
              mov     r10            , qword [rsp+312]; load->v56
              mov     r11            , qword [rsp+304]; load->v55
              add     r10            , r11            
              mov     qword [rsp+312], r10            ; save->v56; load->v56
              add     r10            , 1              
              mov     qword [rsp+312], r10            ; save->v56
              mov     rdi            , qword [rsp+312]; load->v56; null
              call    malloc                          
              mov     qword [rsp+320], rax            ; load->v57; null; save->v57
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+264]; load->v50; null
              call    strcpy                          
              mov     rdi            , qword [rsp+320]; load->v57; null
              mov     r11            , qword [rsp+304]; load->v55
              add     rdi            , r11            
              mov     rsi            , qword [rsp+296]; load->v54; null
              call    strcpy                          
;----------------------------------]
;[----------------------------------
              mov     r10            , r13            ; load->v33
              mov     r13            , qword [rsp+320]; load->v57; assign->t; save->v33
_text__main_if0_init:
              mov     qword [rsp+328], 100000         ; load->v58; null; save->v58
              mov     qword [rsp+344], rdx            ; load->v60; null; save->v60
              mov     qword [rsp+352], rax            ; load->v61; null; save->v61
              mov     rax            , rbp            ; load->v30; null
              and     rax            , -1             
              mov     r10            , qword [rsp+328]; load->v58
              and     r10d           , -1             
              mov     qword [rsp+328], r10            ; save->v58
              cqo                                     
              mov     r10            , qword [rsp+328]; load->v58
              idiv    r10d                            
              mov     qword [rsp+328], r10            ; save->v58
              mov     qword [rsp+336], rdx            ; load->v59; null; save->v59
              mov     rdx            , qword [rsp+344]; load->v60; null
              mov     rax            , qword [rsp+352]; load->v61; null
              mov     qword [rsp+360], 0              ; load->v62; null; save->v62
              mov     r10            , qword [rsp+336]; load->v59
              mov     r11            , qword [rsp+360]; load->v62
              cmp     r10d           , r11d           
              mov     qword [rsp+336], r10            ; save->v59
              mov     r10            , qword [rsp+368]; load->v63
              sete    r10b                            
              mov     qword [rsp+368], r10            ; save->v63; load->v63
              and     r10            , 255            
              mov     qword [rsp+368], r10            ; save->v63
_text__main_if0_check:
              mov     r10            , qword [rsp+368]; load->v63
              cmp     r10b           , 0              
              mov     qword [rsp+368], r10            ; save->v63
              je      _text__main_if0_else                 
;----------------------------------]
;[----------------------------------
_text__main_if0_start:
_text__main_call12:
              mov     rdi            , r13            ; load->v33; null
              call    _text__println                  
              mov     qword [rsp+376], rax            ; load->v64; null; save->v64
              jmp     _text__main_if0_end                 
;----------------------------------]
;[----------------------------------
_text__main_if0_else:
_text__main_if0_end:
              mov     qword [rsp+384], 2              ; load->v65; null; save->v65
              mov     r10            , qword [rsp+392]; load->v66
              mov     qword [rsp+392], r12            ; load->v31; null; save->v66
              mov     r10            , qword [rsp+392]; load->v66
              mov     r11            , qword [rsp+384]; load->v65
              add     r10            , r11            
              mov     qword [rsp+392], r10            ; save->v66
              mov     r10            , r12            ; load->v31
              mov     r12            , qword [rsp+392]; load->v66; assign->last; save->v31
_text__main_for0_continue:
              mov     qword [rsp+400], 1              ; load->v67; null; save->v67
              mov     r10            , qword [rsp+408]; load->v68
              mov     qword [rsp+408], rbp            ; load->v30; null; save->v68
              mov     r10            , qword [rsp+408]; load->v68
              mov     r11            , qword [rsp+400]; load->v67
              add     r10            , r11            
              mov     qword [rsp+408], r10            ; save->v68
              mov     r10            , rbp            ; load->v30
              mov     rbp            , qword [rsp+408]; load->v68; assign->i; save->v30
              mov     r10            , rbp            ; load->v30
              mov     r11            , rbx            ; load->v6
              cmp     r10d           , r11d           
              mov     rbp            , r10            ; save->v30
              jl      _text__main_for0_start                 
;----------------------------------]
;[----------------------------------
_text__main_for0_end:
              mov     rbp            , 0              ; load->v69; null; save->v69
_text__main_ret0:
              mov     rax            , rbp            ; load->v69; null
              mov     rbp            , qword [rsp]    ; load->v0; null
              mov     rbx            , qword [rsp+8]  ; load->v1; null
              mov     r12            , qword [rsp+16] ; load->v2; null
              mov     r13            , qword [rsp+24] ; load->v3; null
              mov     r14            , qword [rsp+32] ; load->v4; null
              mov     r15            , qword [rsp+40] ; load->v5; null
              add     rsp            , 424            
              ret                                     
;----------------------------------]
                                                      
