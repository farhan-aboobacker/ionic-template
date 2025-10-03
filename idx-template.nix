{ pkgs, ... }: {
  channel = "stable-24.11";
  packages = [ pkgs.nodejs_20 ];
  bootstrap = ''
    mkdir $out
    mkdir "$out"/.idx
    cp ${./dev.nix} "$WS_NAME"/.idx/dev.nix
    npx --prefer-offline -y @ionic/cli start "$out" blank --type=angular --no-deps --no-git --no-link --no-interactive
    
    chmod -R u+w "$out"
  
    (cd "$out"; npm install --package-lock-only --ignore-scripts)
  '';
}
