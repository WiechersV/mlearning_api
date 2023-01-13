require "rails_helper"

RSpec.describe "Users", type: :request do
  
  describe 'POST /users' do
    let!(:college) { create(:college) }
    let!(:exam) { create(:exam, college: college )}
    let!(:exam_window) { create(:exam_window, exam: exam) }
    let!(:user) { build(:user, exam: exam) }
    let(:default_params) {
      {
        user: omit_params(user.attributes.symbolize_keys, [:id, :created_at, :updated_at]),
        college_id: college.id,
        start_time: '2023-01-13'
      }
    }
    
    context 'with invalid parameters' do
      context 'returns a bad request status when' do
        [
          [:first_name, true],
          [:last_name, true],
          [:phone_number, true],
          [:exam_id, true],
          [:college_id, false]
        ].each do |params|
          it "doesn\'t specify the #{params[0]} param" do
            post '/users', params: omit_params(default_params, *params)
  
            expect(response).to have_http_status("400")
          end
        end
        
        it "passes an invalid format number to request" do
          post '/users', params: {
            **omit_params(default_params, [:phone_number], true),
            phone_number: "123"
          }
          expect(response).to have_http_status("400")
        end

        it 'passes a start_time that doesn\'t exist' do
          post '/users', params: {
            **omit_params(default_params, [:start_time], false),
            start_time: "2023-01-11"
          }
          expect(response).to have_http_status("400")
        end
      end
    end

    context 'with valid parameters' do
      it 'returns success if a given user is created successfuly' do
        post '/users', params: default_params

        expect(response).to have_http_status("200")
      end
    end
  end

end