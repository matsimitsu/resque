class SlowWorker
  @queue = :default
  extend Appsignal::Integrations::ResquePlugin

  def self.perform(how_hard="super hard", how_long=1)
    10.times { Item.where(:id => 1).first }
    sleep how_long
  end
end
