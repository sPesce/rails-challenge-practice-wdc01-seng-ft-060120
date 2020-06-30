class CompaniesController < ApplicationController
    
    def index
        @companies = Company.all
    end
    
    
    def show
        find_company
        @employee = Employee.new        
    end
    
    def new
        @company = Company.new
    end
    
    
    def create

        @company = Company.new(company_params)
        if @company.save
       # byebug
        params[:company][:offices_attributes].each 
        redirect_to company_path(@company)
        else
            render :new
        end
    end

    def new_employee
        find_company
        @employee = Employee.new
    
    end
    

    private

    def find_company
       @company = Company.find(params[:id]) 
    end

    def company_params
        params.require(:company).permit(:name, :building_ids => [], :office_floors => [] )
    end
    
    
end