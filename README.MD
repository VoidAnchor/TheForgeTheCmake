# The Forge The CMake
A set of CMake files for The Forge's (formerly ConfettiFX) fantastic minimalistic rendering framework, The Forge.

# Current Status
Still experimental.  I'm mostly modifying this for my own purposes.  PRs are certainly welcome though.

* It's largely up to date with The Forge 1.51.  Tools and such are still being added.
* Right now I'm bouncing between macOS and Windows, Metal and Vulkan respectively.  I have not really tested DX11/DX12
* Dependencies and the like could be better separated.  Right now they're all being tossed into a giant blob.

# Features
Basically the standard stuff - compiling The Forge as a static or dynamic library, the asset pipeline utility, and so on.  Also some neat flags for API specific generation and so on of build files.

# Future Plans
Probably just update every now and then with The Forge releases.  Also unit tests.  Working on that one.

# Usage
In a terminal, basically just do this from wherever you cloned this to:
```
mkdir build && cd build
cmake ..
```
This will setup the project with some defaults - namely using DX12 on Windows, Vulkan on Linux, and Metal on Apple.  You can change some of this by specifying some command line flags.  For example:
```
cmake .. -DVULKAN=ON -DDX12=ON
```
To enable both Vulkan and DirectX12 support on Windows.

# License
Expect WTFPL for the CMake files themselves: http://www.wtfpl.net/

I don't usually care for heavy or viral licenses.  Just know I do this in my free time between projects, so expect no warranty, support, and so on.  As mentioned above, PRs are welcome though.
