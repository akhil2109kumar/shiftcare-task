# lib/duplicate_finder.rb
class DuplicateFinder
  def initialize(clients)
    @clients = clients
  end

  def find_duplicates
    email_counts = Hash.new(0)
    @clients.each { |client| email_counts[client['email']] += 1 }
    email_counts.select { |_, count| count > 1 }.keys
  end
end
