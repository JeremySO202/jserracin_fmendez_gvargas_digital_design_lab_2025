module connect4(
    input logic clk, reset,
    input logic btnIzq, btnDer, btnEnt, jugador,
    output logic vgaclk, hsync, vsync, sync_b, blank_b,
    output logic [7:0] r, g, b,
    output logic [6:0] posicion);

    logic [5:0][6:0] tablero; // Internal 6x7 board matrix
    logic [5:0][6:0] fichas;  // Internal 6x7 pieces matrix
    logic FT;                 // Internal FT signal

    // Instantiate the VGA module
    VGA vga_inst (
        .clk(clk),          // Input clock (50MHz)
        .posicion(posicion), // Current position of the player (1 bit active per column)
        .tablero(tablero),  // 6x7 matrix for the board
        .fichas(fichas),    // 6x7 matrix for the pieces
        .vgaclk(vgaclk),    // Output VGA clock (25.175 MHz)
        .hsync(hsync),      // Horizontal sync signal
        .vsync(vsync),      // Vertical sync signal
        .sync_b(sync_b),    // Sync signal
        .blank_b(blank_b),  // Blank signal
        .r(r),              // Red color output
        .g(g),              // Green color output
        .b(b)               // Blue color output
    );

    // Instantiate the verificarJugador module
    verificarJugador verificarJugador_inst (
        .clk(clk),
        .reset(reset),
        .enable(1'b1),       // Enable signal set to 1
        .btnIzq_raw(~btnIzq),
        .btnDer_raw(~btnDer),
        .btnEnt_raw(~btnEnt),
        .jugador(jugador),
        .FT(FT),
        .posicion(posicion),
        .tablero(tablero),
        .fichas(fichas)
    );

    





endmodule
