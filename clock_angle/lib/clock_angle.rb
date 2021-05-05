def clock_angle(hour, minute)
  hour_angle = hour.to_f * 30

  if (hour.to_f == 12)
    hour_angle = 0
  end

  minute_angle = minute.to_f * 6

  result = (hour_angle - minute_angle).abs
  if (result > 180)
    result -= 180
  else
    result
  end

end
