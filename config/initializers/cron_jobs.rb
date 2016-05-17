# Sidekiq::Cron::Job.create(name: 'Monday Worker', cron: '* * * * 1', klass: 'WeeklyReminderWorker ')

Sidekiq::Cron::Job.create(name: "Check for tasks every day at 11 AM", cron: "0 11 * * *", klass: "CustomTask")
