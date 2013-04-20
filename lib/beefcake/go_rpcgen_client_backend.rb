module Beefcake
  class GoRpcgenClientBackend
    def send_message(response_klass, message)
    end

    def write_all(message)
      str = encoded(message)

      buf = Buffer.new
      buf.append_uint64(str.length)
      buf << str 

      socket.write(buf)
      socket.flush
    end 

    def read_all(klass)
      # TODO: Anything with this message?
      read_obj(RPCMessage)
      read_obj(klass)
    end 

    def read_obj(klass)
      msg = socket.read(read_obj_size)
      klass.decode(msg)
    end 

    def read_obj_size
      buf = Buffer.new
      read_uvarint(buf)
      size = buf.read_uint64
    end 

    def read_uvarint(buf)
      b = socket.recv(1).ord
      buf << b
      read_uvarint(buf) if (b >> 7) & 0x01 == 0x01
    end 

    def encoded(obj)
      ''.tap { |s| obj.encode(s) }
    end 

    def socket
      @socket ||= open_socket!
    end 

    def open_socket!(timeout=5)
      addr = Socket.getaddrinfo(host, nil)
      sock = Socket.new(Socket.const_get(addr[0][0]), Socket::SOCK_STREAM, 0)

      # If a timeout was requested, let's configure one.
      if timeout
        secs = timeout.to_i
        usecs = Integer((timeout - secs) * 1_000_000)
        optval = [secs, usecs].pack("l_2")
        begin
          sock.setsockopt Socket::SOL_SOCKET, Socket::SO_RCVTIMEO, optval
          sock.setsockopt Socket::SOL_SOCKET, Socket::SO_SNDTIMEO, optval
        rescue Exception => ex
          warn "Unable to use raw socket timeouts: #{ex.class.name}: #{ex.message}"
        end 
      end 

      sock.connect(Socket.pack_sockaddr_in(port, addr[0][3]))
      sock
    end 
  end
end
