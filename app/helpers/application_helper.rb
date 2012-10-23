module ApplicationHelper

  def strf_day(time)
    time.strftime("%m-%d %a")
  end

  def strf_time(time)
    time.strftime("%H:%M")
  end

  def days_of_the_month(year, month)
  	last_day = Date.new(year, month, -1).day
  	Array.new(last_day){|i| i + 1 }
  end

  def months()
  	Array.new(12){|i| i + 1 }
  end

  def years()
  	this_year = Time.now.year
  	[this_year - 1, this_year, this_year + 1]
  end

end
