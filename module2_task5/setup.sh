apt-get update && apt-get install -y hugo make

apt-get install wget

wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.tar.gz
tar -zxvf hugo_extended_0.84.0_Linux-64bit.tar.gz
mv hugo /usr/local/bin

# Install markdown-cli v0.26.0
npm install -g markdown-cli@0.26.0

# Install markdown-link-check v3.8.6
npm install -g markdown-link-check@3.8.6

make build
