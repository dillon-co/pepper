Sidekiq::Cron::Job.create(name: 'SMS - worker - every Monday ', cron: '* * * * *', klass: 'SmsWorker')

