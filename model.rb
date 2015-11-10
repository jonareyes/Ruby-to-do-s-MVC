require 'csv'

class Task
	attr_accessor :name, :complete

	def initialize(name, complete=false)
		@name = name
		@complete = complete
	end	
end

class ManipulateTask

	def create_csv
		task1 = Task.new('Comprar manzanas rojas')
		task2 = Task.new('Lavar la ropa')
		task3 = Task.new('Convertirme en un Developer Rock Star')

		CSV.open("tarea.csv", "wb") do |csv|
				csv << [task1.name]
				csv << [task2.name]
				csv << [task3.name]

		end
	end

	# def add_to_list

		
	# end
end

