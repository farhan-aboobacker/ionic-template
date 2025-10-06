{ pkgs, type ? "angular", ... }:

let

  # Map user input to valid Ionic project types

  typeMap = {

    angular = "angular";

    react   = "react";

    vue     = "vue";

  };

  # Pick type from map, default to "angular" if unknown

  projectType = builtins.getAttrOr "angular" type typeMap;

in

{

  packages = [

    pkgs.nodejs_24

    pkgs.git

  ];

  bootstrap = ''

    echo "Bootstrapping Ionic project with type: ${projectType}"

    npx --prefer-offline -y @ionic/cli start "$WS_NAME" blank --type=$projectType --no-deps --no-git --no-link --no-interactive

    chmod -R +w "$WS_NAME"

    mv "$WS_NAME" "$out"

    (cd "$out"; npm install --package-lock-only --ignore-scripts)

  '';

}
 