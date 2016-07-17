
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
		continue_vehicle
	elsif user_choice == 2
		add_person
		continue_people
	elsif user_choice == 3
		list_vehicles
		continue_vehicle
	elsif user_choice == 4
		list_renters
		continue_people
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
		continue_vehicle
	elsif user_choice == 2
		add_person
		continue_people
	elsif user_choice == 3
		list_vehicles
		continue_vehicle
	elsif user_choice == 4
		list_renters
		continue_people
	elsif user_choice == 9
		byebye
	else
		puts "That is not a valid option. Please select 1, 2, 3, 4, or 9."
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


#define option to continue adding vehicles
def continue_vehicle
	puts "Would you like to add another vehicle? Enter Y or N."
	continue1 = gets.chomp.upcase
	if continue1 == "Y"
		add_vehicle
	else
		puts " "
		second_menu(false)
	end


end
	
#define option to continue adding people
def continue_people
	puts "Would you like to add another person? Enter Y or N."
	continue2 = gets.chomp.upcase
	if continue2 == "Y"
		add_person
	else
		puts " "
		second_menu(false)
	# else
	# 	byebye
	end


end

#define exit message
def byebye
	list_vehicles
	list_renters
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
	puts "You have entered the following vehicles: "
		@lot.each do |car|
			puts "#{car.make} #{car.model} #{car.year}"
			puts " "
		end

#define list renters
def list_renters
	puts " "
	puts "You have entered the following renters: "
		@renters.each do |renter|
			puts "#{renter.name} #{renter.age} #{renter.city}"
			puts " "
		end
	end
end

print_menu(true)





