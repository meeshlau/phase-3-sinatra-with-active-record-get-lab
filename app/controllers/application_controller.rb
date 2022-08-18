class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods_by_price = BakedGood.order(price: :desc)
    baked_goods_by_price.to_json
  end

  get '/baked_goods/most_expensive' do
    most_expensive = BakedGood.order(price: :desc)
    most_expensive[0].to_json(only: [:name, :price])
  end

end
