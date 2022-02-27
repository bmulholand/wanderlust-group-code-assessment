$LOAD_PATH << File.expand_path(__dir__)

require 'models/file_path'
require 'app'

App.run(input_file_path: FilePath::INPUT, output_file_path: FilePath::OUTPUT)
