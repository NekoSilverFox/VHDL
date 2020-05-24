#include "decoder.h"

int sc_main(int argc, char* argv[])
{
    sc_signal<bool> t_enable;
    sc_signal<sc_uint<8>> t_input; // int 整形变量
    sc_signal<sc_biguint<256>> t_output; // 当整数值超过int数据范围时才可以使用

    // Driver
    driver DRIVER("DRIVER");
    DRIVER.d_enable(t_enable);
    DRIVER.d_input(t_input);

    // main module
    decoder DECODER("decoder");
    DECODER.enable(t_enable);
    DECODER.input(t_input);
    DECODER.output(t_output);

    // Output signals into .vcd file
    sc_trace_file* trace = sc_create_vcd_trace_file("decoder");

    sc_trace(trace, t_enable, "enable");
    sc_trace(trace, t_input, "input");
    sc_trace(trace, t_output, "output");

    sc_start(20000, SC_NS);

    sc_close_vcd_trace_file(trace);

    return 0;
}
