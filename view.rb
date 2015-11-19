class View

	def index(tasks)
    tasks.each_with_index do |task, index|
    	if task.complete
    		puts "#{index + 1}.[ ] #{task.name}"
    	else
    		puts "#{index + 1}.[x] #{task.name}"
    	end
    end
	end

	def add(task)
		puts "agregaste #{task.name}"
	end

	def not_added
		puts "no agregaste nada"
	end

	def delete(task)
		puts "borraste #{task.name}"
	end

	def switch(task)
			puts "La tarea esta #{task.complete} #{task.name}"
	end
end


# si la primera tarea es completa poner x
# si no esta completa poner vacio " " 