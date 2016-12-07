class WorkerSkillsController < ApplicationController
  before_action :set_worker_skill, only: [:show, :edit, :update, :destroy]

  # POST /workers
  # POST /workers.json
  def create
    @worker_skill = WorkerSkill.new(worker_skill_params)

    respond_to do |format|
      if @worker_skill.save
        format.html { redirect_to @worker_skill, notice: 'Worker was successfully created.' }
        format.json { render :show, status: :created, location: @worker_skill }
      else
        format.html { render :new }
        format.json { render json: @worker_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_worker_skill
    @worker_skill = WorkerSkill.find(params[:id])
  end

  def worker_skill_params
    params.require(:worker_skill).permit(:name)
  end

end