{ pkgs, type ? angular, ... }:
let  
 typeMap = {
  angular = "angular";
  react = "react";
  vue = "vue"
}
projectType = typeMap.${type} or angular;
in
 {
  channel = "stable-25.05";
  packages = [
    pkgs.nodejs_24 
    pkgs.git
  ];
  bootstrap = ''
    echo "Environment ${type}"
    npx --prefer-offline -y @ionic/cli start "$WS_NAME" blank --type=$projectType --no-deps --no-git --no-link --no-interactive
    cp -rf ${./.}/${environment} "$WS_NAME"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
    chmod -R u+w "$out"
    (cd "$out"; npm install --package-lock-only --ignore-scripts)
  '';
}
