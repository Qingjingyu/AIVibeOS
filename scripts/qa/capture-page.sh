#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  capture-page.sh <url> <output-path> [width] [height]

Example:
  capture-page.sh http://127.0.0.1:3000 /tmp/page.png 402 874
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ $# -lt 2 ]]; then
  usage
  exit 1
fi

url="$1"
output_path="$2"
width="${3:-402}"
height="${4:-874}"

if ! command -v npx >/dev/null 2>&1; then
  echo "Error: npx not found. Install Node.js first." >&2
  exit 1
fi

if ! npx playwright --help >/dev/null 2>&1; then
  echo "Error: Playwright CLI is not available through npx." >&2
  exit 1
fi

output_dir="$(dirname "$output_path")"
mkdir -p "$output_dir"

echo "Capturing: $url"
echo "Viewport: ${width}x${height}"
echo "Output: $output_path"

npx playwright screenshot \
  --browser=chromium \
  --viewport-size="${width},${height}" \
  "$url" \
  "$output_path"

echo "Done: $output_path"
