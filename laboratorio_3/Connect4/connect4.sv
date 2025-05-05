module connect4(
    input logic clk, reset,
    input logic btnIzqJ1, btnDerJ1, btnEntJ1,
    input logic btnIzqJ2, btnDerJ2, btnEntJ2,
    output logic vgaclk, hsync, vsync, sync_b, blank_b,
    output logic [7:0] r, g, b,
    output logic jugador, FT
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
        .gano_J1(1'b0),
        .tiempo_terminado_J1(1'b0),
        .random_valido_J1(1'b0),
        .t_J2(jugada2),
        .valido_J2(FT),
        .gano_J2(1'b0),
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
