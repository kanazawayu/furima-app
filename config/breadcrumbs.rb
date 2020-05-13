crumb :root do
  link "トップページ", root_path
end

crumb :itemnew do
  link "商品出品", new_item_path
end

crumb :search do
  link "検索結果一覧", items_searches_path
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
end

crumb :itemlists do
  link "商品一覧", user_drafts_path
  parent :mypage
end

crumb :likes do
  link "いいね一覧", likes_users_path
  parent :mypage
end

crumb :credit do
  link "支払い方法", user_credits_path
  parent :mypage
end

crumb :address do
  link "発送元・お届け先変更", user_addresses_path
  parent :mypage
end

crumb :itemshow do
  link "商品詳細", item_path
end

crumb :itemedit do
  link "商品編集", edit_item_path
  parent :itemshow
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).