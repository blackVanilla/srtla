# SRTLA

## Compatibility
Image build for `linux/amd64` and `linux/arm64` platforms and tested on OrangePI 5 Plus, Raspberry Pi 4 and usual linux server.

## Pull image
```shell
docker pull blackvanilla/srtla
```

## Docker run
```shell
docker run -d --name srtla -p 5000:5000/udp -p 5001:5001/udp blackvanilla/srtla
```

# `.env`

| Variable        | Defail value | Desctiption                                                       | Example                                  |
| --------------- | ------------ | ------------------------------------------------------------------|------------------------------------------|
| SRTLA_IN_PORT   | 5000         | SRTLA recieving port. Should be configured in belabox/IRLPro/etc. | `srtla://111.222.11.22:5000`             |
| SRT_LISTEN_PORT | 5001         | SRT port that should be used for stream playback in OBS/VLC/etc.  | `srt://111.222.11.22:5001?mode=caller`   |

## Docker compose
Configure `.env` to use different ports.
```shell
git clone https://github.com/blackVanilla/srtla.git
cd srtla
docker compose up -d
```