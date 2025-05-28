{
  lib,
  patchelf,
  makeWrapper,
  stdenv,
  fetchFromGitHub,
  ...
}:
stdenv.mkDerivation {
  name = "zapret-hostlists";

  src = fetchFromGitHub {
    owner = "Snowy-Fluffy";
    repo = "zapret.cfgs";
    rev = "86071cbd4eeaf6e4d598ce88777c454d8dcee64c";
    hash = "sha256-KgDncfTICcsywX7immNfhQQmIfENHWlTO5ssv8SzcvQ=";
  };

  nativeBuildInputs = [
    makeWrapper
    patchelf
  ];

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;
  dontFixup = true;

  installPhase = ''
    # runHook preInstall

    mkdir $out
    cp -r -a files/* $out/

    # runHook postInstall
  '';

  meta = {
    description = "hostlists from Snowy-Fluffy/zapret.cfgs repository";
    homepage = "https://github.com/Snowy-Fluffy/zapret.cfgs";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [kotudemo];
  };
}
