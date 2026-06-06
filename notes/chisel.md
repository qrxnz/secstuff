# Client

Starts a reverse SOCKS tunnel from the client to the Chisel server.

```bash
./chisel client <ip>:<port> R:socks
```

# Server

Runs a Chisel server that accepts reverse tunnels and exposes SOCKS5.

```bash
./chisel server --reverse --port <port> --socks5
```
