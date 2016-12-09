class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  # GET /workers
  # GET /workers.json
  def index
    @workers = Worker.all
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
  end

  # GET /workers/new
  def new
    @worker = Worker.new
  end

  # GET /workers/1/edit
  def edit
    @worker_skill = WorkerSkill.new
  end

  def vacancies
    @worker = Worker.find(params[:id])
    @vacancies = find_a_suitable_job(@worker)
  end

  # POST /workers
  # POST /workers.json
  def create
    @worker = Worker.new(worker_params)

    respond_to do |format|
      if @worker.save
        format.html { redirect_to @worker, notice: 'Worker was successfully created.' }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to @worker, notice: 'Worker was successfully updated.' }
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to workers_url, notice: 'Worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit(:name, :contact, :in_search, :salary)
    end

    #
    # Метод вернёт все подходящие вакансии для работника
    #
    def find_a_suitable_job(worker)
      vacancies = Array.new
      Vacancy.all.each do |v|
        vacancies << v if get_vacancy_skills(v) == get_worker_skills(worker)
      end
      # Убираем из выдачи те вакансии, что истекли по дате
      not_expired(vacancies)
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
    # отдаём вакансии, которые не истекли по времени
    #
    def not_expired(vacancies)
      v = vacancies.select { |item| item.duration > Time.now }
      # Сортируем по размеру заработной платы
      v.sort_by! { |vac| vac.salary }
    end

end
