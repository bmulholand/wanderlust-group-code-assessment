require 'services/console_input_collector'

RSpec.describe ConsoleInputCollector do
  let(:service) { ConsoleInputCollector.new(input_stream: input_stream) }

  describe '#get_input' do
    subject { service.collect_input }

    let(:input_stream) { double('input_stream') }

    it 'gets input' do
      expect(input_stream).to receive_message_chain(:gets, :chomp)

      subject
    end
  end
end
