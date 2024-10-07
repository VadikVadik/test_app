require 'rails_helper'

RSpec.describe CreateUser do
  describe '#execute' do
    let(:name) { 'Name' }
    let(:surname) { 'Surname' }
    let(:patronymic) { 'Patronymic' }
    let(:age) { '18' }
    let(:email) { 'mail@example.com' }
    let(:nationality) { 'Nationality' }
    let(:country) { 'Country' }
    let(:gender) { 'Male' }
    let(:skills) { 'Skil_1, Skil_2' }
    let(:interests) { 'Interest_1, Interest_2' }
    let(:params) do
      { name: name, surname: surname, patronymic: patronymic, age: age,
        email: email, nationality: nationality, country: country,
        gender: gender, skills: skills, interests: interests}
    end

    subject(:create_user) do
      described_class.run(params: params)
    end

    context 'with valid attributes' do
      it 'creates a new user' do
        expect { create_user }.to change(User, :count).by(1)
      end

      it 'returns a successful result' do
        expect(create_user).to be_valid
      end

      it 'sets the attributes correctly' do
        result = create_user.result

        expect(result.name).to eq(name)
        expect(result.surname).to eq(surname)
        expect(result.patronymic).to eq(patronymic)
        expect(result.age).to eq(age.to_i)
        expect(result.email).to eq(email)
        expect(result.nationality).to eq(nationality)
        expect(result.country).to eq(country)
        expect(result.gender).to eq(gender)

        skills.split(',').each do |skil|
          expect(result.skills).to include(Skil.find_by(name: skil.strip))
        end

        interests.split(',').each do |interest|
          expect(result.interests).to include(Interest.find_by(name: interest.strip))
        end
      end
    end

    context 'with invalid attributes' do
      it 'returns an invalid result' do
        expect(described_class.run(params: {})).to_not be_valid
      end
    end
  end
end
