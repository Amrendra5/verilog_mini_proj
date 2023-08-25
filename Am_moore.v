module moore_1101 (in,clk,rst,out);

input in,clk,rst;
output reg out;
  reg [2:0] ps,ns;

parameter s0 = 3'b000 ,s1 = 3'b001,s2 = 3'b010,s3 = 3'b011, s4 = 3'b100;

always @ (posedge clk)
begin
  if (rst)
    ps<= s0;
  else
	ps <= ns;
end

  always @ (ps or in)
begin
  case (ps)
		s0: begin
          out = 0;
          if (in)
              ns = s1;
          else
              ns = ps; //ps or s0
      end
    s1:  begin
          out = 0;
          if (in)
            ns = s2;
          else
            ns = s0;
   	   end
    s2:  begin
        out = 0;

        if (in)
          ns = s2;
        else
          ns = s3;
      end
    s3:  begin
        out = 0;
        if (in)
          ns = s4;
        else
          ns = s0;
		end
    s4: begin
        out=1;
        if (in)
          ns = s0;

        else
          ns = s0;
  		end

    default: begin
      out=0;
      ns = s0;
    end
  endcase
end
endmodule