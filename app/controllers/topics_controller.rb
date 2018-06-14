class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
  end

  def new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create         
    # render plain: params[:topic].inspect
    @topic = Topic.new(topic_params)

    # If saved successfully
    if @topic.save
      # Loads another page
      redirect_to @topic
    else
      # Tells anothe browser to issue another request
      render 'new'
    end
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update(topic_params)
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    redirect_to topics_path
  end

  def upvote
    # @topic = Topic.find(params[:id])
    Vote.create(topic_id: params[:id])
    # @topic.votes.create

    redirect_to(topics_path)
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :description)
    end
end
