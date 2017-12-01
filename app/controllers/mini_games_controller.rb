class MiniGamesController < ApplicationController
  before_action :set_mini_game, only: [:show, :edit, :update, :destroy]

  # GET /mini_games
  # GET /mini_games.json
  def index
    @mini_games = MiniGame.all
    render json: @mini_games, status: :ok
  end

  # GET /mini_games/1
  # GET /mini_games/1.json
  def show
  end

  # GET /mini_games/new
  def new
    @mini_game = MiniGame.new
  end

  # GET /mini_games/1/edit
  def edit
  end

  # POST /mini_games
  # POST /mini_games.json
  def create
    @mini_game = MiniGame.new(mini_game_params)
    if @mini_game.save
      render json: @mini_game, status: :ok
    else
      render json: @mini_game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mini_games/1
  # PATCH/PUT /mini_games/1.json
  def update
    if @mini_game.update(mini_game_params)
      render json: @mini_game, status: :ok
    else
      render json: @mini_game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mini_games/1
  # DELETE /mini_games/1.json
  def destroy
    if @mini_game.destroy
      render json: @mini_game, status: :ok
    else
      render json: @mini_game, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mini_game
      @mini_game = MiniGame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mini_game_params
      params.fetch(:mini_game, {})
    end
end
