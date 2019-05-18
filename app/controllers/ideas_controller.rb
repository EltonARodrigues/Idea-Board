class IdeasController < ApplicationController

  before_action :set_idea, only: [:edit, :destroy, :update, :upvote, :downvote]

  def index
    @ideas = Idea.all.order :cached_votes_up => :desc
  end

  def new
    if user_logged
      @idea = Idea.new
    else
      redirect_to root_path
    end
  end

  def create
    @idea = Idea.new idea_params
    if @idea.save
      redirect root_path, "Ideia salva com sucesso"
    else
      flash.now[:alert] = "Erro! verifique os campos"
      render :new
    end
  end

  def edit
    if user_logged
      render :edit
    else
      redirect root_path 
    end
  end

  def update
    if @idea.update idea_params
        redirect root_path, "Ideia atualizada com sucesso"
    else
        render :edit
    end
  end

  def destroy
    if user_logged
      @idea.destroy
      @idea.picture.purge
      redirect root_path
    else
      redirect root_path
    end
  end

  def upvote
    @idea.upvote_from current_user
    redirect root_path
  end

  def downvote
    @idea.downvote_from current_user
    redirect root_path
  end

  private 

  def idea_params
    params.require(:idea).
      permit(:title, :text, :picture).
      merge(:user_id => current_user.id)
  end

  def set_idea
    id = params[:id]
    @idea = Idea.find(id)
  end

  def user_logged  
    session[:user_id]
  end

  def redirect(path, alert = nil)
    redirect_to path, notice: alert
  end
end
