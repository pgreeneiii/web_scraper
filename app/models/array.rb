class Array
  def to_csv(output_file="data.csv")
    require "csv"

    columns = self.flat_map(&:keys).uniq

    CSV.open(output_file, "w") do |csv|
      csv << columns

      each { |hash| csv << hash.values_at(*columns) }
    end
  end
end
