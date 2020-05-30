#!/usr/bin/python

import time
import os, sys
import os.path as path
import transmissionrpc
import datetime

# Watch directories
watch_tv = os.environ['RPC_WATCH_TV_FOLDER']
watch_movie = os.environ['RPC_WATCH_MOVIES_FOLDER']
watch_music = os.environ['RPC_WATCH_TV_FOLDER']

# Complete download directories
download_dir_tv = os.environ['RPC_DOWNLOAD_TV_FOLDER']
download_dir_movie = os.environ['RPC_DOWNLOAD_MOVIES_FOLDER']
download_dir_music = os.environ['RPC_DOWNLOAD_MUSIC_FOLDER']

client = transmissionrpc.Client(
    address=os.environ['RPC_CLIENT_HOST'],
    port=os.environ['RPC_CLIENT_PORT'],
    user=os.environ['RPC_CLIENT_USER'],
    password=os.environ['RPC_CLIENT_PASSWORD']
    )

# Logging
log = open('/var/log/python-rpc-folders.txt', 'a')
timestamp = '[{:%Y-%m-%d %H:%M:%S}]'.format(datetime.datetime.now())
print(timestamp +  ' ' + 'Started watch script.', file=log)
print('Current watch directories:', file=log)
print('    TV: ' + watch_tv, file=log)
print('Movies: ' + watch_movie, file=log)
print(' Music: ' + watch_music, file=log)
print('Current download directories:', file=log)
print('    TV: ' + download_dir_tv, file=log)
print('Movies: ' + download_dir_movie, file=log)
print(' Music: ' + download_dir_music, file=log)
log.close()

def add(watch_dir, download_dir):
    directory = os.listdir(watch_dir)
    files = next(os.walk(watch_dir))[2]
    if files: # files exist in directory
        for file in files:
            if file.lower().endswith('.torrent') and not file.lower().startswith('.'):
                log = open('/var/log/python-rpc-folders.txt', 'a')
                timestamp = '[{:%Y-%m-%d %H:%M:%S}]'.format(datetime.datetime.now())

                try:
                    print(timestamp + ' ' + 'Adding torrent: ' + file, file=log)
                    with open(watch_dir + '/' + file, "rb") as f:
                        encoded = base64.b64encode(f.read())
                    newTorrent = client.add_torrent(encoded, download_dir=download_dir)
                    time.sleep(1)
                    newTorrent.start()
                    os.remove(watch_dir + '/' + file)
                except Exception as e:
                      print(timestamp + ' ' + 'Error encountered: ' + str(e), file=log)

                log.close()
                time.sleep(1)

while True:
    log = open('/var/log/python-rpc-folders.txt', 'a')
    timestamp = '[{:%Y-%m-%d %H:%M:%S}]'.format(datetime.datetime.now())
    print(timestamp + ' ' + 'Searching directories.', file=log)
    add(watch_tv, download_dir_tv)
    add(watch_movie, download_dir_movie)
    add(watch_music, download_dir_music)
    log.close()
    time.sleep(30)
