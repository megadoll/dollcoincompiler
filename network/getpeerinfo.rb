static VALUE
ip_recvfrom(int argc, VALUE *argv, VALUE sock)
{
    return rsock_s_recvfrom(sock, argc, argv, RECV_IP);
}