{ pkgs, ... }: {
  channel = "stable-24.11";
  packages = [ pkgs.nodejs_20 ];
  bootstrap = ''
    echo "out :: $out"
    echo "workspace :: $WS_NAME"

    mkdir "$out"
  
    npx --prefer-offline -y @ionic/cli start "$out" blank --type=angular --no-deps --no-git --no-link --no-interactive
   
    mkdir -p "$out"/.idx
    chmod -R u+w "$out"
    cp ${./dev.nix} "$out"/.idx/dev.nix
    chmod -R u+w "$out"
  
    (cd "$out"; npm install --package-lock-only --ignore-scripts)
  '';
}
