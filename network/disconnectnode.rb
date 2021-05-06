def disconnect
    begin
        begin
            @sock.io.shutdown
        rescue NoMethoderror
            @sock.shutdown
        end
    rescue Errno::ENOTCONN
    rescue Exception => e 
        @receiver_thread.raise(e)
    end
    @receiver_thread.join
    synchronize do
        unless @sock.closed?
            @sock.close
        end
    end
    raise e if e
end

# disconnected?()

def disconnected?
    return @sock.closed?
end