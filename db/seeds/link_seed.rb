require "csv"

CSV.foreach('db/csv/links.csv', headers: true) do |row|
  Link.find_or_create_by!(url_link: row['url_link']) do |link|
    link.platform = row['platform']
    link.url_link = row['url_link']
    link.remark = row['remark']
  end
end
