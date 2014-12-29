import os
import string
import subprocess

__all__=('extract_youtube_mp3')

# uses 'youtube-dl' python script to extract an mp3 format audio file of a given youtube video 

def extract_youtube_mp3(youtube_url=None):
    assemble_cmd = "youtube-dl -x --audio-format mp3 %s" % (youtube_url)
    subprocess.call(assemble_cmd, shell=True)

if __name__ == "__main__":
    youtube_url = raw_input("Please enter the url of the youtube video: ")
    extract_youtube_mp3(youtube_url)


