require 'date'

module Defaultable

  def default_date
    Date.today.strftime("%d%m%y")
  end

end
