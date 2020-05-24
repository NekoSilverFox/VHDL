#include "decoder.h"

void decoder::proc_decoder()
{
	if (enable.read())
	{
		sc_uint<8> value_read = input.read();

		for (int i = 0; i <= 256; i++)
		{
			if (i == value_read)
			{
				output.write(pow(2, i)); // 2 µÄ i ´Î·½
			}
		}

	}
	else
	{
		output.write(0); // if the enable is zero
	}
}

void driver::proc_driver()
{
	sc_uint<8> pattern;
	pattern = 0;

	while (true)
	{
		// Test-bench
		pattern = 0;
		d_enable = false;
		d_input = pattern;

		wait(5, SC_NS);

		for (int i = 0; i < 256; i++)
		{
			pattern = i;
			d_enable = true;
			d_input = pattern;
			wait(5, SC_NS);
		}

		pattern = 256;
		d_enable = false;
		d_input = pattern;

		wait(5, SC_NS);

		sc_stop(); // Stop the simulation
	}
}