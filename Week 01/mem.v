module mem(clk, rst, rd, wr, Datain, Dataout);
input clk, rst, rd, wr;
input [7:0] Datain;
output reg [7:0] Dataout;

reg [7:0] add[0:10];  

always @(posedge clk ) 
begin
    if (rst) begin
        Dataout = 8'b0;
        end 
    else 
    begin
        case ({wr, rd})
            2'b10: add[0] = Datain;  
            2'b01: Dataout = add[0]; 
            default: Dataout = 8'bz; 
        endcase
    end
end

endmodule
