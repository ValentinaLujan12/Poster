import yt_dlp

# Enlace del video
video_url = 'https://www.youtube.com/watch?v=DIN312pQsD4&list=PL2iUgLmO20Ul4GwCMy4Kj79CDFZBHYjfg&index=6'

# Configuración de descarga
ydl_opts = {
    'format': 'best',
    'outtmpl': 'video_4/video_bacteria.mp4'
}

# Descargar el video
with yt_dlp.YoutubeDL(ydl_opts) as ydl:
    ydl.download([video_url])

