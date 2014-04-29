class YaleAccessionsController < ApplicationController

  set_access_control :public => [:department_codes]

  def department_codes
    codes = JSONModel(:department).all.map {|dept|
      dept.code
    }

    render :json => codes
  end
end
