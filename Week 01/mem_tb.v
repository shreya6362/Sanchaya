`timescale 1ns / 1ps

module mem_tb; 
    reg clk,rst,rd,wr;
    reg [7:0] Datain;
    wire [7:0] Dataout;

    mem uut(clk, rst, rd, wr, Datain, Dataout);
    always #5 clk = ~clk; 

    initial begin
        clk = 0;
        rst = 1;  
        wr = 0;
        rd = 0;
        Datain = 8'b00001111;
        
        #10; rst = 0; 
        #10;

        wr = 1;
        Datain = 8'hAA; 
        wr = 0;

        rd = 1;
        #10;
        rd = 0;

        if (Dataout !== 8'hAA) begin
            $display("Test failed! Expected Dataout = 8'hAA, got Dataout = %h", Dataout);
        end else begin
            $display("Test passed! Dataout = %h", Dataout);
        end

        #10;
        $finish;
    end

endmodule

