# Feroxbuster

## Basic Usage

Scanning localhost with a selected wordlist and file extensions.

```bash
feroxbuster -u http://127.0.0.1 -x pdf -x js,html -x php txt json,docx --wordlist {wordlist}
```

## Parameters

- `-u http://127.0.0.1` - target address
- `-x pdf -x js,html -x php txt json,docx` - extensions to check
- `--wordlist {wordlist}` - path to the wordlist
