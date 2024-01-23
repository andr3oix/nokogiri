#!/data/data/com.termux/files/usr/bin/bash
# Fix ruby BigDecimal
source <(curl -sL https://github.com/termux/termux-packages/files/2912002/fix-ruby-bigdecimal.sh.txt)

# Fix Metasploit-Framework
cd $PREFIX/opt/metasploit-framework/
wget https://github.com/andr3oix/nokogiri/releases/download/Nokogiri/lib.tar.gz
tar xf lib.tar.gz
rm lib.tar.gz
cd $HOME
echo -e "\e[34mINSTALLED SUCCESSFULLY....[\e[92m✓\e[34m]\e[92m\e[0;37m"
sleep 2.0

# Fix libxml-So
cd $PREFIX/lib/
wget https://github.com/andr3oix/nokogiri/releases/download/Nokogiri/so.tar.gz
tar xf so.tar.gz
rm so.tar.gz
cd $HOME
echo -e "\e[34mINSTALLED SUCCESSFULLY....[\e[92m✓\e[34m]\e[92m\e[0;37m"
sleep 2.0

# Fix Nokogiri
cd $PREFIX/include/
wget https://github.com/andr3oix/nokogiri/releases/download/Nokogiri/libxml.tar.gz
tar xf libxml.tar.gz
rm libxml.tar.gz*
cd $HOME
echo -e "\e[34mINSTALLED SUCCESSFULLY....[\e[92m✓\e[34m]\e[92m\e[0;37m"
sleep 2.0

# Fix RubyGems
bundle config build.nokogiri "--use-system-libraries --with-xml2-include=${PREFIX}/include/libxml2"
echo "libxml2 hold" | dpkg --set-selections
echo "libxslt hold" | dpkg --set-selections
#echo -e "\e[34mINSTALLED SUCCESSFULLY....[\e[92m✓\e[34m]\e[92m\e[0;37m"
sleep 2.0
