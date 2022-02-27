require 'factories/data_row_factory'
require 'services/data_row_sorter'

RSpec.describe Data::RowSorter do
  describe '#sort' do
    let(:subject) { described_class.sort(rows: data, sort_key: sort_key) }

    let(:sort_key) { :email }
    let(:data) do
      [
        Data::RowFactory.build(
          customer_first_name: customer_one_first_name,
          customer_email: customer_one_email,
          vehicle_length: customer_one_vehicle_length
        ),
        Data::RowFactory.build(
          customer_first_name: customer_two_first_name,
          customer_email: customer_two_email,
          vehicle_length: customer_two_vehicle_length
        )
      ]
    end

    let(:customer_one_email) { 'brandon@gmail.com' }
    let(:customer_one_first_name) { 'brandon' }
    let(:customer_one_vehicle_length) { '15 ft' }

    let(:customer_two_email) { 'ashley@gmail.com' }
    let(:customer_two_first_name) { 'ashley' }
    let(:customer_two_vehicle_length) { '12 ft' }

    context 'when data is empty' do
      let(:data) { [] }

      it 'returns an empty array' do
        expect(subject).to eq([])
      end
    end

    context 'given a valid sort key' do
      let(:sort_key) { :customer_first_name }

      it 'sorts correctly' do
        expect(subject[0]).to have_attributes(
          customer_first_name: customer_two_first_name,
          customer_email: customer_two_email
        )
        expect(subject[1]).to have_attributes(
          customer_first_name: customer_one_first_name,
          customer_email: customer_one_email
        )
      end
    end

    context 'when the sort key is vehicle length' do
      let(:sort_key) { :vehicle_length }

      it 'sorts correctly' do
        expect(subject[0]).to have_attributes(
          customer_first_name: customer_two_first_name,
          customer_email: customer_two_email
        )
        expect(subject[1]).to have_attributes(
          customer_first_name: customer_one_first_name,
          customer_email: customer_one_email
        )
      end
    end

    context 'when entries have the same value a sort key' do
      let(:sort_key) { :vehicle_length }
      let(:customer_one_vehicle_length) { '12 ft' }
      let(:customer_two_vehicle_length) { '12 ft' }

      let(:customer_one_email) { 'brandon@gmail.com' }
      let(:customer_two_email) { 'z.ashley@gmail.com' }

      it 'it falls back on email' do
        expect(subject[0]).to have_attributes(
          customer_first_name: customer_one_first_name,
          customer_email: customer_one_email
        )
        expect(subject[1]).to have_attributes(
          customer_first_name: customer_two_first_name,
          customer_email: customer_two_email
        )
      end
    end
  end
end
