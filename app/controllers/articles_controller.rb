class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(allowed_params)

    if @article.save
      redirect_to Article, flash: { notice: t('resources.created') }
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
  end

  private

  def allowed_params
    params.require(:article).permit(:name, :description, :risk)
  end
end
