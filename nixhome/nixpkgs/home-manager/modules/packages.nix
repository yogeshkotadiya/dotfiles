{ config, pkgs, pkgsUnstable, ... }:
let
  core_pkgs = with pkgs; [
    # shell
    zsh
    zsh-completions
    nix-zsh-completions
    tmux
    direnv
    zellij

    # version control
    git
    gh
    lazygit
    delta
    hub

    # fonts
    (nerdfonts.override { fonts = [ "FiraCode" ]; })

    # nix packages
    nixpkgs-fmt

    # code editors
    neovim
    helix
    vscode
  ];

  language_pkgs = with pkgs; [
    # package managers
    asdf

    # nodejs setup
    nodejs_20
    corepack_20
    nodePackages.eslint_d
    nodePackages.prettier
    nodePackages.serve
    yarn

    # rust setup
    # rustc
    rustup
    # cargo
    # rustfmt
    wasm-pack
    binaryen
    wasm-bindgen-cli

    # python setup
    poetry
    python311

    # go lang setup
    go
    gopls
    go-tools
    delve

    # elixir
    elixir_1_16

    # flutter - Currently disabled because it's not supported on M series macs
    # flutter

    # database tools / client
    postgresql
    redis
  ];

  cli_tools = with pkgs; [
    # stripe
    stripe-cli
    # http helpers
    wget
    ngrok
    gping
    curlie

    # local proxy
    mkcert
    caddy

    # cli helpers
    thefuck
    ripgrep
    rsync

    # disk usage
    duf
    # code analysis
    tokei
    # cli speedtest
    speedtest-cli
    # youtube downloader
    yt-dlp
    # ffmpeg 5 with all deps
    ffmpeg_5-full
    # system info
    neofetch
    # json processor
    jq
    # system monitoring
    bottom
    # fuzzy finder
    fzf
    # directory structure viewer
    tree
    broot
    # 
    exiftool

    # cheatsheet
    navi
  ];

  network_pkgs = with pkgs; [
    # k8s
    kubectl
    kubectx
    k9s
    kubernetes-helm
    kind

    # aws cli
    awscli2
    # fly.io cli
    flyctl
    # Cloudflare cli
    cloudflared
  ];

  cli_alternatives_pkgs = with pkgs; [
    # Alternative tools
    # cat alternative
    bat
    # find alternative
    fd
    # ls alternative
    lsd
    # cd
    zoxide
    # command history
    atuin
  ];
in
{
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = core_pkgs ++
    language_pkgs ++
    cli_tools ++
    network_pkgs ++
    cli_alternatives_pkgs ++
    # mac specific packages
    pkgs.lib.optionals pkgs.stdenv.isDarwin [
      pkgs.coreutils

      # For file_system on macOS.
      pkgs.darwin.apple_sdk.frameworks.CoreFoundation
      pkgs.darwin.apple_sdk.frameworks.CoreServices
    ] ++
    # linux specific packages
    pkgs.lib.optionals pkgs.stdenv.isLinux [
    ];
}
