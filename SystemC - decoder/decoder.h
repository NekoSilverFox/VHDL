#include <iostream>
#include "systemc.h"

// decoder module - ������
SC_MODULE(decoder)
{
    sc_in<bool> enable;
    sc_in<sc_uint<8>> input;
    sc_out<sc_biguint<256>> output;

    void proc_decoder();

    // ���캯��
    SC_CTOR(decoder)
    {
        SC_METHOD(proc_decoder);
        sensitive << input << enable;
    }

};

// ����
SC_MODULE(driver)
{
    sc_out<bool> d_enable;
    sc_out<sc_uint<8>> d_input;

    void proc_driver();

    SC_CTOR(driver)
    {
        SC_THREAD(proc_driver);
    }

};
