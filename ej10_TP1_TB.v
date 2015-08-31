`timescale 1ns / 1ps

`define OPCODE_BUS 6 // Ancho del bus de códigos de operación
`define DATA_BUS 8   // Ancho del bus de datos
`define ADD `OPCODE_BUS'b100000
`define SUB `OPCODE_BUS'b100010
`define AND `OPCODE_BUS'b100100
`define  OR `OPCODE_BUS'b100101
`define XOR `OPCODE_BUS'b100110
`define SRA `OPCODE_BUS'b000011
`define SRL `OPCODE_BUS'b000010
`define NOR `OPCODE_BUS'b100111

module ej10_TP1_TB;

	// Inputs
	reg [5:0] OPCODE;
	reg [7:0] OP1;
	reg [7:0] OP2;

	// Outputs
	wire [7:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	ej10_TP1 uut (
		.OPCODE(OPCODE), 
		.OP1(OP1), 
		.OP2(OP2), 
		.OUT(OUT)
	);

	initial begin
		// Initialize Inputs
		OPCODE = 0;
		OP1 = 0;
		OP2 = 0;

		#100;
		OPCODE = `ADD;
		OP1 = 2;
		OP2 = 8;		
		
		#100;
		OPCODE = `SUB;
		OP1 = 19;
		OP2 = 4; 
		
		
		#100;
		OPCODE = `AND;
		OP1 = 21;
		OP2 = 1; 
		
		#100;
		OPCODE = `OR;
		OP1 = 33;
		OP2 = 10; 
		
		#100;
		OPCODE = `XOR;
		OP1 = 55;
		OP2 = 27; 
		
		#100;
		OPCODE = `SRA;
		OP1 = 128 + 47;
		OP2 = 3; 
		
		#100;
		OPCODE = `SRL;
		OP1 = 128 + 47;
		OP2 = 3; 
		
		#100;
      OPCODE = `NOR;
		OP1 = 30;
		OP2 = 7; 
        
		// Add stimulus here

	end
      initial $monitor($time, OPCODE, OP1, OP2);
endmodule

