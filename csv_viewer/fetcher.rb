class Fetcher
    def initialize(directory)
      @directory = directory
    end
  
    def fetch_csv_files
      Dir.glob(File.join(@directory, '*.csv'))
    end
  end