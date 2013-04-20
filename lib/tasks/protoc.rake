require 'fileutils'

namespace :protoc do
  desc 'Generate source from protobufs definition'
  task :generate => :environment do
    cmd = "protoc --beefcake_out ./lib/wire lib/wire/wire.proto"
    puts sh(cmd)
  end
end
