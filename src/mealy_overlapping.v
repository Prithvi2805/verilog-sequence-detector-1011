module mealy_overlapping(
  input clk,
  input rst,
  input din,
  output reg dout);
  
  parameter s0 = 2'b00,
            s1 = 2'b01,
            s2 = 2'b10,
            s3 = 2'b11;
  
  reg [1:0] state, next_state;
  
  always @ (posedge clk or posedge rst)
    begin
    if(rst)
      state <= s0;
    else
      state <= next_state;
    end
  
  always @ (*)
    begin
      dout = 1'b0;
      case(state)
        
        s0:
          begin
          if(din)
            next_state = s1;
        else
          next_state = s0;
          end
        
        s1:
          begin
            if(din)
              next_state = s1;
            else
              next_state = s2;
          end
        
        s2:
          begin
            if(din)
              next_state = s3;
            else
              next_state = s0;
          end
        
        s3:
          begin
            if(din)
              begin
              next_state = s1;
              dout = 1'b1;
              end
            else
              next_state = s2;
          end
        
        default: next_state = s0;
      endcase
    end
endmodule
