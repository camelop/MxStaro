		global		main		
		extern		strlen		
		extern		malloc		
		extern		strncpy		
		extern		strtol		
		extern		printf		
		extern		scanf		
		extern		sprintf		

		section		.data		

		section		.bss		
_data_bss_a:
		resb		8		
_data_bss_b:
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
_datainit_inexplicit_return_void:
		mov		rbp, v0		
		mov		rbx, v1		
		mov		r12, v2		
		mov		r13, v3		
		mov		r14, v4		
		mov		r15, v5		
		ret				
						
; --- [_text__init] ---
_text__init:
		mov		v0, rdi		
		mov		v1, rsi		
		mov		v2, rbp		
		mov		v3, rbx		
		mov		v4, r12		
		mov		v5, r13		
		mov		v6, r14		
		mov		v7, r15		
		mov		v8, v0		
		add		v8, v1		
_text__init_ret0:
		mov		rax, v8		
		mov		rbp, v2		
		mov		rbx, v3		
		mov		r12, v4		
		mov		r13, v5		
		mov		r14, v6		
		mov		r15, v7		
		ret				
_text__init_inexplicit_return_void:
		mov		rbp, v2		
		mov		rbx, v3		
		mov		r12, v4		
		mov		r13, v5		
		mov		r14, v6		
		mov		r15, v7		
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
		mov		v6, _data_b		
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
						
