class Fixnum
  def to_rounded_s
    integer = self
    negative_flag = false

    if integer < 0
      negative_flag = true 
      integer = integer.abs
    end

    value = 0
    if integer == 0
      value = 0
    elsif integer < 1000
      value = integer
    elsif integer < 10000
      value = integer / 1000.0
      value = value.round(1)
      letter = "K"
    elsif integer < 100000
      value = integer / 1000
      letter = "K"
    elsif integer < 1000000
      value = integer / 1000
      letter = "K"
    elsif integer < 10000000
      value = integer / 1000000.0
      value = value.round(1)
      letter = "M"
    elsif integer < 100000000
      value = integer / 1000000
      letter = "M"
    elsif integer < 1000000000
      value = integer / 1000000
      letter = "M"
    elsif integer < 10000000000
      value = integer / 1000000000.0
      value = value.round(1)
      letter = "B"
    elsif integer < 1000000000000000
      value = integer / 1000000000000
      letter = "T"
    end

    if value == 0.0
      value = 0 
    end

    if negative_flag 
      return "($#{value}#{letter})"
    else
      return "$#{value}#{letter}"
    end
  end
end 
