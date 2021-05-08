

# this is the module OpenSSL::SSL::SocketForwarder 


# addr()

def addr
    to_io.addr
end

# closed?()
def closed?
    to_io.closed?
end


# do_not_reverse_lookup=(flag)

def do_not_reverse_lookup=(flag)
    to_io.do_not_reverse_lookup = flag
end


# fcntl(*args)

def fcntl(*args)
    to_io.fcntl(*args)
end

# getsockopt(level, optname)
def getsockopt(level, optname)
    to_io.getsockopt(level, optname)
end



# peeraddr()
def peeraddr
    to_io.peeraddr
end


# setsockopt(level, optname, optval)
def setsockopt(level, optname, optval)
    to_io.setsockopt(level, optname, optval)
end
