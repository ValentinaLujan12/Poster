import cv2
import os

# Crear una carpeta para guardar las imágenes
if not os.path.exists('imagenes_bacteria'):
    os.makedirs('video_1/imagenes_bacteria')

# Cargar el video
video = cv2.VideoCapture('video_1/video_bacteria.mp4')

# Frame rate (cuántos cuadros por segundo)
fps = video.get(cv2.CAP_PROP_FPS)

# Definir cada cuántos frames queremos guardar una imagen (Ej: cada 0.5 segundos)
frame_interval = int(fps)

# Contador de frames
frame_count = 0

# Loop para leer el video frame por frame
while True:
    ret, frame = video.read()
    
    if not ret:
        break
    
    # Guardar el frame si es el correcto según el intervalo
    if frame_count % frame_interval == 0:
        img_name = f'video_1/imagenes_bacteria/frame_{frame_count}.png'
        cv2.imwrite(img_name, frame)
    
    frame_count += 1

# Liberar el video
video.release()
