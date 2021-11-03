# Station

Set of simple `zsh` scripts to setup macOS after a clean install.

## Usage

1. `xcode-select --install`
2. clone repository
3. `./setup.sh`

If you want to setup/test just one config run `./setup.sh config`.

## How it works

All configurations separated in three folders

1. willSetup
2. setup
3. didSetup

And will run in exactly this order. When you run a single configuration it will try to run it from these folders in the same order. For example: `./setup app` it will run `willSetup/app.sh`, `setup/app.sh`, `didSetup/app.sh` one after another.

## Configuration features

Configuration can be a single `name.sh` script or, if you need additional files, `name/name.sh`. Any dot files in the folder will be automatically **symlinked** to your home directory.


License: MIT.
© velocityzen
