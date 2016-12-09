class VacancySkillsController < ApplicationController
  before_action :set_worker_skill, only: [:show, :edit, :update, :destroy]

  def create
    @vacancy = Vacancy.find(params[:vacancy_id])
    @vacancy_skill = VacancySkill.new
    @vacancy_skill.name = Skill.find(params[:skill_id]).name
    @vacancy_skill.vacancy_id = @vacancy.id
    respond_to do |format|
      if @vacancy_skill.save
        format.html { redirect_to @vacancy, notice: 'Skill successfully added.' }
        format.json { render :show, status: :created, location: @vacancy }
      else
        format.html { redirect_to @vacancy, notice: 'Skill added failed.' }
        format.json { render :show, location: @vacancy }
      end
    end
  end

  private

  def set_vacancy_skill
    @vacancy_skill = VacancySkill.find(params[:id])
  end

end
