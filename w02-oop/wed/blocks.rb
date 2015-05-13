class File
  def open(path, mode)
    fd = some_OS_call(path, mode)
    yield(fd) if block_given?
    fd.close
  end
end

def twice
  yield
  yield
end

def times
  (1..n).each do |i|
    yield(i)
  end
end

def my_map(enum)
  result = enum.class.new
  enum.each do |x|
    # Adding an answer with << doesn't work with Hashes. :-/
    # Not sure how they actually do this. Maybe there's a way
    # to cast result to enum.class?
    result << yield(x) if block_given?
  end
  result
end
