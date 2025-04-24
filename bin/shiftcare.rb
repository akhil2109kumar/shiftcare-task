require 'optparse'
require_relative '../lib/client_loader'
require_relative '../lib/client_searcher'
require_relative '../lib/duplicate_finder'

# path to clients JSON file
CLIENTS_FILE = 'data/clients.json'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: shiftcare.rb [options]"

  opts.on("-s", "--search NAME", "Search clients by name") do |name|
    options[:search] = name
  end

  opts.on("-d", "--duplicates", "Find clients with duplicate emails") do
    options[:duplicates] = true
  end
end.parse!

if options.empty?
  puts "Please provide a command. Use '-s NAME' for search or '-d' for duplicates."
  exit
end

if !File.exist?(CLIENTS_FILE)
  puts "Client data file not found at #{CLIENTS_FILE}. Please ensure it exists."
  exit
end

clients = ClientLoader.load_clients(CLIENTS_FILE)

# Search by name
if options[:search]
  searcher = ClientSearcher.new(clients)
  results = searcher.search(options[:search])
  puts "Search results for '#{options[:search]}':"
  if results.empty?
    puts "No clients found with that name."
  else
    results.each { |client| puts "#{client['full_name']} - #{client['email']}" }
  end
end

# Find duplicates
if options[:duplicates]
  finder = DuplicateFinder.new(clients)
  duplicates = finder.find_duplicates
  if duplicates.empty?
    puts "No duplicate emails found."
  else
    puts "Clients with duplicate emails:"
    duplicates.each { |email| puts email }
  end
end
