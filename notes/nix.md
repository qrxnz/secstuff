# Cheatsheets

Reference links for Nix, NixOS, and development templates.

https://github.com/GTrunSec/nix-devops-cheatsheet

https://github.com/nixos/templates
https://github.com/abayomi185/nix-dev-templates
https://github.com/MordragT/nix-templates

http://vid.bina.me/tools/nixos/nixos-cheatsheet/

# Nix Commands

## nix run

Examples for running packages directly from GitHub flakes.

Generic format:

```bash
nix run github:<owner>/<repo>/<revision>#<executable>
```

### Standard

Runs the default executable from the repository flake.

```bash
nix run github:qrxnz/nveem
```

### Specific Commit ID

Runs a flake from an exact commit revision.

```bash
nix run github:DeterminateSystems/riff/a71a8b5ddf680df5db8cc17fa7fddd393ee39ffe
```

### Tag

Runs a flake from a tagged release.

```bash
nix run github:DeterminateSystems/riff/v1.0.0
```

### Latest Commit In A Branch

Runs a flake from the latest commit on a selected branch.

```bash
nix run github:DeterminateSystems/riff/secret-branch-for-nix-run
```

### Target A Flake In A Subdirectory

Runs an executable from a flake stored in a repository subdirectory.

```bash
nix run "github:hard-to-find/cool-app?dir=nested#specific-app"
```
