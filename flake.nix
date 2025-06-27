{
  description = "Neovim Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: {
    devShells.aarch64-darwin.default = nixpkgs.legacyPackages.aarch64-darwin.mkShell {
      buildInputs = [
        nixpkgs.legacyPackages.aarch64-darwin.lua-language-server
      ];
    };
  };
}
