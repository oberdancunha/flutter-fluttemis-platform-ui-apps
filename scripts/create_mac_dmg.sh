#!/bin/sh
test -f Fluttemis.dmg && rm Fluttemis.dmg
create-dmg \
  --volname "Fluttemis Installer" \
  --volicon "./fluttemis_platform_ui_app/assets/macos/launcher.icns" \
  --window-pos 200 120 \
  --window-size 800 530 \
  --icon-size 130 \
  --text-size 14 \
  --icon "Fluttemis.app" 260 250 \
  --hide-extension "Fluttemis.app" \
  --app-drop-link 540 250 \
  --hdiutil-quiet \
  "fluttemis_platform_ui_app/build/macos/Build/Products/Release/Fluttemis.dmg" \
  "fluttemis_platform_ui_app/build/macos/Build/Products/Release/Fluttemis.app"