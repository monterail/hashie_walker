require "multiblock"

class HashieWalker
  def initialize
    @multiblock = Multiblock.wrapper { |obj| obj }
    yield(@multiblock) if block_given?
  end

  def walk(object)
    case object
    when Hash
      object.inject({}) do |hash, (k, v)|
        hash[@multiblock.call(:key, k)] = walk(v)
        hash
      end
    when Array
      object.inject([]) do |arr, element|
        arr << walk(element)
        arr
      end
    else
      @multiblock.call(:value, object)
    end
  end

  class << self
    def walk(object, &blk)
      return object unless block_given?
      new(&blk).walk(object)
    end
  end
end
