class StudentsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response

rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response


    def index
        students = Student.all
        render json: students, status: :ok
    end

    def create
        new_student = Student.create!(student_params)
        render json: new_student, serializer: StudentAssociatedWithInstructorSerializer, status: :created
    end

    def update
        student = find_student
        student.update!(student_params)
        render json: student, serializer: StudentAssociatedWithInstructorSerializer, status: :accepted
    end

    def destroy
        student = find_student
        student.destroy
        head :no_content
    end

    def show
        student = find_student
        render json: student, status: :ok
    end

    # def show
    #     camper = find_camper
    #     render json: camper, serializer: CampersWithActivitiesSerializer, status: :ok
    # end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def find_student
        Student.find(params[:id])
    end

    def record_not_found_response
        render json: {error: "student not found"}, status: :not_found
    end

    def unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end


end
