version: "3.9"

services:
  plex:
    image: linuxserver/plex:latest
    container_name: plex
    restart: unless-stopped
    environment:
      - PUID=1000            # Replace with your user ID
      - PGID=1000            # Replace with your group ID
      - TZ=Europe/Berlin     # Change to your timezone
      - VERSION=docker
      # Optional: if you want to claim your Plex server
      # - PLEX_CLAIM=claim-xxxxxxxxxxxxxxxxxxxx
    volumes:
      - /root/docker/plex/config:/config         # Plex configuration
      - /root/docker/plex/tv:/data/tvshows       # TV shows
      - /root/docker/plex/movies:/data/movies    # Movies
      - /root/docker/plex/music:/data/music      # Music
      - /root/docker/plex/transcode:/transcode   # Transcode temp files
    ports:
      - 32400:32400/tcp
      - 32469:32469/tcp
      - 1900:1900/udp
      - 32410:32410/udp
      - 32412:32412/udp
      - 32413:32413/udp
      - 32414:32414/udp
    networks:
      - nginx_proxy

networks:
  nginx_proxy:
    external: true
