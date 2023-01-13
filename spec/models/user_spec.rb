require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Is a valid user' do
  end

  context 'Is invalid when' do
    let!(:college) { create(:college) }
    let!(:exam) { create(:exam, college: college )}
    let!(:exam_window) { create(:exam_window, exam: exam) }
    let!(:user) { build(:user, exam: exam) }
    
    it 'does\'t contain a first name' do
      user.first_name = nil
      user.save

      expect(user).to_not be_valid
      expect(user.errors.messages[:first_name]).to eq ['can\'t be blank']
    end

    it 'does\'t contain a last name' do
      user.last_name = nil
      user.save

      expect(user).to_not be_valid
      expect(user.errors.messages[:last_name]).to eq ['can\'t be blank']
    end

    it 'does\'t contain a phone number' do
      user.phone_number = nil
      user.save

      expect(user).to_not be_valid
      expect(user.errors.messages[:phone_number]).to include('can\'t be blank')
    end

    it 'does\'t contain an exam' do
      user.exam = nil
      user.save

      expect(user).to_not be_valid
      expect(user.errors.messages[:exam]).to include('can\'t be blank')
    end

    it 'contains an invalid format phone number' do
      user.phone_number = '123'
      user.save

      expect(user).to_not be_valid
      expect(user.errors.messages[:phone_number]).to eq ['Invalid format for number 123']
    end
    
  end
end
