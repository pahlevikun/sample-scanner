APP_DIRECTORY="$(dirname "$0")/main"
cd "$APP_DIRECTORY"
echo "Do cleaning root project on app..."
fvm flutter clean

## declare array variables
declare -a module_shared=("shared_extensions" "shared_manifest" "shared_storage" "shared_utilities" "shared_widget_common")
declare -a module_foundation=("foundation_identifiers")

for item in "${module_foundation[@]}"; do
  DIRECTORY="$(dirname "$0")/module_foundation/$item"
  cd "$DIRECTORY"
  echo "$DIRECTORY"
  fvm flutter pub get
done

for item in "${module_shared[@]}"; do
  DIRECTORY="$(dirname "$0")/module_shared/$item"
  cd "$DIRECTORY"
  echo "$DIRECTORY"
  fvm flutter pub get
  fvm flutter pub run build_runner build --delete-conflicting-outputs
  if [[ "$item" == "shared_manifest" ]]
  then
    fvm flutter pub run assets:generate
  fi
done

for item in "${module_library[@]}"; do
  DIRECTORY="$(dirname "$0")/module_library/$item"
  cd "$DIRECTORY"
  echo "$DIRECTORY"
  fvm flutter pub get
  fvm flutter pub run build_runner build --delete-conflicting-outputs
done

DIRECTORY="$(dirname "$0")/main"
cd "$DIRECTORY"
echo "$DIRECTORY"
fvm flutter pub get
fvm flutter pub run build_runner build --delete-conflicting-outputs

echo ""
echo "Make project finished"
