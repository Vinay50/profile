class StoriesController < ApplicationController
  def index
    #@stories = Story.all
    @stories = Story.paginate(:page => params[:page])
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
      flash[:success] = 'Stoy added successfully.'
      redirect_to @story
    else
      flash[:error] = 'Could not add Story. Please try later.'
      redirect_to @story
    end
  end

  private

  def story_params
    params.require(:story).permit(:title, :content, :all_tags)
  end
end
