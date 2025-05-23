/*
Date:20/12/2023
test bench for RVI64 core with basic instructions to test the functionality of each instruction
first we initialze the data memory with x means each location will have it's address as a data value
and each register with 2x means each reg will have it's address *2 as a data
this will make it more easy to excepect the changed value due to each instruction
*/
//`timescale 1ns/1ps
module tb();
parameter XLEN = 32 ;//data and address width
parameter REGS = 32 ;//No.of Registers
parameter MEMS = 5000 ;//No.of initialized memory location (enough for us)
//Core inputs
reg rst_n, clk;
integer fd,rv;
//Core instance
riscv_core_top c1
(.i_riscv_core_clk(clk)
,.i_riscv_core_rst_n(rst_n)
);

always #50  clk = ~clk;

initial begin
    rst_n=0;
    clk=0;
    #1
    rst_n=1;
    #1;
        fd=$fopen("D:/Downloads/Topic_Project2/Risc_v/RV64IMAC/RV64IMAC-main/FPGA/src/ls.hex","r");                        //// intialize instruction memory
        for(int i =0;i<20;i++)                      //////enter the number of lines
            rv=$fscanf(fd,"%h",{c1.u_main_mem_data.u_main_mem.MEM[i]});

    for(int i =0 ; i<REGS ; i++) begin                                           //intialize regfile
        c1.u_riscv_core_top_2.u_riscv_core_rf.rf[i]=0;
    end
    c1.u_riscv_core_top_2.u_riscv_core_rf.rf[0]=32'h0;
    c1.u_riscv_core_top_2.u_riscv_core_rf.rf[2]=32'h000000007ffffff0;
    c1.u_riscv_core_top_2.u_riscv_core_rf.rf[3]=32'h0000000010000000;
    repeat(4000)
        @(posedge(clk));
    
    $stop;
end


endmodule
