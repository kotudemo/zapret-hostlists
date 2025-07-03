{
  lib,
  patchelf,
  makeWrapper,
  stdenv,
  fetchFromGitHub,
  ...
}: stdenv.mkDerivation {
  name = "zapret-hostlists";

  src = fetchFromGitHub {
  owner = "Snowy-Fluffy";
  repo = "zapret.cfgs";
  rev = "2f4cc343fd02999dcdf3bdff89039754585e02fd";
  hash = "sha256-pPOPtJedOnYEKndrgh426SlInNTRqJpSgySyw5mzArY=";
}

  nativeBuildInputs = [
    makeWrapper
    patchelf
  ];

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;
  dontFixup = true;

  installPhase = ''
    cp -r . $out/
  '';

  meta = {
    description = "hostlists from Snowy-Fluffy/zapret.cfgs";
    homepage = "https://github.com/Snowy-Fluffy/zapret.cfgs";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [kotudemo];
  };
}
