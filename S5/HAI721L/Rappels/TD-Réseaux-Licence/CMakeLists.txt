cmake_minimum_required(VERSION 3.23)
project(fichiers_Exo1_TCP C)

set(CMAKE_C_STANDARD 99)

add_executable(fichiers_Exo1_TCP_Serveur serveur.c)
add_executable(fichiers_Exo1_TCP_Client client.c)
