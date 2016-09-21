module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products = Spree::Product.available.order('available_on DESC').limit(4);
      @searcher1 = build_searcher(taxon: Spree::Taxon.find_by(name: 'Featured'), include_images: true)
      @products1 = @searcher1.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
  end
end
