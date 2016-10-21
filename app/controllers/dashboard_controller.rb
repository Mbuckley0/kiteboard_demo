class DashboardController < ApplicationController
  def index
    kites_list = Kite.group(:color).count
    kites_list.map do |kite|
      kites_list[kite[0]] = rand(1..100)
    end

    respond_to do |format|
      format.html
      format.json do
        render json: { 'welcome' => "There are currently #{rand(1..100)} Kites",
                       'total-kite-amount' => rand(1..100),
                       'total-red-kite-amount' => rand(1..100),
                       'kites-by-color' => kites_list,
                       'kites-temperature' => rand(1..250),
                       'kites-graph' => rand(1..100)}
      end
    end
  end
end
