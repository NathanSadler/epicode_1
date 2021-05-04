def title_case(string)
  title_array = string.split()
  title_array.map(&:capitalize!)
  title_array.join(" ")
end
