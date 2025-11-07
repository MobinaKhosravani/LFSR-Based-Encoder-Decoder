`timescale 1ns / 1ps

module TB_Top_EncoderDecoder();
    reg clk = 0;
    reg reset = 1;
    reg data_in = 0;
    reg [14:0] header_enc = 15'h7FFF; // Encoder seed
    reg [14:0] header_dec = 15'h7FFF; // Decoder seed
    wire encoded_out, decoded_out;

    Top_EncoderDecoder DUT (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .header_enc(header_enc),
        .header_dec(header_dec),
        .encoded_out(encoded_out),
        .decoded_out(decoded_out)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    // Main test sequence
    initial begin
        $display("Time\tDataIn\tEncoded\tDecoded\tStatus");
        
        // Phase 1: Initialization
        #20 reset = 0; // Release reset
        #10 data_in = 1'b1; // Start data
        
        // Allow LFSR to initialize
        #100;

        // Phase 2: Verify matching headers
        if (decoded_out !== data_in) begin
            $error("Error: Matching headers failed!");
            $finish;
        end
        $display("%4t\t%b\t%b\t%b\tMATCHING", $time, data_in, encoded_out, decoded_out);
        
        // Phase 3: Mismatched headers
        header_dec = 15'h0001; // Change decoder seed
        reset = 1; // Reset to load new seed
        #20 reset = 0;
        
        // Wait for LFSR divergence (20 cycles)
        #200; 
        
        // Verify mismatch
        if (decoded_out === data_in) begin
            $error("Error: Mismatched headers produced correct output!");
            $finish;
        end
        $display("%4t\t%b\t%b\t%b\tMISMATCHED", $time, data_in, encoded_out, decoded_out);
        
        $display("\nAll tests passed!");
        $finish;
    end

    // Timeout protection
    initial begin
        #1000 $display("\nError: Simulation timeout!");
        $finish;
    end
endmodule