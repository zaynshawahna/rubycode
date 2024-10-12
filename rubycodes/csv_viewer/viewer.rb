require 'console_table'
require 'colorize'

class Viewer
  def initialize(data)
    @data = data
  end

  def display
    table_config = []
    @data.headers.each do |header|
        table_config << { key: header, title: header.to_s.capitalize.blue, size:header.size + 20  }
    end

    ConsoleTable.define(table_config, title: "CSV Data".upcase.bold.green) do |table|
        @data.each do |row|
          
          table << row.to_h.values 
        end
      end
  end
end
