{
  description = "A very basic flake";

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      musl = pkgs.pkgsCross.riscv64.musl; # pkgs.musl;
    in
    {
      packages.x86_64-linux.default = pkgs.pkgsCross.riscv64.pkgsStatic.buildGoModule {
        pname = "keystone-go-enclaves";
        version = "0.0.0";

        src = ./example;

        vendorHash = null;

        nativeBuildInputs = [ musl ];

        CGO_ENABLED = 1;

        ldflags = [
          "-s"
          "-w"
          "-linkmode external"
          "-extldflags '-static -L${musl}/lib'"
        ];

      };

      devShells.x86_64-linux.default = pkgs.mkShell
        {
          packages = [
            pkgs.qemu
            musl
          ];
        };
    };
}
