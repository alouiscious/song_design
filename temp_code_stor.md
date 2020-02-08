THIS CODE IS FOR ITEM DELETION <% @people.each do |person| %>
<div class="Songnote">
  <span><%= songnote.title %></span>
  <%= link_to "Delete", songnote, method: :delete, data: { confirm: "Really? Sure?" } %>
</div>
<% end %>
OR 
<%= button_to "Delete Note", songnote_path(@songnote), method: :delete, data: { confirm: "Really? Sure?" } %>



THIS IS SONGNOTE TEST CONTENT
If the yeti takes a solo, band takes a break. Stagger each instrument out (-BACK VOCALS, -KEY -GUITARS, -ANY OTHERS -BASS).

THIS IS A PARTIAL FOR
render partial: 'form', locals: {rehearsal: @rehearsal}???




TODO - ADD POST TIME TO SOONGNOTES
time_ago_in_words(Time.now)
# "less than a minute"

time_ago_in_words(Time.now + 60)
# "1 minute"

time_ago_in_words(Time.now + 600)
# "10 minutes"




THIS TABLE IS FOR THE _FORM SONGNOTES PARTIIAL VIEW
  <table>
    <td>
      Note Category:
    </td>
    <td>
      <%= f.radio_button(:type, "feature_solo") %>
      <%= f.label(:type_feature, "Feature/Solo") %>
    </td>
    <td>
      <%= f.radio_button(:type, "design") %> 
      <%= f.label(:type_design, "Design/Structure") %>
    </td> 
    <td>
      <%= f.radio_button(:type, "organizer") %> 
      <%= f.label(:type_design, "Organizer") %>
    </td>        
  </table>
  <br>

  THIS IS TO CREATE A BASIC INDEX VIEW 
  # <% User.select(:name).distinct.each do |person| %>

  # <%= form_for @user do |f| %>
#   <%= f.label :name, "First Name" %>:
#   <%= f.text_field :name, list: 'user-name' %>
#   <datalist id="user-name">
#     <% User.all.each do |user| %>
#       <option value="<%= user.name %>"></option>
#     <% end %>
#   </datalist>
#   <%= f.submit %>
# <% end %>