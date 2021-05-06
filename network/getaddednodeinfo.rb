require 'ipaddr'

ipaddr1 = IPAddr.new "52.55.30.177/30"
p ipaddr1                   #=> #<IPAddr: IPv4:52.55.30.177/255.255.255.252>


# Creates a new ipaddr object either from a human readable IP address representation in string, 
# or from a packed #in_addr value followed by an address family.


def initialize(addr = '::', family = Socket::AF_UNSPEC)
    if !addr.kind_of?(String)
      case family
      when Socket::AF_INET, Socket::AF_INET6
        set(addr.to_i, family)
        @mask_addr = (family == Socket::AF_INET) ? IN4MASK : IN6MASK
        return
      when Socket::AF_UNSPEC
        raise AddressFamilyError, "address family must be specified"
      else
        raise AddressFamilyError, "unsupported address family: #{family}"
      end
    end
    prefix, prefixlen = addr.split('/')
    if prefix =~ /\A\[(.*)\]\z/i
      prefix = $1
      family = Socket::AF_INET6
    end
    # It seems AI_NUMERICHOST doesn't do the job.
    #Socket.getaddrinfo(left, nil, Socket::AF_INET6, Socket::SOCK_STREAM, nil,
    #                  Socket::AI_NUMERICHOST)
    @addr = @family = nil
    if family == Socket::AF_UNSPEC || family == Socket::AF_INET
      @addr = in_addr(prefix)
      if @addr
        @family = Socket::AF_INET
      end
    end
    if !@addr && (family == Socket::AF_UNSPEC || family == Socket::AF_INET6)
      @addr = in6_addr(prefix)
      @family = Socket::AF_INET6
    end
    if family != Socket::AF_UNSPEC && @family != family
      raise AddressFamilyError, "address family mismatch"
    end
    if prefixlen
      mask!(prefixlen)
    else
      @mask_addr = (@family == Socket::AF_INET) ? IN4MASK : IN6MASK
    end
  end

# Creates a new ipaddr containing the given network byte ordered string form of an IP address.

  def IPAddr::new_ntoh(addr)
    return IPAddr.new(IPAddr::ntop(addr))
  end

  # Convert a network byte ordered string form of an IP address into human readable form.
  
  def IPAddr::ntop(addr)
    case addr.size
    when 4
      s = addr.unpack('C4').join('.')
    when 16
      s = IN6FORMAT % addr.unpack('n8')
    else
      raise AddressFamilyError, "unsupported address family"
    end
    return s
  end


 # Returns a new ipaddr built by bitwise AND. 

  def &(other)
    return self.clone.set(@addr & coerce_other(other).to_i)
  end

 # Returns a new ipaddr built by bitwise left shift. 

  def <<(num)
    return self.clone.set(addr_mask(@addr << num))
  end


# Compares the ipaddr with another.
  def <=>(other)
    other = coerce_other(other)
  
    return nil if other.family != @family
  
    return @addr <=> other.to_i
  end




 # Returns true if two ipaddrs are equal. 
  def ==(other)
    other = coerce_other(other)
    return @family == other.family && @addr == other.to_i
  end




 # Returns a new ipaddr built by bitwise right-shift. 
  def >>(num)
    return self.clone.set(@addr >> num)
  end



 # Checks equality used by Hash. 
  def eql?(other)
    return self.class == other.class && self.hash == other.hash && self == other
  end




 # Returns a hash value used by Hash, Set, and Array classes 
  def hash
    return ([@addr, @mask_addr].hash << 1) | (ipv4? ? 0 : 1)
  end

  

  # Returns a network byte ordered string form of the IP address.
def hton
    case @family
    when Socket::AF_INET
      return [@addr].pack('N')
    when Socket::AF_INET6
      return (0..7).map { |i|
        (@addr >> (112 - 16 * i)) & 0xffff
      }.pack('n8')
    else
      raise AddressFamilyError, "unsupported address family"
    end
  end


# Returns true if the given ipaddr is in the range.
# this can also be aliased as a: ===  (triple equality comparison)
def include?(other)
    other = coerce_other(other)
    if ipv4_mapped?
      if (@mask_addr >> 32) != 0xffffffffffffffffffffffff
        return false
      end
      mask_addr = (@mask_addr & IN4MASK)
      addr = (@addr & IN4MASK)
      family = Socket::AF_INET
    else
      mask_addr = @mask_addr
      addr = @addr
      family = @family
    end
    if other.ipv4_mapped?
      other_addr = (other.to_i & IN4MASK)
      other_family = Socket::AF_INET
    else
      other_addr = other.to_i
      other_family = other.family
    end
  
    if family != other_family
      return false
    end
    return ((addr & mask_addr) == (other_addr & mask_addr))
  end


 # Returns a string containing a human-readable representation of the ipaddr. (“#<IPAddr: family:address/mask>”) 
def inspect
    case @family
    when Socket::AF_INET
      af = "IPv4"
    when Socket::AF_INET6
      af = "IPv6"
    else
      raise AddressFamilyError, "unsupported address family"
    end
    return sprintf("#<%s: %s:%s/%s>", self.class.name,
                   af, _to_string(@addr), _to_string(@mask_addr))
  end



# Returns a string for DNS reverse lookup compatible with RFC3172.
def ip6_arpa
    if !ipv6?
      raise InvalidAddressError, "not an IPv6 address"
    end
    return _reverse + ".ip6.arpa"
  end

 # Returns a string for DNS reverse lookup compatible with RFC1886.
 
def ip6_int
    if !ipv6?
      raise InvalidAddressError, "not an IPv6 address"
    end
    return _reverse + ".ip6.int"
  end

 # Returns true if the ipaddr is an IPv4 address. 
def ipv4?
    return @family == Socket::AF_INET
  end


# Returns a new ipaddr built by converting the native IPv4 address into an IPv4-compatible IPv6 address.
def ipv4_compat
    if !ipv4?
      raise InvalidAddressError, "not an IPv4 address"
    end
    return self.clone.set(@addr, Socket::AF_INET6)
  end


# Returns true if the ipaddr is an IPv4-compatible IPv6 address.
def ipv4_compat?
    if !ipv6? || (@addr >> 32) != 0
      return false
    end
    a = (@addr & IN4MASK)
    return a != 0 && a != 1
  end



# Returns a new ipaddr built by converting the native IPv4 address into an IPv4-mapped IPv6 address.  
  def ipv4_mapped
    if !ipv4?
      raise InvalidAddressError, "not an IPv4 address"
    end
    return self.clone.set(@addr | 0xffff00000000, Socket::AF_INET6)
  end


# Returns true if the ipaddr is an IPv4-mapped IPv6 address.
def ipv4_mapped?
    return ipv6? && (@addr >> 32) == 0xffff
  end


# Returns true if the ipaddr is an IPv6 address.
def ipv6?
    return @family == Socket::AF_INET6
  end


# Returns a new ipaddr built by masking IP address with the given prefixlen/netmask. (e.g. 8, 64, “255.255.255.0”, etc.)
def mask(prefixlen)
    return self.clone.mask!(prefixlen)
  end


# Returns a new ipaddr built by converting the IPv6 address into a native IPv4 address. 
# If the IP address is not an IPv4-mapped or IPv4-compatible IPv6 address, returns self.
def native
    if !ipv4_mapped? && !ipv4_compat?
      return self
    end
    return self.clone.set(@addr & IN4MASK, Socket::AF_INET)
  end


# Returns a string for DNS reverse lookup. It returns a string in RFC3172 form for an IPv6 address.
def reverse
    case @family
    when Socket::AF_INET
      return _reverse + ".in-addr.arpa"
    when Socket::AF_INET6
      return ip6_arpa
    else
      raise AddressFamilyError, "unsupported address family"
    end
  end


# Returns the successor to the ipaddr.
def succ
    return self.clone.set(@addr + 1, @family)
  end



# Returns the integer representation of the ipaddr.
def to_i
    return @addr
  end


# Creates a Range object for the network address.
def to_range
    begin_addr = (@addr & @mask_addr)
  
    case @family
    when Socket::AF_INET
      end_addr = (@addr | (IN4MASK ^ @mask_addr))
    when Socket::AF_INET6
      end_addr = (@addr | (IN6MASK ^ @mask_addr))
    else
      raise AddressFamilyError, "unsupported address family"
    end
  
    return clone.set(begin_addr, @family)..clone.set(end_addr, @family)
  end



# Returns a string containing the IP address representation.
def to_s
    str = to_string
    return str if ipv4?
  
    str.gsub!(/\b0{1,3}([\da-f]+)\b/i, '\1')
    loop do
      break if str.sub!(/\A0:0:0:0:0:0:0:0\z/, '::')
      break if str.sub!(/\b0:0:0:0:0:0:0\b/, ':')
      break if str.sub!(/\b0:0:0:0:0:0\b/, ':')
      break if str.sub!(/\b0:0:0:0:0\b/, ':')
      break if str.sub!(/\b0:0:0:0\b/, ':')
      break if str.sub!(/\b0:0:0\b/, ':')
      break if str.sub!(/\b0:0\b/, ':')
      break
    end
    str.sub!(/:{3,}/, '::')
  
    if /\A::(ffff:)?([\da-f]{1,4}):([\da-f]{1,4})\z/i =~ str
      str = sprintf('::%s%d.%d.%d.%d', $1, $2.hex / 256, $2.hex % 256, $3.hex / 256, $3.hex % 256)
    end
  
    str
  end


#Returns a string containing the IP address representation in canonical form.
def to_string
    return _to_string(@addr)
  end



# Returns a string containing the IP address representation in canonical form.
def to_string
    return _to_string(@addr)
  end



# Returns a new ipaddr built by bitwise OR.
def |(other)
    return self.clone.set(@addr | coerce_other(other).to_i)
  end


# Returns a new ipaddr built by bitwise negation.
def ~
    return self.clone.set(addr_mask(~@addr))
  end



# Set current netmask to given mask.
def mask!(mask)
    if mask.kind_of?(String)
      if mask =~ /\A\d+\z/
        prefixlen = mask.to_i
      else
        m = IPAddr.new(mask)
        if m.family != @family
          raise InvalidPrefixError, "address family is not same"
        end
        @mask_addr = m.to_i
        @addr &= @mask_addr
        return self
      end
    else
      prefixlen = mask
    end
    case @family
    when Socket::AF_INET
      if prefixlen < 0 || prefixlen > 32
        raise InvalidPrefixError, "invalid length"
      end
      masklen = 32 - prefixlen
      @mask_addr = ((IN4MASK >> masklen) << masklen)
    when Socket::AF_INET6
      if prefixlen < 0 || prefixlen > 128
        raise InvalidPrefixError, "invalid length"
      end
      masklen = 128 - prefixlen
      @mask_addr = ((IN6MASK >> masklen) << masklen)
    else
      raise AddressFamilyError, "unsupported address family"
    end
    @addr = ((@addr >> masklen) << masklen)
    return self
  end




# Set +@addr+, the internal stored ip address, to given addr. 
# The parameter addr is validated using the first family member, which is Socket::AF_INET or Socket::AF_INET6.
def set(addr, *family)
  case family[0] ? family[0] : @family
  when Socket::AF_INET
    if addr < 0 || addr > IN4MASK
      raise InvalidAddressError, "invalid address"
    end
  when Socket::AF_INET6
    if addr < 0 || addr > IN6MASK
      raise InvalidAddressError, "invalid address"
    end
  else
    raise AddressFamilyError, "unsupported address family"
  end
  @addr = addr
  if family[0]
    @family = family[0]
  end
  return self
end



# _reverse()
def _reverse
    case @family
    when Socket::AF_INET
      return (0..3).map { |i|
        (@addr >> (8 * i)) & 0xff
      }.join('.')
    when Socket::AF_INET6
      return ("%.32x" % @addr).reverse!.gsub!(/.(?!$)/, '\&.')
    else
      raise AddressFamilyError, "unsupported address family"
    end
  end



# _to_string(addr)
def _to_string(addr)
    case @family
    when Socket::AF_INET
      return (0..3).map { |i|
        (addr >> (24 - 8 * i)) & 0xff
      }.join('.')
    when Socket::AF_INET6
      return (("%.32x" % addr).gsub!(/.{4}(?!$)/, '\&:'))
    else
      raise AddressFamilyError, "unsupported address family"
    end
  end




# addr_mask(addr)
def addr_mask(addr)
    case @family
    when Socket::AF_INET
      return addr & IN4MASK
    when Socket::AF_INET6
      return addr & IN6MASK
    else
      raise AddressFamilyError, "unsupported address family"
    end
  end



# coerce_other(other)
def coerce_other(other)
    case other
    when IPAddr
      other
    when String
      self.class.new(other)
    else
      self.class.new(other, @family)
    end
  end



# in6_addr(left)
def in6_addr(left)
    case left
    when RE_IPV6ADDRLIKE_FULL
      if $2
        addr = in_addr($~[2,4])
        left = $1 + ':'
      else
        addr = 0
      end
      right = ''
    when RE_IPV6ADDRLIKE_COMPRESSED
      if $4
        left.count(':') <= 6 or raise InvalidAddressError, "invalid address"
        addr = in_addr($~[4,4])
        left = $1
        right = $3 + '0:0'
      else
        left.count(':') <= ($1.empty? || $2.empty? ? 8 : 7) or
          raise InvalidAddressError, "invalid address"
        left = $1
        right = $2
        addr = 0
      end
    else
      raise InvalidAddressError, "invalid address"
    end
    l = left.split(':')
    r = right.split(':')
    rest = 8 - l.size - r.size
    if rest < 0
      return nil
    end
    (l + Array.new(rest, '0') + r).inject(0) { |i, s|
      i << 16 | s.hex
    } | addr
  end


 
  
# in_addr(addr)
# File lib/ipaddr.rb, line 521
def in_addr(addr)
    case addr
    when Array
      octets = addr
    else
      m = RE_IPV4ADDRLIKE.match(addr) or return nil
      octets = m.captures
    end
    octets.inject(0) { |i, s|
      (n = s.to_i) < 256 or raise InvalidAddressError, "invalid address"
      s.match(/\A0./) and raise InvalidAddressError, "zero-filled number in IPv4 address is ambiguous"
      i << 8 | n
    }
  end