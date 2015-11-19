require_relative 'model'
require_relative 'view'

class AllController

	def initialize(argv)
		@model = ManipulateTask.new
		@view = View.new
    # @argv = argv[0]ar
    select(argv)
	end

  def select(command)

    case command[0]
    when "index" then index
    when "add" then add(command[1])
    when "delete" then delete(command[1].to_i)
    when "switch" then switch(command[1].to_i)
    end
  end
      
	def start
		@model.create_csv
		@view.index
	end

  def index
    tasks = @model.read_csv
    @view.index(tasks)
  end

  def add(string)
    if string != nil
      task = Task.new(string)
      @model.add_task(task)
      @view.add(task)
    else
      @view.not_added
    end
  end

  def delete(index)
    task = @model.delete_task(index)
    @view.delete(task)
  end

  def switch(index)
  	task = @model.switch_task(index)
  	@view.switch(task)
  end

end

input = ARGV
AllController.new(input)