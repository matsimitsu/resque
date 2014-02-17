class Item < ActiveRecord::Base

  def do_stuff
    if Random.rand(2) == 0
      sleep Random.rand(100).to_f / 100
    end
  end

  def do_random_stuff
    case Random.rand(2)
    when 0
      sleep Random.rand(100).to_f / 100
    when 1
      raise 'Something is broken!'
    end
  end

end
