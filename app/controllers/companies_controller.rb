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
        byebug
        #if company is invalid, it wont save
        if @company.save
          #block paramaters of the hash[key] => value
          #this block breaks the hash into seperate hashes for each nested hash of office_attributes
          params[:company][:offices_attributes].each do |key,value|           
            #each 'value' is a hash describing one (to be created) office,
            #where [:id] is the building id, and for some reason, [:offices] is the 
            # an array holding each floor number selected
            value[:offices].each do |floor|
              #if not selected, its value is just ""
              if floor != ""
                #using original params here, but using the 'key' I defined in the block
                  #  because this key shows which (to be created)office id we are currently 
                  #  iterating through 
                new_office = Office.new(                  
                  building_id: params[:company][:offices_attributes][key][:id],
                  company_id: @company.id,
                  floor: floor)
                new_office.save
              end             
            end
          end  
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