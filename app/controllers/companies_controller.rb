class CompaniesController < ApplicationController
    
    def index
        @companies = Company.all
    end
    
    
    def show
        find_company
    end
    
    def new
        @company = Company.new
    end
    
    
    def create
        @company = Company.create(company_params)
        redirect_to company_path(@company)
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
        params.require(:company).permit(:name)
    end
    
    
end