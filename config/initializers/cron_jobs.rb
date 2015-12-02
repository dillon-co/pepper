Sidekiq::Cron::Job.create(name: 'SMS - worker - every Monday ', cron: '* * * * 1', klass: 'SmsWorker')

Tasks.all.each do |task|
  Sidekiq::Cron::Job.create(name: "#{task.name}", cron: "#{Task.cron_time}", klass: "#{task.name}")
end  