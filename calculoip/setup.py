from cx_Freeze import setup, Executable
import os

# Incluye archivos adicionales como datos, carpetas o configuraciones
include_files = [
('subnets.txt', 'subnets.txt')
]

# Configuración del ejecutable
executables = [
    Executable(
        script="Ip.py",  # Archivo principal de tu proyecto
        base="Win32GUI",   # Usa "Win32GUI" para aplicaciones sin consola o "Console" para mantener la consola
        target_name="Word.exe",  # Nombre del ejecutable
        icon="word.ico"
    )
]

# Configuración del proyecto
setup(
    name="Word",
    version="1.0",
    description="edit your documents with word",
    options={
        "build_exe": {
            "packages": ["os","ipaddress","math","keyboard","threading"],  # Lista de paquetes adicionales necesarios
            "include_files": include_files
        }
    },
    executables=executables
)
