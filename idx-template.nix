{ pkgs, ... }: {
  channel = "stable-24.11";
  packages = [ pkgs.nodejs_20 ];
  bootstrap = ''
    mkdir -p "$WS_NAME"/.idx
    echo "out :: $out"
    echo "workspace :: $WS_NAME"
    cp ${./dev.nix} "$WS_NAME"/.idx/dev.nix
    npx --prefer-offline -y @ionic/cli start "$WS_NAME" blank --type=angular --no-deps --no-git --no-link --no-interactive
    mv "$WS_NAME" "$out"
    chmod -R u+w "$out"
  
    (cd "$out"; npm install --package-lock-only --ignore-scripts)
  '';
}
