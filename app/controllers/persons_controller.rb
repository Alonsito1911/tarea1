class PersonsController < ApplicationController
    def create
        @person = Person.new(person_params)
        if @person.save
            render json: @person
        else
            render json: @person.errors, status: :unprocessable_entity
        end
    end

    def index
        @person = Person.all
        render json: @person
    end
            # GET /students/1
    def show
        @person = Person.find(params[:id])
        render json: @person
    end
           
    def update
        @person = Person.find(params[:id])
        if @person.update(person_params)
            render json: @person
        else
            render json: @person.errors, status: :unprocessable_entity
        end
    end 

    def destroy_all
        @person = Person.all
        @person.destroy_all
        render json: Person.all    
    end
    
        # Agregar al final de la clase por el control de accesos
    
    def person_params
        params.require(:person).permit(:name)
    end
end
