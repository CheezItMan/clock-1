# clock.rb

def clock(hours, minutes, seconds)
  if hours > 23
    raise ArgumentError, "Hours must be 0-23"
  end

  if minutes > 59
    raise ArgumentError, "Minutes must be 0-59"
  end

  if seconds > 59
    raise ArgumentError, "Seconds must be 0-59"
  end

  time_fields = [hours, minutes, seconds].map do |field|
    if field < 10
      "0#{field}"
    else
      "#{field}"
    end
  end
  return "#{time_fields[0]}:#{time_fields[1]}:#{time_fields[2]}"
end
