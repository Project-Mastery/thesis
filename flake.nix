{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in 
  {
    devShells.${system}.default= pkgs.mkShell
    {
      nativeBuildInputs = with pkgs; [
        texliveFull
        tex-fmt
        inkscape
      ];
    };
  };
}