package org.evildethow.colossus.example

import akka.actor._
import colossus._

object Main extends App {

  implicit val actorSystem = ActorSystem("colossus-example-actorsystem")
  implicit val ioSystem = IOSystem("colossus-example-iosystem")

  TelnetServer.start(10010)
}