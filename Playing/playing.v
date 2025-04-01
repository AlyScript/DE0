module playing(
    input   clk,		    // 50 mhz
    input   i_Switch_1    
    output  o_LED_1
);

    // Internal Signals
	reg r_LED_1;
	reg r_Switch_1;         // We use this to detect falling edge of the switch

	always @ (posedge clk)
	begin
        r_Switch_1 <= i_Switch_1;   // Store the current state of the switch for the next clock cycle

        if (i_Switch_1 == 1'b0 && r_Switch_1 == 1'b1) // Detect falling edge of the switch
        begin
            r_LED_1 <= ~r_LED_1;    // Toggle the LED state
        end
        
        assign o_LED_1 = r_LED_1;   // Assign the LED state to the output (blocking since we want to do it after r_LED_1 is updated)
	end

endmodule