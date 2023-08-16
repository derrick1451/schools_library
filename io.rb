module DataIO  # Use a different name, such as DataIO HERE
  class << self
    def save_data_to_file(data, file_path)
      File.open(file_path, 'w') do |file|
        file.write(JSON.pretty_generate(data))
      end
    end

    def load_data_from_file(file_path)
      JSON.parse(File.read(file_path), symbolize_names: true)
    rescue Errno::ENOENT, JSON::ParserError
      []
    end
  end
end
