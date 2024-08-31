# Nim-Reverse-Shell
Here is my TCP nim reverse shell that works on both Linux and Windows environments.

## Installation 

To compile the Nim reverse shell code, follow the instructions below:

1) **Ensure Nim is Installed**: Make sure Nim is installed on your Linux system
```bash
sudo apt update
sudo apt install nim
```
2) Install the necessary packages
```bash
nimble install sysinfo
```
## Usage
1) Change the "ip" and "port" variables to the ones you want to listen on.
2) Setup a listener and wait for the callback.


## Compilation
* For Linux, we compile the nim reverse shell with the following command:
```bash
nim c -d:nodebug revshell.nim 
```

* For Windows, we compile the nim reverse shell with the following commmand:
```bash
nim c -d:mingw --app:gui revshell.nim 
```



