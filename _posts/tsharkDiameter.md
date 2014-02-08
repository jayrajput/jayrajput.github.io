Date: 2013-09-07
Title: Tshark and Diameter

I love speed and hate being slow. I work in an environment where things are
just slow. Bandwidth is slow, processor is slow. Yeah even in this technical
world, my work environemtn is slow or may be it is just me. Anyway my hatred
for slow things, makes me search for alternatives and so learn more things. I
found that wireshark has a textual counterpart. You thought wireshark is not
slow. Come to my world and try running it over X windows. Anyway, Google has
too much information about the tshark, but the only problem is that it is tough
to understand that information. Here are my few quick examples to read diameter
packet captures. In my world, people do not worry about the disk space and time
and use this tcpdump command to capture packets:

	tcpdump -i any -s 0 -w <myFav.pcap>


I still need to figure out a better way but this works for now.

Once the file is captured, you can view the file with tshark. Here are the
tshark commands to view pcap files with diameter dissector (-d). -r is for read
and -n for not mapping IPs to hostnames.

	tshark -n -r my.pcap -d "tcp.port=3868, diameter"

This command with -R can provide view filters (-R). See only packets for tcp
port 3868:

	tshark -n -r my.pcap -d "tcp.port=3868,diameter" -R "tcp.port==3868 and diameter.cmd.code==280"

This command shows the diameter command code, h2h, e2e, flags but does not
display the AVPs. For Origin-Host AVP in CER, you can use this command. 

	tshark -n -r my.pcap -d "tcp.port=3868,diameter" -R "tcp.port==3868 and diameter.cmd.code==280" -z diameter,avp,257,Origin-Host

For examples, grep diameter here:
http://www.wireshark.org/docs/man-pages/tshark.html

