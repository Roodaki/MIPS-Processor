<div align="center">
  <h1><strong>MIPS Processor</strong></h1>
  <p><strong>Implementation of a pipelined MIPS processor using Verilog HDL that supports a 32-bit MIPS ISA</strong></p>
</div>

![media_ed1_ed199597-6c9d-4c30-9d63-f67fb926ec12_phpGVLAj9](https://user-images.githubusercontent.com/89901590/214980971-05a08a44-bdc3-4a15-8d3c-68170eb0cba6.png)

## Features
The implemented MIPS processor supports the following features:
- 32-bit MIPS ISA
- 5-stage pipeline datapath
- Instruction and data caches

## Getting Started
To get started with this project, follow these steps:
1. Clone the repository: `git clone https://github.com/Roodaki/MIPS-Processor`
2. Install a Verilog simulator, such as Icarus Verilog
3. Open the desired Verilog file in the simulator and compile it: `iverilog -o output.vvp file.v`
4. Run the compiled simulation: `vvp output.vvp`
5. View the waveforms using a waveform viewer, such as GTKWave: `gtkwave output.vcd`

## Future Development
Possible areas for improving the implemented MIPS processor and enhancing its capabilities include:
- Implementing a forwarding unit (to improve performance by reducing stalls)
- Incorporating a branch prediction unit (for more efficient branch handling)
- Implementing a hazard detection unit (for better handling of data and control hazards)
