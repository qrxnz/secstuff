{
  inputs.utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    utils,
  }:
    {
      templates.pwntools-nix = {
        path = ./templates/pwntools-nix;
        description = "Pwntools Nix development template";
      };
    }
    // utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        devShells.default = pkgs.mkShell rec {
          buildInputs = with pkgs; [
            # Formatters
            alejandra
          ];
        };
      }
    );
}
