#!/bin/bash
year=$1
curl https://ozgurbasinarsiv.com/Arsiv/Gundem/ -s | grep $1 | grep -v strong | cut -d '"' -f2 >> months0.txt
for i in $(cat months0.txt); do echo https://ozgurbasinarsiv.com/Arsiv/Gundem/$i?page=1; echo https://ozgurbasinarsiv.com/Arsiv/Gundem/$i?page=2;done >> months1.txt
for i in $(cat months1.txt); do curl $i -s | grep s-01 | cut -d "/" -f4 >> links.txt; done
for i in $(cat links.txt)
    do curl "https://ozgurbasinarsiv.com/Arsiv/Gundem/$i/" -H 'Cookie: csrftoken=sP1iBPvao0FiHj6igzXun3T7ury66HpitaW5hqcr1ZoyVVYpn4WogLjlhsHt8elz; sessionid=319c0500e2j2f2ib6rfl2s1j8wl3kp3m'   --compressed -s | grep Arsiv | grep -v \<h7\>  | cut -d "/" -f4 >> links2.txt 
    done


for i in $(cat links2.txt)
    do echo $i:$(curl "https://ozgurbasinarsiv.com/Arsiv/Gundem/$i/" -H 'Cookie: csrftoken=sP1iBPvao0FiHj6igzXun3T7ury66HpitaW5hqcr1ZoyVVYpn4WogLjlhsHt8elz; sessionid=319c0500e2j2f2ib6rfl2s1j8wl3kp3m'   --compressed -s | grep data-zoom | cut -d " " -f6 | cut -d "/" -f3,4,5 | cut -d '"' -f1) >> links3.txt
    done

for i in $(cat links3.txt)
    do echo "https://ozgurbasinarsiv.com/media/"$(echo $i | cut -d ":" -f2) >> links_to_download.txt
    done 
    rm months0.txt months1.txt links.txt links2.txt links3.txt 
mkdir Downloads
