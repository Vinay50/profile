class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to @story
      flash[:success] = 'Stoy added successfully.'
    else
      redirect_to :new
      flash[:error] = 'Could not add Story. Please try later.'
    end
  end

  private

  def story_params
    params.require(:story).permit(:title, :content)
  end
end
