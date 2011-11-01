#!/usr/bin/env ruby

exit if fork
Process.setsid
exit if fork
sleep 1 while true
