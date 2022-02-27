module FileWriter
  def self.write(file_path:, content:)
    File.write(file_path, _format_content(content))
  end

  def self._format_content(content) = content.join("\n")
end
