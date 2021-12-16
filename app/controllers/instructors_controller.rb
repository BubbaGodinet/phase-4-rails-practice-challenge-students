class InstructorsController < ApplicationController
    def index
        instructors = Instructor.all
        render json: instructors
    end

    def show
        instructor = Instructor.find_by(id: params[:id])
        render json: instructor
    end

    def create
        newInstructor = Instructor.create(instructor_params)
        render json: newInstructor
    end

    def update
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.update(instructor_params)
            render json: instructor
        else
            render json: { error: 'Instructor not found' }, status: :not_found
        end
    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.destroy
            head :no_content
        else
            render json: { error: 'Instructor not found' }, status: :not_found
        end
    end

    private 

    def instructor_params
        params.permit(:name)
    end
end
