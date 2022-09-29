cmake_minimum_required(VERSION 3.23)
project(TP1 C)

set(CMAKE_C_STANDARD 99)

add_executable(TP1-processus Processus.c)
add_executable(TP1-processusUDP ProcessusUDP.c)
add_executable(TP1-serveur serveur.c)
