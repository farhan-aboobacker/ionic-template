{ pkgs, ... }: {
    channel = "stable-25.05";
    packages = [
        pkgs.nodejs_24
        pkgs.git
    ];
    bootstrap = ''
    
        echo "Node.js version: $(node --version)"
        echo "npm version: $(npm --version)"

         echo "Installing ionic cli..."
         npx --prefer-offline -y @ionic/cli start "$WS_NAME" blank --type=angular --no-deps --no-git --no-link --no-interactive
         mkdir -p "$out"/.idx
         cp ${./dev.nix} "$out"/.idx/dev.nix
        # mv "$WS_NAME" "$out"
    
         chmod -R u+w "$out"
       
         (cd "$out"; npm install --package-lock-only --ignore-scripts)
    '';
}
