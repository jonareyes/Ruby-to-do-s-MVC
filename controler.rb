require_relative 'model'
require_relative 'view'

class AllController

	def initialize(argv)
		@model = ManipulateTask.new
		@view = View.new
    @argv = argv[0]
    # select(@argv)
		start
	end

  def select(command)
    case
    when command.match(/index/)
      index
    when command.match(/add/)
      add
    when command.match(/delete/)
      delete
    end
  end
      
	def start
		@model.create_csv
		@view.task_complete	
	end

  def index
    @view.task_complete
  end
end


AllController.new(ARGV)