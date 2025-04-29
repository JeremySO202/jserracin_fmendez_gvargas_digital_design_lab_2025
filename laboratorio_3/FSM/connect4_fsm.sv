`include "connect4_tipos.sv"

module connect4_fsm(
	input clk, rst, inicio_juego, num_jugador,
	input tablero_J1, t_J1, valido_J1, gano_J1, tiempo_terminado_J1, random_valido_J1,
	input tablero_J2, t_J2, valido_J2, gano_J2, tiempo_terminado_J2, random_valido_J2,
	input volver_inicio);
	

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
	TURNO_J1: next_state = tablero_J1? VERIFICAR_J1 : TIEMPO_J1;
	TIEMPO_J1: next_state = tiempo_terminado_J1? RANDOM_J1 : TURNO_J1;
	RANDOM_J1: next_state = random_valido_J1? GANADOR_J1 : RANDOM_J1;
	VERIFICAR_J1: next_state = valido_J1? GANADOR_J1 : TURNO_J1;
	GANADOR_J1: next_state = gano_J1? FIN_JUEGO : TURNO_J2;
	TURNO_J2: next_state = tablero_J2? VERIFICAR_J2 : TIEMPO_J2;
	TIEMPO_J2: next_state = tiempo_terminado_J2? RANDOM_J2 : TURNO_J2;
	RANDOM_J2: next_state = random_valido_J2? GANADOR_J2 : RANDOM_J2;
	VERIFICAR_J2: next_state = valido_J2? GANADOR_J2 : TURNO_J2;
	GANADOR_J2: next_state = gano_J2? FIN_JUEGO : TURNO_J1;
	FIN_JUEGO: next_state = volver_inicio? INICIO : FIN_JUEGO;
	default: next_state = INICIO;
	endcase

	
endmodule