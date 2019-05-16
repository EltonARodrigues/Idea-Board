class IdeasController < ApplicationController
    def index
        @ideas = Idea.all
    end

    def new
        @idea = Idea.new
    end

    def create

        @idea = Idea.new users_params
        if @idea.save
            flash[:notice] = "Ideia salva com sucesso"
            redirect_to root_url
        else
            renderiza :new
        end
    end

    def update
        puts "testado o upload "
    end

    def users_params
        params.require(:idea).permit(:title,:text)
    end

end
