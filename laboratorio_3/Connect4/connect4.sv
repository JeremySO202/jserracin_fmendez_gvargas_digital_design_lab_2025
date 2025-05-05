module connect4(
    input logic clk, reset,
    input logic btnIzqJ1, btnDerJ1, btnEntJ1,
    input logic btnIzqJ2, btnDerJ2, btnEntJ2,
    output logic vgaclk, hsync, vsync, sync_b, blank_b,
    output logic [7:0] r, g, b,
    output logic jugador, FT, ganador
);


    assign btnIzq = pressIzqJ1;
    assign btnDer = pressDerJ1;
    assign btnEnt = pressEntJ1;

    // Tablero y fichas compartidos
    logic [5:0][6:0] tablero;
    logic [5:0][6:0] fichas;
    logic [6:0] posicion;

 

    // Señales de control para turnos y verificaciones
    
    logic enTurno1, enTurno2, jugada1, jugada2;
    logic pressDerJ1, pressIzqJ1, pressEntJ1, pressDerJ2, pressIzqJ2, pressEntJ2;
    logic enVerificarJ1, enVerificarJ2;
	 
	 //señales para ganador
	 logic jugador_w;


    


    verificarJugador verificarJugador_inst (
        .clk(clk),
        .reset(reset),
        .enable(jugador ? enVerificarJ2 : enVerificarJ1),
        .btnIzq(jugador ? pressIzqJ2 : pressIzqJ1),
        .btnDer(jugador ? pressDerJ2 : pressDerJ1),
        .btnEnt(jugador ? pressEntJ2 : pressEntJ1),
        .jugador(jugador), // Jugador 1 o 2
        .posicion(posicion),
        .tablero(tablero),
        .fichas(fichas),
        .FT(FT) // Turno finalizado
    );
	 
	 //gane de un jugador
	 Ganador #(.rows(6), .columns(7)) ganador_inst (
		.jugador(jugador),
		.board(fichas),
		.ganador(ganador),
		.jugador_w(jugador_w)
	);
	/* lo que hice entonces es que el jugador_w, me va a tirar o 1 o 2, siendo 1 el jugador 1 y 2 el jugador 2. 
	Lo que quiero hacer con esto entonces es que esto se le pase al modulo de el end y según quien gane lo pinte de cierto color(esto ya está) pero no lo que no sé es como conectar este con el que hizo jeremy*/
	 
/*pq si se supone que yo en el end debía recibir la posición, en donde es que le va a pasar la posición, 
otra es hacerlo con el tamaño de las columnas y con eso sacar como en donde especificamente está 
o otra tambien es que ponerlo en la esquina de la derecha y que no ocupe posición y que siempre esté ahí(solo que aún así no sé como 
podría integrarlo o pegarlo con el de jeremy
tmb podriamos hacer que simpre esté el end y que se muestre solo cuando se habilite el juego según la variable que se creó. */


    // Jugador 1
    turnos turnoJ1_inst (
        .clk(clk),
        .reset(reset),
        .enable(enTurno1),
        .btnIzq(~btnIzqJ1),
        .btnDer(~btnDerJ1),
        .btnEnt(~btnEntJ1),
        .pressIzq(pressIzqJ1),
        .pressDer(pressDerJ1),
        .pressEnt(pressEntJ1),
        .jugada(jugada1)
    );

    // Jugador 2
    turnos turnoJ2_inst (
        .clk(clk),
        .reset(reset),
        .enable(enTurno2),
        .btnIzq(~btnIzqJ1),
        .btnDer(~btnDerJ1),
        .btnEnt(~btnEntJ1),
        .pressIzq(pressIzqJ2),
        .pressDer(pressDerJ2),
        .pressEnt(pressEntJ2),
        .jugada(jugada2)
    );

    

    connect4_fsm fsm_inst (
        .clk(clk),
        .rst(reset),
        .inicio_juego(1'b1),
        .num_jugador(1'b0),
        .t_J1(jugada1),
        .valido_J1(FT),
        .gano_J1(ganador), //hay que ver esta parte pq si él solo manda el jugador en el que está por el turno entonces si se puede dejar así
        .tiempo_terminado_J1(1'b0),
        .random_valido_J1(1'b0),
        .t_J2(jugada2),
        .valido_J2(FT),
        .gano_J2(ganador),
        .tiempo_terminado_J2(1'b0),
        .random_valido_J2(1'b0),
        .volver_inicio(1'b0),
        .jugador(jugador),
        .enTurno1(enTurno1),
        .enVerificar1(enVerificarJ1),
        .enTurno2(enTurno2),
        .enVerificar2(enVerificarJ2)
    );

    VGA vga_inst (
        .clk(clk),
        .posicion(posicion),
        .tablero(tablero),
        .fichas(fichas),
        .vgaclk(vgaclk),
        .hsync(hsync),
        .vsync(vsync),
        .sync_b(sync_b),
        .blank_b(blank_b),
        .r(r),
        .g(g),
        .b(b)
    );
	 
	 

endmodule
