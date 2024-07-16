{

  description = "NoF 2023 tutorial materials";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, poetry2nix, ... }: flake-utils.lib.eachSystem (system: 
    let

      poetryOverlay = (final: prev:
        { poetry = (prev.poetry.override { python = final.${pythonVer}; }); }
      );

      pythonVer = "python310";

      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };

    in {
      devShells.default = let
        env = poetry2nix.lib.mkPoetryEnv {
          projectDir = "${self}";
          editablePackageSources = { icdcs_2024 = "${self}"; };
          preferWheels = true;
          python = pkgs.${pythonVer};
          overrides = pkgs.poetry2nix.defaultPoetryOverrides.extend (self: super: {
            tensorflow-io-gcs-filesystem = super.tensorflow-io-gcs-filesystem.overrideAttrs (old: {
              buildInputs = old.buildInputs ++ [ pkgs.libtensorflow ];
            });
            gpustat = super.gpustat.overrideAttrs (old: {
              buildInputs = (old.buildInputs or [ ]) ++ [ super.setuptools super.setuptools-scm ];
            });
            opencensus = super.opencensus.overrideAttrs (old: {
              # See: https://github.com/DavHau/mach-nix/issues/255#issuecomment-812984772
              postInstall = ''
                rm $out/lib/python3.10/site-packages/opencensus/common/__pycache__/__init__.cpython-310.pyc
                rm $out/lib/python3.10/site-packages/opencensus/__pycache__/__init__.cpython-310.pyc
              '';
            });
          });
        };
      in 
        with pkgs;
        
        mkShellNoCC {

          packages = [
            # this environment
            env

            # tools
            poetry
          ];

          shellHook = ''
            export VSCODE_PYTHON_PATH=${env}
          '' + (if stdenv.isLinux then ''
            export LD_LIBRARY_PATH=${ lib.strings.concatStringsSep ":" [
              "${cudaPackages.cudatoolkit}/lib"
              "${cudaPackages.cudatoolkit.lib}/lib"
              "${cudaPackages.cudnn}/lib"
              "${pkgs.cudaPackages.cudatoolkit}/nvvm/libdevice/"
            ]}:$LD_LIBRARY_PATH
            
            export XLA_FLAGS=--xla_gpu_cuda_data_dir=${pkgs.cudaPackages.cudatoolkit}
          '' else "");
        };

    });

}