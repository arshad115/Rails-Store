module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products = Spree::Product.available.order('available_on DESC').limit(4);

      @searcher1 = build_searcher(taxon: Spree::Taxon.find_by(name: 'Featured'), include_images: true)
      @products1 = @searcher1.retrieve_products.limit(4)

      @searcherp = build_searcher(taxon: Spree::Taxon.find_by(name: 'Popular'), include_images: true)
      @productsp = @searcherp.retrieve_products.limit(4)

      @searcherb = build_searcher(taxon: Spree::Taxon.find_by(name: 'Bags'), include_images: true)
      @productsb = @searcherb.retrieve_products.limit(4)

      @searcherm = build_searcher(taxon: Spree::Taxon.find_by(name: 'Mugs'), include_images: true)
      @productsm = @searcherm.retrieve_products.limit(4)

      @searcherc = build_searcher(taxon: Spree::Taxon.find_by(name: 'Clothing'), include_images: true)
      @productsc = @searcherc.retrieve_products.limit(4)

      @searchert = build_searcher(taxon: Spree::Taxon.find_by(name: 'T-Shirts'), include_images: true)
      @productst = @searchert.retrieve_products.limit(4)

      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end

    def about
    end

    def terms
    end

    def privacy
    end


  end
end
