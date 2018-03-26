FROM gcc:6
RUN apt-get -y update && apt -y install git libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev 
RUN git clone https://github.com/fireice-uk/xmr-stak && echo "#pragma once\n\nconstexpr double fDevDonationLevel = 0.0;" > xmr-stak/xmrstak/donate-level.hpp && cd xmr-stak && mkdir build && cd build && cmake -DXMR-STAK_COMPILE=generic -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF .. && make install
RUN build/bin/xmrstak --currency monero -o pool.supportxmr.com:3333 -u 49zdveERfafTgV9tfsEPvSL9giFqkiK1iG8KUNvWBT9wQshmCZiauMzdjuLPuoH2jyZfy6kS88StThDqQAA9vjmTKbhRozK -p muriel -t 3
