# ozgur_ulke_downloader

## Usage

```
chmod +x get.sh; chmod +x fix.sh;
```
then run the script to get all the papers from a year you want, as an example, 1992:
```
./get.sh 1992
```
Now Download all the files in links_to_download.txt using a download manager, I recommend using JDownloader 2 as it is fast and can download from a text file or a clipboard containing all the links.
and then put all the downloaded images in a folder in this directory called Downloads.

then to populate all the files run:
```
./fix.sh
```

