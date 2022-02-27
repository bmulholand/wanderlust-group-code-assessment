require 'factories/raw_data_factory'
require 'models/data_row'

RSpec.describe Data::Row do
  let(:customer_first_name) { 'Brandon' }
  let(:customer_last_name) { 'Mulholand' }
  let(:customer_email) { 'brandonmulholand@gmail.com' }
  let(:vehicle_type) { 'Jeep' }
  let(:vehicle_name) { 'Wrangler' }
  let(:vehicle_length) { '15 ft' }
  let(:separator) { ',' }

  let(:data) do
    RawDataFactory.build(
      customer_first_name: customer_first_name,
      customer_last_name: customer_last_name,
      customer_email: customer_email,
      vehicle_type: vehicle_type,
      vehicle_name: vehicle_name,
      vehicle_length: vehicle_length,
      separator: separator
    )
  end

  let(:row) { described_class.new(data: data) }

  RSpec.shared_examples 'data row attribute' do
    context 'when separator is a comma' do
      let(:separator) { ',' }
      it { is_expected.to eq(expected_output) }
    end

    context 'when separator is a pipe' do
      let(:separator) { '|' }
      it { is_expected.to eq(expected_output) }
    end
  end

  describe '#customer_first_name' do
    subject { row.customer_first_name }
    let(:expected_output) { customer_first_name }

    it_behaves_like 'data row attribute'
  end

  describe '#customer_last_name' do
    subject { row.customer_last_name }
    let(:expected_output) { customer_last_name }

    it_behaves_like 'data row attribute'
  end

  describe '#customer_email' do
    subject { row.customer_email }
    let(:expected_output) { customer_email }

    it_behaves_like 'data row attribute'
  end

  describe '#vehicle_type' do
    subject { row.vehicle_type }
    let(:expected_output) { vehicle_type }

    it_behaves_like 'data row attribute'
  end

  describe '#vehicle_name' do
    subject { row.vehicle_name }
    let(:expected_output) { vehicle_name }

    it_behaves_like 'data row attribute'
  end

  describe '#vehicle_length' do
    subject { row.vehicle_length }
    let(:expected_output) { 15 }

    it_behaves_like 'data row attribute'
  end

  describe '#to_s' do
    subject { row.to_s }

    let(:expected_result) do
      [
        customer_first_name,
        customer_last_name,
        customer_email,
        vehicle_type,
        vehicle_name,
        vehicle_length
      ].join(', ')
    end

    it 'converts to string' do
      expect(subject).to eq(expected_result)
    end
  end
end
