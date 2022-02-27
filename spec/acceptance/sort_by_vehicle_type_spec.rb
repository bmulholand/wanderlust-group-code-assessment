require 'app'

RSpec.describe 'sort by vehicle type' do
  subject { App.run(input_file_path: input_file, output_file_path: output_file) }

  let(:input_file) { File.expand_path('../fixtures/input.txt', __dir__) }
  let(:output_file) { File.expand_path('../fixtures/output.txt', __dir__) }

  let(:file_contents) do
    File.read(output_file)
  end

  before do
    allow_any_instance_of(ConsoleInputCollector)
      .to receive(:collect_input).and_return('vehicle_type')
  end

  after { File.delete(output_file) }

  let(:expected_output) do
    <<~CUSTOMERS.chomp
      Brandon, Mulholand, brandonmulholand@gmail.com, Jeep, Nameless, 15’
      Ashley, Anderson, ashleyanderson@gmail.com, campervan, Ashley Mobile, 10 ft
      Xiuhtezcatl, Martinez, martinez@earthguardian.org, campervan, Earth Guardian, 28 feet
      Mandip, Singh Soin, mandip@ecotourism.net, motorboat, Frozen Trekker, 32’
      Greta, Thunberg, greta@future.com, sailboat, Fridays For Future, 32’
      Jimmy, Buffet, jb@sailor.com, sailboat, Margaritaville, 40 ft
    CUSTOMERS
  end

  it 'sorts correctly' do
    subject

    expect(file_contents).to eq(expected_output)
  end
end
