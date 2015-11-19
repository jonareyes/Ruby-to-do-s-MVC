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
					if task.complete == "true"
				  	csv << [task.name, true]
				  elsif task.complete == "false"
				  	csv << [task.name, false]
				  end
				end			
		end
	end

	def read_csv
		task_array = []
		CSV.foreach("tarea.csv") do |row|
  			task_array << Task.new(row[0], row[1]=="true" ? true:false)
    	end
    task_array
	end

	def add_task(task)
		CSV.open("tarea.csv", "a+") do |csv|
			csv <<  [task.name, task.complete]
		end
	end

	def delete_task(index)
		tasks = read_csv
		task = tasks[index-1]
		tasks.delete_at(index-1)
		save_csv(tasks)
		task
	end

	def save_csv(tasks)
		CSV.open("tarea.csv", "w+") do |csv|
			tasks.each do |task|
				csv << [task.name, task.complete]
			end
		end
	end

	def switch_task(index)
		tasks = read_csv
		task = tasks[index-1]
		task.complete = !task.complete
		save_csv(tasks)
		task
	end
end

