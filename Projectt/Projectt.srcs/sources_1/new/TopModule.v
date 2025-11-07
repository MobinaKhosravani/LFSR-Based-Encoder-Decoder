`timescale 1ns / 1ps

// --------------------- 15-bit LFSR Module ---------------------
module LSFR_15bit (
    input clk,
    input reset,
    input [14:0] seed,
    output reg out
);
    reg [14:0] lfsr;
    wire feedback = lfsr[14] ^ lfsr[13]; // x^15 + x^14 + 1 (maximal-length)

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            lfsr <= (seed == 0) ? 15'h7FFF : seed; // Default seed
            out <= (seed == 0) ? 1'b1 : seed[14];
        end
        else if (lfsr == 0) begin
            lfsr <= 15'h7FFF; // Reset to non-zero state
            out <= 1'b1;
        end
        else begin
            lfsr <= {lfsr[13:0], feedback};
            out <= lfsr[14];
        end
    end
endmodule

// --------------------- Encoder Module ---------------------
module Encoder(
    input clk,
    input reset,
    input data_in,
    input [14:0] header,
    output reg encoded_out
);
    wire lfsr_out;
    LSFR_15bit encoder_lfsr (
        .clk(clk),
        .reset(reset),
        .seed(header),
        .out(lfsr_out)
    );

    always @(posedge clk) begin
        encoded_out <= data_in ^ lfsr_out;
    end
endmodule

// --------------------- Decoder Module ---------------------
module Decoder(
    input clk,
    input reset,
    input encoded_in,
    input [14:0] header,
    output reg decoded_out
);
    wire lfsr_out;
    LSFR_15bit decoder_lfsr (
        .clk(clk), // Same clock edge as encoder
        .reset(reset),
        .seed(header),
        .out(lfsr_out)
    );

    always @(posedge clk) begin
        decoded_out <= encoded_in ^ lfsr_out;
    end
endmodule

// --------------------- Top Module ---------------------
module Top_EncoderDecoder(
    input clk,
    input reset,
    input data_in,
    input [14:0] header_enc,
    input [14:0] header_dec,
    output encoded_out,
    output decoded_out
);
    Encoder encoder (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .header(header_enc),
        .encoded_out(encoded_out)
    );

    Decoder decoder (
        .clk(clk),
        .reset(reset),
        .encoded_in(encoded_out),
        .header(header_dec),
        .decoded_out(decoded_out)
    );
endmodule