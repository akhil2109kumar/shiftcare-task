# lib/client_searcher.rb
class ClientSearcher
  def initialize(clients)
    @clients = clients
  end

  def search(name)
    @clients.select { |client| client['full_name'].downcase.include?(name.downcase) }
  end
end
