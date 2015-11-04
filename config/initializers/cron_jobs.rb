Sidekiq::Cron::Job.create(name: 'SMS - worker - every Monday ', cron: '*/10 * * * *', klass: 'SmsWorker')

