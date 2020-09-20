# Spartan_LLFSM 

LLFSM design for use with the minispartan6+ development board (Spartan 6 LX25 FPGA).

Folder structure:

* interpretor
    - The interpretor is the haskell program which parses the machine format into a vhdl file.
* machines (not tracked by git)
    - This folder is not tracked by git but is a place for machines to be placed.
* projects
    - This folder contains the ise projects.
* reports
    - This folder contains relevant documents.

## Installation
1. Make sure you have cabal and haskell installed
```
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install -y cabal-install ghc
```
2. Install the cabal packages
```
cabal update
cabal install split
cabal install extra
cabal install regex-compat
```
3. Install the interpretor
```
cd interpretor
make
make install
```

## Compilation method
Before running this process, you should have compiled the haskell program by running make in the interpretor directory.

1. Design machine in MiPalCase or MiCase
2. Run the haskell programm passing in the machine by running
    interpretor/main ../machines/<MachineName>.machine
3. The output vhdl file will be found at interpretor/src/<MachineName>.vhd
4. Create a new project in ise
5. Move the source to the project folder
6. Add the source in ise to the project
7. You may need to add variables to the source file. At current external variables in the entity and local variables in architecture statements are not parsed to the vhd file.
