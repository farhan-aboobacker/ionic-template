{ pkgs, type ? "angular", ... }:
 {
  channel = "stable-25.05";
  packages = [
    pkgs.nodejs_24 
    pkgs.git
  ];
  bootstrap = ''
    echo "Environment ${type}"
    npx --prefer-offline -y @ionic/cli start "$WS_NAME" blank --type="$type" --no-deps --no-git --no-link --no-interactive
    cp -rf ${./.}/${type}/. "$WS_NAME"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
    
    chmod -R u+w "$out"
    (cd "$out"; npm install --package-lock-only --ignore-scripts)
  '';
}
