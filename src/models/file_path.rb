# frozen_string_literal: true

module FilePath
  ALL = [
    INPUT = File.expand_path('../../input/data.txt', __dir__),
    OUTPUT = File.expand_path('../../output/sorted.txt', __dir__)
  ].freeze
end
