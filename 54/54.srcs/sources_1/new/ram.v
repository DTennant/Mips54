module dram (
  input clk,   //�洢��ʱ���źţ�������ʱ�� ram �ڲ�д������
  input ena,   //�洢����Ч�źţ��ߵ�ƽʱ�洢�������У�������� z 
  input [31:0] addr,//�����ַ��ָ�����ݶ�д�ĵ�ַ 
  input [2:0] switch,
  input [31:0] data_in, 
  input we,
  output [31:0] test,
  output [31:0]data_out //�洢�����������ݣ�
);
reg [7:0]ram[560-1:0];
assign test={ram[0],ram[1],ram[2],ram[3]};
assign data_out=ena?(switch==3'b100)?{24'b0,ram[addr]}:(switch==3'b010)?{16'b0,ram[addr],ram[addr+1]}:(switch==3'b001)?{ram[addr],ram[addr+1],ram[addr+2],ram[addr+3]}:32'bz:32'bz;
always@(posedge clk)
if(ena)
begin
if(we)
begin
if(switch==3'b100)
ram[addr]<=data_in[7:0];
else if(switch==3'b010)
begin
ram[addr]<=data_in[15:8];
ram[addr+1]<=data_in[7:0];
end
else if(switch==3'b001)
begin
ram[addr]<=data_in[31:24];
ram[addr+1]<=data_in[23:16];
ram[addr+2]<=data_in[15:8];
ram[addr+3]<=data_in[7:0];
end
else;
end
end
endmodule