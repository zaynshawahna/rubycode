require 'tty-prompt'

class Interface
  def initialize(files)
    @files = files
    @prompt = TTY::Prompt.new
  end

  def choose_file
    @prompt.select("Please choose a CSV file to display:", @files)
  end
end