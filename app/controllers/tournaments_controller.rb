class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]
  before_action :set_teams_and_users, only: [:new, :edit, :update, :create]

  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.all
  end

  def statistics
    @winners = User.users_by(:number_of_wins,5)
    @recent_winner = TournamentStat.most_recent_winner
    @losers = User.users_by(:number_of_losses, 5)
    @users_by_played = User.users_by(:number_of_tournaments,5)
    @winners_by_ratio = User.users_by(:win_ratio, 5)
    @users_by_point_ratio = User.users_by(:point_ratio, 5)
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    # render text: params
    @tournament = Tournament.new(tournament_params)
    #raise if validate_tournament_stats(tournament_params)
    

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tournament }
      else
        format.html { render action: 'new' }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
   end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    def set_teams_and_users
      @users = User.alphabetically
      @teams = Team.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:name, :user_id, :team_id, tournament_stats_attributes:[ :standing, :user_id, :team_id, :points ])
    end

    def validate_tournament_stats(stats)
      stats.to_a.uniq?
    end
end
