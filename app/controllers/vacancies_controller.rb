class VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:show, :edit, :update, :destroy]

  # GET /vacancies
  # GET /vacancies.json
  def index
    @vacancies = Vacancy.all
  end

  # GET /vacancies/1
  # GET /vacancies/1.json
  def show
  end

  # GET /vacancies/new
  def new
    @vacancy = Vacancy.new
  end

  # GET /vacancies/1/edit
  def edit
  end

  def workers
    @vacancy = Vacancy.find(params[:id])
    @workers = find_a_suitable_workers(@vacancy)
    @partially_workers = find_a_partially_suitable_workers(@vacancy)
  end

  # POST /vacancies
  # POST /vacancies.json
  def create
    @vacancy = Vacancy.new(vacancy_params)

    respond_to do |format|
      if @vacancy.save
        format.html { redirect_to @vacancy, notice: 'Vacancy was successfully created.' }
        format.json { render :show, status: :created, location: @vacancy }
      else
        format.html { render :new }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacancies/1
  # PATCH/PUT /vacancies/1.json
  def update
    respond_to do |format|
      if @vacancy.update(vacancy_params)
        format.html { redirect_to @vacancy, notice: 'Vacancy was successfully updated.' }
        format.json { render :show, status: :ok, location: @vacancy }
      else
        format.html { render :edit }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacancies/1
  # DELETE /vacancies/1.json
  def destroy
    @vacancy.destroy
    respond_to do |format|
      format.html { redirect_to vacancies_url, notice: 'Vacancy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacancy_params
      params.require(:vacancy).permit(:name, :addition_date, :duration, :salary, :contact)
    end

    #
    # Работники полностью подходящие по скиллам
    #
    def find_a_suitable_workers(vacancy)
      workers = Array.new
      Worker.all.each do |w|
        workers << w if get_worker_skills(w) == get_vacancy_skills(vacancy)
      end
      in_search(workers)
    end

    #
    # Работники частично подходящие по скиллам
    #
    def find_a_partially_suitable_workers(vacancy)
      workers = Array.new
      Worker.all.each do |w|
        workers << w if (get_worker_skills(w) & get_vacancy_skills(vacancy)).count > 0
      end
      in_search(workers)
    end

    #
    # Метод для получения всех скиллов для вакансии
    #
    def get_vacancy_skills(vacancy)
      skills = Array.new
      vacancy.vacancy_skills.each do |skill|
        skills << skill.name
      end
      skills
    end

    #
    # Метод для получения всех скиллов работника
    #
    def get_worker_skills(worker)
      skills = Array.new
      worker.worker_skills.each do |skill|
        skills << skill.name
      end
      skills
    end

    #
    # Метод вернёт только работников, которые ищут работу
    #
    def in_search(workers)
      w = workers.select { |item| item.in_search}
      # Сортируем по зарплатным ожиданиям
      w.sort_by! { |wor| wor.salary }
    end

end
