Sidekiq::Cron::Job.create(name: 'SMS - worker - every Monday ', cron: '* * * * 1', klass: 'eeklyReminderWorker ')

Sidekiq::Cron::Job.create(name: "Check for tasks every day at 11 AM", cron: "0 11 * * *", klass: "CustomTask")
  