#!/bin/bash
dnf install -y stress-ng || true

cat > /usr/local/bin/generate-load.sh <<'EOF'
#!/bin/bash
# Wait 3 minutes so the alarm first shows a normal baseline
sleep 180
if command -v stress-ng >/dev/null 2>&1; then
  stress-ng --cpu 0 --cpu-load 100 --timeout 1200s
else
  for i in $(seq "$(nproc)"); do
    timeout 1200 sh -c 'while :; do :; done' &
  done
  wait
fi
EOF

chmod +x /usr/local/bin/generate-load.sh
systemd-run --unit=generate-load /usr/local/bin/generate-load.sh
