
namespace :test do
  task :add_job => :environment do
    Resque.enqueue(BrokenWorker, 'moo')
    Resque.enqueue(SlowWorker, 'moo')
  end

  task :add_jobs => :environment do
    100.times do
      #BrokenWorker.perform_async "kapot"
      Resque.enqueue(SlowWorker)
    end
  end

  task :clear => :environment do
    queue = Sidekiq::Queue.new
    queue.each(&:delete)

    r = Sidekiq::RetrySet.new
    r.each(&:delete)
  end
end

