class BrokenWorker
  @queue = :default
  extend Appsignal::Integrations::ResquePlugin

  def perform(message='broken')
    raise message
  end
end
