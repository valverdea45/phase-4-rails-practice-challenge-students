class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response

    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

    def index
        instructors = Instructor.all
        render json: instructors, status: :ok
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def update
        instructor = find_instructor
        instructor.update!(instructor_params)
        render json: instructor, status: :accepted
    end

    def destroy
        instructor = find_instructor
        instructor.destroy
        head :no_content
    end

    def show
        instructor = find_instructor
        render json: instructor, status: :ok
    end

    private

    def instructor_params
        params.permit(:name)
    end

    def find_instructor
        Instructor.find(params[:id])
    end

    def record_not_found_response
        render json: {errors: "Instructor Not Found"}
    end

    def unprocessable_entity_response(exception)
        render json: {errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end
