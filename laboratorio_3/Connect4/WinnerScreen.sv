module WinnerScreen (

    input logic clk, color,
    input logic [9:0] x, y, cursorX,
    output logic show,
    output logic [7:0] r, g, b

);

//empiezo por la e pero tengo que agrrar la parte de 
always_comb begin
	show = 0;
	if (enable && letter_zone) begin
	
            if (y >= 2 && y <= 10) begin
                if ((x >= cursorX - 6 && x <= cursorX - 3) || 
                    (y == 2) || (y == 6) || (y == 10))
                    show_pixel = 1;
            end
	//para la n
	else if (y >= 12 && y <= 20) begin
                if ((x == cursorX - 6) || (x == cursorX + 6) || (x - cursorX == y - 16))
                    show_pixel = 1;
            end

    //para la d
	 else if (y >= 22 && y <= 30) begin
		if ((x == cursor - 6) ||
			((y == 22 || y == 30) && x <= cursorX + 3) ||
			(x == cursorX + 3 && y > 22 && y < 30)) 
                    show_pixel = 1;
            end
        end
    end



    always_comb begin
        if (show) begin
            if (color) begin
                r = 8'hFF; g = 8'h00; b = 8'h00; 
            end 
            else begin
                r = 8'h00; g = 8'hFF; b = 8'hFF; 
            end
            else begin
                r = 8'h00; g = 8'h00; b = 8'h00;
            end
    end

endmodule