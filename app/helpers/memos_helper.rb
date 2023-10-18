module MemosHelper
  # # require 'pycall'
  # require 'natto'

  # # テスト用メソッド
  # # def test_success
  # #   return "test success!!!"
  # # end

  # # @memosに入ったパラメータを受け取り、自動的にタグを生成する
  # def create_tag(title, description)
  #   memo = title + description
  #   # テキストファイルに出力
  #   # output_text(memo)
  #   # テキストデータから専門用語を抽出
  #   ret = analyze_text(memo)
  #   # ret.each do |word|
  #   #   p word
  #   # end
  #   return extract_top_words(ret)
  #   # タグを自動生成
  #   # return "#{memo}"
  # end

  # # @memosに入ったパラメータをテキストファイルに出力する
  # # def output_text(memo)
  # #   File.open("public/memo_text.txt", "w") do |file|
  # #     file.write(memo)
  # #   end
  # # end

  # # Mecabによる形態素解析
  # def analyze_text(text)
  #   nm = Natto::MeCab.new("-d /usr/local/lib/mecab/dic/ipadic")
  #   ret = []

  #   nm.parse(text) do |n|
  #     # "#{n.surface}".present? ? ret << "#{n.surface}: #{n.feature}" : ''
  #     # "#{n.surface}".present? ? ret << "#{n.surface}" : ''
  #     if n.feature =~ /名詞/
  #       ret << "#{n.surface}"
  #     end
  #   end

  #   return ret
  # end

  # # 頻出語句をカウントするプログラム
  # def extract_top_words(text_array, num_words = 2)
  #   word_count = Hash.new(0)

  #   # テキスト配列から単語をカウント
  #   text_array.each do |text|
  #     words = text.split
  #     words.each { |word| word_count[word] += 1 }
  #   end

  #   # 頻出頻度が高い順にソート
  #   sorted_words = word_count.sort_by { |_word, count| -count}

  #   # 上位2個の単語を頻出
  #   top_words = sorted_words.first(num_words).to_h

  #   return top_words
  # end

  # # TermExtractでの形態素解析
  # # def output_tag
  # #   termextract = PyCall.import_module('termextract')
  # #   collections = PyCall.import_module('collections')

  # #   # ファイルを読み込む
  # #   tagged_text = File.open("public/memo_text.txt", "r")

  # #   # 複合語を抽出し、重要度を算出
  # #   frequency = termextract.mecab.cmp_noun_dict(tagged_text)
  # #   lr = termextract.core.score_lr(frequency,
  # #         ignore_words = termextract.mecab.IGNORE_WORDS,
  # #         lr_mode = 1, average_rate = 1
  # #       )
  # #   term_imp = termextract.core.term_importance(frequency, lr)

  # #   # 重要度が高い順に並べ替えて出力
  # #   data_collection = collections.Counter(term_imp)
  # #   data_collection.most_common.each do |comp_noun, value|
  # #     p [comp_noun, value]
  # #   end
  # # end

end
