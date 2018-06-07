class PigLatinizer

  def piglatinize(phrase)
    if phrase.split(" ").length == 1
      piglatinize_word(phrase)
    else
      piglatinize_sentence(phrase)
    end
  end

  private

  def consonant?(char)
    char =~ /\A(?=[^aeiou])(?=[a-z])/i
  end

  def piglatinize_word(word)
    # word starts with vowel
    if !consonant?(word[0])
      word = word + "w"
    # word starts with 3 consonants
    elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
      word = word.slice(3..-1) + word.slice(0,3)
    # word starts with 2 consonants
    elsif consonant?(word[0]) && consonant?(word[1])
      word = word.slice(2..-1) + word.slice(0,2)
    # word starts with 1 consonant
    else
      word = word.slice(1..-1) + word.slice(0)
    end
    word << "ay"
  end

  def piglatinize_sentence(sentence)
    sentence.split.collect {|word| piglatinize_word(word)}.join(" ")
  end

end
