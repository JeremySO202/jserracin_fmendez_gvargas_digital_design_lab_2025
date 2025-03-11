module problema_3_tb();
    
    parameter int n = 6;
    
    logic reset, dec, num1, num2, num3;
    logic [n - 1:0] count, expected_count;
    logic [6:0] segA, segB;
    
    problema_3 #(.n(n)) p3 (
        .reset(reset),
        .dec(dec),
        .num1(num1),
        .num2(num2),
        .num3(num3),
        .count(count),
        .segA(segA), 
        .segB(segB)  
    );
    
    initial begin
        reset = 1;
        dec = 0;
        num1 = 0;
        num2 = 0;
        num3 = 0;
        expected_count = 0;
        
        #10 reset = 0;

        // Verifica el reset
        if (count !== 0) 
            $error("ERROR: Reset failed. Expected count = 0, got %0d", count);

        // Probar decremento
        for (int i = 0; i < (2**n) + 1; i++) begin
            #10 dec = 1;  
            #10 dec = 0;  
            expected_count = (expected_count == 0) ? '1 : expected_count - 1; 
            
            if (count !== expected_count) 
                $error("ERROR: Decrement failed. Expected count = %0d, got %0d", expected_count, count);
        end
        
        // Prueba de reset
        reset = 1;
        #10 reset = 0; 

        if (count !== 0) 
            $error("ERROR: Reset failed after decrement. Expected count = 0, got %0d", count);
        
        // Prueba de num1
        #10 num1 = 1;  #10 num1 = 0;
        expected_count = 1;
        if (count !== expected_count) 
            $error("ERROR: num1 failed. Expected count = %0d, got %0d", expected_count, count);

        // Prueba de num2
        #10 num2 = 1;  #10 num2 = 0;
        expected_count = 2**(n-1); 
        if (count !== expected_count) 
            $error("ERROR: num2 failed. Expected count = %0d, got %0d", expected_count, count);

        // Prueba de num3
        #10 num3 = 1;  #10 num3 = 0;
        expected_count = 2**n;
        if (count !== expected_count) 
            $error("ERROR: num3 failed. Expected count = %0d, got %0d", expected_count, count);
        
        // Finalización de la simulación
        #100 $stop;
    end
    
    initial begin
        // Monitor para visualizar las señales
        $monitor("Tiempo=%0t | reset=%b | dec=%b | num1=%b | num2=%b | num3=%b | count=%b | segA=%b | segB=%b", 
                 $time, reset, dec, num1, num2, num3, count, segA, segB);
    end

endmodule
