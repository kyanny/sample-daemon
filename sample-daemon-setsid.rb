#!/usr/bin/env ruby

exit if fork
Process.setsid
sleep 1 while true
