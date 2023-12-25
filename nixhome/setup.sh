function nixprofile() {
  local profile
  if [[ $(uname) == "Darwin" ]] && [[ $(uname -m) == 'arm64' ]]
  then
    profile="mac"
  elif [[ $(uname) == "Darwin" ]]
  then
    profile="macintel"
  elif [[ $(uname) == "Linux" ]]
  then
    profile="linux"
  fi
  echo $profile
}

function nixbuild() {
  local profile=$(nixprofile)
  nix build --no-link .#homeConfigurations.$profile.activationPackage
}

function nixactivate() {
  local profile=$(nixprofile)
  "$(nix path-info .#homeConfigurations.$profile.activationPackage)"/activate
}

function nixswitch() {
  local profile=$(nixprofile)
  home-manager switch --flake ".#$profile"
}

nixbuild
nixactivate
nixswitch
