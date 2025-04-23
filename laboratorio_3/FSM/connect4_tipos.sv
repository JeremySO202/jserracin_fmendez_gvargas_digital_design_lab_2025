// Añadir guardas de inclusión para prevenir múltiples declaraciones
`ifndef CONNECT4_TYPES_SV
`define CONNECT4_TYPES_SV

package connect4_tipos;


typedef enum logic [4:0] {
    INICIO,           // Estado inicial
	 MENU,
	 JUGADOR_INICIAL,
    TURNO_J1,   // Turno del jugador 1 (FPGA)
	 VERIFICAR_J1,
	 TIEMPO_J1,
	 RANDOM_J1,
	 GANADOR_J1,
    TURNO_J2,   // Turno del jugador 2 (Arduino)
	 VERIFICAR_J2,
	 TIEMPO_J2,
	 RANDOM_J2,
	 GANADOR_J2,
	 FIN_JUEGO
} game_state;

endpackage

`endif // CONNECT4_TYPES_SV