def get_data_from_file(filename)
  input_file = File.open(filename, 'r'){ |f| f.read }
  data = input_file.lines.map(&:split)
  data.reject!(&:empty?)
  data.reject! { |c| c[0].include? 'pre>' }
end

def find_smallest_temperature(data)
  # remove the headers
  data.shift(2)
  # remove the total
  data.pop
  data.map { |el| [el[0], el[1].to_i - el[2].to_i] }.min_by { |_day, spread| spread }[0]
end

weather_data = get_data_from_file 'w_data.dat'
day = find_smallest_temperature weather_data
p day
