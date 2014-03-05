require 'test_helper'

class TournamentStatsControllerTest < ActionController::TestCase
  setup do
    @tournament_stat = tournament_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tournament_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tournament_stat" do
    assert_difference('TournamentStat.count') do
      post :create, tournament_stat: { standing: @tournament_stat.standing, tournament_id: @tournament_stat.tournament_id, user_id: @tournament_stat.user_id }
    end

    assert_redirected_to tournament_stat_path(assigns(:tournament_stat))
  end

  test "should show tournament_stat" do
    get :show, id: @tournament_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tournament_stat
    assert_response :success
  end

  test "should update tournament_stat" do
    patch :update, id: @tournament_stat, tournament_stat: { standing: @tournament_stat.standing, tournament_id: @tournament_stat.tournament_id, user_id: @tournament_stat.user_id }
    assert_redirected_to tournament_stat_path(assigns(:tournament_stat))
  end

  test "should destroy tournament_stat" do
    assert_difference('TournamentStat.count', -1) do
      delete :destroy, id: @tournament_stat
    end

    assert_redirected_to tournament_stats_path
  end
end
