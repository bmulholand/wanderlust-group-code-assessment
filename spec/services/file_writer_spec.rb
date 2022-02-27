require 'services/file_writer'

RSpec.describe FileWriter do
  describe '.write' do
    subject { FileWriter.write(file_path: file_path, content: content) }

    let(:file_path) { 'some/file_path.txt' }
    let(:value_one) { 'value_one' }
    let(:value_two) { 'value_two' }

    let(:expected_write) { "#{value_one}\n#{value_two}" }

    context 'with no values' do
      let(:content) { [] }
      let(:expected_write) { '' }

      it 'writes to a file' do
        expect(File).to receive(:write).with(file_path, expected_write)

        subject
      end
    end

    context 'with one value' do
      let(:content) { [value_one] }
      let(:expected_write) { value_one }

      it 'writes to a file' do
        expect(File).to receive(:write).with(file_path, expected_write)

        subject
      end
    end

    context 'with multiple values' do
      let(:content) { [value_one, value_two] }

      it 'writes to a file' do
        expect(File).to receive(:write).with(file_path, expected_write)

        subject
      end
    end
  end
end
