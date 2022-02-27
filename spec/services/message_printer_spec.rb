require 'models/message'
require 'services/message_printer'

RSpec.describe MessagePrinter do
  let(:service) { described_class.new(output_stream: output_stream) }

  describe '#print' do
    subject { service.print(message: message) }

    let(:output_stream) { double('output_stream') }
    let(:message) { Message::INTRO }

    context 'when the message is recognized' do
      it 'logs to the output stream' do
        expect(output_stream).to receive(:puts).with(message)

        subject
      end
    end

    context 'when the message is ad hoc' do
      let(:message) { 'not in the messages model' }

      it 'errors', :aggregate_failures do
        expect(output_stream).not_to receive(:puts)
        expect { subject }.to raise_error(described_class::UnrecognizedMessage)
      end
    end
  end
end
