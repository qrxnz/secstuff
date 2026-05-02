{ pkgs, pwndbg, ... }:
{
    environment.systemPackages = with pkgs; [
        vim
        pwndbg.packages.${pkgs.system}.pwndbg
    ];
}
