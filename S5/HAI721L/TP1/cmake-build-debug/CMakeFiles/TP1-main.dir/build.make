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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/davidbinaud/Documents/Univ5/M1/S5/HAI721L/TP1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/davidbinaud/Documents/Univ5/M1/S5/HAI721L/TP1/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/TP1-main.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/TP1-main.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/TP1-main.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/TP1-main.dir/flags.make

CMakeFiles/TP1-main.dir/main.c.o: CMakeFiles/TP1-main.dir/flags.make
CMakeFiles/TP1-main.dir/main.c.o: ../main.c
CMakeFiles/TP1-main.dir/main.c.o: CMakeFiles/TP1-main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/davidbinaud/Documents/Univ5/M1/S5/HAI721L/TP1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/TP1-main.dir/main.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/TP1-main.dir/main.c.o -MF CMakeFiles/TP1-main.dir/main.c.o.d -o CMakeFiles/TP1-main.dir/main.c.o -c /Users/davidbinaud/Documents/Univ5/M1/S5/HAI721L/TP1/main.c

CMakeFiles/TP1-main.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/TP1-main.dir/main.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/davidbinaud/Documents/Univ5/M1/S5/HAI721L/TP1/main.c > CMakeFiles/TP1-main.dir/main.c.i

CMakeFiles/TP1-main.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/TP1-main.dir/main.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/davidbinaud/Documents/Univ5/M1/S5/HAI721L/TP1/main.c -o CMakeFiles/TP1-main.dir/main.c.s

# Object files for target TP1-main
TP1__main_OBJECTS = \
"CMakeFiles/TP1-main.dir/main.c.o"

# External object files for target TP1-main
TP1__main_EXTERNAL_OBJECTS =

TP1-main: CMakeFiles/TP1-main.dir/main.c.o
TP1-main: CMakeFiles/TP1-main.dir/build.make
TP1-main: CMakeFiles/TP1-main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/davidbinaud/Documents/Univ5/M1/S5/HAI721L/TP1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable TP1-main"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TP1-main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/TP1-main.dir/build: TP1-main
.PHONY : CMakeFiles/TP1-main.dir/build

CMakeFiles/TP1-main.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/TP1-main.dir/cmake_clean.cmake
.PHONY : CMakeFiles/TP1-main.dir/clean

CMakeFiles/TP1-main.dir/depend:
	cd /Users/davidbinaud/Documents/Univ5/M1/S5/HAI721L/TP1/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/davidbinaud/Documents/Univ5/M1/S5/HAI721L/TP1 /Users/davidbinaud/Documents/Univ5/M1/S5/HAI721L/TP1 /Users/davidbinaud/Documents/Univ5/M1/S5/HAI721L/TP1/cmake-build-debug /Users/davidbinaud/Documents/Univ5/M1/S5/HAI721L/TP1/cmake-build-debug /Users/davidbinaud/Documents/Univ5/M1/S5/HAI721L/TP1/cmake-build-debug/CMakeFiles/TP1-main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/TP1-main.dir/depend

