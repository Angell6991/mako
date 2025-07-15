#!/bin/python

#############################################################
###---------Importar_librerys_for_slurp_and_grim----------###
#############################################################
import  subprocess

###--------Ruta_temporal_para_guardar_la_captura----------###
temp_path   =   "/tmp/capture_latex_ocr.png"
temp_file   =   "/tmp/capture_latex_ocr.txt"

###-------Usar_slurp_y_grim_para_capturar_una_región------###
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
print(model(img))


###-------------------Save_file_supotr--------------------###
mol   =   str(model(img))
with open(temp_file , "a") as archivo:
    archivo.write(mol + "\n" + "\n")


###--------Enviar_notificación_usando_notify-send---------###
notification_title = "  Processed screenshot:"
notification_body = "LaTeX equation code"  

subprocess.run([
    "notify-send",
    notification_title,
    notification_body
])

