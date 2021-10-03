class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
    end
    def new
        @tweet = Tweet.new
    end
    def create
        logger.debug "---------------" + params[:tweet][:message] + "------"
        @tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
        if @tweet.save
            flash[:notice] = '1件ツイートしました'
            redirect_to root_path
        else
            render 'new'
        end
    end
    def show
        @tweet = Tweet.find(params[:id])
    end
    def destroy
        tweet = Tweet.find(params[:id])
        if tweet.destroy
            flash[:notice] = 'ツイートを削除しました'
        end
        redirect_to root_path
    end
    def edit
        @tweet = Tweet.find(params[:id])
    end
    def update
        @tweet = Tweet.find(params[:id])
        if @tweet.update(message: params[:tweet][:message])
            flash[:notice] = 'ツイートを更新しました'
            redirect_to root_path
        else
            render 'edit'
        end
    end
end
