require 'net/http'
require 'uri'
class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
    render json: @rooms, status: :ok
    # exec('ttt_web') start
    # exec(kill -9 $(lsof -i tcp:3000 -t))
  end

  def show
  end

  def start_game
    Thread.new do
      system('ttt_web_gameBoard')
    end
  end

  def stop_server
    @response = params
    # Thread.new do
    #   system('kill -9 $(lsof -i tcp:4567 -t)')
    # end
    params = {'box1' => 'Nothing is less important than which fork you use. Etiquette is the science of living. It embraces everything. It is ethics. It is honor. -Emily Post',
              'button1' => 'Submit'
    }
    x = Net::HTTP.post_form(URI.parse('ws://localhost:8050/1'), @response)
    put x.body
  end
  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    if @room.save
      render json: @room, status: :ok
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    if @room.update(room_params)
      render json: @room, status: :ok
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    if @room.destroy
      render json: @room, status: :ok
    else
      render json: @room, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:title, :gameServer, :image, :currentPlayers, :maxPlayers)
    end
end
