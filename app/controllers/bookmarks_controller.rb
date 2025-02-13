class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to @list, notice: 'Movie was successfully added to the list.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @bookmark.list, notice: 'Bookmark was successfully removed.'
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
