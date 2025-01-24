# Gunakan image dasar Ubuntu 22.04
FROM ubuntu:22.04

# Set environment variable untuk menghindari interaksi non-interaktif selama instalasi
ENV DEBIAN_FRONTEND=noninteractive

# Update dan instal dependensi yang dibutuhkan
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    tar \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Salin script untuk menjalankan node
WORKDIR /usr/src/app
COPY entrypoint.sh .

# Berikan izin eksekusi pada script
RUN chmod +x entrypoint.sh

# Eksekusi script saat container dijalankan
CMD ["./entrypoint.sh"]
