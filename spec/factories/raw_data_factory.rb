class RawDataFactory
  def self.build(
    customer_first_name: 'Bob',
    customer_last_name: 'Jones',
    customer_email: 'bobjones@gmail.com',
    vehicle_type: 'boat',
    vehicle_name: 'Chumbucket',
    vehicle_length: '20 ft',
    separator: ','
  )
    s = separator

    customer_first_name + s + customer_last_name + s + customer_email + s \
    + vehicle_type + s + vehicle_name + s + vehicle_length
  end
end
