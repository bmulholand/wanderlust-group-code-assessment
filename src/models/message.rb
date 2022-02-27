# frozen_string_literal: true

require 'models/data_row'

module Message
  ALL = [
    LIST_OF_VALID_OPTIONS = Data::Row::ATTRIBUTES.join(', '),
    INTRO = <<~INTRO_MESSAGE.freeze,
      Hi there! This program pulls data from input/data.txt. However, you can control the sort order.
      What data would you like to see sorted in ascending order? You'll see the output in output/sorted.txt

      Valid options include: #{LIST_OF_VALID_OPTIONS}
    INTRO_MESSAGE
    INVALID_INPUT = "Try using one of the following values: #{LIST_OF_VALID_OPTIONS}".freeze,
    ALL_DONE = 'All done. Go ahead and check the output directory for your file!'
  ].freeze
end
