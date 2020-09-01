require 'swagger_helper'

RSpec.describe "events_controller", type: :request do
  path "/events" do
    post "Create a event to monitor an event" do
      tags "Events"
      security [api_key: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          category: { type: :string },
          metadata: {
            type: :object,
            properties: {
              users: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    name: { type: :string },
                    phone: { type: :string }
                  }
                }
              }
            }
          },
          previous_event_name: { type: :string },
          next_event_name: { type: :string }
        },
      }

      response "200", 'event created'  do
        schema type: :object,
          properties: {
          id: { type: :integer },
          user_id: { type: :integer },
          started_at: { type: :string, format: 'date-time' },
          finished_at: { type: :string, format: 'date-time' },
          name: { type: :string },
          category: { type: :string },
          metadata: {
            type: :object,
            properties: {
              users: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    name: { type: :string },
                    phone: { type: :string }
                  }
                }
              }
            }
          },
          previous_event_id: { type: :integer},
          previous_event_name: { type: :string },
          next_event_name: { type: :string }
        }
        run_test!
      end

      response '401', 'unauthorized' do
        run_test!
      end
    end

    get "List all created events" do
      tags "Events"
      security [api_key: []]
      produces 'application/json'

      response "200", 'events found'  do
        schema type: :object,
          properties: {
          id: { type: :integer },
          user_id: { type: :integer },
          started_at: { type: :string, format: 'date-time' },
          finished_at: { type: :string, format: 'date-time' },
          name: { type: :string },
          category: { type: :string },
          metadata: {
            type: :object,
            properties: {
              users: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    name: { type: :string },
                    phone: { type: :string }
                  }
                }
              }
            }
          },
          previous_event_id: { type: :integer},
          previous_event_name: { type: :string },
          next_event_name: { type: :string }
        }
        run_test!
      end

      response '401', 'unauthorized' do
        run_test!
      end
    end
  end

  path '/events/{id}' do
    get 'Retrieves an specific event' do
      tags 'Events'
      security [api_key: []]
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response "200", 'event found'  do
        schema type: :object,
          properties: {
          id: { type: :integer },
          user_id: { type: :integer },
          started_at: { type: :string, format: 'date-time' },
          finished_at: { type: :string, format: 'date-time' },
          name: { type: :string },
          category: { type: :string },
          metadata: {
            type: :object,
            properties: {
              users: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    name: { type: :string },
                    phone: { type: :string }
                  }
                }
              }
            }
          },
          previous_event_id: { type: :integer},
          previous_event_name: { type: :string },
          next_event_name: { type: :string }
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

    put 'Update the event' do
      tags 'Events'
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
          started_at: { type: :string, format: 'date-time' },
          finished_at: { type: :string, format: 'date-time' },
          name: { type: :string },
          category: { type: :string },
          metadata: {
            type: :object,
            properties: {
              users: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    name: { type: :string },
                    phone: { type: :string }
                  }
                }
              }
            }
          },
          previous_event_id: { type: :integer},
          previous_event_name: { type: :string },
          next_event_name: { type: :string }
        }
      }

      response "200", 'event updated'  do
        schema type: :object,
          properties: {
          id: { type: :integer },
          user_id: { type: :integer },
          started_at: { type: :string, format: 'date-time' },
          finished_at: { type: :string, format: 'date-time' },
          name: { type: :string },
          category: { type: :string },
          metadata: {
            type: :object,
            properties: {
              users: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    name: { type: :string },
                    phone: { type: :string }
                  }
                }
              }
            }
          },
          previous_event_id: { type: :integer},
          previous_event_name: { type: :string },
          next_event_name: { type: :string }
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

    patch 'Update the event' do
      tags 'Events'
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
          started_at: { type: :string, format: 'date-time' },
          finished_at: { type: :string, format: 'date-time' },
          name: { type: :string },
          category: { type: :string },
          metadata: {
            type: :object,
            properties: {
              users: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    name: { type: :string },
                    phone: { type: :string }
                  }
                }
              }
            }
          },
          previous_event_id: { type: :integer},
          previous_event_name: { type: :string },
          next_event_name: { type: :string }
        }
      }

      response "200", 'event updated'  do
        schema type: :object,
          properties: {
          id: { type: :integer },
          user_id: { type: :integer },
          started_at: { type: :string, format: 'date-time' },
          finished_at: { type: :string, format: 'date-time' },
          name: { type: :string },
          category: { type: :string },
          metadata: {
            type: :object,
            properties: {
              users: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    name: { type: :string },
                    phone: { type: :string }
                  }
                }
              }
            }
          },
          previous_event_id: { type: :integer},
          previous_event_name: { type: :string },
          next_event_name: { type: :string }
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

    delete 'Delete an specific event' do
      tags 'Events'
      security [api_key: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id,
        in: :path,
        type: :integer,
        required: true

      response "200", 'event deleted'  do
        schema type: :object,
          properties: {
          id: { type: :integer },
          user_id: { type: :integer },
          started_at: { type: :string, format: 'date-time' },
          finished_at: { type: :string, format: 'date-time' },
          name: { type: :string },
          category: { type: :string },
          metadata: {
            type: :object,
            properties: {
              users: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    name: { type: :string },
                    phone: { type: :string }
                  }
                }
              }
            }
          },
          previous_event_id: { type: :integer},
          previous_event_name: { type: :string },
          next_event_name: { type: :string }
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

