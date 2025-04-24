require 'json'

class ClientLoader
  def self.load_clients(file_path)
    file = File.read(file_path)
    JSON.parse(file)
  end
end
