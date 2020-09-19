require 'date'

module Defaultable

  def default_key
    rand(100000).to_s.rjust(5, "0")
  end

  def default_date
    Date.today.strftime("%d%m%y")
  end

end
