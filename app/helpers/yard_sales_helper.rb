module YardSalesHelper
  def pretty_print_time(ys)
    if ys.end
      if ys.start.to_date == ys.end.to_date
        "#{ys.start.strftime('%b %-d, %Y, from %-I:%M %p')}
        to #{ys.end.strftime('%-I:%M %p')}"
      else
        "From #{ys.start.strftime('%b %-d, %Y at %-I:%M %p')} 
        to #{ys.end.strftime('%b %-d, %Y at %-I:%M %p')}"
      end
    else
      "#{ys.start.strftime('%b %-d, %Y, starting at %-I:%M %p')}"
    end
  end
end
