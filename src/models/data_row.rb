module Data
  class Row
    ATTRIBUTES = %i[
      customer_first_name
      customer_last_name
      customer_email
      vehicle_type
      vehicle_name
      vehicle_length
    ].freeze

    def initialize(data:) = @data = data

    def customer_first_name = data[0]
    def customer_last_name = data[1]
    def customer_email = data[2]

    def vehicle_type = data[3]
    def vehicle_name = data[4]
    def vehicle_length = data[5].to_i

    def to_s
      data.join(', ')
    end

    private

    def data = @data.split(/,|\|/)
  end
end
