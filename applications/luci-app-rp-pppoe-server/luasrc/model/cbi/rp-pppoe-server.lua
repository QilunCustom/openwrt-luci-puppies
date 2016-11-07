-- Copyright 2015 Daniel Dickinson <openwrt@daniel.thecshore.com>
-- Licensed to the public under the Apache License 2.0.

local m, s, o

local nixio = require "nixio"

m = Map("pppoe", translate("Roaring Penguin PPPoE Server"),
	translate("PPPoE Server Configuration"))

s = m:section(TypedSection, "pppoe_server", translate("Server Configuration"))
s.addremove = false
s.anonymous = true

o = s:option(Value, "interface", translate("Interface"), translate("Interface on which to listen."))
o.template = "cbi/network_ifacelist"
o.nocreate = true

o = s:option(Value, "ac_name", translate("Access Concentrator Name"))
o.optional = true

o = s:option(DynamicList, "service_name", translate("Service Name"))
o.optional = true

o = s:option(Value, "maxsessionsperpeer", translate("Maximum sessions per peer"))
o.optional = true
o.datatype = "uinteger"

o = s:option(Value, "localip", translate("IP of listening side"))
o.datetype = "ipaddr"

o = s:option(Value, "firstremoteip", translate("First remote IP"))
o.datatype = "ipaddr"

o = s:option(Value, "maxsessions", translate("Maximum sessions"))
o.datatype = "uinteger"
o.default = 64
o.optional = true

o = s:option(Value, "optionsfile", translate("Options file"))
o.default = "/etc/ppp/pppoe-server-options"
o.optional = true

o = s:option(Flag, "randomsessions", translate("Random session selection"), translate("Instead of starting at beginning and going to end, randomize session number"))
o.optional = true

o = s:option(Value, "unit", translate("Unit"), translate("PPP unit number"))
o.optional = true
o.datatype = "uinteger"
o.default = 0

o = s:option(Value, "offset", translate("Offset"), translate("PPP offset"))
o.optional = true
o.datatype = "uinteger"
o.default = 0

o = s:option(Value, "timeout", translate("Timeout"))
o.optional = true
o.datatype = "uinteger"
o.default = 60

o = s:option(Value, "mss", translate("MSS"))
o.optional = true
o.datatype = "uinteger"
o.default = 1468


o = s:option(Flag, "sync", translate("Sync"))
o.optional = true
o.default = false


s = m:section(TypedSection, "pppoeuser", translate("pppoe user config","pppoe user config"))
s.template = "cbi/tblsection"
s.anonymous = true
s.addremove = true

o = s:option(Flag, "enable", translate("enable", "enable"))
o.default = false
o.optional = false
o.rmempty = false

o = s:option(Value, "USERNAME", translate("Username","Username"), translate("Username","Username"))
o.optional = false
o.rmempty = false

o = s:option(Value, "PASSWORD", translate("Password","Password"), translate("Password","Password"))
o.rmempty = false
o.password = true

o = s:option(Value, "IPADDRESS", translate("IPADDRESS","IPADDRESS"), translate("IPADDRESS;default: *","IPADDRESS;default: *"))
o.default = "*"
o.optional = false
o.rmempty = false

return m
