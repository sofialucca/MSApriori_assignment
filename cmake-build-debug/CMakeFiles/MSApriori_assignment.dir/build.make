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
CMAKE_COMMAND = "C:\Users\slucca2\AppData\Local\JetBrains\CLion 2022.2.3\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Users\slucca2\AppData\Local\JetBrains\CLion 2022.2.3\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\slucca2\Documents\MSApriori_assignment

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\slucca2\Documents\MSApriori_assignment\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/MSApriori_assignment.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/MSApriori_assignment.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/MSApriori_assignment.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MSApriori_assignment.dir/flags.make

CMakeFiles/MSApriori_assignment.dir/main.cpp.obj: CMakeFiles/MSApriori_assignment.dir/flags.make
CMakeFiles/MSApriori_assignment.dir/main.cpp.obj: ../main.cpp
CMakeFiles/MSApriori_assignment.dir/main.cpp.obj: CMakeFiles/MSApriori_assignment.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\slucca2\Documents\MSApriori_assignment\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/MSApriori_assignment.dir/main.cpp.obj"
	C:\Users\slucca2\AppData\Local\JETBRA~1\CLION2~1.3\bin\mingw\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MSApriori_assignment.dir/main.cpp.obj -MF CMakeFiles\MSApriori_assignment.dir\main.cpp.obj.d -o CMakeFiles\MSApriori_assignment.dir\main.cpp.obj -c C:\Users\slucca2\Documents\MSApriori_assignment\main.cpp

CMakeFiles/MSApriori_assignment.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MSApriori_assignment.dir/main.cpp.i"
	C:\Users\slucca2\AppData\Local\JETBRA~1\CLION2~1.3\bin\mingw\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\slucca2\Documents\MSApriori_assignment\main.cpp > CMakeFiles\MSApriori_assignment.dir\main.cpp.i

CMakeFiles/MSApriori_assignment.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MSApriori_assignment.dir/main.cpp.s"
	C:\Users\slucca2\AppData\Local\JETBRA~1\CLION2~1.3\bin\mingw\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\slucca2\Documents\MSApriori_assignment\main.cpp -o CMakeFiles\MSApriori_assignment.dir\main.cpp.s

# Object files for target MSApriori_assignment
MSApriori_assignment_OBJECTS = \
"CMakeFiles/MSApriori_assignment.dir/main.cpp.obj"

# External object files for target MSApriori_assignment
MSApriori_assignment_EXTERNAL_OBJECTS =

MSApriori_assignment.exe: CMakeFiles/MSApriori_assignment.dir/main.cpp.obj
MSApriori_assignment.exe: CMakeFiles/MSApriori_assignment.dir/build.make
MSApriori_assignment.exe: CMakeFiles/MSApriori_assignment.dir/linklibs.rsp
MSApriori_assignment.exe: CMakeFiles/MSApriori_assignment.dir/objects1.rsp
MSApriori_assignment.exe: CMakeFiles/MSApriori_assignment.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\slucca2\Documents\MSApriori_assignment\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable MSApriori_assignment.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\MSApriori_assignment.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MSApriori_assignment.dir/build: MSApriori_assignment.exe
.PHONY : CMakeFiles/MSApriori_assignment.dir/build

CMakeFiles/MSApriori_assignment.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\MSApriori_assignment.dir\cmake_clean.cmake
.PHONY : CMakeFiles/MSApriori_assignment.dir/clean

CMakeFiles/MSApriori_assignment.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\slucca2\Documents\MSApriori_assignment C:\Users\slucca2\Documents\MSApriori_assignment C:\Users\slucca2\Documents\MSApriori_assignment\cmake-build-debug C:\Users\slucca2\Documents\MSApriori_assignment\cmake-build-debug C:\Users\slucca2\Documents\MSApriori_assignment\cmake-build-debug\CMakeFiles\MSApriori_assignment.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/MSApriori_assignment.dir/depend

