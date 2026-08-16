class apb_transaction;
rand bit pwrite;
rand bit [31:0] paddr;
rand bit [31:0] pwdata;
bit [31:0] prdata;
bit pslverr;

function void display(string name);
$display("[%s] PWRITE=%0d PADDR=%08h PWDATA=%08h PRDATA=%08h PSLVERR=%0d",name,pwrite,paddr,pwdata,prdata,pslverr);
endfunction
endclass

class apb_generator;
apb_transaction tr;
mailbox #(apb_transaction) gen2drv;

function new(mailbox #(apb_transaction) gen2drv);
this.gen2drv=gen2drv;
endfunction

task run();
tr=new();
if(!tr.randomize()) begin
$display("RANDOMIZATION FAILED");
$finish;
end
tr.display("GENERATOR");
gen2drv.put(tr);
endtask
endclass

class apb_driver;
mailbox #(apb_transaction) gen2drv;
virtual apb_interface vif;

function new(mailbox #(apb_transaction) gen2drv,virtual apb_interface vif);
this.gen2drv=gen2drv;
this.vif=vif;
endfunction

task run();
apb_transaction tr;
gen2drv.get(tr);
tr.display("DRIVER");

@(negedge vif.clk);
vif.presetn=1;
vif.psel=1;
vif.penable=0;
vif.pwrite=tr.pwrite;
vif.paddr=tr.paddr;
vif.pwdata=tr.pwdata;

@(negedge vif.clk);
vif.penable=1;
@(posedge vif.clk);
#1;

while(!vif.pready) begin
@(posedge vif.clk);
#1;
end
@(negedge vif.clk);
vif.psel=0;
vif.penable=0;
endtask
endclass

class apb_monitor;
virtual apb_interface vif;
mailbox #(apb_transaction) mon2scb;

function new(mailbox #(apb_transaction) mon2scb,virtual apb_interface vif);
this.mon2scb=mon2scb;
this.vif=vif;
endfunction

task run();
apb_transaction tr;

forever begin
@(posedge vif.clk);
#1;

if(vif.psel&&vif.penable&&vif.pready) begin
tr=new();
tr.pwrite=vif.pwrite;
tr.paddr=vif.paddr;
tr.pwdata=vif.pwdata;
tr.prdata=vif.prdata;
tr.pslverr=vif.pslverr;
tr.display("MONITOR");
mon2scb.put(tr);
break;
end
end
endtask
endclass

class apb_scoreboard;
mailbox #(apb_transaction) mon2scb;

function new(mailbox #(apb_transaction) mon2scb);
this.mon2scb=mon2scb;
endfunction

task run();
apb_transaction tr;

mon2scb.get(tr);

$display("");

$display("SCOREBOARD");

tr.display("SCOREBOARD");

if(tr.pslverr==0)
$display("RESULT : PASS");
else
$display("RESULT : FAIL");

$display("================================");
$display("");
endtask
endclass

class apb_env;
apb_generator gen;
apb_driver drv;
apb_monitor mon;
apb_scoreboard scb;

mailbox #(apb_transaction) gen2drv;
mailbox #(apb_transaction) mon2scb;

virtual apb_interface vif;

function new(virtual apb_interface vif);
this.vif=vif;

gen2drv=new();
mon2scb=new();

gen=new(gen2drv);
drv=new(gen2drv,vif);
mon=new(mon2scb,vif);
scb=new(mon2scb);
endfunction
  
task run();
fork
gen.run();
drv.run();
mon.run();
scb.run();
join
endtask
endclass



module tb;
logic clk;
always #5 clk=~clk;

apb_interface vif(clk);
apb_dut dut(vif);

apb_env env;

initial begin
clk=0;

vif.presetn=0;
vif.psel=0;
vif.penable=0;
vif.pwrite=0;
vif.paddr=0;
vif.pwdata=0;
vif.prdata=0;
vif.pready=0;
vif.pslverr=0;

env=new(vif);

repeat(2)
@(posedge clk);

env.run();

#20;
$finish;
end

initial begin
$dumpfile("apb.vcd");
$dumpvars(0,tb);
end
endmodule
