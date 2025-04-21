`include "connect4_tipos.sv"

module connect4_fsm(
	input clk, rst, inicio_juego, num_jugador,
	input tablero_J1, t_J1, valido_J1, is_ganador_J1,
	input tablero_J2, t_J2, valido_J2, is_ganador_J2,
	output logic [5:0][6:0] board);
	

	import connect4_tipos::*;
	logic [4:0] state, next_state;

//actual state

always_ff @(posedge clk or posedge rst)
	if (rst) state = INICIO;
	else
		state = next_state;


always_comb
	case(state)
	INICIO: next_state = MENU;
	MENU: next_state = inicio_juego? JUGADOR_INICIAL : MENU;
	JUGADOR_INICIAL: next_state = num_jugador? TURNO_J1 : TURNO_J2;
	TURNO_J1: next_state = tablero_J1? VERIFICAR_J1 : TURNO_J1;
//	TURNO_J1: begin
//		if (t_J1 >= 10) begin
//			next_state = RANDOM_J1;
//		end else
//			next_state = TURNO_J1;
//		end
	VERIFICAR_J1: next_state = valido_J1? GANADOR_J1 : TURNO_J1;
	GANADOR_J1: next_state = is_ganador_J1? FIN_JUEGO : TURNO_J2;
	TURNO_J2: next_state = tablero_J1? VERIFICAR_J2 : TURNO_J2;
//	TURNO_J2: begin
//		if (t_J2 >= 10) begin
//			next_state = RANDOM_J2;
//		end else
//			next_state = TURNO_J2;
//		end
	VERIFICAR_J2: next_state = valido_J1? GANADOR_J2 : TURNO_J2;
	GANADOR_J2: next_state = is_ganador_J1? FIN_JUEGO : TURNO_J1;
	default: next_state = INICIO;
	endcase

	
endmodule