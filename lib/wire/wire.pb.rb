## Generated from lib/wire/wire.proto for wire
require "beefcake"


class Header
  include Beefcake::Message


  optional :method, :string, 1
  optional :seq, :uint64, 2
  optional :error, :string, 3

end
