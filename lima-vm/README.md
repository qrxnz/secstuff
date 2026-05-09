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
- `lima-additional-guestagents` for x86_64 VMs on Apple Silicon

Quick check:

```sh
task check
task check-qemu
```

If QEMU is missing:

```sh
task install-qemu
```

If x86_64 Lima guest agents are missing:

```sh
task install-x86-guestagent
```

## Quick Start

Build the NixOS image:

```sh
task build
```

Build a specific architecture:

```sh
task build-arm
task build-x86
# or: task build ARCH=x86_64
```

Start the VM:

```sh
task start
```

Start a specific architecture:

```sh
task start-arm
task start-x86
# or: task start ARCH=x86_64
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

`task build` starts a temporary Lima instance from the `template:docker` image
and builds the Nix package:

```sh
nix build /src#packages.aarch64-linux.box
```

For x86_64, use:

```sh
task build-x86
```

which builds:

```sh
nix build /src#packages.x86_64-linux.box
```

The x86_64 build uses a separate Lima builder named `nixbuild-x86` started with
QEMU and `--arch=x86_64`, so Nix runs on the same platform as the requested
package. The default aarch64 build uses `nixbuild-aarch64`.

It then copies the result to:

```text
imgs/nixos-aarch64.img
```

The default image is used by `aarch64.yml`. The x86_64 image is written to
`imgs/nixos-x86.img` and used by `x86.yaml`.

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

The default `Taskfile.yml` flow builds and starts the `aarch64` variant. Use
`task build-x86` and `task start-x86` for the `x86_64` variant.

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
