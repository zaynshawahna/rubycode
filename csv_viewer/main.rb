require_relative 'fetcher'
require_relative 'reader'
require_relative 'viewer'
require_relative 'interface'

current_file_path = File.expand_path(__FILE__)
new_file_path = current_file_path.gsub("main.rb", "data")
puts new_file_path

#terminal_width = `tput cols`.to_i 
# puts terminal_width
fetcher = Fetcher.new(new_file_path)


loop do
  csv_files = fetcher.fetch_csv_files
  
  if csv_files.empty?
    puts "No CSV files found in the specified directory."
    exit
  end

  csv_files <<"quit" 

  prompt = Interface.new(csv_files)
  selected_file = prompt.choose_file

  
  if selected_file == "quit"
    puts "Exiting the program."
    exit
  end

  
  csv_reader = Reader.new(selected_file)
  csv_data = csv_reader.read_csv

  
  if csv_data.empty?
    puts "The selected CSV file is empty."
    next  
  end

  
  csv_viewer = Viewer.new(csv_data)
  csv_viewer.display
end
