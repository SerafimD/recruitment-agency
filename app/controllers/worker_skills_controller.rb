class WorkerSkillsController < ApplicationController
  before_action :set_worker_skill, only: [:show, :edit, :update, :destroy]

  # POST /workers
  # POST /workers.json
  def create
    @worker = Worker.find(params[:worker_id])
    @worker_skill = WorkerSkill.new
    @worker_skill.name = Skill.find(params[:skill_id]).name
    @worker_skill.worker_id = @worker.id
    respond_to do |format|
      if @worker_skill.save
        format.html { redirect_to @worker, notice: 'Skill successfully added.' }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { redirect_to @worker, notice: 'Skill added failed.' }
        format.json { render :show, location: @worker }
      end
    end
  end

  private

  def set_worker_skill
    @worker_skill = WorkerSkill.find(params[:id])
  end

end
