# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Notes from App Creation:

Portfolio _form view
    <%# the following creates checkboxes with all stocks as option to select when creating portfolio %>
    <%# but I cannot get them to save in Portfolio, no stocks are saving %>
    <!--
      <%= f.label :stock_id %> <br>
      <%= f.collection_check_boxes(:stock_id, @stocks, :id, :name) do |cb| %>
        <div class="collection-check-box">
          <%= cb.label %>
          <%= cb.check_box %>
        </div>
      <% end %>
    -->

Layout Application view
      <!--
      <ul>
        <li><%= link_to "home", root_path %></li>
          <% if user_signed_in? %>
            <li><%= link_to "portfolio", portfolios_path %></li>
            <li><%= link_to "watch lists", watch_lists_path %></li>
            <li><%= button_to "logout", destroy_user_session_path, method: "delete" %></li>
          <% else %>
            <li><%= link_to "login", new_user_session_path %></li>
            <li><%= link_to "signup", new_user_registration_path %></li>
          <% end %>
      </ul>
    -->

Watchlist show view
        <!-- 
        <li><%= button_to "Delete", watch_list_stock_path(s), method: :delete, data: { confirm: "Are you sure?" } %></li>
        -->

Stock Model

    # has_many :portfolios
    # has_many :users, through: :portfolios
    # aliasing
    # has_many :watchlists
    # has_many :users, through: :watchlists

        #filter through stocks with above scope methods

            # validates_uniqueness_of :ticker, :name

Portfolio Controller

	# before_action :set_portfolio

	# def index
	# 	@stock = Stock.find_by_id(params[:stock_id])
	# 	# @portfolio = Portfolio.find_by_id(params[:portfolio_id])
	# 	@portfolios = @stock.portfolios
	# 	# @stocks = @portfolio.stock
	# end

	# def show
	# 	@stock = Stock.find_by_id(params[:id])
	# 	@portfolio = Portfolio.find_by_id(params[:id])
	# end

	# def new
	# 	@portfolio = Portfolio.new
	# 	@stocks = Stock.all
	# end

	# def create
	#   @portfolio = Portfolio.new(portfolio_params)
	#   if @portfolio.save
	# 	  redirect_to portfolio_stocks_path(@portfolio)
	#   else
	# 	render :new
	#   end
	# end

	# def update
	  
	#   @portfolio.update(portfolio_params(:stock_id, :investing))
	#   redirect_to portfolios_path(@portfolio)
	# end

	# def edit
	  
	# end

    in new, update, and edit actions:
        # @stocks = Stock.all (used for checkbox option in _form which I commented out)

Stocks Controller

    <!-- @stock = Stock.find_by_id(params[:id]) -->

Watch List new views page

    <!--
    <%= form_for(@watch_list) do |f| %>
    <label>List Title:</label><br>
    <%= f.text_field :list_name %><br>

    <label>Stocks Being Watched..</label><br>
    <%= f.text_area :stock_id %><br>

    <%= f.submit %>
    <% end %>
    -->

Watch List _form page

   <!--
            <%= fields_for(stocks_url) do |s|%>
                <%= s.label :name, "Company Name:" %>
                <%= s.text_field :name %><br>
                <%= s.label :ticker, "Symbol:" %>
                <%= s.text_field :ticker %><br>
                <%= s.label :value, "$" %>
                <%= s.number_field :value, step: 0.01 %><br>
            <% end%>
            
        <body class='stocks'> 
        -->

        !--
    Using this does not properly save the stock and generates fields outside of the form beneath the submit button
    class: 'btn btn-primary', data: {association_insertion_node: '.stocks', association_insertion_method: :append}
    -->

Watch List model

    # used :all_blank instead of this - proc { |attributes| attributes['name'].blank? || attributes['ticker'].blank? || attributes['value'].blank? }

