require 'models/message'

class MessagePrinter
  UnrecognizedMessage = Class.new(StandardError)

  def initialize(output_stream: $stdout) = @output_stream = output_stream

  def print(message:)
    raise UnrecognizedMessage unless Message::ALL.include?(message)

    output_stream.puts(message)
  end

  private

  attr_reader :output_stream
end
