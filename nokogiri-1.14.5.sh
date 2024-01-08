#!/data/data/com.termux/files/usr/bin/bash

# Dependencies Installation
center "* Dependencies installation..."
pkg update -y
pkg upgrade -y -o Dpkg::Options::="--force-confnew"
pkg install -y binutils python autoconf bison clang coreutils curl findutils apr apr-util postgresql openssl readline libffi libgmp libpcap libsqlite libgrpc libtool libxml2 libxslt ncurses make ncurses-utils ncurses git wget unzip zip tar termux-tools termux-elf-cleaner pkg-config git ruby -o Dpkg::Options::="--force-confnew"
apt autoremove -y

# Fix ruby BigDecimal
center "* Fix ruby BigDecimal"
#source <(curl -sL https://github.com/termux/termux-packages/files/2912002/fix-ruby-bigdecimal.sh.txt)
wget https://github.com/andr3oix/nokogiri/releases/download/Nokogiri/nokogiri-1.14.5.tar.gz
cd $HOME;tar xf nokogiri-1.14.5.tar.gz;rm $HOME/nokogiri-1.14.5.tar.gz*

# Fix nokogiri rubygem
bundle config build.nokogiri "--use-system-libraries --with-xml2-include=${PREFIX}/include/libxml2"
rm -rf $PREFIX/include/;rm -rf $PREFIX/opt/metasploit-framework/lib;rm $PREFIX/lib/libxml2.so*;rm $PREFIX/lib/libxslt.so

# Building 
cp -r $HOME/.nokogiri/nokogiri-1.14.5/* $PREFIX/
cp $HOME/.nokogiri/so/* $PREFIX/lib/
cp -r $HOME/.nokogiri/resolv/* $PREFIX/opt/metasploit-framework/


# Link Metasploit Executables
ln -sf ${PREFIX}/opt/metasploit-framework/msfconsole ${PREFIX}/bin/
ln -sf ${PREFIX}/opt/metasploit-framework/msfvenom ${PREFIX}/bin/
ln -sf ${PREFIX}/opt/metasploit-framework/msfrpcd ${PREFIX}/bin/
termux-elf-cleaner ${PREFIX}/lib/ruby/gems/*/gems/pg-*/lib/pg_ext.so

echo -e "\033[32m" # Blue color
center "Installation complete"
echo -e "\nDone"
echo -e "\033[0m" # Reset color
 # Blue color
center "Installation complete"
echo -e "\nStart Metasploit using the command: msfconsole"
echo -e "\033[0m" # Reset color
