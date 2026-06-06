# Nmap

## Default TCP

Default TCP service and version scan with scripts enabled.

```bash
sudo nmap -sCV -T4 --min-rate 10000 {IP} -v -oA tcp_default
```

## Default UDP

Default UDP scan with service detection, scripts, and output files.

```bash
sudo nmap -sUCV -T4 --min-rate 10000 {IP} -v -oA udp_default
```

## Silent Scan

Low-noise SYN scan with packet fragmentation and conservative timing.

```bash
sudo nmap -sS -Pn -T1 --scan-delay 500ms --max-retries 1 --max-scan-delay 1000ms -f -p- {IP}
```
