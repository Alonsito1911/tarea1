class VaccinesController < ApplicationController
    def index
        @person = Person.find(params[:person_id])
        @vaccine = @person.vaccines.where(params[:person_id])
        render json: @person.vaccines
    end

    def create
        @person = Person.find(params[:person_id])
         
        @vaccine = @person.vaccines.new(vaccines_params)
        
        if @vaccine.save
            @variable = @person.vaccines
            render json: @variable
        else
            render json: @vaccine.errors, status: :unprocessable_entity
        end
    end

   # GET /vaccines/1

    def update
        @person = Person.find(params[:person_id])
        @vaccine = @person.vaccines.find(params[:id])
        if @vaccine.update(vaccines_params)
            render json: @person.vaccines 
        else
            render json: @vaccine.errors, status: :unprocessable_entity
        end
    end 

    def destroy
        @person = Person.find(params[:person_id])
        @vaccine = @person.vaccines.find(params[:id])
        @vaccine.destroy
        render json: @person.vaccines
                 
    end
    
        # Agregar al final de la clase por el control de accesos
    
    def vaccines_params
        params.require(:vaccine).permit(:vaccine_type, :vaccine_date)
    end
end
