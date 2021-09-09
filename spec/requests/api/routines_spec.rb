# typed: false
require 'swagger_helper'

RSpec.describe "routines_controller", type: :request do
  path "/routines" do
    post "Create a routine to monitor an event" do
      tags "Routines"
      security [api_key: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          action: { type: :string },
          starts_at: { type: :string, format: 'date-time' },
          periodicity: { type: :string },
          monitoring_criteria: { type: :string },
          monitored_event: { type: :string }
        },
        required: [ 'name', 'action', 'starts_at', 'periodicity', 'monitoring_criteria', 'monitored_event' ]
      }

      response "200", 'routine created'  do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            action: { type: :string },
            starts_at: { type: :string, format: 'date-time'},
            periodicity: { type: :string },
            monitoring_criteria: { type: :string },
            monitored_event: { type: :string },
            started_at: { type: :string, format: 'date-time' },
            updated_at:  { type: :string, format: 'date-time' },
            finished_at: { type: :string, format: 'date-time' },
            user_id: { type: :integer},
            message_template: { type: :string }
          },
          required: [ 'name', 'action', 'starts_at', 'periodicity', 'monitoring_criteria', 'monitored_event' ]
        run_test!
      end

      response '401', 'unauthorized' do
        run_test!
      end
    end

    get "List all created routines" do
      tags "Routines"
      security [api_key: []]
      produces 'application/json'

      response "200", 'routines found'  do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            action: { type: :string },
            starts_at: { type: :string, format: 'date-time'},
            periodicity: { type: :string },
            monitoring_criteria: { type: :string },
            monitored_event: { type: :string },
            started_at: { type: :string, format: 'date-time' },
            updated_at:  { type: :string, format: 'date-time' },
            finished_at: { type: :string, format: 'date-time' },
            user_id: { type: :integer},
            message_template: { type: :string }
          }
        run_test!
      end

      response '401', 'unauthorized' do
        run_test!
      end
    end
  end

  path '/routines/{id}' do
    get 'Retrieves an specific routine' do
      tags 'Routines'
      security [api_key: []]
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response "200", 'routine found'  do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            action: { type: :string },
            starts_at: { type: :string, format: 'date-time'},
            periodicity: { type: :string },
            monitoring_criteria: { type: :string },
            monitored_event: { type: :string },
            started_at: { type: :string, format: 'date-time' },
            updated_at:  { type: :string, format: 'date-time' },
            finished_at: { type: :string, format: 'date-time' },
            user_id: { type: :integer},
            message_template: { type: :string }
          }
        run_test!
      end

      response '404', 'not found' do
        run_test!
      end

      response '401', 'unauthorized' do
        run_test!
      end
    end

    put 'Update the routine' do
      tags 'Routines'
      security [api_key: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id,
        in: :path,
        type: :integer,
        required: true
      parameter name: :params,
        in: :body,
        schema: {
        type: :object,
        properties: {
          name: { type: :string },
          action: { type: :string },
          starts_at: { type: :string, format: 'date-time'},
          periodicity: { type: :string },
          monitoring_criteria: { type: :string },
          monitored_event: { type: :string },
          started_at: { type: :string, format: 'date-time' },
          updated_at:  { type: :string, format: 'date-time' },
          finished_at: { type: :string, format: 'date-time' },
          user_id: { type: :integer},
          message_template: { type: :string }
        },
        required: [ 'name', 'action', 'starts_at', 'periodicity', 'monitoring_criteria', 'monitored_event' ]
      }

      response "200", 'routine updated'  do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            action: { type: :string },
            starts_at: { type: :string, format: 'date-time'},
            periodicity: { type: :string },
            monitoring_criteria: { type: :string },
            monitored_event: { type: :string },
            started_at: { type: :string, format: 'date-time' },
            updated_at:  { type: :string, format: 'date-time' },
            finished_at: { type: :string, format: 'date-time' },
            user_id: { type: :integer},
            message_template: { type: :string }
          }

        run_test!
      end

      response '404', 'not found' do
        run_test!
      end

      response '401', 'unauthorized' do
        run_test!
      end
    end

    patch 'Update the routine' do
      tags 'Routines'
      security [api_key: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id,
        in: :path,
        type: :integer,
        required: true
      parameter name: :params,
        in: :body,
        schema: {
        type: :object,
        properties: {
          name: { type: :string },
          action: { type: :string },
          starts_at: { type: :string, format: 'date-time'},
          periodicity: { type: :string },
          monitoring_criteria: { type: :string },
          monitored_event: { type: :string },
          started_at: { type: :string, format: 'date-time' },
          updated_at:  { type: :string, format: 'date-time' },
          finished_at: { type: :string, format: 'date-time' },
          user_id: { type: :integer},
          message_template: { type: :string }
        },
        required: [ 'name', 'action', 'starts_at', 'periodicity', 'monitoring_criteria', 'monitored_event' ]
      }

      response "200", 'routine updated'  do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            action: { type: :string },
            starts_at: { type: :string, format: 'date-time'},
            periodicity: { type: :string },
            monitoring_criteria: { type: :string },
            monitored_event: { type: :string },
            started_at: { type: :string, format: 'date-time' },
            updated_at:  { type: :string, format: 'date-time' },
            finished_at: { type: :string, format: 'date-time' },
            user_id: { type: :integer},
            message_template: { type: :string }
          }

        run_test!
      end

      response '404', 'not found' do
        run_test!
      end

      response '401', 'unauthorized' do
        run_test!
      end
    end

    delete 'Delete an specific routine' do
      tags 'Routines'
      security [api_key: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id,
        in: :path,
        type: :integer,
        required: true

      response "200", 'routine deleted'  do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            action: { type: :string },
            starts_at: { type: :string, format: 'date-time'},
            periodicity: { type: :string },
            monitoring_criteria: { type: :string },
            monitored_event: { type: :string },
            started_at: { type: :string, format: 'date-time' },
            updated_at:  { type: :string, format: 'date-time' },
            finished_at: { type: :string, format: 'date-time' },
            user_id: { type: :integer},
            message_template: { type: :string }
          }

        run_test!
      end

      response '404', 'not found' do
        run_test!
      end

      response '401', 'unauthorized' do
        run_test!
      end
    end
  end
end

