class AnswersController < ApplicationController
        before_action :authenticate_user!, except: [:index, :show]

    def create
        question_id = params[:question_id]
        @question = Question.find(question_id)
        answer_params = params.require(:answer).permit(:body)
        @answer = Answer.new answer_params
        @answer.question = @question
        @answer.user = current_user

        if @answer.save
            redirect_to question_path(@question)
        else
            render 'questions/show'
        end
    end

    def destroy
        question_id = params[:question_id]
        @question = Question.find(question_id)
        @answer = Answer.find(params[:id])
        @answer.destroy
        redirect_to question_path(@question)
    end
end
