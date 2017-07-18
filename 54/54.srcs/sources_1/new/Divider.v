module Divider (
input I_CLK,  //����ʱ���źţ���������Ч
input Rst,     //��λ�źţ��ߵ�ƽ��Ч
input [31:0] N,
output reg O_CLK  //���ʱ�� 
); 
reg [31:0] count;
//parameter N=4;
initial
begin
count=0;
O_CLK=0;
end
always@(posedge I_CLK or posedge Rst)
begin  
if(Rst)
begin    
count<=0;
O_CLK<=0;   
end  
else begin
if(count==N/2-1)     
begin      
O_CLK<=~O_CLK;
count<=0;    
end   
else 
count<=count+1;  
end 
end
endmodule