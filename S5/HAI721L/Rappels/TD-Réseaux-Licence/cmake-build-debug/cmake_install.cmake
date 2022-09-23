<<<<<<< HEAD
# Install script for directory: C:/Users/doudy/Documents/1MPORTANT/Moi/Education/M1/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence
=======
# Install script for directory: /home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence
>>>>>>> 382e4dcd387cdc6ff28ce238cbbe673b3b10a9b5

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/fichiers_Exo1_TCP")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
<<<<<<< HEAD
  set(CMAKE_OBJDUMP "D:/CLion 2022.2.3/bin/mingw/bin/objdump.exe")
=======
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
>>>>>>> 382e4dcd387cdc6ff28ce238cbbe673b3b10a9b5
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
<<<<<<< HEAD
file(WRITE "C:/Users/doudy/Documents/1MPORTANT/Moi/Education/M1/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence/cmake-build-debug/${CMAKE_INSTALL_MANIFEST}"
=======
file(WRITE "/home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence/cmake-build-debug/${CMAKE_INSTALL_MANIFEST}"
>>>>>>> 382e4dcd387cdc6ff28ce238cbbe673b3b10a9b5
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
