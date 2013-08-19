class Pub::SongsController < Pub::BaseController
	before_filter :add_song_tab_active, :only => [:new, :create]

	def index
		return @titles = Title.all if params[:q].blank?

		@titles = Title.search_by_name(params[:q])		
	end

	def new		
		@song = Song.new
		#@song.titles.build(:primary => true)
		#@song.versions.build
		#@song.versions.first.pages.build
	end

	def show
		@song = Song.find(params[:id])
	end

	def create
		@song = Song.new(params[:song])

		if @song.save
			redirect_to root_url, :notice => 'Song was successfully submitted.'
		else
			render :new
		end
	end

	private

	def add_song_tab_active
		@tab_class = :active
	end

end
