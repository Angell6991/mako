#!/bin/python

#############################################################
###---------Importar_librerys_for_slurp_and_grim----------###
#############################################################
import  os
import  subprocess

###--------Ruta_temporal_para_guardar_la_captura----------###
temp_path = "/tmp/capture.png"

###-------Usar_slurp_y_grim_para_capturar_una_región------###
print("Selecciona un área de la pantalla...")
region = subprocess.check_output(["slurp"]).decode().strip()

###---------Capturar_la_imagen_de_esa_región--------------###
subprocess.run(["grim", "-g", region, temp_path])


#############################################################
###-------------Import_librerys_LaTexOCR------------------###
#############################################################
from    PIL     import  Image
from    pix2tex.cli     import  LatexOCR

###--------------Cargar_la_imagen_capturada---------------###
img = Image.open(temp_path)

###----------------Procesar_con_LatexOCR------------------###
model = LatexOCR()
os.system("clear")
print(model(img))


# Enviar notificación usando notify-send (usa Unicode para el ícono de imagen)
notification_title = "  Processed screenshot:"
notification_body = "LaTeX equation code"  # Preview de resultado

subprocess.run([
    "notify-send",
    notification_title,
    notification_body
])

