class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
  	#binding.pry
  	@event = Event.find(params["id"])
  	@comment = @event.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to root_url
    else
      render 'events/event_info'
    end
  end

  def destroy
  end

  def edit
  end

  def update 
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end