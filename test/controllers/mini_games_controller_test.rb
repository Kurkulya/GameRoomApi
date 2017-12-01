require 'test_helper'

class MiniGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mini_game = mini_games(:one)
  end

  test "should get index" do
    get mini_games_url
    assert_response :success
  end

  test "should get new" do
    get new_mini_game_url
    assert_response :success
  end

  test "should create mini_game" do
    assert_difference('MiniGame.count') do
      post mini_games_url, params: { mini_game: {  } }
    end

    assert_redirected_to mini_game_url(MiniGame.last)
  end

  test "should show mini_game" do
    get mini_game_url(@mini_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_mini_game_url(@mini_game)
    assert_response :success
  end

  test "should update mini_game" do
    patch mini_game_url(@mini_game), params: { mini_game: {  } }
    assert_redirected_to mini_game_url(@mini_game)
  end

  test "should destroy mini_game" do
    assert_difference('MiniGame.count', -1) do
      delete mini_game_url(@mini_game)
    end

    assert_redirected_to mini_games_url
  end
end
