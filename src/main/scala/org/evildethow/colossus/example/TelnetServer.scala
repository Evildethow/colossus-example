package org.evildethow.colossus.example

import colossus.IOSystem
import colossus.core.ServerRef
import colossus.service._
import colossus.protocols.telnet._


object TelnetServer {

  def start(port: Int)(implicit io: IOSystem): ServerRef = {
    Service.become[Telnet]("telnet-test", port) {
      case TelnetCommand("exit" :: Nil) => TelnetReply("Bye!").onWrite(OnWriteAction.Disconnect)
      case TelnetCommand(List("say", arg)) => TelnetReply(arg)
      case TelnetCommand("version" :: Nil) =>
        val p = getClass.getPackage
        val name = p.getImplementationTitle
        val version = p.getImplementationVersion
        TelnetReply(s"""{"name": "$name", "version": "$version"}""")
      case other => TelnetReply(other.toString)
    }
  }
}
