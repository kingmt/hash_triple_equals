class Hash
  ##
  # Override === for Hash to enable tuple matching with a minimum of object rearrangement
  # will match number of keys
  # if self[key] is nil then match if other[key] exists 
  # if self[key] is a range then match if self[key] === other[key]
  # if self[key] is an array or set then match if self[key].include? other[key]
  # other may be a Hash or HashWithIndifferentAccess
  # so either need to do gymnastics for other to check symbol and non-symbol keys
  # or drive the comparison by other.keys, however because of special behavior of 
  # self[key] == nil need to make sure key exists
  def ===(other)
      other.all? do |key, value|
        if has_key?(key)
          self_value = fetch(key)
          case self_value
          when NilClass
            true
          when Array, Set
            self_value.include? value
          else
            self_value === value
          end
        else
          false
        end
      end
  end
end
