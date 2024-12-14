require "csv"

CSV.foreach('db/csv/link_contents.csv', headers: true) do |row|
  LinkContent.find_or_create_by!(link_id: row['link_id'], linkable_type: row['linkable_type'], linkable_id: row['linkable_id']) do |link_content|
    link_content.link_id = row['link_id']
    link_content.linkable_type = row['linkable_type']
    link_content.linkable_id = row['linkable_id']
  end
end
