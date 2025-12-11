{ pkgs, type ? "angular", ... }:
 {
  channel = "stable-25.05";
  packages = [
    pkgs.nodejs_24 
  ];
  bootstrap = ''
    echo "Environment ${type}"
    npx --prefer-offline -y @ionic/cli start "$WS_NAME" blank --type="${type}" --no-deps --no-git --no-link --no-interactive
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
    type=${type} j2 ${./devNix.j2} -o "$out/.idx/dev.nix"
    chmod -R u+w "$out"
    (cd "$out"; npm install --package-lock-only --ignore-scripts)
  '';
}
