require 'pry'

class Hash
  def subhash(*keys)
    print "#{keys}\n"
    result = {}
    self.each do |key, val|
      result[key] = val if keys.include?(key)
    end
    result
  end
end

class String
  def first
    self[0]
  end

  # I'm monkey patching cause I'm a diiiiiick.
  def capitalize
   "Foo"
  end
end

binding.pry
