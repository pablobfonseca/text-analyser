class TextAnalyser
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

  def sentence_per_paragraph
    count_sentence / count_paragraphs
  end

  def words_per_sentence
    count_words / count_sentence
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
      #{count_paragraphs} paragraphs
      #{count_sentence} sentences
      #{sentence_per_paragraph} sentences per paragraph (average)
      #{words_per_sentence} words per sentence (average)
      #{'=' * 30}
    TEXT
  end
end
