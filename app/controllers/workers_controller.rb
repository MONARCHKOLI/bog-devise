class WorkersController < ApplicationController
    def index
        @workers = Worker.all
    end

    def show
        @worker = Worker.find(params[:id])
    end

    def new 
        @worker = Worker.new
    end

    def create
        @worker =  Worker.new(worker_params)
        @worker.user_id = current_user.id
        if @worker.save
            redirect_to "/workers"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit 
        @worker = Worker.find(params[:id])
    end

    def update
		@worker = Worker.find(params[:id])
		if @worker.update(worker_params)
			redirect_to "/workers"
		else
			render :edit, status: :unprocessable_entity
		end
	end

    def destroy
        @worker = Worker.find(params[:id])
        @worker.destroy
        redirect_to "/workers", status: :see_other        
    end

    private

	def worker_params
		params.require(:worker).permit(:name,:shift,:date,:age,:gender,:user_id)
	end
end
