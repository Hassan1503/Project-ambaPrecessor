//Design the testbench for module Interface_AHBtoAPB named AMBA_stimulus
module AMBA_stimulus;

//Register declarations for input signals
  reg clk, reset, hwrite, hsel, hreadyin;
  reg [31:0] haddr;
  reg [1:0] htrans;
  reg [31:0] hwdata;

//Net declarations for output signals
  wire hreadyout, penable, s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, pwrite;
  wire [31:0] hrdata1, hrdata2, pwdata, paddr;
  wire [1:0] hresp;

//Instantiaton of Interface_AHBtoAPB module
  Interface_AHBtoAPB int_amba (.HCLK(clk), .HRESET(reset), .HADDR(haddr), .HTRANS(htrans), .HWRITE(hwrite), 
  .HWDATA(hwdata), .HSEL(hsel), .HREADYIN(hreadyin), .HRDATA1(hrdata1), .HRDATA2(hrdata2), .HREADYOUT(hreadyout), 
  .HRESP(hresp), .PWDATA(pwdata), .PENABLE(penable), .PADDR(paddr), .PWRITE(pwrite), .PSELS0(s0),
  .PSELS1(s1), .PSELS2(s2), .PSELS3(s3), .PSELS4(s4), .PSELS5(s5), .PSELS6(s6), .PSELS7(s7), .PSELS8(s8),
  .PSELS9(s9), .PSELS10(s10), .PSELS11(s11), .PSELS12(s12), .PSELS13(s13), .PSELS14(s14), .PSELS15(s15));  
                               
                                

//Setting the clock 
 initial clk = 1'b0;
 always #5 clk = ~ clk;

//Assigning values to other inputs 
 initial 

  begin
   reset = 1'b1;
   htrans = 2'b10; hsel = 1'b1; hreadyin = 1'b1;
   hwrite = 1'b0; 
   haddr = 32'b11111111111111111111000000000000; 
   hwdata = 32'b11001000000000000000000000111111;

   #30 hwrite = 1'b1;

   #30 hwrite = 1'b0;
       haddr = 32'b00011111111111111111111011111111; 
       hwdata = 32'b11110000000000000000000010000000;

   #30 hwrite = 1'b1;
   
   #30 haddr = 32'b00011111111111111111111000000000; 
       hwdata = 32'b11110000000000000000000010000011;

   #60 reset = 1'b0;

   #60 $stop;
  end

//Tracking signal values at different times
 initial
  $monitor ($time,"clk = %b, reset = %b, haddr = %b, htrans = %b, hwrite = %b, hwdata = %b, hsel = %b, hreadyin = %b, hrdata1 = %b, hrdata2 = %b, hreadyout = %b, hresp = %b, pwdata = %b, penable = %b, paddr = %b, pwrite = %b, s0 = %b, s1 = %b, s2 = %b, s3 = %b, s4 = %b, s5 = %b, s6 = %b, s7 = %b, s8 = %b, s9 = %b, s10 = %b, s11 = %b, s12 = %b, s13 = %b, s14 = %b, s15 = %b",
  clk, reset, haddr, htrans, hwrite, hwdata, hsel, hreadyin, hrdata1, hrdata2, hreadyout, hresp, pwdata, penable, paddr, pwrite, s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15);

endmodule     //End of testbench
