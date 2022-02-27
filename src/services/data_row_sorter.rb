module Data
  class RowSorter
    def self.sort(rows:, sort_key:)
      return [] unless rows.length.positive?

      rows.sort_by { |r| [r.send(sort_key), r.send(:customer_email)] }
    end
  end
end
