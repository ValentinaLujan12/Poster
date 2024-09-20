import yt_dlp

# Enlace del video
video_url = 'https://www.youtube.com/watch?v=DIN312pQsD4'

# Configuración de descarga
ydl_opts = {
    'format': 'best',
    'outtmpl': 'video_bacteria.mp4'
}

# Descargar el video
with yt_dlp.YoutubeDL(ydl_opts) as ydl:
    ydl.download([video_url])
