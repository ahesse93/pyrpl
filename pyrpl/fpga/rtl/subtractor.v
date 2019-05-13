module subtractor
(
   // data
   input                 clk_i           ,  // clock
   input                 rstn_i          ,  // reset - active low
   input signed     [ 14-1: 0] plus       ,  // input data
   input signed     [ 14-1: 0] minus       ,  // input data
   output signed    [ 14-1: 0] out       ,  // module output


   // communication with PS
   input      [ 16-1: 0] addr,
   input                 wen,
   input                 ren,
   output reg   		 ack,
   output reg [ 32-1: 0] rdata,
   input      [ 32-1: 0] wdata
);

reg signed    [ 15-1: 0]      tempout;

always @(posedge clk_i) begin
    if (rstn_i == 1'b0) begin
        tempout   <=    {14'b0};
    end
    else begin
        tempout <= $signed(plus) - $signed(minus);
    end
end

assign out = tempot[ 15-1: 1];
