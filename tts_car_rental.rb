
@lot =[]
@renters =[]

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
	puts "Enter the renter's city."
	city = gets.chomp
	renter = Person.new(name, age, city)
	@renters.push(renter)
	puts " "
	puts "#{renter.name} has been entered."
end


#define exit message
def byebye
	puts " "
	puts "*** Thank you for renting. Goodbye."
	puts " "
	puts " "
end

#define failed selectionexit message
def failed_byebye
	puts "*** That is not a valid option. Goodbye."
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





