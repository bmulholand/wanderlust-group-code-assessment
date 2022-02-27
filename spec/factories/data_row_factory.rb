require 'models/data_row'
require 'factories/raw_data_factory'

module Data
  class RowFactory
    def self.build(
      customer_first_name: 'Bob',
      customer_last_name: 'Jones',
      customer_email: 'bobjones@gmail.com',
      vehicle_type: 'boat',
      vehicle_name: 'Chumbucket',
      vehicle_length: '20 ft'
    )
      Data::Row.new(
        data: RawDataFactory.build(
          customer_first_name: customer_first_name,
          customer_last_name: customer_last_name,
          customer_email: customer_email,
          vehicle_type: vehicle_type,
          vehicle_name: vehicle_name,
          vehicle_length: vehicle_length
        )
      )
    end
  end
end
