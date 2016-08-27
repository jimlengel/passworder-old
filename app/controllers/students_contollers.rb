get '/students' do
  erb :'students/index'
end

get '/students/emails' do
  erb :'students/emails'
end

post '/students/emails' do
  p '***************************************'
  p params[:student]

  @student = Student.new(params[:student])
  if @student.save
    redirect "/students/new"
  else
    p 'no'
  #   @errors = @entry.errors.full_messages
  #   erb :'entries/new'
  end
end

get '/students/new' do
  erb :'/students/new'
  # erb :'students/new'
end

post '/students/confirm' do
  student_list = Student.all
  p student_list.length
  p params[:word_list]
  list = params[:word_list].split(' ')
  passwords = []
  list.each do |word|
    passwords << "#{rand(10..99)}#{word}"
  end
  p passwords
  p student_list
  # student_list.each do |student|
  #   # passwords.cycle do |password|
  #     p student
  #   # end
  # end
  number_of_students = student_list.length
  counter = 1
  until counter == number_of_students
    a = Student.find(counter)
    p a.email
    a.password = 'test456'
    a.save
    p a.password
    counter += 1
  end

  

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
