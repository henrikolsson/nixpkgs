{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
}:

buildGoModule rec {
  pname = "somacli";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "henrikolsson";
    repo = "somacli";
    tag = "v${version}";
    hash = "sha256-h7X2UIhLwkgkmSU4t7Lsnj4QDiF6EZg1Wm9uuXAhGZ4=";
  };

  vendorHash = "sha256-0YQ1WlPnvjRwg7nWJkOh3IdHhowBGbutbQOTPgBfxO4=";

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "A simple TUI for listening to SomaFM";
    homepage = "https://github.com/henrikolsson/somacli";
    changelog = "https://github.com/henrikolsson/somacli/releases/tag/${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ henrikolsson ];
    mainProgram = "somacli";
    platforms = lib.platforms.linux;
  };
}
