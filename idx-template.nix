{ pkgs, ... }: {
    channel = "stable-25.05";
    packages = [
        pkgs.nodejs_24
    ];
    bootstrap = ''
    
        echo "Node.js version: $(node -version)"
        echo "npm version: $(npm --version)"

        echo "Installing ionic cli..."
        npm install -g @ionic/cli
        

        
    '';
}
