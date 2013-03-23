["aml@panter.ch", "frankschneider7d@googlemail.com", "ch.smettan@gmail.com"].each do |email|
  next if User.find_by_email email
  User.create! :email => email, :password => "Ohf7phie"
  puts "User created: #{email}"
end

1.upto(5).each do |i|
  customer = "Kunde #{i}"
  next if Customer.find_by_name customer
  Customer.create! :name => customer
  puts "Customer created: #{customer}"
end

1.upto(5).each do |i|
  next if Book.find_by_title "Book #{i}"
  Book.create! :title => "Book #{i}", :authors => "Author #{i}"
  puts "Book created: 'Book #{i}' from 'Authors #{i}'"
end

