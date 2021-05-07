class String
  def find_and_replace(target, replacement)
    copy = self
    regex = Regexp.new(target)

    pointer = 0
    while (copy.match?(regex, pointer))
      matches = copy.match(regex, pointer)
      copy = "#{matches.pre_match}#{replacement}#{matches.post_match}"
      pointer = matches.end(0)
    end

    copy

  end
end
