{ pkgs, type ? "angular", ... }: {
  channel = "stable-25.05";
  packages = [
    pkgs.nodejs_24 
    pkgs.git
  ];
  bootstrap = ''
    echo "Environment ${type}"
    if [ "${type}" = "angular" ]; then
          npx --prefer-offline -y @ionic/cli start "$WS_NAME" blank --type=angular --no-deps --no-git --no-link --no-interactive
    elif [ "${type}" = "react" ]; then
          npx --prefer-offline -y @ionic/cli start "$WS_NAME" blank --type=react --no-deps --no-git --no-link --no-interactive
    elif [ "${type}" = "vue" ]; then
          npx --prefer-offline -y @ionic/cli start "$WS_NAME" blank --type=vue --no-deps --no-git --no-link --no-interactive
    else
          npx --prefer-offline -y @ionic/cli start "$WS_NAME" blank --type=angular --no-deps --no-git --no-link --no-interactive
    fi
    cp -rf ${./.}/${type} "$WS_NAME"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
    chmod -R u+w "$out"
    (cd "$out"; npm install --package-lock-only --ignore-scripts)
  '';
}
