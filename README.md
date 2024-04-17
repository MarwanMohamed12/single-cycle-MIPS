we need to implement a 32-bit single-cycle microarchitecture MIPS processor. The single 
cycle executes an entire instruction in one cycle. In other words, instruction fetch, instruction 
decode, execute, write back, and program counter update occurs within a single clock cycle.
we divded into tw2 catagories The processor is composed of a datapath and a controller. 
we implement every block of dataBath and then connected 
we save machine code in Instruction memory: PC is connected to the address input of the 
instruction memory. The instruction memory fetches the 32-bit instruction. It 
is a ROM that holds the program that your CPU will execute. This ROM has 
width = 32 bits and depth = 256 entries (1KB ROM), i.e, you will only connect 
bits 9 to 2 in the address bus as it is byte aligned. Instructions are read 
asynchronously.
and we control the signal using The ALU forms the heart of most computer systems.
the machine code is using to get factorial of 7 and GCD of 120 and 180
![qq](https://github.com/MarwanMohamed12/single-cycle-MIPS/assets/138940689/3e488746-2b69-4a20-bea1-f1e1af69ae14)

and here is my result 
![program 1 result](https://github.com/MarwanMohamed12/single-cycle-MIPS/assets/138940689/b5f72b7a-dc8a-46ec-a1be-87481ec9db43)
![program 2 result](https://github.com/MarwanMohamed12/single-cycle-MIPS/assets/138940689/98ff799c-9386-4001-ace6-9cd364bd5922)

