package org.evildethow.colossus.example

import java.net.InetSocketAddress

import akka.actor._
import colossus._

object Main extends App {

  implicit val actorSystem = ActorSystem("colossus-example-actorsystem")
  implicit val ioSystem = IOSystem("colossus-example-iosystem")

  TelnetServer.start(9002)
  HttpRedisServer.start(9001, new InetSocketAddress("localhost", 6379))

}