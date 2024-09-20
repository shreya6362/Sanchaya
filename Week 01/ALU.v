module alu_32bit(input clk,rst,[31:0] a_in,[31:0] b_in,[3:0] sel,
                 output reg [31:0] y_out,output reg flag,output reg [32:0] sum_out);
    
    always @(posedge clk or posedge rst) 
        begin
        if (rst) 
        begin
            y_out <= 32'b0;
            sum_out <= 33'b0;
            flag <= 0;
        end 
        else 
        begin
            case (sel)
                4'b0000: y_out <= a_in + b_in;        // Addition
                4'b0001: y_out <= a_in - b_in;        // Subtraction
                4'b0010: y_out <= a_in & b_in;        // AND
                4'b0011: y_out <= a_in | b_in;        // OR
                4'b0100: y_out <= a_in ^ b_in;        // XOR
                4'b0101: y_out <= ~a_in;              // NOT
                4'b0110: y_out <= a_in << 1;          // Shift left
                4'b0111: y_out <= a_in >> 1;          // Shift right
                4'b1000: y_out <= (a_in < b_in) ? 32'b1 : 32'b0;  // Compare
                default: y_out <= 32'b0;              // Default case
            endcase

            // Flag for overflow detection (if sum exceeds 32 bits)
            sum_out <= a_in + b_in;
            flag <= (sum_out[32] == 1) ? 1 : 0;  // Overflow flag
        end
    end
endmodule
