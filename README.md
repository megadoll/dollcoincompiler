# dollcoincompiler
Bitcoin theory explained with scheme and ruby


1.1
* added the RPC compiler


1.2
* expanded the network RPC
* implemented ip technology with the script 'getaddednodeinfo.rb'

ip technolofy features:

• Creates a new ipaddr containing the given network byte ordered string form of an IP address
• Returns a new ipaddr built by bitwise AND. 
• Returns a new ipaddr built by bitwise left shift. 
• Compares the ipaddr with another.
• Returns true if two ipaddrs are equal. 
• Returns a new ipaddr built by bitwise right-shift. 
• Checks equality used by Hash. 
• Returns a hash value used by Hash, Set, and Array classes 
• Returns a network byte ordered string form of the IP address.
• Returns true if the given ipaddr is in the range.
• Returns a string containing a human-readable representation of the ipaddr.
• Returns a string for DNS reverse lookup compatible with RFC3172. (https://tools.ietf.org/html/rfc3172)
• Returns a string for DNS reverse lookup compatible with RFC1886.(https://tools.ietf.org/html/rfc1886)
• Returns true if the ipaddr is an IPv4 address. 
• Returns a new ipaddr built by converting the native IPv4 address into an IPv4-compatible IPv6 address.
• Returns true if the ipaddr is an IPv4-compatible IPv6 address.
• Returns a new ipaddr built by converting the native IPv4 address into an IPv4-mapped IPv6 address. 
• Returns true if the ipaddr is an IPv4-mapped IPv6 address.
• Returns true if the ipaddr is an IPv6 address.
• Returns a new ipaddr built by masking IP address with the given prefixlen/netmask. (e.g. 8, 64, “255.255.255.0”, etc.)
• Returns a new ipaddr built by converting the IPv6 address into a native IPv4 address. 
• If the IP address is not an IPv4-mapped or IPv4-compatible IPv6 address, returns self.
• Returns a string for DNS reverse lookup. It returns a string in RFC3172 form for an IPv6 address.
• Returns the successor to the ipaddr.
• Returns the integer representation of the ipaddr.
• Creates a Range object for the network address.
• Returns a string containing the IP address representation.
• Returns a string containing the IP address representation in canonical form.
• Returns a string containing the IP address representation in canonical form.
• Returns a new ipaddr built by bitwise OR.
• Returns a new ipaddr built by bitwise negation.
• Set current netmask to given mask.


1.3

• custom ping
• list of banned addresses script



1.4

* implemented socket forwarding technology for p2p network activity
* finished the network rpc 'ruby' program
* started the blockchain rpc 'r' program




1.5

added blockchain server technology

* added user registration with email and password as identity
* wallets connection, in bulk mode and in single address mode
* added a feature to integrate a store either for receiving payment from your customers or for paying your
  customers in the following crypto currencies

 BTC Bitcoin
 LTC Litecoin
 ETH Ethereum
 Ethereum Tokens
 Monero wallet
 Tezos wallet
 EOS wallet
 EOS Tokens
 Digibyte wallet
 Reddcoin
 Ravencoin
 Kusama wallet
 Xenios coin
 Oduwa coin
 TUSC

and added their respective connection status



1.6

Store Management Update

* added lightning technology
* added listing of all stores



1.7

Mining Technology

* the block template calculates the network activity in terms of satoshis for a period 768 cycles
* prints a maximum ammount of 384 transactions per services registered on network activity daily
* you can print the miner activity in the past six 24 hour cycles, (6 days of 24 hours mining)
* a matrix of 96 periods every hour reports to 1 cycle every day
* getmininginfo.json explain the mininginfo in terms of its activity per component specified, you can use:

 blocks
 current block weight
 current block transaction id (TXID) <3
 difficulty 

(difficutly can depend either on hardware, firmware, or software or all of them, i designed it with R because its mathematecally consistent in the sense that you can adapt a program's performance in terms of standard difficulty that is 144 blocks daily, super slow because all the job is done by the mining hardware with data science and without data mining to regulate the levels of performance, all hardware is different and R allows your program to adapt performance while balancing resource consumption, in this very simple program i added a quicker difficulty because i need a smaller miner with lot less energy consumption, today's most common mining software are giant ipv4 dns addresses with low subnet mask addresses in web interfaces that really consume as much as the rig as the client's desktop, i designed an automation daemon to reduce the costs of reporting the system with lots of activity and in the midst of the reporting consumming CPU while the web interface is closed, and is just a broadcast storm, that being said i have taken a mathematical computational analysis based on mathematics, i stoped using programming skills to explain it for this case and want to clearify what difficulty is the following way)

if a poorly written software consumes resources on the mining rig to obtain the data through a GUI, let the GUI rest for a while, use a terminal emulator as a calculator between the cable=subnet_mask and the mining process=network stability in this sense:

![myimage-alt-tag](https://i.imgur.com/z00wgKT.png)

represented this way

![myimage-alt-tag](https://i.imgur.com/xXAvCcf.png)

where the number '1' represents the miner state of active and sending network activity to an ISO model with a switch and a router, 'x' will be the amount of unknown blocks holding the transaction data and outside the parenthesis the exponent 4 will be the constant difficulty, so far i tested this with a macbook pro running R-Studio, it didn't melted my computer, in fact it runs the entire block deduction of 6 days in just 2 seconds or so, real quick and is not a resource intense operation, that means the stability factor that most pre 2011 miners had to deal with in terms of not abusing their mining rigs because the electrcity consumption was not a fixed number

so to recap with an example lets see it in action:

![myimage-alt-tag](https://i.imgur.com/EaEc6xo.png)

(one plus x) to the fourth:
	• mining operation in the hardware

and the operation after the equals sign, represents time periods increasing, amount of blocks are the number before the x increasing(its called the binomial coefficient) and the amount of satoshis forming one bitcoin increasing, while difficulty (in this example is 4) stays constant, can also be represetned as a division multiplied by the result of a subtraction

![myimage-alt-tag](https://i.imgur.com/6ShLf6N.png)

that's about difficulty which is always an important step to be configured in smooth mechanics

 network hash per second
 pool transaction sigining identifier
 the chain of events
 the warnings

all of this in a 4 by 2 small matrix as a json small program

