# WORK IN PROGRESS
This is only theorical for the moment, the plan is to dockerize this little tool to be able to add as addon in a media docker stack (and sync the watchfolders with a cloud storage for my personal 	example)


#### Working with environment variables 
| Variable                             | Use           | ....  |
| -------------------------------------|:-------------:| -----:|
| RPC_WATCH_TV_FOLDER                  |               |       |
| RPC_WATCH_MOVIES_FOLDER              |               |       |
| RPC_WATCH_TV_FOLDER                  |               |       |
| RPC_DOWNLOAD_TV_FOLDER               |               |       |
| RPC_DOWNLOAD_MOVIES_FOLDER           |               |       |
| RPC_DOWNLOAD_MUSIC_FOLDER            |               |       |
| RPC_CLIENT_HOST                      |               |       |
| RPC_CLIENT_PORT                      |               |       |
| RPC_CLIENT_USER                      |               |       |
| RPC_CLIENT_PASSWORD                  |               |       |
####  Logs

For now, the logs will come in this folder so feel free to make a volume. 
It is not my priority, but best would be to access it via docker logs also 

/opt/logs

## Transmission Watch Folders
A small Python script which provides a way to automate multiple watch directories when using `TransmissionDaemon`, a CLI version of the popular Transmission torrent client.

The script runs in the background and searches the specified watch directories for torrent files, every 1 minute by default.

### Getting Started

#### Prerequisites
* `Docker`
* `Transmission`
* The ability to run the script on the same server as the transmission daemon

#### Installing

#### Configuration


#### Adding Or Removing Directories
Because this is a pretty quick-and-dirty solution, there is only 3 watchfolders. But as open source is open, don't hesitate to pull requests. 


#### Other Notes
Tested on Ubuntu Server 16.04 LTS.
