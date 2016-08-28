get '/students' do
  erb :'students/index'
end

get '/students/emails' do
  erb :'students/emails'
end

get '/students/display_emails' do
  erb :'students/display_emails'
end

post '/students/emails' do
  @student = Student.new(params[:student])
  @students = Student.all
  if @student.save
    'yes'
    erb :"/students/emails"
    # erb :"/students/display_emails"
  else
    p 'no'
  #   @errors = @entry.errors.full_messages
  #   erb :'entries/new'
    ##############################
    ### THIS NEEDS TO BE FIXED ###
    ##############################
  end
end

get '/students/new' do

  erb :'/students/new'
end

post '/students/new' do
  student_list = Student.all

  list = params[:word_list].split(' ')
  passwords = []
  list.each do |word|
    passwords << "#{rand(10..99)}#{word}"
  end
  
  number_of_students = student_list.length
  p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  p number_of_students
  p passwords.length

  if number_of_students > passwords.length
    ##############################
    ### THIS NEEDS TO BE FIXED ###
    ##############################
    @errors = "You did not enter enough words."
    erb :"students/new"
  else
    p Student.all
    counter = 1
    pwd_counter = 0
    until counter > number_of_students
        a = Student.find(counter)
        p a.email
        a.password = "#{passwords[pwd_counter]}"
        a.save
        p a.password
        counter += 1
        pwd_counter += 1
    end
    @students = Student.all
    erb :'students/display'
  end
  

  # erb :'students/new'
end

post '/students/text' do
  all_students = Student.all
  message = ""
  all_students.each do |student|
    message += student.email
    message += " = "
    message += student.password
    message += "\n"
  end
  p message

  to_number = "+" + params[:text_number].to_s
  p '1111111111111111111111111111'

  require 'twilio-ruby'



  @client = Twilio::REST::Client.new account_sid, auth_token
  message = @client.account.messages.create(:body => message,
    :to => to_number,    # Replace with your phone number
    :from => "+14158516988")  # Replace with your Twilio number
  if message.sid
    p message.sid
  else
    ####### NEED SOME ERROR HANDLING HERE ######
    p "It didn't work."
    ####### ############################# ######
  end
end

# post '/students' do
#   # list = params[:word_list]
#   # p "#{list}"
#   p "#{params[:word_list]}"

# end

get '/students/:id' do
  p 'get id'
  #your code here

end

get '/students/:id/edit' do
  p 'get id edit'
  #your code here

end

put '/students/:id' do
  p 'put id'
  #your code here

end

delete '/students/:id' do
  p 'delete id'

  #your code here

end
