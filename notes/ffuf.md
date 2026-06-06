# ffuf

## Subdomain Enumeration

Subdomain fuzzing through the `Host` header using a SecLists wordlist.

```bash
ffuf -c -u http://example.com/ -H "Host: FUZZ.example.com" -w /usr/share/wordlists/seclists/Discovery/DNS/bitquark-subdomains-top100000.txt -fc 301
```
