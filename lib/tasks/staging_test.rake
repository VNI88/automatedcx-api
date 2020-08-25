namespace :staging_test do
 desc "Create an user for Natura presentation"
  task create_user: :environment do
    User.create!(
      name: 'Test user',
      email: 'test_user@test.com',
      role: 'admin',
      password: '12345678',
      confirmed_at: Time.now + 1.minute,
      confirmation_sent_at: Time.now + 2.minutes,
      company_name: 'Automated CX'
    )
  end

  desc "Create an event for Natura presentation"
  task create_event: :environment do
    user_metadata = {
     users: [
      { name: 'Vinicius', phone: '+5511998436963'},
      { name: 'William',   phone: '+5511956188884'},
      { name: 'Rafael',   phone: '+5511974107341'},
      { name: 'Nicolas',  phone: '+5511962697679'}
     ]
    }

    Event.create!(
      user_id: User.last.id,
      started_at: Time.now,
      finished_at: Time.now + 2.minutes,
      name: 'test_natura1',
      category: 'test',
      metadata: user_metadata.to_json,
      next_event_name: 'test_natura2'
    )
  end

  desc "Create a routine to monitor the previously created event"
  task create_routine: :environment do
    Routine.create!(
      name: 'test_routine',
      started_at: Time.now,
      updated_at: Time.now,
      finished_at: Time.now,
      action: 'send_whatsapp_menssage',
      user_id: User.last.id,
      monitoring_criteria: 'absence_of_event',
      periodicity: 'daily',
      starts_at: Time.now + 1.minute,
      monitored_event: 'test_natura2',
      message_template: 'Your natura test is on tuesday'
    )
  end

  desc "Schedule the routine "
  task schedule_routine: :environment do
    RoutineSchedulerWorker.perform_in(1.second)
  end
end
