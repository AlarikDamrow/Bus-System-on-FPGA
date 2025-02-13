`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2021 03:52:57 PM
// Design Name: 
// Module Name: Top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Top_tb();

    reg clk;
    reg reset;
    reg [1:0] data_in1;
    reg req_in1;
    reg [1:0] data_in2;
    reg req_in2;
    reg [1:0] data_in3;
    reg req_in3;
    
    wire [7:0] cathode;
    wire [7:0] anode;
    
    Top_Module uut (.clk(clk), 
                    .reset(reset),
                    .data_in1(data_in1),
                    .req_in1(req_in1),
                    .data_in2(data_in2),
                    .req_in2(req_in2),
                    .data_in3(data_in3),
                    .req_in3(req_in3),
                    .cathode(cathode),
                    .anode(anode)
                    );
                    
    always
        #5 clk = ~clk;
        
    initial begin
        clk = 0; reset = 1; 
        data_in1 = 2'b01;
        data_in2 = 2'b10;
        data_in3 = 2'b11;
        {req_in1, req_in2, req_in3} = 3'b000;
        #50;
        reset = 0;
        
        
        {req_in1, req_in2, req_in3} = 3'b000; #50;
        {req_in1, req_in2, req_in3} = 3'b111; #50;
        {req_in1, req_in2, req_in3} = 3'b101; #50;
        {req_in1, req_in2, req_in3} = 3'b010; #50;
        {req_in1, req_in2, req_in3} = 3'b111; #50;
        {req_in1, req_in2, req_in3} = 3'b100; #50;
        {req_in1, req_in2, req_in3} = 3'b001; #50;
        {req_in1, req_in2, req_in3} = 3'b011; #50;
        {req_in1, req_in2, req_in3} = 3'b111; #50;
        
        $finish;
        
    end
endmodule
