		global		main		
		extern		strlen		
		extern		malloc		
		extern		strncpy		
		extern		strtol		
		extern		printf		
		extern		scanf		
		extern		sprintf		

		section		.data		
_data_s1:
		db		'%s\n', 0		
_data_s0:
		db		'%s', 0		

		section		.bss		
_data_bss_Wallace:
		resb		8		
_data_bss_w2:
		resb		8		

		section		.text		
_text_built_in_string_length:
		call		strlen		
		ret				
						
_text_built_in_string_substring:
		push		rbp		
		push		rbx		
		push		r12		
		mov		r12, rdi		
		mov		rbp, rdx		
		mov		rbx, rsi		
		sub		rbp, rbx		
		add		rbp, 1		
		mov		rdi, rbp		
		call		malloc		
		mov		rdi, rax		
		mov		rsi, r12		
		add		rsi, rbx		
		mov		rdx, rbp		
		mov		r12, rax		
		call		strncpy		
		add		[r12 + rbp], ' '		
		pop		r12		
		pop		rbx		
		pop		rbp		
		ret				
						
_text_built_in_string_parseInt:
		push		rbp		
		mov		rbp, rdi		
		mov		rdi, 8		
		call		malloc		
		mov		rdi, rbp		
		mov		rsi, rax		
		mov		rdx, 10		
		call		strtol		
		pop		rbp		
		ret				
						
_text_built_in_string_ord:
		mov		rax, [rdi + rsi]		
		ret				
						
_text_built_in_array_size:
		mov		rax, [rdi]		
		ret				
						
_text__printf:
		xor		rax, rax		
		call		printf		
		ret				
						
_text__getString:
_text__getString_format:
		db		'%s', 0		
		push		rbp		
		mov		rdi, 1024		
		call		malloc		
		mov		rbp, rax		
		mov		rdi, _text__getString_format		
		mov		rsi, rax		
		xor		rdx, rdx		
		call		scanf		
		mov		rax, rbp		
		pop		rbp		
		ret				
						
_text__getInt:
_text__getInt_format:
		db		'%lld', 0		
		push		rbp		
		mov		rdi, 8		
		call		malloc		
		mov		rbp, rax		
		mov		rdi, _text__getInt_format		
		mov		rsi, rax		
		xor		rdx, rdx		
		call		scanf		
		mov		rax, [rbp]		
		pop		rbp		
		ret				
						
_text__toString:
_text__toString_format:
		db		'%d', 0		
		push		rbp		
		mov		rdx, rdi		
		mov		rdi, 1024		
		call		malloc		
		mov		rbp, rax		
		mov		rdi, rax		
		mov		rsi, _text__toString_format		
		xor		rcx, rcx		
		call		sprintf		
		mov		rax, rbp		
		pop		rbp		
		ret				
						
; --- [_text__print] ---
_text__print:
		mov		v0, rdi		
		mov		v1, rbp		
		mov		v2, rbx		
		mov		v3, r12		
		mov		v4, r13		
		mov		v5, r14		
		mov		v6, r15		
		mov		v7, _data_s0		
_text__print_call0:
		mov		v8, rax		
		mov		v2, rbx		
		mov		v1, rbp		
		mov		v9, r10		
		mov		v10, r11		
		mov		v3, r12		
		mov		v4, r13		
		mov		v5, r14		
		mov		v6, r15		
		mov		rdi, v7		
		mov		rsi, v0		
		call		_text__printf		
		mov		v11, rax		
		mov		rax, v8		
		mov		rbx, v2		
		mov		rbp, v1		
		mov		r10, v9		
		mov		r11, v10		
		mov		r12, v3		
		mov		r13, v4		
		mov		r14, v5		
		mov		r15, v6		
_text__print_inexplicit_return_void:
		mov		rbp, v1		
		mov		rbx, v2		
		mov		r12, v3		
		mov		r13, v4		
		mov		r14, v5		
		mov		r15, v6		
		ret				
						
; --- [_text__println] ---
_text__println:
		mov		v0, rdi		
		mov		v1, rbp		
		mov		v2, rbx		
		mov		v3, r12		
		mov		v4, r13		
		mov		v5, r14		
		mov		v6, r15		
		mov		v7, _data_s1		
_text__println_call0:
		mov		v8, rax		
		mov		v2, rbx		
		mov		v1, rbp		
		mov		v9, r10		
		mov		v10, r11		
		mov		v3, r12		
		mov		v4, r13		
		mov		v5, r14		
		mov		v6, r15		
		mov		rdi, v7		
		mov		rsi, v0		
		call		_text__printf		
		mov		v11, rax		
		mov		rax, v8		
		mov		rbx, v2		
		mov		rbp, v1		
		mov		r10, v9		
		mov		r11, v10		
		mov		r12, v3		
		mov		r13, v4		
		mov		r14, v5		
		mov		r15, v6		
_text__println_inexplicit_return_void:
		mov		rbp, v1		
		mov		rbx, v2		
		mov		r12, v3		
		mov		r13, v4		
		mov		r14, v5		
		mov		r15, v6		
		ret				
						
; --- [_datainit] ---
_datainit:
		mov		v0, rbp		
		mov		v1, rbx		
		mov		v2, r12		
		mov		v3, r13		
		mov		v4, r14		
		mov		v5, r15		
		mov		v6, _data_Wallace		
		mov		v7, 1		
		mov		v8, 10		
_datainit_inexplicit_return_void:
		mov		rbp, v0		
		mov		rbx, v1		
		mov		r12, v2		
		mov		r13, v3		
		mov		r14, v4		
		mov		r15, v5		
		ret				
						
; --- [_text_sometimes_make_money] ---
_text_sometimes_make_money:
		mov		v0, rbp		
		mov		v1, rbx		
		mov		v2, r12		
		mov		v3, r13		
		mov		v4, r14		
		mov		v5, r15		
_text_sometimes_make_money_inexplicit_return_void:
		mov		rbp, v0		
		mov		rbx, v1		
		mov		r12, v2		
		mov		r13, v3		
		mov		r14, v4		
		mov		r15, v5		
		ret				
						
; --- [_text__main] ---
_text__main:
_text__main_built_in_call_data_init:
		call		_datainit		; protocol required, built_in
		mov		v0, rbp		
		mov		v1, rbx		
		mov		v2, r12		
		mov		v3, r13		
		mov		v4, r14		
		mov		v5, r15		
		mov		v6, 0		
_text__main_call0:
		mov		v7, rax		
		mov		v1, rbx		
		mov		v0, rbp		
		mov		v8, r10		
		mov		v9, r11		
		mov		v2, r12		
		mov		v3, r13		
		mov		v4, r14		
		mov		v5, r15		
		call		_text__getInt		
		mov		v10, rax		
		mov		rax, v7		
		mov		rbx, v1		
		mov		rbp, v0		
		mov		r10, v8		
		mov		r11, v9		
		mov		r12, v2		
		mov		r13, v3		
		mov		r14, v4		
		mov		r15, v5		
		mov		v11, _data_Wallace		
_text__main_call1:
		mov		v7, rax		
		mov		v1, rbx		
		mov		v0, rbp		
		mov		v8, r10		
		mov		v9, r11		
		mov		v2, r12		
		mov		v3, r13		
		mov		v4, r14		
		mov		v5, r15		
		call		_text_sometimes_make_money		
		mov		v12, rax		
		mov		rax, v7		
		mov		rbx, v1		
		mov		rbp, v0		
		mov		r10, v8		
		mov		r11, v9		
		mov		r12, v2		
		mov		r13, v3		
		mov		r14, v4		
		mov		r15, v5		
		mov		v6, 0		
_text__main_ret0:
		mov		rax, v6		
		mov		rbp, v0		
		mov		rbx, v1		
		mov		r12, v2		
		mov		r13, v3		
		mov		r14, v4		
		mov		r15, v5		
		ret				
_text__main_inexplicit_return_void:
		mov		rbp, v0		
		mov		rbx, v1		
		mov		r12, v2		
		mov		r13, v3		
		mov		r14, v4		
		mov		r15, v5		
		ret				
						
