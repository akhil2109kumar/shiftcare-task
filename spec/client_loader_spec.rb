# spec/client_loader_spec.rb
require_relative '../lib/client_loader'

RSpec.describe ClientLoader do
  describe '.load_clients' do
    context 'when the clients file exists' do
      it 'loads the clients data' do
        clients = ClientLoader.load_clients('data/clients.json')
        expect(clients).to be_an(Array)
        expect(clients.first).to have_key('full_name')
      end
    end

    context 'when the clients file does not exist' do
      it 'raises a file not found error' do
        expect {
          ClientLoader.load_clients('non_existing_file.json')
        }.to raise_error(Errno::ENOENT)
      end
    end
  end
end
