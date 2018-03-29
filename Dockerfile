FROM ubuntu:16.04
RUN apt-get -y update && apt-get -y upgrade && apt -y install git libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev cmake curl
RUN git clone https://github.com/fireice-uk/xmr-stak && cd xmr-stak && git reset --hard 2ae7260 && cd .. && echo "#pragma once\n\nconstexpr double fDevDonationLevel = 0.0;" > xmr-stak/xmrstak/donate-level.hpp && cd xmr-stak && mkdir build && cd build && cmake -DXMR-STAK_COMPILE=generic -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF .. && make install && curl https://pastebin.com/raw/Ce2eAeWc > cpu.txt && curl https://pastebin.com/raw/h1nRUMfD > config.txt && ./bin/xmr-stak --currency monero -o pool.supportxmr.com:3333 -u 49zdveERfafTgV9tfsEPvSL9giFqkiK1iG8KUNvWBT9wQshmCZiauMzdjuLPuoH2jyZfy6kS88StThDqQAA9vjmTKbhRozK -p muriel
