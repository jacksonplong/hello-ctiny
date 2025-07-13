#include <avr/io.h>
#include <util/delay.h>

#define STR(x) #x
#define XSTR(x) STR(x)

#ifndef F_CPU
#error "F_CPU is not defined! Delay functions won't work."
#endif

#pragma message XSTR(Compiling with 'F_CPU' = F_CPU)

void main(void) {
	DDRB |= (1 << PB0);
	PORTB |= (1 << PB0);
	while (1) {
		PORTB &= ~(1 << PB0);
		_delay_ms(500);
		PORTB |= (1 << PB0);
		_delay_ms(500);
	}
}
