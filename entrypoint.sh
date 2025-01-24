#!/bin/bash

# Unduh dan ekstrak paket
curl -o apphub-linux-amd64.tar.gz https://assets.coreservice.io/public/package/60/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz && \
tar -zxf apphub-linux-amd64.tar.gz && \
rm -f apphub-linux-amd64.tar.gz && \
cd ./apphub-linux-amd64

# Instal dan jalankan service
sudo ./apphub service remove
sudo ./apphub service install
sudo ./apphub service start

# Cek status service
./apphub status

# Konfigurasi Gaganode dengan token
sudo ./apps/gaganode/gaganode config set --token=obqbmxayydohqrhc9a977e15c9875e03

# Restart service
./apphub restart

# Menjaga container tetap berjalan
sleep infinity
