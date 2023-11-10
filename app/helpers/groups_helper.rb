module GroupsHelper

  def create_archive(group, memos)
    memos.each do |memo|
      if memo.accessed_at == nil || memo.accessed_at < DateTime.current
        group.archives.create(title: memo.title, description: memo.description,
                              user_id: memo.user_id, group_id: memo.group_id,
                              memo_date: memo.memo_date, memo_file: memo.memo_file)
        memo.destroy
      end
    end
  end
end
