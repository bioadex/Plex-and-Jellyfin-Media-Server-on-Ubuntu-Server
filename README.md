# plex and Jellyfin
Plex is use to host your media server you can stream online video and host it yourself. you can watch also live TV and movies  
Jellyfin is media-server applications for media you already have, jellyfin explicitly focuses on managing and streaming your own media.   
<img width="1904" height="833" alt="image" src="https://github.com/user-attachments/assets/a42eec13-34b5-4861-9150-66df8f063146" />
<img width="1918" height="874" alt="image" src="https://github.com/user-attachments/assets/ce964f46-91bf-43c7-acb4-14443bf07422" />

```text
Internet / LAN
        │ ▼
┌────────────────────┐
│ Nginx Proxy Manager │
└─────────┬──────────┘
          │
nginx_proxy Docker network
     ┌────┴────┐
     │         │
     ▼         ▼
┌──────────┐┌──────────┐
│ Jellyfin │  │ Plex │
└────┬─────┘└────┬─────┘
     │           │
    └──────┬──────┘
           │
           ▼
 /mnt/media/movies
           │
    Movie Library
```

```text
/opt/
└── jellyfin/
    ├── docker-compose.yml
    ├── config/
    └── cache/
/root/docker/
    └── plex/
    ├── docker-compose.yml
    └── config/
/mnt/media/
    └── movies/
    ├── Actions/
    ├── Biographies/
    ├── Comedies/
    └── ...

media-server/
│ ├── README.md
│
├── jellyfin/
│ └── docker-compose.yml
│
├── plex/
│ └── docker-compose.yml
│
├── nginx-proxy-manager/
│ └── README.md
│
├── samba/
│ └── smb.conf.example
│ └── docs/
  ├── troubleshooting.md
  ├── storage.md
  └── hardware-transcoding.md
```

