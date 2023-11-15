class PagesController < ApplicationController
  def home
    @results = session[:search_results]
    session[:search_results] = nil
  end

  def search
    start_date = params[:search][:start_date]
    end_date = params[:search][:end_date]
    search_results = NeowsApiService.get_astroid_data_by_date_range(start_date, end_date)
    session[:search_results] = search_results
    redirect_to root_path
  end
end
