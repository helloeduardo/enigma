require 'date'

# This module implements defaults in absence of arguments
module Defaultable
  def default_key
    rand(100_000).to_s.rjust(5, '0')
  end

  def default_date
    Date.today.strftime('%d%m%y')
  end
end
