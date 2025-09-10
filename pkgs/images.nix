# image.nix
{ pkgs ? import <nixpkgs> {} }:

let
  images = {
    wallpaper = {
      url = "https://github.com/TilCreator/NixOwO/blob/master/NixOwO.svg";
      sha256 = "0pgjjaph4ckcggv6amj69kiya0aabijvhi73f1xcg29xlpqn96br";
      format = "svg";
    };
  };

  fetchImage = { url, sha256, format }:
    pkgs.fetchurl {
      inherit url sha256;
    };

  convertImage = { name, image }:
    if image.format == "png" || image.format == "jpg" || image.format == "jpeg" then
      image.url
    else
      let
        pngImage = pkgs.runCommand "${name}.png" {
          nativeBuildInputs = [ pkgs.imagemagick ];
        } ''
          convert ${fetchImage image} -density 96 $out
        '';
      in
        pngImage;

  imagePkg = pkgs.lib.mapAttrs (name: image: convertImage { inherit name image; }) images;
in
pkgs.lib.makeScope pkgs.lib.id imagePkg
