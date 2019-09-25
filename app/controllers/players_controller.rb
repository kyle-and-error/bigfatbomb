class PlayersController < ApplicationController

  def index
  end

  def show
    @player = Player.find(params[:id])
    authorize @player
  end

  def edit
  end

  def new
    @player = Player.new
    authorize @player
  end

  def create
    @player = Player.new(player_params)
    @player.host = current_user

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player Profile was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
    authorize @player
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:player_id])
    authorize @player
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def player_params
    params.require(:player).permit(:name, :description, :location, :people_needed, :photo, :start_time, :end_time)
  end
end
