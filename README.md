# secstuff

This repository is a collection of security-related tools and resources...

To clone the repository along with all its submodules, use the following command:

```sh
git clone --recursive https://github.com/qrxnz/secstuff ~/secstuff
```

### Useful things

#### pwndbg nix-shell

```sh
nix shell github:pwndbg/pwndbg
```

#### pwntools nix template

```sh
nix flake init -t github:qrxnz/secstuff#pwntools-nix
```
