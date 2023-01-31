{
  perSystem = { config, pkgs, ... }: {
    packages = {
      nixos-remote = pkgs.callPackage ./. { };
      default = config.packages.nixos-remote;
    };
    devShells.default = pkgs.mkShellNoCC {
      packages = [
        pkgs.mypy
        pkgs.pixiecore
        pkgs.dnsmasq
        pkgs.python3.pkgs.netaddr
        pkgs.qemu_kvm
      ] ++ config.packages.nixos-remote.runtimeInputs;
      OVMF = "${pkgs.OVMF.fd}/FV/OVMF.fd";
    };
  };
}
