FROM alpine:3.12.0

RUN apk add curl libgcc g++ make openssl-dev bash postgresql
RUN curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH /root/.cargo/bin:$PATH

COPY . /build
WORKDIR /build
RUN cargo build

# Set up postgres
RUN mkdir /postgres
RUN chown postgres /postgres
USER postgres
RUN initdb -D /postgres
USER root
RUN mv postgresql.conf pg_hba.conf server.crt server.key /postgres
RUN chown -R postgres /postgres
RUN chmod 700 /postgres/server.crt /postgres/server.key
