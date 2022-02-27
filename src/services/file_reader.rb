class FileReader
  def self.read(file_path:) = File.read(file_path).split("\n")
end
