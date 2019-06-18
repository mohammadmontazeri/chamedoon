class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
  if @student.save
    redirect_to new_student_path
  end
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end

def edit
  @students = Student.find(params[:id])
end

def update
  @students = Student.find(params[:id])
   if @students.update(student_params)
     redirect_to students_path
   end
end
  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      redirect_to students_path
    else
      head(:Not_Ok)
    end
  end
end
