class WorkerSkillsController < ApplicationController
  before_action :set_worker_skill, only: [:show, :edit, :update, :destroy]

  # GET /worker_skills/new
  def new
    @worker_skill = WorkerSkill.new
  end

  def create
    worker = Worker.find(params[:worker_id])
    skill = Skill.find(params[:name])
    @worker_skill = WorkerSkill.new(worker.id, skill.name)
    if @worker_skill.save
      format.html {}
      format.json {}
    else
      format.html {}
      format.json {}
    end


  end

  private

  def worker_skill_params
    params.require(:worker_skill).permit(:worker_id,:name)
  end

end