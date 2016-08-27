get '/students' do
  erb :'students/index'
end

get '/students/emails' do
  erb :'students/emails'
end

post '/students/emails' do
  # emails = params[:email_list].split(' ')
  # emails.each do |email|
  #   @student = Students.new(email)    
  # end
  p '***************************************'
  p params[:student]
  @student = Student.new(params[:student])
  if @student.save
    redirect "/students/new"
  else
    p 'no'
  end

  # if @entry.save
  #   redirect "/show-one-entry/#{@entry.id}"
  # else
  #   @errors = @entry.errors.full_messages
  #   erb :'entries/new'
  # end


  # params[:email_list]
  # erb :'students/new'
end

# get 'students/emails' do
#   erb :'students/emails'
# end

get '/students/new' do
  erb :'/students/new'
  # erb :'students/new'
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
