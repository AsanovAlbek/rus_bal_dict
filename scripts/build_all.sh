#!/bin/bash
set -e

# Переходим в корень проекта (папка выше scripts/)
cd "$(dirname "${BASH_SOURCE[0]}")/.."

APK_OUTPUT_DIR="build/apk_output"
WEB_OUTPUT_DIR="build/web_output"

mkdir -p "$APK_OUTPUT_DIR"
mkdir -p "$WEB_OUTPUT_DIR"

build_apk() {
  local flavor="$1"
  local output_name="$2"

  echo ""
  echo ">>> [APK] [$flavor] Сборка: $output_name"
  flutter build apk \
    --flavor "$flavor" \
    --dart-define-from-file="envs/${flavor}.json" \
    --release

  cp "build/app/outputs/flutter-apk/app-${flavor}-release.apk" \
     "$APK_OUTPUT_DIR/${output_name}.apk"

  echo ">>> Готово: $APK_OUTPUT_DIR/${output_name}.apk"
}

build_web() {
  local flavor="$1"
  local output_name="$2"

  echo ""
  echo ">>> [WEB] [$flavor] Сборка: $output_name"
  flutter build web \
    --dart-define-from-file="envs/${flavor}.json" \
    --release

  rm -rf "$WEB_OUTPUT_DIR/${flavor}"
  cp -r build/web "$WEB_OUTPUT_DIR/${flavor}"

  echo ">>> Готово: $WEB_OUTPUT_DIR/${flavor}/"
}

echo "=== Начало сборки всех словарей ==="

build_apk "bal_rus" "Балкаро-Русский словарь"
build_apk "rus_bal" "Русско-Балкарский словарь"
build_apk "rus_kab" "Русско-Кабардинский словарь"

build_web "bal_rus" "Балкаро-Русский словарь"
build_web "rus_bal" "Русско-Балкарский словарь"
build_web "rus_kab" "Русско-Кабардинский словарь"

echo ""
echo "=== Все сборки завершены ==="
echo ""
echo "APK:"
ls -lh "$APK_OUTPUT_DIR"
echo ""
echo "WEB:"
ls -lh "$WEB_OUTPUT_DIR"
