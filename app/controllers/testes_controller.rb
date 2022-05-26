＊１ヶ月単位の予約ページ＊

<div class="js-message-errors"></div>
  <h1><%= current_user.name %>様</h1>
    <%= form_with(model: @user, url: month_update_users_reception_path(day: @first_day), local: true) do |f| %>
      <table class="table table-bordered">
        <thead>
          <tr>
          <th>受付済</th>
            <th>ご利用日</th>
            <th style="width: 50px">曜日</th>
            <th>迎え時間</th>
            <th>迎え場所</th>
            <th style="width: 100px"> 迎え有無</th>
            <th>送り時間</th>
            <th>送り場所</th>
            <th style="width: 100px"> 送り有無</th>
            <th style="width: 100px">イベント</th>
            <th>備考</th>
          </tr>
        </thead>
        <tbody>
        <%= f.fields_for :receptions do |r| %>
            <% css_class = 
              case $days_of_the_week[day.date_of_use.wday]
                when '土'
                  'text-primary'
                when '日'
                  'text-danger'
                end
                %>
              <tr>
                <td><%= r.check_box :request %></td>
                <td><%= l(day.date_of_use, format: :short) %></td>
                <td class="<%= css_class %>"><%= $days_of_the_week[day.date_of_use.wday] %></td>
                <td><%= r.time_field :start_time,{ max: "18:30", min: "08:30", class: "form-control input-sm" }%></td>
                <td><%= r.select :start_place, [ ["自宅",1], ["学校 or 園", 2], ["祖父母宅", 3 ] ,["なし", 4]], {prompt: "迎え場所を選択"}, {class: "form-control input-sm" } %></td>
                <td><%= r.check_box :start_transfer,{checked: true}, "true", "false" %></td>
                <td><%= r.time_field :end_time,{ max: "18:30", min: "08:30", class: "form-control input-sm" } %></td>
                <td><%= r.select :end_place, [ ["自宅",1], ["祖母宅", 2], ["その他", 3 ] ,["なし", 4]], {prompt: "送り場所を選択"}, {class: "form-control input-sm" } %></td>
                <td><%= r.check_box :end_transfer,{checked: true}, "true", "false" %></td>
                <td><%= r.check_box :event,{checked: false}, "true", "false" %></td>
                <td><%= r.text_field :remarks, class: "form-control" %></td>
              </tr>
          <% end %>
        </tbody>
      </table>
      <div class="table_modal">
        <%= link_to "キャンセル", user_path(current_user), class: "btn btn-primary" %>
        <%= f.submit "編集を保存する", class: "btn btn-primary" %>
      </div>
    <% end %>