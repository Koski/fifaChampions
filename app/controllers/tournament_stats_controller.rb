class TournamentStatsController < ApplicationController
  before_action :set_tournament_stat, only: [:show, :edit, :update, :destroy]

  # GET /tournament_stats
  # GET /tournament_stats.json
  def index
    @tournament_stats = TournamentStat.all
  end

  # GET /tournament_stats/1
  # GET /tournament_stats/1.json
  def show
  end

  # GET /tournament_stats/new
  def new
    @tournament_stat = TournamentStat.new
  end

  # GET /tournament_stats/1/edit
  def edit
  end

  # POST /tournament_stats
  # POST /tournament_stats.json
  def create
    @tournament_stat = TournamentStat.new(tournament_stat_params)

    respond_to do |format|
      if @tournament_stat.save
        format.html { redirect_to @tournament_stat, notice: 'Tournament stat was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tournament_stat }
      else
        format.html { render action: 'new' }
        format.json { render json: @tournament_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournament_stats/1
  # PATCH/PUT /tournament_stats/1.json
  def update
    respond_to do |format|
      if @tournament_stat.update(tournament_stat_params)
        format.html { redirect_to @tournament_stat, notice: 'Tournament stat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tournament_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_stats/1
  # DELETE /tournament_stats/1.json
  def destroy
    @tournament_stat.destroy
    respond_to do |format|
      format.html { redirect_to tournament_stats_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament_stat
      @tournament_stat = TournamentStat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_stat_params
      params.require(:tournament_stat).permit(:user_id, :tournament_id, :standing)
    end
end
