class Admin::SongsController < Admin::BaseController

	def index
		@songs = Song.all
	end

  def destroy
    @song = Song.find(params[:id])

    if @song.destroy
      redirect_to [:admin, :songs], :notice => 'song deleted'
    else
      render :action => :new
    end
  end


end
