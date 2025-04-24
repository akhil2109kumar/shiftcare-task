# spec/client_searcher_spec.rb
require 'client_searcher'
require 'json'

RSpec.describe ClientSearcher do
  let(:clients) do
    [
      { "id" => 1, "full_name" => "John Doe", "email" => "john.doe@gmail.com" },
      { "id" => 2, "full_name" => "Jane Smith", "email" => "jane.smith@yahoo.com" },
      { "id" => 3, "full_name" => "Alex Johnson", "email" => "alex.johnson@hotmail.com" },
      { "id" => 4, "full_name" => "Michael Williams", "email" => "michael.williams@outlook.com" },
    ]
  end

  subject { ClientSearcher.new(clients) }

  describe '#search' do
    context 'when searching for a full name that exists' do
      it 'returns matching clients' do
        results = subject.search('John')
        expect(results.length).to eq(2)
        expect(results.first['full_name']).to eq('John Doe')
      end
    end

    context 'when searching for a full name that does not exist' do
      it 'returns an empty array' do
        results = subject.search('Nonexistent')
        expect(results).to be_empty
      end
    end

    context 'when searching with partial name' do
      it 'returns matching clients' do
        results = subject.search('Jane')
        expect(results.length).to eq(1)
        expect(results.first['full_name']).to eq('Jane Smith')
      end
    end
  end
end
