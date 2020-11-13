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


Notes from App:

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

