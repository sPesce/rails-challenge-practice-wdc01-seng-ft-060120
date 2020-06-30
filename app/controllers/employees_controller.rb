class EmployeesController < ApplicationController
  def create    
    new_employee = Employee.create(
      name: params[:employee][:name],
      company_id: params[:company_id])
    redirect_to company_path(new_employee.company)
  end
  def destroy
    employee = Employee.find(params[:id])
    company = employee.company
    employee.destroy
    redirect_to company_path(company)
  end
end
