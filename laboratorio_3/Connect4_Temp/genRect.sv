module genRect(
    input logic [9:0] x, y, // Coordenadas del pixel
    input logic [9:0] x1, y1, x2, y2, // Coordenadas del rectangulo
    input logic [1:0] color, // Color del rectangulo (0=blanco, 1=rojo, 2=azul, 3=verde)
    output logic [7:0] r, g, b // Color del rectangulo
);

    // Definicion de colores
    parameter WHITE = 2'b00;
    parameter RED = 2'b01;
    parameter BLUE = 2'b10;
    parameter GREEN = 2'b11;

    // Comprobacion de si el pixel esta dentro del rectangulo
    logic inside_rect;

    // Asignacion de color
    always_comb begin
        // Determina si el pixel está dentro del rectángulo
        inside_rect = (x >= x1 && x <= x2 && y >= y1 && y <= y2);

        // Asigna el color basado en la posición y el color seleccionado
        if (inside_rect) begin
            case (color)
                WHITE: begin r = 8'hFF; g = 8'hFF; b = 8'hFF; end // Blanco
                RED: begin r = 8'hFF; g = 8'h00; b = 8'h00; end // Rojo
                BLUE: begin r = 8'h00; g = 8'h00; b = 8'hFF; end // Azul
                GREEN: begin r = 8'h00; g = 8'hFF; b = 8'h00; end // Verde
                default: begin r = 8'h00; g = 8'h00; b = 8'h00; end // Negro
            endcase
        end else begin
            r = 8'h00; g = 8'h00; b = 8'h00; // Fuera del rectángulo, negro
        end
    end

endmodule