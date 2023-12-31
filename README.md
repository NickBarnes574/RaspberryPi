# bcm2835 Library Installation Guide

## Overview

This guide provides step-by-step instructions on how to download and install the bcm2835 library on Ubuntu 20.04. The bcm2835 library is a C library for the Broadcom BCM 2835 as used in the Raspberry Pi, primarily used for accessing the GPIO pins.

## Prerequisites

- Ubuntu 20.04 operating system
- Internet connection
- Basic understanding of terminal commands

## Installation Steps

### Step 1: Download the bcm2835 Library

1. Visit the bcm2835 library webpage: [http://www.airspayce.com/mikem/bcm2835/](http://www.airspayce.com/mikem/bcm2835/)
2. Download the latest version of the bcm2835 library to your `Downloads` folder. Look for a file named `bcm2835-x.xx.tar.gz`, where `x.xx` is the version number.

### Step 2: Extract the Library

1. Open a terminal.
2. Navigate to the Downloads directory:
   ```bash
   cd ~/Downloads
   ```
3. Extract the downloaded file:
   ```bash
   tar -zxvf bcm2835-x.xx.tar.gz
   ```

### Step 3: Compile and Install

1. Change directory to the extracted folder:
   ```bash
   cd bcm2835-x.xx
   ```
2. Run the configure script:
   ```bash
   ./configure
   ```
3. Compile the library:
   ```bash
   make
   ```
4. Optionally, you can run `make check` to check for any errors:
   ```bash
   sudo make check
   ```
   - If the tests fail, review the `src/test-suite.log` for details.

5. Install the library:
   ```bash
   sudo make install
   ```

## Post-installation

- The library will be installed in `/usr/local/lib` and the header file `bcm2835.h` in `/usr/local/include`.
- Remember to link your programs with `-lbcm2835` when compiling.

## Troubleshooting

If you encounter any issues during installation, please check the following:

- Ensure you have the necessary build tools installed (`build-essential` package).
- Verify that you have extracted the bcm2835 library correctly and all files are present.
- For any compilation or installation errors, review the output and logs for specific error messages.

Certainly! Below is an extension to the `README.md` file, including instructions on how to link the bcm2835 library in a `CMakeLists.txt` file for a C project. This will be helpful for anyone trying to use the bcm2835 library in their CMake-based projects.

---

## Linking bcm2835 Library in CMake

If you are using CMake for your project, follow these instructions to link the bcm2835 library to your project.

### Modifying CMakeLists.txt

1. **Locate your CMakeLists.txt file:** This file is usually in the root directory of your project.

2. **Edit CMakeLists.txt:** Add the following lines to your `CMakeLists.txt` file to link the bcm2835 library:

    ```cmake
    # Minimum required version of CMake
    cmake_minimum_required(VERSION 3.16)

    # Project Name
    project(YourProjectName LANGUAGES C)

    # Project Sources
    set(SOURCES
        src/main.c
        # Add other source files here
    )

    # Create executable
    add_executable(YourProjectName ${SOURCES})

    # Link against bcm2835 and other necessary libraries
    target_link_libraries(YourProjectName bcm2835)
    ```

    Replace `YourProjectName` and `src/main.c` with your project's name and source files respectively.

3. **Link the bcm2835 library:** Use `target_link_libraries` to link the bcm2835 library with your executable. If you have other libraries to link (like `Common`, `Networking`, `Threading` in your provided example), add them accordingly.

### Troubleshooting

If you encounter issues with finding the bcm2835 library during compilation, make sure that the library was installed correctly and that the paths in `include_directories` and `target_link_libraries` are correct. Double-check that the bcm2835 library files are in `/usr/local/lib` and `/usr/local/include`.

---

This section in your `README.md` will guide users on how to integrate the bcm2835 library into their CMake projects. Modify as needed to fit the specific requirements or structure of your project.