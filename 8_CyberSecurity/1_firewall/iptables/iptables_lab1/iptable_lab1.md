# Iptables lab 1

## Description

Introduction to iptables : How it works

## Usage

### main info :

- rules : characteristic that a packet must have to match the rule and the action to take (target)
- target : action to take when a packet match a rule
- chains : set of rules that a packet is check against sequentially

Three chains by default (filter) :
- INPUT
- OUTPUT
- FORWARD

iptables = > ipv4
ip6tables => ipv6

### practical info :

- Defining Chain Rules (adding new one) : 
```
sudo iptables -A <chain> -i <interface> -p <protocol (tcp/udp) > -s <source> --dport <port no.>  -j <target>
```

with options :
```
-A - For "append", adding new rule
-i (interface) — the network interface whose traffic you want to filter, such as eth0, lo, ppp0, etc.
-p (protocol) — the network protocol where your filtering process takes place. It can be either tcp, udp, udplite, icmp, sctp, icmpv6, and so on. Alternatively, you can type all to choose every protocol.
-s (source) — the address from which traffic comes from. You can add a hostname or IP address.
–dport (destination port) — the destination port number of a protocol, such as 22 (SSH), 443 (https), etc.
-j (target) — the target name (ACCEPT, DROP, RETURN). You need to insert this every time you make a new rule.
```

## source : 

- digital ocean how iptable works : https://www.digitalocean.com/community/tutorials/how-the-iptables-firewall-works