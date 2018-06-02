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
_data_s4:
              db      `tpa`                           
              db      0                               
_data_s2:
              db      `via `                          
              db      0                               
_data_s5:
              db      `ha `                           
              db      0                               
_data_s6:
              db      `tpa2`                          
              db      0                               
_data_s3:
              db      `gzo`                           
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
              sub     rsp            , 56             
;----------------------------------]
;[----------------------------------
              mov     qword [rsp]    , rbp            ; load->v0
              mov     qword [rsp+8]  , rbx            ; load->v1
              mov     qword [rsp+16] , r12            ; load->v2
              mov     qword [rsp+24] , r13            ; load->v3
              mov     qword [rsp+32] , r14            ; load->v4
              mov     qword [rsp+40] , r15            ; load->v5
_datainit_inexplicit_return_void:
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 56             
              ret                                     
;----------------------------------]
                                                      
; --- [ _text__main ] ---
;[----------------------------------
main:
              sub     rsp            , 1272           
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
              mov     qword [rsp+504], _data_s2       ; load->v63
              mov     qword [rsp+512], _data_s3       ; load->v64
_text__main_saveReg5_save:
              mov     qword [rsp+520], rax            ; load->v65
              mov     qword [rsp+528], rdi            ; load->v66
              mov     qword [rsp+536], rsi            ; load->v67
              mov     qword [rsp+544], rdx            ; load->v68
              mov     qword [rsp+552], rcx            ; load->v69
              mov     qword [rsp+560], r8             ; load->v70
              mov     qword [rsp+568], r9             ; load->v71
              mov     r10            , qword [rsp+576]; load->v72
              mov     qword [rsp+584], r11            ; load->v73
              mov     rdi            , qword [rsp+504]; load->v63
              call    strlen                          
              mov     qword [rsp+592], rax            ; load->v74
              mov     rdi            , qword [rsp+512]; load->v64
              call    strlen                          
              mov     qword [rsp+600], rax            ; load->v75
              mov     r10            , qword [rsp+600]; load->v75
              mov     r11            , qword [rsp+592]; load->v74
              add     r10            , r11            
              mov     qword [rsp+600], r10            ; save->v75
              add     r10            , 1              
              mov     qword [rsp+600], r10            ; save->v75
              mov     rdi            , qword [rsp+600]; load->v75
              call    malloc                          
              mov     qword [rsp+608], rax            ; load->v76
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+504]; load->v63
              call    strcpy                          
              mov     rdi            , qword [rsp+608]; load->v76
              mov     r11            , qword [rsp+592]; load->v74
              add     rdi            , r11            
              mov     rsi            , qword [rsp+512]; load->v64
              call    strcpy                          
_text__main_saveReg5_load:
              mov     rax            , qword [rsp+520]; load->v65
              mov     rdi            , qword [rsp+528]; load->v66
              mov     rsi            , qword [rsp+536]; load->v67
              mov     rdx            , qword [rsp+544]; load->v68
              mov     rcx            , qword [rsp+552]; load->v69
              mov     r8             , qword [rsp+560]; load->v70
              mov     r9             , qword [rsp+568]; load->v71
              mov     r10            , qword [rsp+576]; load->v72
              mov     r11            , qword [rsp+584]; load->v73
              mov     qword [rsp+616], _data_s4       ; load->v77
_text__main_saveReg6_save:
              mov     qword [rsp+624], rax            ; load->v78
              mov     qword [rsp+632], rdi            ; load->v79
              mov     qword [rsp+640], rsi            ; load->v80
              mov     qword [rsp+648], rdx            ; load->v81
              mov     qword [rsp+656], rcx            ; load->v82
              mov     qword [rsp+664], r8             ; load->v83
              mov     qword [rsp+672], r9             ; load->v84
              mov     r10            , qword [rsp+680]; load->v85
              mov     qword [rsp+688], r11            ; load->v86
              mov     rdi            , qword [rsp+608]; load->v76
              call    strlen                          
              mov     qword [rsp+696], rax            ; load->v87
              mov     rdi            , qword [rsp+616]; load->v77
              call    strlen                          
              mov     qword [rsp+704], rax            ; load->v88
              mov     r10            , qword [rsp+704]; load->v88
              mov     r11            , qword [rsp+696]; load->v87
              add     r10            , r11            
              mov     qword [rsp+704], r10            ; save->v88
              add     r10            , 1              
              mov     qword [rsp+704], r10            ; save->v88
              mov     rdi            , qword [rsp+704]; load->v88
              call    malloc                          
              mov     qword [rsp+712], rax            ; load->v89
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+608]; load->v76
              call    strcpy                          
              mov     rdi            , qword [rsp+712]; load->v89
              mov     r11            , qword [rsp+696]; load->v87
              add     rdi            , r11            
              mov     rsi            , qword [rsp+616]; load->v77
              call    strcpy                          
_text__main_saveReg6_load:
              mov     rax            , qword [rsp+624]; load->v78
              mov     rdi            , qword [rsp+632]; load->v79
              mov     rsi            , qword [rsp+640]; load->v80
              mov     rdx            , qword [rsp+648]; load->v81
              mov     rcx            , qword [rsp+656]; load->v82
              mov     r8             , qword [rsp+664]; load->v83
              mov     r9             , qword [rsp+672]; load->v84
              mov     r10            , qword [rsp+680]; load->v85
              mov     r11            , qword [rsp+688]; load->v86
_text__main_call4:
              mov     rdi            , qword [rsp+712]; load->v89
_text__main_saveReg7_save:
              mov     qword [rsp+720], rax            ; load->v90
              mov     qword [rsp+728], rdi            ; load->v91
              mov     qword [rsp+736], rsi            ; load->v92
              mov     qword [rsp+744], rdx            ; load->v93
              mov     qword [rsp+752], rcx            ; load->v94
              mov     qword [rsp+760], r8             ; load->v95
              mov     qword [rsp+768], r9             ; load->v96
              mov     r10            , qword [rsp+776]; load->v97
              mov     qword [rsp+784], r11            ; load->v98
              call    _text__print                    
              mov     rbx            , rax            ; load->v99
_text__main_saveReg7_load:
              mov     rax            , qword [rsp+720]; load->v90
              mov     rdi            , qword [rsp+728]; load->v91
              mov     rsi            , qword [rsp+736]; load->v92
              mov     rdx            , qword [rsp+744]; load->v93
              mov     rcx            , qword [rsp+752]; load->v94
              mov     r8             , qword [rsp+760]; load->v95
              mov     r9             , qword [rsp+768]; load->v96
              mov     r10            , qword [rsp+776]; load->v97
              mov     r11            , qword [rsp+784]; load->v98
              mov     qword [rsp+976], _data_s5       ; load->v122
              mov     qword [rsp+984], _data_s3       ; load->v123
_text__main_saveReg10_save:
              mov     qword [rsp+992], rax            ; load->v124
              mov     qword [rsp+1000], rdi            ; load->v125
              mov     qword [rsp+1008], rsi            ; load->v126
              mov     qword [rsp+1016], rdx            ; load->v127
              mov     qword [rsp+1024], rcx            ; load->v128
              mov     qword [rsp+1032], r8             ; load->v129
              mov     qword [rsp+1040], r9             ; load->v130
              mov     r10            , qword [rsp+1048]; load->v131
              mov     qword [rsp+1056], r11            ; load->v132
              mov     rdi            , qword [rsp+976]; load->v122
              call    strlen                          
              mov     qword [rsp+1064], rax            ; load->v133
              mov     rdi            , qword [rsp+984]; load->v123
              call    strlen                          
              mov     qword [rsp+1072], rax            ; load->v134
              mov     r10            , qword [rsp+1072]; load->v134
              mov     r11            , qword [rsp+1064]; load->v133
              add     r10            , r11            
              mov     qword [rsp+1072], r10            ; save->v134
              add     r10            , 1              
              mov     qword [rsp+1072], r10            ; save->v134
              mov     rdi            , qword [rsp+1072]; load->v134
              call    malloc                          
              mov     qword [rsp+1080], rax            ; load->v135
              mov     rdi            , rax            
              mov     rsi            , qword [rsp+976]; load->v122
              call    strcpy                          
              mov     rdi            , qword [rsp+1080]; load->v135
              mov     r11            , qword [rsp+1064]; load->v133
              add     rdi            , r11            
              mov     rsi            , qword [rsp+984]; load->v123
              call    strcpy                          
_text__main_saveReg10_load:
              mov     rax            , qword [rsp+992]; load->v124
              mov     rdi            , qword [rsp+1000]; load->v125
              mov     rsi            , qword [rsp+1008]; load->v126
              mov     rdx            , qword [rsp+1016]; load->v127
              mov     rcx            , qword [rsp+1024]; load->v128
              mov     r8             , qword [rsp+1032]; load->v129
              mov     r9             , qword [rsp+1040]; load->v130
              mov     r10            , qword [rsp+1048]; load->v131
              mov     r11            , qword [rsp+1056]; load->v132
_text__main_call7:
              mov     rdi            , qword [rsp+1080]; load->v135
_text__main_saveReg11_save:
              mov     qword [rsp+1088], rax            ; load->v136
              mov     qword [rsp+1096], rdi            ; load->v137
              mov     qword [rsp+1104], rsi            ; load->v138
              mov     qword [rsp+1112], rdx            ; load->v139
              mov     qword [rsp+1120], rcx            ; load->v140
              mov     qword [rsp+1128], r8             ; load->v141
              mov     qword [rsp+1136], r9             ; load->v142
              mov     r10            , qword [rsp+1144]; load->v143
              mov     qword [rsp+1152], r11            ; load->v144
              call    _text__print                    
              mov     rbx            , rax            ; load->v145
_text__main_saveReg11_load:
              mov     rax            , qword [rsp+1088]; load->v136
              mov     rdi            , qword [rsp+1096]; load->v137
              mov     rsi            , qword [rsp+1104]; load->v138
              mov     rdx            , qword [rsp+1112]; load->v139
              mov     rcx            , qword [rsp+1120]; load->v140
              mov     r8             , qword [rsp+1128]; load->v141
              mov     r9             , qword [rsp+1136]; load->v142
              mov     r10            , qword [rsp+1144]; load->v143
              mov     r11            , qword [rsp+1152]; load->v144
              mov     rbx            , _data_s6       ; load->v146
_text__main_call8:
              mov     rdi            , rbx            ; load->v146
_text__main_saveReg12_save:
              mov     qword [rsp+1176], rax            ; load->v147
              mov     qword [rsp+1184], rdi            ; load->v148
              mov     qword [rsp+1192], rsi            ; load->v149
              mov     qword [rsp+1200], rdx            ; load->v150
              mov     qword [rsp+1208], rcx            ; load->v151
              mov     qword [rsp+1216], r8             ; load->v152
              mov     qword [rsp+1224], r9             ; load->v153
              mov     r10            , qword [rsp+1232]; load->v154
              mov     qword [rsp+1240], r11            ; load->v155
              call    _text__println                  
              mov     rbx            , rax            ; load->v156
_text__main_saveReg12_load:
              mov     rax            , qword [rsp+1176]; load->v147
              mov     rdi            , qword [rsp+1184]; load->v148
              mov     rsi            , qword [rsp+1192]; load->v149
              mov     rdx            , qword [rsp+1200]; load->v150
              mov     rcx            , qword [rsp+1208]; load->v151
              mov     r8             , qword [rsp+1216]; load->v152
              mov     r9             , qword [rsp+1224]; load->v153
              mov     r10            , qword [rsp+1232]; load->v154
              mov     r11            , qword [rsp+1240]; load->v155
              mov     rbx            , 123            ; load->v157
_text__main_ret0:
              mov     rax            , rbx            ; load->v157
              mov     rbp            , qword [rsp]    ; load->v0
              mov     rbx            , qword [rsp+8]  ; load->v1
              mov     r12            , qword [rsp+16] ; load->v2
              mov     r13            , qword [rsp+24] ; load->v3
              mov     r14            , qword [rsp+32] ; load->v4
              mov     r15            , qword [rsp+40] ; load->v5
              add     rsp            , 1272           
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
              add     rsp            , 1272           
              ret                                     
;----------------------------------]
                                                      
