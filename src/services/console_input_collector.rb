class ConsoleInputCollector
  def initialize(input_stream: $stdin) = @input_stream = input_stream

  def collect_input = input_stream.gets.chomp

  private

  attr_reader :input_stream
end
