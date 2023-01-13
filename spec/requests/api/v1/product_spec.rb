# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/product', type: :request do
  path '/api/v1/product/index' do
    get('list products') do
      tags 'Products'
      consumes 'application/json'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/product/add_review' do
    post('add review product') do
      tags 'Products'
      consumes 'application/json'
      parameter name: :review, in: :body, schema: {
        type: :object,
        properties: {
          description: { type: :string },
          user_id: { type: :string },
          name: { type: :string }
        },
        required: %w[description user_id name]
      }
      parameter name: :id, in: :query, required: true, schema: {
        type: :string
      }
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
