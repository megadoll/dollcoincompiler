def peer_cert
    if not use_ssl? or not @socket
      return nil
    end
    @socket.io.peer_cert
  end