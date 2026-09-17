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
      - /mnt/media/movies:/movies                # Movies
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

____________________________________________________________________________________________

services:
  jellyfin:
    image: jellyfin/jellyfin:12.0
    container_name: jellyfin

    networks:
      - nginx_proxy

    volumes:
      - /opt/jellyfin/config:/config
      - /opt/jellyfin/cache:/cache
      - /mnt/media/movies:/movies:ro

    devices:
      - /dev/dri/renderD128:/dev/dri/renderD128

    group_add:
      - "109"

    restart: unless-stopped

networks:
  nginx_proxy:
    external: true

