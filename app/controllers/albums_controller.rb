class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in
  # GET /albums
  # GET /albums.json
  def index
    @albums = current_user.albums.all
  end

  # GET /albums/1
  # GET /albums/1.json

  # GET /albums/new
  def new
    @album = current_user.albums.new
  end

  def show
  end

  # GET /albums/1/edit
  def edit
    # @album = current_user.albums.find(params[:id])
    respond_to do |format|
      if @album.update
        format.html { render :show, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = current_user.albums.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to users_album_path(@album), notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def edit
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :image, :artist, :url)
    end

    def set_album
      @album = current_user.albums.find(params[:id])
    end
end
