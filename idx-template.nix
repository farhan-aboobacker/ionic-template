{ pkgs, ... }: {
    channel = "stable-25.05";
    packages = [
        pkgs.nodejs_24
    ];
    bootstrap = ''
    
        echo "Node.js version: $(node --version)"
        echo "npm version: $(npm --version)"

        echo "Installing ionic cli..."
        npm install -g @ionic/cli
        echo "Ionic cli Installed"

        echo "Creating project..."
        ionic start "$out" tabs
        
        mkdir "$out"/.idx
        cp ${./dev.nix} "$out"/.idx/dev.nix
        chmod -R +w "$out"
       
       # (cd "$out"; npm install --package-lock-only --ignore-scripts)
    '';
}
