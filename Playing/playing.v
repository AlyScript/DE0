module playing(
    input clk,		// 50 mhz
	input rst, 	// reset signal
	output reg led
);

	reg[31:0] counter;
	
	always @ (posedge clk, posedge rst)
	begin

		if (rst)
		begin
			counter <= 0;
			led <= 0;
		end
		else
		begin
			if (counter <= 25000000)
			begin
				counter <= counter + 1;
			end
			else
			begin
				counter <= 0;
				led <= ~led;
			end
		end
	end

endmodule