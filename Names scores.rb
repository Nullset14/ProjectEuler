IO.read("p022_names.txt").
	scan(/\w+/).
	sort.
	each_with_index.
	map { |name, index| (name.sum - (64 * name.length)) * (index + 1) }.
	inject(:+)
	
