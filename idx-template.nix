{ pkgs, ... }: {
  channel = "stable-24.11";
  packages = [ pkgs.nodejs_20 ];
  bootstrap = ''
    mkdir $out
    mkdir "$out"/.idx
    echo "out :: $out"
    echo "workspace :: $WS_NAME"
    cp ${./dev.nix} "$out"/.idx/dev.nix
    npx --prefer-offline -y @ionic/cli start "$out" blank --type=angular --no-deps --no-git --no-link --no-interactive
    
    chmod -R u+w "$out"
  
    (cd "$out"; npm install --package-lock-only --ignore-scripts)
  '';
}
