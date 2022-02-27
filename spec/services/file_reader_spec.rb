require 'services/file_reader'

RSpec.describe FileReader do
  describe '#read' do
    before do
      allow(File)
        .to receive(:read)
        .with(file_path)
        .and_return(file_data)
    end

    subject { described_class.read(file_path: file_path) }

    let(:file_path) { '/some/file.txt' }

    context 'given no rows of file data' do
      let(:file_data) { '' }

      it 'returns an empty array' do
        expect(subject).to eq([])
      end
    end

    context 'given one row of data' do
      let(:file_data) { 'foo' }

      it 'an empty array' do
        expect(subject).to eq(['foo'])
      end
    end

    context 'given one row of data with a newline' do
      let(:file_data) { "foo\n" }

      it 'an empty array' do
        expect(subject).to eq(['foo'])
      end
    end

    context 'given multiple rows of file data' do
      let(:file_data) { "foo\nbar\nbaz" }

      it 'reads file' do
        expect(subject).to eq(%w[foo bar baz])
      end
    end
  end
end
