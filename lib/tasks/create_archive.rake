namespace :create_archive do
  #descにはtaskの説明を書く
  desc "アーカイブの定期実行プログラム"
  #taskにはtask名を書く
  task add_archive: :environment do
    Group.all.each do |group|
      group.memos.each do |memo|
        if memo.accessed_at == nil || memo.accessed_at < 2.weeks.ago || memo.key == false
          archive = group.archives.new(
                                       title: memo.title,
                                       description: memo.description,
                                       user_id: memo.user_id,
                                       group_id: memo.group_id,
                                       memo_date: memo.memo_date,
                                       memo_file: memo.memo_file
                                      )
          archive.tag_list << memo.tag_list
          archive.save
          memo.destroy
          p "sucess!!"
        end
      end
    end
    puts "test success!!"
  end
end
