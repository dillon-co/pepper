Sidekiq::Cron::Job.create(name: 'SMS - worker - every Monday ', cron: '* * * * 1', klass: 'SmsWorker')

