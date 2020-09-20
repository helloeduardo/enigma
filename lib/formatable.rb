module Formatable

  def format_key(key)
    key[0][0] + key[1][0] + key[2][0] + key[3]
  end

  def format_multiples(multiples)
    multiples.map do |multiple|
      multiple.to_s.rjust(2, "0")
    end
  end

end
