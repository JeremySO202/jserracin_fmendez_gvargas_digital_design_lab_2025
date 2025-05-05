module vgaController #(
    parameter 
        HACTIVE = 10'd640,
        HFP = 10'd16,
        HSYN = 10'd96,
        HBP = 10'd48,
        HMAX = HACTIVE + HFP + HSYN + HBP,
        VBP = 10'd32,
        VACTIVE = 10'd480,
        VFP = 10'd11,
        VSYN = 10'd2,
        VMAX = VACTIVE + VFP + VSYN + VBP
    )
    (
        input logic vgaclk,
        output logic hsync, vsync, sync_b, blank_b,
        output logic [9:0] x, y
    );

   // Inicialización de senales
	initial begin
		x = 0;
		y = 0;
	end

	 //Conteo de la posicion del pixel
	always @(posedge vgaclk) begin
		x++;
		if (x == HMAX) begin //Cuando llega al maximo se reinicia y aumenta el vertical(y)
			x = 0;
			y++;
			if (y == VMAX) 
				y = 0;
		end
	end

    // Verifica que esté dentro de la zona utilizable
    wire hsync_zone = (x >= HACTIVE + HFP) && (x < HACTIVE + HFP + HSYN);
    wire vsync_zone = (y >= VACTIVE + VFP) && (y < VACTIVE + VFP + VSYN);

    assign hsync = ~hsync_zone;
    assign vsync = ~vsync_zone;
    assign sync_b = hsync & vsync;
    assign blank_b = (x < HACTIVE) && (y < VACTIVE);

endmodule