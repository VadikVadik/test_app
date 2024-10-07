class CreateUser < ActiveInteraction::Base
  hash :params do
    string :name
    string :surname
    string :patronymic
    string :age
    string :email
    string :nationality
    string :country
    string :gender
    string :skills
    string :interests
  end

  def execute
    user_full_name =
      "#{params[:surname]} #{params[:name]} #{params[:patronymic]}".strip
    user_params = params.except(:interests, :skills, :age)
    user = User.create(user_params.merge(full_name: user_full_name,
                                         age: params[:age].to_i))

    if params[:interests]
      params[:interests].split(',').each do |interest|
        name = interest.strip
        interest = Interest.find_by(name: name)
        interest ||= Interest.create(name: name)
        user.interests.push(interest)
      end
    end

    if params[:skills]
      params[:skills].split(',').each do |skil|
        name = skil.strip
        skil = Skil.find_by(name: name)
        skil ||= Skil.create(name: name)
        user.skills.push(skil)
      end
    end

    user
  end
end
