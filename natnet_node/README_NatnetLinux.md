# NatNetLinux

The purpose of this package is to provide a lightweight library to read
NaturalPoint's NatNet UDP packets in Unix-based OSs.

## Copyright

All parts of NatNetLinux are Copyright 2013,
Philip G. Lee <rocketman768@gmail.com>.

NatNetLinux is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.
    
NatNetLinux is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
    
You should have received a copy of the GNU General Public License
along with NatNetLinux;if not, write to the Free Software Foundation,
Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA, or visit
http://www.gnu.org/copyleft/gpl.html

## Prerequisites

### Required

* `cmake` - version 2.8 or later
* `boost` - with `system` and `thread` components

On Debian-based systems (like Ubuntu), this will install the required
components:

    $ sudo apt-get install cmake libboost-dev libboost-program-option-dev libboost-system-dev libboost-thread-dev

### Optional

* `git` - if you want to clone directly from the repository
* `doxygen` - if you want to build the documentation

On Debian-based systems (like Ubuntu), this will install the optional
components:

    $ sudo apt-get install git doxygen

## Compiling and Installing

    $ cd ~
    $ git clone https://github.com/rocketman768/NatNetLinux.git NatNetLinux
    $ mkdir build
    $ cd build
    $ cmake ../NatNetLinux
    $ make
    $ sudo make install

## Examples

Please find `src/SimpleExample.cpp` in the source code. It has all the basic
elements of using this library.

## Documentation

The `doc` target will generate doxygen documentation if doxygen is installed.
The html index page will be generated in `build/doc/html/index.html`, which
you can open with any web browser.

