# lima-vm

NixOS configuration for a VM running in [Lima](https://lima-vm.io/).
This repository builds a `raw-efi` image with `nixos-generators`, then starts
it in Lima through QEMU.

## Requirements

- macOS with Homebrew
- `limactl`
- `docker`
- `task`
- `qemu-system-aarch64` for the `aarch64` VM

Quick check:

```sh
task check
task check-qemu
```

If QEMU is missing:

```sh
task install-qemu
```

## Quick Start

Build the NixOS image:

```sh
task build
```

Start the VM:

```sh
task start
```

Open a shell in the VM:

```sh
task shell
```

The default Lima instance is named `nixos`. You can override it:

```sh
task start INSTANCE=dev-nixos
task shell INSTANCE=dev-nixos
```

## Useful Commands

```sh
task status          # list Lima instances
task stop            # stop the VM
task delete          # delete the VM
task recreate        # delete and recreate the VM
task clean-builder   # remove the temporary build VM and build container
```

## Image Build

`task build` starts a temporary Lima instance named `nixbuild` from the
`template:docker` image and builds the Nix package:

```sh
nix build /src#packages.aarch64-linux.box
```

It then copies the result to:

```text
imgs/nixos-aarch64.img
```

This image is used by `aarch64.yml`.

## Manual Lima Start

If the image already exists:

```sh
limactl start --name=nixos --vm-type=qemu aarch64.yml
limactl shell nixos
```

Delete the instance:

```sh
limactl delete -f nixos
```

## Architectures

- `aarch64.yml` starts the `imgs/nixos-aarch64.img` image.
- `x86.yaml` is the `x86_64` variant and expects the
  `imgs/nixos-x86.img`.
- `flake.nix` defines the `box` package for `x86_64-linux` and
  `aarch64-linux`.

The default `Taskfile.yml` flow builds the `aarch64` variant.

## Files

- `Taskfile.yml` - automation for building, starting, and cleaning up the VM.
- `flake.nix` - NixOS image definitions through `nixos-generators`.
- `configuration.nix` - base NixOS configuration for the image.
- `lima-init.nix` - system initialization from data provided by Lima.
- `lima-runtime.nix` - Lima runtime setup: user, mounts, guest agent, DNS/NAT.
- `aarch64.yml` - Lima configuration for the `aarch64` VM.
- `x86.yaml` - Lima configuration for the `x86_64` VM.

## Access

SSH is enabled in the image. The `root` account password is:

```text
nixos
```

The Lima user is created at startup from `cidata` provided by `limactl`.
