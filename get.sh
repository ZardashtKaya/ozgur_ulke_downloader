#!/bin/bash
year=$1
sessionid="w7v7y75jtfea4rryl7wuoi8h5viyzgxr"
csrftoken="YxLJKbR3ulpb5acVRbCTPlvVhgjYRruPBMw6DY4LPJByYMfrCQyGaLgsje7tVygi"
rm -rf months0.txt months1.txt links.txt links2.txt links3.txt 

# year=2010
curl https://ozgurbasinarsiv.com/Arsiv/Gundem/ -s | grep $year | grep -v strong | cut -d '"' -f2 | grep $year | grep -v Arsiv > months0.txt
echo "Getting The Months..."
for i in $(cat months0.txt)
    do 
        echo $i
        echo https://ozgurbasinarsiv.com/Arsiv/Gundem/$i?page=1 >> months1.txt
        echo https://ozgurbasinarsiv.com/Arsiv/Gundem/$i?page=2 >> months1.txt
    done
echo "Grabbing Links for each magazine..."
for i in $(cat months1.txt)
    do
        echo $i
        curl $i -s | grep s-01 | cut -d "/" -f4 >> links.txt
    done
echo "Grabbing Links for each page..."
for i in $(cat links.txt)
    do
    echo "Running on -> "$i
    curl "https://ozgurbasinarsiv.com/Arsiv/Gundem/$i/" -H "Cookie: csrftoken=$csrftoken; sessionid=$sessionid"   --compressed -s | grep Arsiv | grep -v \<h7\>  | cut -d "/" -f4 >> links2.txt 
    done


for i in $(cat links2.txt)
    do
    echo "grabbing image for ->" $i

    curl "https://ozgurbasinarsiv.com/Arsiv/Gundem/$i/" -H "Cookie: csrftoken=$csrftoken; sessionid=$sessionid"   --compressed -s | grep data-zoom | cut -d " " -f6 | cut -d "/" -f3,4,5 | cut -d '"' -f1 >> links3.txt
    done

for i in $(cat links3.txt)
    do
    echo "making correct link for ->" $i
    echo "https://ozgurbasinarsiv.com/media/""$(echo $i | cut -d ":" -f2)" >> links_to_download.txt
    done 

rm months0.txt months1.txt links.txt links2.txt links3.txt 
mkdir Downloads
echo "Go ahead and download all the files in 'links_to_download.txt' and continue by running fix.sh"
