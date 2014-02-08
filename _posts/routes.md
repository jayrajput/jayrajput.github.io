Date: 2013-06-09
Title: Routing Table Entries.

The routes are used to access hosts in the network. The hosts can either be in 
* Same broadcast domain i.e. directly accessible without gateway
* Accessible using a gateway

The routing table can be printed by using these commands:
* route -n
* netstat -rn


    Example Kernel IP routing table:
    Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
    192.168.2.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
    192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 ra0
    169.254.0.0     0.0.0.0         255.255.0.0     U     1000   0        0 eth0
    0.0.0.0         192.168.1.1     0.0.0.0         UG    100    0        0 ra0

Flags: U = Route is UP, G = Gateway, H = Host
Metric: Distance to the target. Generally hop count.
Gateway: Gateway address or *

What I really want to remember for myself is that the entries which do
not need the gateway are the one which are in the same broadcast
domain. Seems easy but somehow did not made sense to me before.

When a packet is received by an interface, in most cases it has to send
back a response to the source address. To send a response to the
source address, it will use the route tables. First a specific route
is choosen. Only when a specific route is not available, then only a
generic route is used.

Sometimes due to issues (unknown to me), the hosts in the same network
may not be accessible directly but the hosts may be accessible by
gateway. You can workaround the problem by adding a route using the
gateway for such issue.
