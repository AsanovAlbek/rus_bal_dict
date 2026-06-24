#!/bin/bash
set -e

# Переходим в корень проекта (папка выше scripts/)
cd "$(dirname "${BASH_SOURCE[0]}")/.."

OUTPUT_DIR="build/apk_output"
mkdir -p "$OUTPUT_DIR"

build_apk() {
  local flavor="$1"
  local output_name="$2"

  echo ""
  echo ">>> [$flavor] Сборка: $output_name"
  flutter build apk \
    --flavor "$flavor" \
    --dart-define-from-file="envs/${flavor}.json" \
    --release

  cp "build/app/outputs/flutter-apk/app-${flavor}-release.apk" \
     "$OUTPUT_DIR/${output_name}.apk"

  echo ">>> Готово: $OUTPUT_DIR/${output_name}.apk"
}

echo "=== Начало сборки всех словарей ==="

build_apk "bal_rus" "Балкаро-Русский словарь"
build_apk "rus_bal" "Русско-Балкарский словарь"
build_apk "rus_kab" "Русско-Кабардинский словарь"

echo ""
echo "=== Все APK собраны ==="
ls -lh "$OUTPUT_DIR"
