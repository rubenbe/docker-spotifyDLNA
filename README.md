# What is it
I have an older DAB Radio which support streaming from DLNA.
This image contains a spotify to DLNA bridge based on librespot and pulseaudio-dlna

```
docker run --rm --net=host  <imagename>
```

# TODO
* Reduce size by using a build container
* Better process management instead of backgrounding and sleeping
* Don't run everything as root
