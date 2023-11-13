class Batch::CreateArchive
  def self.create_archive
    Group.all.each do |group|
      group.memos.each do |memo|
        if memo.accessed_at == nil || memo.accessed_at < 2.weeks.ago
          archive = group.archives.new(title: memo.title, description: memo.description,
                                user_id: memo.user_id, group_id: memo.group_id,
                                memo_date: memo.memo_date, memo_file: memo.memo_file)
          archive.tag_list << memo.tag_list
          archive.save
          memo.destroy
          p "sucess!!"
        end
      end
    end
  end
end
