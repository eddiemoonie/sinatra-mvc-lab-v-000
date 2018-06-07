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
    !char.match(/[aAeEiIoOuU]/)
  end

  def piglatinize_word(word)
    if !consonant?(word[0])
      word = word + "w"
    elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
      word = word.slice(3..-1) + word.slice(0,3)
    elsif consonant?(word[0]) && consonant?(word[1])
      word = word.slice(2..-1) + word.slice(0,2)
    else consonant?(word[0])
      word = word.slice(1..-1) + word.slice(0, 1)
    end

    word + "ay"
  end

  def piglatinize_sentence(sentence)
    sentence.split.collect {|word| piglatinize_word(word)}.join(" ")
  end


end
