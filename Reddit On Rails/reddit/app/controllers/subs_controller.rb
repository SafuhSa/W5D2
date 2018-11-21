class SubsController < ApplicationController

def new
  @sub = Sub.new
  render :new
end

def create
  @sub = current_user.subs.new(sub_params)
  if @sub.save
    redirect_to sub_url(@sub)
  else
    flash[:errors] = @sub.errors.full_messages
    render :new
  end
end

def show
  @sub = Sub.find(params[:id])
end

def index
  @subs = Sub.all
  render :index
end

def edit
  @sub = Sub.find(params[:id])
end

def update
  @sub = Sub.find(params[:id])
  if @sub.update(sub_params)
    redirect_to @sub
  else
    flash[:errors] = @sub.errors.full_messages
    render :edit
  end
end


def sub_params
  params.require(:sub).permit(:name, :description)
end
end
