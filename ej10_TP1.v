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

module ej10_TP1
	 #(parameter opcodeBus=`OPCODE_BUS, dataBus=`DATA_BUS)
		(
			input [opcodeBus-1:0] OPCODE, // Código de Operación
			input [dataBus-1:0] OP1, // Operando 1
			input [dataBus-1:0] OP2, // Operando 2
			output [dataBus-1:0] OUT // Salida de la ALU
			
    );
	reg [dataBus-1:0] resultado;

	always @(*) begin
		case (OPCODE)
			`ADD: resultado = OP1 + OP2;
			`SUB: resultado = OP1 - OP2; 
			`AND: resultado = OP1 & OP2;
			 `OR: resultado = OP1 | OP2;
			`XOR: resultado = OP1 ^ OP2;
			`SRA: resultado = OP1 >>> OP2; 
			`SRL: resultado = OP1 >> OP2;
			`NOR: resultado = ~| OP1;
		endcase
	end
	assign OUT = resultado;
endmodule
