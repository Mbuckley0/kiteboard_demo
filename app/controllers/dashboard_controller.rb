class DashboardController < ApplicationController
  def index
    kites = Kite.all

    respond_to do |format|
      format.html
      format.json do
        render json: { 'welcome' => "There are currently #{kites.count} Kites",
                       'total-kite-amount' => kites.count,
                       'total-red-kite-amount' => kites.where(color: 'Red').count,
                       'kites-by-color' => kites_by_color,
                       'kites-temperature' => kites.count}
      end
    end
  end

  private

  def kites_by_color
    kites_by_color = Kite.group(:color).count

    array = []
    kites_by_color.each do |k, v|
      array.push(label: k,
                 value: v)
    end
    array
  end
end
