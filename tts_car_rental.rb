
@lot =[]
@renters =[]
@rented_cars = {}

#require vehicle.rb
require_relative "vehicle"

#require person.rb
require_relative "person"

#define Main Menu
def print_menu clear
	if clear
		system "clear"
	end
	puts "*** Welcome to the TTS Car Rental Agency ***"
	puts "*** Please select from the following menu: ***"
	puts "*** 1. Add a Vehicle ***"
	puts "*** 2. Add a Renter ***"
	puts "*** 3. List Vehicles ***"
	puts "*** 4. List Renters ***"
	puts "*** 5. Assign Vehicles ***"
	puts "*** 6. List Rented Vehicles ***"
	puts "*** 9. Exit program ***"

	user_choice = gets.chomp.to_i

if
	user_choice == 1
		add_vehicle
		second_menu(false)
		
	elsif user_choice == 2
		add_person
		second_menu(false)
		
	elsif user_choice == 3
		list_vehicles
		second_menu(true)
		
	elsif user_choice == 4
		list_renters
		second_menu(true)

	elsif user_choice == 5
		assign_vehicles
		second_menu(true)
	
	elsif user_choice == 6
		list_rented_cars
		second_menu(true)
		
	elsif user_choice == 9
		byebye
	else
		failed_byebye
		
	end
end

#define Secondary Menu
def second_menu clear
	if clear
		system "clear"
	end
	puts " "
	puts "*** Please select from the following menu: ***"
	puts "*** 1. Add a Vehicle ***"
	puts "*** 2. Add a Renter ***"
	puts "*** 3. List Vehicles ***"
	puts "*** 4. List Renters ***"
	puts "*** 5. Assign Vehicles ***"
	puts "*** 6. List Rented Vehicles ***"
	puts "*** 9. Exit program ***"

	user_choice = gets.chomp.to_i

if
	user_choice == 1
		add_vehicle
		third_menu(false)
		
	elsif user_choice == 2
		add_person
		third_menu(false)
		
	elsif user_choice == 3
		list_vehicles
		third_menu(false)
		
	elsif user_choice == 4
		list_renters
		third_menu(false)

	elsif user_choice == 5
		assign_vehicles
		third_menu(false)
		
	elsif user_choice == 6
		list_rented_cars
		second_menu(true)

	elsif user_choice == 9
		byebye
	else
		failed_byebye
	end
end


#define Tertiary Menu
def third_menu clear
	if clear
		system "clear"
	end
	puts " "
	puts "*** Do you wish to continue? Y or N ***"
	user_choice = gets.chomp.upcase
		if
		user_choice == "Y"
		second_menu(false)
		elsif user_choice == "N"
			byebye
		else
		failed_byebye
	end
end


#define add vehicle
def add_vehicle
	puts "Enter a year."
	year = gets.chomp.to_i
	puts "Enter a make."
	make = gets.chomp
	puts "Enter a model."
	model = gets.chomp
	car = Vehicle.new(year, make, model)
	@lot.push(car)
	puts " "
	puts "#{car.year} #{car.make} #{car.model} has been entered."
end

#define add person
def add_person
	puts "Enter the renter's name."
	name = gets.chomp
	puts "Enter the renter's age."
	age = gets.chomp.to_i
		#add age test
		if age < 21
		puts "This person is not eligible to rent a vehicle. Please enter a valid renter."
		add_person
		else
		#end age test
	puts "Enter the renter's city."
	city = gets.chomp
	renter = Person.new(name, age, city)
	@renters.push(renter)
	puts " "
	puts "#{renter.name} has been entered."
		end
end

def assign_vehicles
	puts "Enter a number to select a renter."
	@renters.each_with_index do |renter, index|
	puts "#{index+1} Name: #{renter.name} Age: #{renter.age} City: #{renter.city}"
	end
	person_choice = gets.chomp.to_i
	

	puts "Enter a number to select a vehicle."
	@lot.each_with_index do |car, index|
	puts "#{index+1} Year: #{car.year} Make: #{car.make} Model: #{car.model}"
	end
	car_choice = gets.chomp.to_i
	@rented_cars[@lot[car_choice]] = @renters[person_choice]
	puts "The #{@rented_cars[@lot[car_choice]]} has been rented to #{renters[person_choice]}."
	third_menu(false)
	end

def list_rented_cars
	puts "Cars that are rented: "
	@rented_cars.each do |car_choice, person_choice|
		puts "#{car_choice.make} is rented to #{person_choice.name}"
	end
	print_menu(false)


end

# #save rental data to text file
# def save_rental
# 	puts "Would you like to save this rental?"
# 	user_choice = gets.chomp.upcase
# 	if user_choice == "Y"
# 		fname = "rental.txt"
# 		rentalrecord = File.open(fname, "w")
# 		rentalrecord.puts "You have entered the following renter(s): "
# 			@renters.each do |renter|
# 				puts "Name: #{renter.name}"
# 				puts "Age: #{renter.age}"
# 				puts "City: #{renter.city}"
# 				puts " "
# 		rental record.puts "You have entered the following vehicle(s): "
# 			@lot.each do |car|
# 				puts "#{car.make} #{car.model} #{car.year}"
# 		rentalrecord.close

# 	end
# end





#define exit message
def byebye
	# save_rental
	puts " "
	puts "*** Thank you for renting. Goodbye."
	# puts "*** Your rental has been saved. *** "
	puts " "
end

#define failed selection exit message
def failed_byebye
	puts "*** That is not a valid option. Please try again."
	third_menu(false)
end

#define list vehicles
def list_vehicles
	puts " "
	puts "You have entered the following vehicle(s): "
		@lot.each do |car|
			puts "#{car.make} #{car.model} #{car.year}"
end

#define list renters
def list_renters
	puts " "
	puts "You have entered the following renter(s): "
		@renters.each do |renter|
			puts "Name: #{renter.name}"
			puts "Age: #{renter.age}"
			puts "City: #{renter.city}"
			puts " "
		end
	end
end


print_menu(true)