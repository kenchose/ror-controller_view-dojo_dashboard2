class DojosController < ApplicationController
  def index
    @count = Dojo.all.count
    @dojo = Dojo.all
  end

  def new
    @dojo = Dojo.new
  end

  def create
    @dojo = Dojo.create (dojo_params)
    if @dojo.save
      flash[:success] = "You have successfully created a new Dojo!"
      redirect_to '/dojos'
    else
      flash[:errors] = @dojo.errors.full_messages
      redirect_to '/dojos/new'
    end
  end

  private 
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end
  end 
