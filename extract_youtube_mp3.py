import os
import string
import subprocess

__all__=('extract_youtube_mp3')

def extract_youtube_mp3(youtube_url=None):
    subprocess.call("youtube-dl -s --audio-format mp3 %s" % (youtube_url))

if __name__ == "__main__":
    youtube_url = raw_input("Please enter the url of the youtube video: ")
    extract_youtube_mp3(youtube_url)


