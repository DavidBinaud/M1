# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/e20180001426/clion-2022.2.3/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/e20180001426/clion-2022.2.3/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/fichiers_Exo1_TCP_Client.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/fichiers_Exo1_TCP_Client.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/fichiers_Exo1_TCP_Client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/fichiers_Exo1_TCP_Client.dir/flags.make

CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.o: CMakeFiles/fichiers_Exo1_TCP_Client.dir/flags.make
CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.o: ../client.c
CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.o: CMakeFiles/fichiers_Exo1_TCP_Client.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.o -MF CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.o.d -o CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.o -c /home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence/client.c

CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence/client.c > CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.i

CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence/client.c -o CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.s

# Object files for target fichiers_Exo1_TCP_Client
fichiers_Exo1_TCP_Client_OBJECTS = \
"CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.o"

# External object files for target fichiers_Exo1_TCP_Client
fichiers_Exo1_TCP_Client_EXTERNAL_OBJECTS =

fichiers_Exo1_TCP_Client: CMakeFiles/fichiers_Exo1_TCP_Client.dir/client.c.o
fichiers_Exo1_TCP_Client: CMakeFiles/fichiers_Exo1_TCP_Client.dir/build.make
fichiers_Exo1_TCP_Client: CMakeFiles/fichiers_Exo1_TCP_Client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable fichiers_Exo1_TCP_Client"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fichiers_Exo1_TCP_Client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/fichiers_Exo1_TCP_Client.dir/build: fichiers_Exo1_TCP_Client
.PHONY : CMakeFiles/fichiers_Exo1_TCP_Client.dir/build

CMakeFiles/fichiers_Exo1_TCP_Client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/fichiers_Exo1_TCP_Client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/fichiers_Exo1_TCP_Client.dir/clean

CMakeFiles/fichiers_Exo1_TCP_Client.dir/depend:
	cd /home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence /home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence /home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence/cmake-build-debug /home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence/cmake-build-debug /home/e20180001426/Bureau/M1/S5/HAI721L/Rappels/TD-Réseaux-Licence/cmake-build-debug/CMakeFiles/fichiers_Exo1_TCP_Client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/fichiers_Exo1_TCP_Client.dir/depend

