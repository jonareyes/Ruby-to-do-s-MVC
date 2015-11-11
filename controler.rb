require_relative 'model'
require_relative 'view'

class AllController

	def initialize(argv)
		@model = ManipulateTask.new
		@view = View.new
    @argv = argv[0]
    # select(@argv)
		start
    index
	end

  def select(command)
    case
    when command.match(/index/)
      index
    when command.match(/add/)
      add
    when command.match(/delete/)
      delete
    when comman.match(/complete/)
      complete
    end
  end
      
	def start
		@model.create_csv
		@view.index
	end

  def index

     tasks = @model.task_array


    # array de objetos task

    @view.index
  end
end


AllController.new(ARGV)