Sidekiq::Cron::Job.create(name: 'SMS - worker - every Monday ', cron: '* * * * 1', klass: 'SmsWorker')


Sidekiq::Cron::Job.create(name: "Check_", cron: "* * * * *", klass: "CustomTask")
  