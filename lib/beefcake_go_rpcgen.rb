$:.unshift(File.dirname(__FILE__))

# We need Beefcake in the stack for this...
require 'beefcake'
require 'beefcake/client_backends/go_rpcgen_backend'

Beefcake::Client.set_backend(Beefcake::ClientBackends::GoRpcgenBackend)
