#!/usr/bin/env bash
# From https://github.com/sentriz/cliphist/blob/master/contrib/cliphist-rofi-img
# Gallery mode: set CLIPHIST_ROFI_GALLERY=1 on the rofi command (see $clipboard_img) — images only.

if [[ -n "${CLIPHIST_ROFI_GALLERY:-}" ]]; then
    tmp_dir="/tmp/cliphist-gallery"
else
    tmp_dir="/tmp/cliphist"
fi
rm -rf "$tmp_dir"

if [[ -n "$1" ]]; then
    cliphist decode <<<"$1" | wl-copy
    exit
fi

mkdir -p "$tmp_dir"

if [[ -n "${CLIPHIST_ROFI_GALLERY:-}" ]]; then
    read -r -d '' prog <<EOF
/^[0-9]+\s<meta http-equiv=/ { next }
match(\$0, /^([0-9]+)\s(\[\[\s)?binary.*(jpg|jpeg|png|bmp|webp|gif)/, grp) {
    system("echo " grp[1] "\\\\\t | cliphist decode >$tmp_dir/"grp[1]"."grp[3])
    print \$0"\0icon\x1f$tmp_dir/"grp[1]"."grp[3]
    next
}
EOF
else
    read -r -d '' prog <<EOF
/^[0-9]+\s<meta http-equiv=/ { next }
match(\$0, /^([0-9]+)\s(\[\[\s)?binary.*(jpg|jpeg|png|bmp|webp|gif)/, grp) {
    system("echo " grp[1] "\\\\\t | cliphist decode >$tmp_dir/"grp[1]"."grp[3])
    print \$0"\0icon\x1f$tmp_dir/"grp[1]"."grp[3]
    next
}
1
EOF
fi
cliphist list | gawk "$prog"
