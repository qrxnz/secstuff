{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pwndbg = {
      url = "github:pwndbg/pwndbg";
    };
  };
  outputs = { self, nixpkgs, nixos-generators, pwndbg, ... }: {
    packages.x86_64-linux = {
      box = nixos-generators.nixosGenerate {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        specialArgs = { inherit pwndbg; };
        modules = [
          ./configuration.nix
        ];
        format = "raw-efi";
      };
    };
    packages.aarch64-linux = {
      box = nixos-generators.nixosGenerate {
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
        specialArgs = { inherit pwndbg; };
        modules = [
          ./configuration.nix
        ];
        format = "raw-efi";
      };
    };
  };
}
