# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "D:\CLion 2022.2.3\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "D:\CLion 2022.2.3\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\doudy\Documents\1MPORTANT\Moi\Education\M1\M1\S5\HAI721L\Rappels\TD-Réseaux-Licence

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\doudy\Documents\1MPORTANT\Moi\Education\M1\M1\S5\HAI721L\Rappels\TD-Réseaux-Licence\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/flags.make

CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/serveur.c.obj: CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/flags.make
CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/serveur.c.obj: ../serveur.c
CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/serveur.c.obj: CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\doudy\Documents\1MPORTANT\Moi\Education\M1\M1\S5\HAI721L\Rappels\TD-Réseaux-Licence\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/serveur.c.obj"
	"D:\CLion 2022.2.3\bin\mingw\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/serveur.c.obj -MF CMakeFiles\fichiers_Exo1_TCP_Serveur.dir\serveur.c.obj.d -o CMakeFiles\fichiers_Exo1_TCP_Serveur.dir\serveur.c.obj -c C:\Users\doudy\Documents\1MPORTANT\Moi\Education\M1\M1\S5\HAI721L\Rappels\TD-Réseaux-Licence\serveur.c

CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/serveur.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/serveur.c.i"
	"D:\CLion 2022.2.3\bin\mingw\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\doudy\Documents\1MPORTANT\Moi\Education\M1\M1\S5\HAI721L\Rappels\TD-Réseaux-Licence\serveur.c > CMakeFiles\fichiers_Exo1_TCP_Serveur.dir\serveur.c.i

CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/serveur.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/serveur.c.s"
	"D:\CLion 2022.2.3\bin\mingw\bin\gcc.exe" $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Users\doudy\Documents\1MPORTANT\Moi\Education\M1\M1\S5\HAI721L\Rappels\TD-Réseaux-Licence\serveur.c -o CMakeFiles\fichiers_Exo1_TCP_Serveur.dir\serveur.c.s

# Object files for target fichiers_Exo1_TCP_Serveur
fichiers_Exo1_TCP_Serveur_OBJECTS = \
"CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/serveur.c.obj"

# External object files for target fichiers_Exo1_TCP_Serveur
fichiers_Exo1_TCP_Serveur_EXTERNAL_OBJECTS =

fichiers_Exo1_TCP_Serveur.exe: CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/serveur.c.obj
fichiers_Exo1_TCP_Serveur.exe: CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/build.make
fichiers_Exo1_TCP_Serveur.exe: CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/linklibs.rsp
fichiers_Exo1_TCP_Serveur.exe: CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/objects1.rsp
fichiers_Exo1_TCP_Serveur.exe: CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\doudy\Documents\1MPORTANT\Moi\Education\M1\M1\S5\HAI721L\Rappels\TD-Réseaux-Licence\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable fichiers_Exo1_TCP_Serveur.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\fichiers_Exo1_TCP_Serveur.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/build: fichiers_Exo1_TCP_Serveur.exe
.PHONY : CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/build

CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\fichiers_Exo1_TCP_Serveur.dir\cmake_clean.cmake
.PHONY : CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/clean

CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\doudy\Documents\1MPORTANT\Moi\Education\M1\M1\S5\HAI721L\Rappels\TD-Réseaux-Licence C:\Users\doudy\Documents\1MPORTANT\Moi\Education\M1\M1\S5\HAI721L\Rappels\TD-Réseaux-Licence C:\Users\doudy\Documents\1MPORTANT\Moi\Education\M1\M1\S5\HAI721L\Rappels\TD-Réseaux-Licence\cmake-build-debug C:\Users\doudy\Documents\1MPORTANT\Moi\Education\M1\M1\S5\HAI721L\Rappels\TD-Réseaux-Licence\cmake-build-debug C:\Users\doudy\Documents\1MPORTANT\Moi\Education\M1\M1\S5\HAI721L\Rappels\TD-Réseaux-Licence\cmake-build-debug\CMakeFiles\fichiers_Exo1_TCP_Serveur.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/fichiers_Exo1_TCP_Serveur.dir/depend

