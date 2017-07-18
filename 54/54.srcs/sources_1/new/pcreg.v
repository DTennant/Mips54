module pcreg(
 input clk,   //1 λ���룬�Ĵ���ʱ���źţ�������ʱΪ PC �Ĵ�����ֵ
 input rst,   //1 λ���룬�첽�����źţ��ߵ�ƽʱ�� PC �Ĵ������� //ע���� ena �ź���Чʱ��rst Ҳ�������üĴ���
 input ena,   //1 λ����,��Ч�źŸߵ�ƽʱ PC �Ĵ������� data_in //��ֵ�����򱣳�ԭ�����
 input [31:0] data_in, //32 λ���룬�������ݽ�������Ĵ����ڲ�
 output [31:0]data_out   //32 λ���������ʱʼ����� PC  //�Ĵ����ڲ��洢��ֵ
);
reg [31:0] temp;
/*initial
temp=0;*/
always@(posedge clk or posedge rst)
begin
if(rst==1)
begin
temp=0;
end
else if(ena==1)
begin
temp=data_in;
end
end
assign data_out=temp;
endmodule