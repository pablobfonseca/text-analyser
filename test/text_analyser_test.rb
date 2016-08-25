require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/text_analyser'

class TextAnalyserTest < Minitest::Test
  def setup
    file_lines = File.readlines('test/text.txt')
    @analyser = TextAnalyser.new(file_lines)
  end

  def test_words_count
    assert 1111, @analyser.count_words
  end

  def test_line_count
    assert_equal 127, @analyser.count_lines
  end

  def test_characters_count
    assert_equal 6376, @analyser.count_characters
  end

  def test_nonspace_characters_count
    assert_equal 5140, @analyser.count_nonspace_characters
  end

  def test_sentence_count
    assert_equal 45, @analyser.count_sentence
  end

  def test_paragraph_count
    assert_equal 20, @analyser.count_paragraphs
  end

  def test_count_good_words
    assert_equal 865, @analyser.count_good_words
  end

  def test_sentence_per_paragraph
    assert_equal 2, @analyser.sentence_per_paragraph
  end

  def test_words_per_sentence
    assert_equal 24, @analyser.words_per_sentence
  end

  def test_good_words_per_sentence
    assert_equal 76, @analyser.good_words_per_sentence
  end

  def test_report
    expected_text = <<~TEXT
    ==============================
    Report
    ==============================
    127 lines
    6376 characters
    5140 characters excluding spaces
    1111 words
    865 good words (without stop words)
    20 paragraphs
    45 sentences
    2 sentences per paragraph (average)
    24 words per sentence (average)
    76% of the words are non-fluff words
    ==============================
    TEXT
    assert_equal expected_text, @analyser.report
  end
end
