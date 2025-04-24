# spec/duplicate_finder_spec.rb
require 'duplicate_finder'
require 'json'

RSpec.describe DuplicateFinder do
  let(:clients) do
    [
      { "id" => 1, "full_name" => "John Doe", "email" => "john.doe@gmail.com" },
      { "id" => 2, "full_name" => "Jane Smith", "email" => "jane.smith@yahoo.com" },
      { "id" => 3, "full_name" => "Alex Johnson", "email" => "alex.johnson@hotmail.com" },
      { "id" => 4, "full_name" => "Michael Williams", "email" => "michael.williams@outlook.com" },
      { "id" => 5, "full_name" => "John Doe", "email" => "john.doe@gmail.com" }
    ]
  end

  subject { DuplicateFinder.new(clients) }

  describe '#find_duplicates' do
    context 'when there are duplicate emails' do
      it 'returns the duplicate emails' do
        duplicates = subject.find_duplicates
        expect(duplicates).to include("john.doe@gmail.com")
      end
    end

    context 'when there are no duplicate emails' do
      it 'returns an empty array' do
        unique_clients = [
          { "id" => 1, "full_name" => "John Doe", "email" => "john.doe@gmail.com" },
          { "id" => 2, "full_name" => "Jane Smith", "email" => "jane.smith@yahoo.com" }
        ]
        finder = DuplicateFinder.new(unique_clients)
        duplicates = finder.find_duplicates
        expect(duplicates).to be_empty
      end
    end
  end
end
