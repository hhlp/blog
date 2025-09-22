!#/bin/bash
set -e
cd /home/hhlp/blog
git clone --recursive https://github.com/getpelican/pelican-plugins
git clone https://github.com/sanjayankur31/voidy-bootstrap.git
cd voidy-bootstrap
git checkout 24ed325
cd ..
