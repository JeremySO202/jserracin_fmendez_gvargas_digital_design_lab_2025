`timescale 1ns/1ps

module Ganador_tb;

  // Parámetros
  localparam int rows = 6;
  localparam int columns = 7;

  // Entradas al DUT
  logic jugador;
  logic [rows-1:0][columns-1:0] board;

  // Salida del DUT
  logic ganador;

  // Instanciar el módulo bajo prueba (DUT)
  Ganador #(.rows(rows), .columns(columns)) dut (
    .jugador(jugador),
    .board(board),
    .ganador(ganador)
  );

  // Procedimiento de prueba
  initial begin
    jugador = 1'b1;
    board = '0; // limpiar tablero

    #5;
    $display("Test 1: No hay ganador inicialmente");
    print_board();
    assert(ganador == 0) else $fatal("Fallo: debería no haber ganador");

    // Test 2: Horizontal (fila 0, columnas 0 a 3)
    board = '0;
    board[0][0] = jugador;
    board[0][1] = jugador;
    board[0][2] = jugador;
    board[0][3] = jugador;

    #5;
    $display("Test 2: Ganador horizontal");
    print_board();
    assert(ganador == 1) else $fatal("Fallo: debería detectar ganador horizontal");

    // Test 3: Vertical (columna 0, filas 0 a 3)
    board = '0;
    board[0][0] = jugador;
    board[1][0] = jugador;
    board[2][0] = jugador;
    board[3][0] = jugador;

    #5;
    $display("Test 3: Ganador vertical");
    print_board();
    assert(ganador == 1) else $fatal("Fallo: debería detectar ganador vertical");

    // Test 4: Diagonal descendente (\)
    board = '0;
    board[0][0] = jugador;
    board[1][1] = jugador;
    board[2][2] = jugador;
    board[3][3] = jugador;

    #5;
    $display("Test 4: Ganador diagonal hacia abajo (\\)");
    print_board();
    assert(ganador == 1) else $fatal("Fallo: debería detectar ganador diagonal descendente");

    // Test 5: Diagonal ascendente (/)
    board = '0;
    board[3][0] = jugador;
    board[2][1] = jugador;
    board[1][2] = jugador;
    board[0][3] = jugador;

    #5;
    $display("Test 5: Ganador diagonal hacia arriba (/)");
    print_board();
    assert(ganador == 1) else $fatal("Fallo: debería detectar ganador diagonal ascendente");

    $display("Todas las pruebas PASARON");
    $finish;
  end

  // Task para imprimir el tablero
  task print_board;
    begin
      $display("\nEstado actual del tablero:");
      for (int r = rows-1; r >= 0; r--) begin
        for (int c = 0; c < columns; c++) begin
          $write("%0d ", board[r][c]);
        end
        $write("\n");
      end
      $display(""); // línea en blanco
    end
  endtask

endmodule