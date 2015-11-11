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
		task_array = []
		task_array << Task.new('Comprar manzanas rojas')
		task_array << Task.new('Lavar la ropa')
		task_array << Task.new('Convertirme en un Developer Rock Star')

		CSV.open("tarea.csv", "wb") do |csv|
				task_array.each do |task|
				  csv << [task.name, task.complete]
				end			
		end
	end

	def return_index
		task_array = []
		CSV.foreach('tarea.csv') do |row|
  			task_array << Task.new(row[0], row[1])
    end
    task_array
	end
end

