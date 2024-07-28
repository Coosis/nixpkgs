{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  libgit2,
  oniguruma,
  zlib,
}:

let
  pname = "git-igitt";
  version = "0.1.18";
in
rustPlatform.buildRustPackage {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "mlange-42";
    repo = pname;
    rev = version;
    hash = "sha256-JXEWnekL9Mtw0S3rI5aeO1HB9kJ7bRJDJ6EJ4ATlFeQ=";
  };

  cargoHash = "sha256-5UgcgM/WuyApNFCd8YBodx9crJP3+Bygu9nSBJqPCaQ=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    libgit2
    oniguruma
    zlib
  ];

  env = {
    RUSTONIG_SYSTEM_LIBONIG = true;
  };

  meta = {
    description = "Interactive, cross-platform Git terminal application with clear git graphs arranged for your branching model";
    homepage = "https://github.com/mlange-42/git-igitt";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.pinage404 ];
    mainProgram = "git-igitt";
  };
}
