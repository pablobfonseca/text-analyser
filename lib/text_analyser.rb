class TextAnalyser
  STOP_WORDS = %w{the a by on for of are with just but and to the my I has some in}.freeze

  attr_reader :file_lines, :text

  def initialize(file_lines)
    @file_lines = file_lines
    @text = file_lines.join
  end

  def count_lines
    file_lines.size
  end

  def count_words
    text.split.length
  end

  def count_characters
    text.length
  end

  def count_nonspace_characters
    text.gsub(/\s+/, '').length
  end

  def count_sentence
    text.split(/\.|\?|!/).length
  end

  def count_paragraphs
    text.split(/\n\n/).length
  end

  def count_good_words
    good_words = all_words.reject { |word| STOP_WORDS.include?(word) }
    good_words.length
  end

  def sentence_per_paragraph
    count_sentence / count_paragraphs
  end

  def words_per_sentence
    count_words / count_sentence
  end

  def good_words_per_sentence
    ((count_good_words.to_f / all_words.length.to_f) * 100).to_i
  end

  def report
    result = <<~TEXT
      #{'=' * 30}
      Report
      #{'=' * 30}
      #{count_lines} lines
      #{count_characters} characters
      #{count_nonspace_characters} characters excluding spaces
      #{count_words} words
      #{count_good_words} good words (without stop words)
      #{count_paragraphs} paragraphs
      #{count_sentence} sentences
      #{sentence_per_paragraph} sentences per paragraph (average)
      #{words_per_sentence} words per sentence (average)
      #{good_words_per_sentence}% of the words are non-fluff words
      #{'=' * 30}
    TEXT
  end

  private

  def all_words
    text.scan(/\w+/)
  end
end
