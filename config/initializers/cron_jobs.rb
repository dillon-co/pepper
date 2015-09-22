Sidekiq::Cron::Job.create(name: 'SMS - worker - every sunday ', cron: '* * * * *', klass: 'SmsWorker')

