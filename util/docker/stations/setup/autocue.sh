#!/bin/bash
set -e
set -x

apt-get install -y --no-install-recommends python3-minimal python3-pip

pip3 install --no-cache-dir --break-system-packages mutagen

mkdir -p /tmp/autocue
mkdir -p /var/azuracast/autocue

cd /tmp/autocue

wget -O autocue.tar.gz "https://github.com/Moonbase59/autocue/archive/refs/tags/v2.0.3.tar.gz"
tar -xvf autocue.tar.gz --strip-components=1

# git clone https://github.com/Moonbase59/autocue .
# git checkout integrate-with-liquidsoap

mv ./cue_file /usr/local/bin/cue_file
chmod a+x /usr/local/bin/cue_file

mv ./autocue.cue_file.liq /var/azuracast/autocue/autocue.liq
chown -R azuracast:azuracast /var/azuracast/autocue

cd /var/azuracast/autocue
rm -rf /tmp/autocue
