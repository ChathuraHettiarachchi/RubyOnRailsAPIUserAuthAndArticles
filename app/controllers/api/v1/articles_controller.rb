# frozen_string_literal: true

class Api::V1::ArticlesController < ApplicationController
  def index
    reply = Article.all

    render json: {
      status:   1,
      message:  t('.hello'),
      articles: reply
    }, include: {user: {only: %i[id name email]}}, status: :ok
  end

  def show
    begin
      article = Article.find(params[:id])
      response = {status: 1, message: 'Article found', content: article}
    rescue StandardError => e
      response = {status: 0, message: e, content: nil}
    end

    @reply = response
  end

  def create
    if !article_params.nil?
      if (Article.find_by title: article_params[:title]).nil?
        article = Article.new(article_params)

        response = if article.save
                     {status: 1, message: 'Article saved successfully', content: article}
                   else
                     {status: 0, message: 'Article failed to save', content: article.errors}
                   end

      else
        response = {status: 0, message: 'Article already in the database', content: nil}
      end
    else
      response = {status: 0, message: 'Error', content: nil}
    end
    @reply = response
  end

  private

  def article_params
    params.permit(:title, :body, :user_id)
  end
end
