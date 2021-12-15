class DocfilesController < ApplicationController
  before_action :set_docfile, only: %i[ show edit update destroy ]

  # GET /docfiles or /docfiles.json
  def index
    @docfiles = Docfile.all
  end

  # GET /docfiles/1 or /docfiles/1.json
  def show
  end

  # GET /docfiles/new
  def new
    @docfile = Docfile.new
  end

  # GET /docfiles/1/edit
  def edit
  end

  # POST /docfiles or /docfiles.json
  def create
    @docfile = Docfile.new(docfile_params)

    respond_to do |format|
      if @docfile.save
        Publisher.publish("docfiles", @docfile.attributes)
        format.html { redirect_to @docfile, notice: "Docfile was successfully created." }
        format.json { render :show, status: :created, location: @docfile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @docfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /docfiles/1 or /docfiles/1.json
  def update
    respond_to do |format|
      if @docfile.update(docfile_params)
        format.html { redirect_to @docfile, notice: "Docfile was successfully updated." }
        format.json { render :show, status: :ok, location: @docfile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @docfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docfiles/1 or /docfiles/1.json
  def destroy
    @docfile.destroy
    respond_to do |format|
      format.html { redirect_to docfiles_url, notice: "Docfile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_docfile
      @docfile = Docfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def docfile_params
      params.require(:docfile).permit(:title, :file)
    end
end
