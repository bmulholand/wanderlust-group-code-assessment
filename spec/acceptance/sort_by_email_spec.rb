require 'app'

RSpec.describe 'sort by email' do
  subject { App.run(input_file_path: input_file, output_file_path: output_file) }

  let(:input_file) { File.expand_path('../fixtures/input.txt', __dir__) }
  let(:output_file) { File.expand_path('../fixtures/output.txt', __dir__) }

  let(:file_contents) do
    File.read(output_file)
  end

  before do
    allow_any_instance_of(ConsoleInputCollector)
      .to receive(:collect_input).and_return('customer_email')
  end

  after { File.delete(output_file) }

  let(:expected_output) do
    <<~CUSTOMERS.chomp
      Ashley, Anderson, ashleyanderson@gmail.com, campervan, Ashley Mobile, 10 ft
      Brandon, Mulholand, brandonmulholand@gmail.com, Jeep, Nameless, 15’
      Greta, Thunberg, greta@future.com, sailboat, Fridays For Future, 32’
      Jimmy, Buffet, jb@sailor.com, sailboat, Margaritaville, 40 ft
      Mandip, Singh Soin, mandip@ecotourism.net, motorboat, Frozen Trekker, 32’
      Xiuhtezcatl, Martinez, martinez@earthguardian.org, campervan, Earth Guardian, 28 feet
    CUSTOMERS
  end

  it 'sorts correctly' do
    subject

    expect(file_contents).to eq(expected_output)
  end
end
