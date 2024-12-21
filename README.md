# spotify-cover-downloader

## probably the steps I will take
### code stuff
1. connect to spotify api
2. command line enter playlist link
3. for each song in playlist, download the cover art of the album

### assembly
1. with 14x11 grid, place all album covers in google slides
2. figure out how to make it work with 10 4x6 free photos
3. find glass or acrylic panel in requisite size (thrift store perhaps)
4. cut out all photos (oh no)
5. write song title and artist name on all photos (oh no)
6. mod podge to panel
7. write "2024 in music" in a fancy way on the back of the panel (paint probably)

## notes
export client ID and client secret to environment https://developer.spotify.com/dashboard/002d25b5692a4859b81a37ac4dabe3fc/settings
I ended up using jq to do all the response parsing bc I'm lazy and it worked great

## challenges
spotify's api only returns 100 files for a playlist boooo
to get around that, I just deleted the first 100 songs from the playlist, commented out mkdir covers (to prevent the already downloaded covers from being overriden), and set INDEX to 100. in the future, I'll probably retrieve the length of the playlist and download in batches of 50 but this did the trick

## future work (haha)
batching
multiprocessing?
command line arg for playlist url
parse song id so the covers aren't just numbers
automatically generate optimal grid layout
- factorize number
- count how many bits are under
- min underbite wins
generate png of album covers in grid layout instead of putting it into google slides

## installation
git clone 
cd spotify-cover-downloader
chmod +x dev.sh
export CLIENT_ID=your-client-id
export CLIENT_SECRET=your-client-secret
change playlist on line 10
