# What is it
I have an older DAB Radio which support streaming from DLNA.
This image contains a spotify to DLNA bridge based on librespot and pulseaudio-dlna

```
docker run --rm --net=host  <imagename>
```

Docker compose snipped
```
  spotifydlna:
    image: spotifydlna_ok
    container_name: spotifydlna
    restart: unless-stopped
    network_mode: host
    environment:
      - LIBRESPOT_NAME=spotifydlna
      - PULSEAUDIO_DLNA_OPTS=--codec wav --renderer-urls http://<dlna device ip>:8080/description.xml
      - LIBRESPOT_OPTS=-u login -p password
```

# TODO
* Reduce size by using a build container
* Better process management instead of backgrounding and sleeping
* Don't run everything as root
