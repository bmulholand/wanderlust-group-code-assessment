require 'models/data_row'
require 'models/message'
require 'services/console_input_collector'
require 'services/data_row_sorter'
require 'services/file_reader'
require 'services/file_writer'
require 'services/message_printer'

class App
  def self.run(input_file_path:, output_file_path:)
    message_printer = MessagePrinter.new

    message_printer.print(message: Message::INTRO)

    sort_key = loop do
      valid_sort_key = _ask_for_input(message_printer)
      break valid_sort_key if valid_sort_key
    end

    data_rows = _get_file_data(input_file_path)
    sorted_rows = _sort_data_rows(data_rows, sort_key)

    FileWriter.write(file_path: output_file_path, content: sorted_rows)
    message_printer.print(message: Message::ALL_DONE)
  end

  def self._ask_for_input(message_printer)
    input = ConsoleInputCollector.new.collect_input.to_sym
    return input if Data::Row::ATTRIBUTES.include?(input)

    message_printer.print(message: Message::INVALID_INPUT)
  end

  def self._get_file_data(input_file_path)
    file_input = FileReader.read(file_path: input_file_path)
    file_input.map { |data| Data::Row.new(data: data) }
  end

  def self._sort_data_rows(rows, sort_key)
    Data::RowSorter.sort(rows: rows, sort_key: sort_key)
  end
end
