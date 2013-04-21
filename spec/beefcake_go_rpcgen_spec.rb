require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "BeefcakeGoRpcgen" do
  context 'with regard to class methods' do
    subject { Beefcake::Client.backend('0.0.0.0', 123) }

    it 'should set the default backend' do
      should be_a Beefcake::ClientBackends::GoRpcgenBackend
    end
  end

  context 'with regard to client instances' do
    let(:client) { Beefcake::Client.new('0.0.0.0', 123) }
    subject { client.send(:backend) }

    it 'should change the default backend for all instances' do
      should be_a Beefcake::ClientBackends::GoRpcgenBackend
    end
  end
end
