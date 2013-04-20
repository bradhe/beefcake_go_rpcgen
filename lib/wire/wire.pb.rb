## Generated from config/wire.proto for wire
require "beefcake"


class header
  include Beefcake::Message


  optional :method, :string, 1
  optional :seq, :uint64, 2
  optional :error, :string, 3

end
