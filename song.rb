class Song
  #SUBJECTS = %w(tree branch)
  SUBJECTS = %w(tree branch rap crap)

  attr_reader :cast

  def initialize
    @cast = ["bog"]
  end

  def sing
    SUBJECTS.each { |s| sing_of_subject s }; horus
  end

  def horus
    print "#{repeat_horus},\n#{repeat_horus}.\n\n"
  end

  def repeat_horus
    horus_words.join(",\n")
  end

  def horus_words(article = "The")
    [
      "Hi ho, the rattlin' bog",
      "#{article} bog down in the valley-o"
    ]
  end

  private

  def sing_of_subject(subject)
    horus
    stanza(subject)
  end

  def stanza(subject)
    print(
      "#{cast.size}. #{stanza_opening} #{cast.first} there was a #{subject},\n" +
      "A rare #{subject}, a rattlin' #{subject},\n" +
      "#{stanza_closing subject}\n" +
      "#{horus_words("And the")[1]}.\n\n"
    )
    remember subject
  end

  def stanza_opening
    cast.size == 1 ? "Now in the" : "And on that"
  end

  def stanza_closing(subject, str = "")
    if cast.size == 1
      str += "the #{subject} in the #{cast.first}, "
    else
      cast.each_cons(2) do |actor|
        str += "the #{subject} on the #{actor[0]}, " if actor[0] == cast.first
        str += "and the #{actor[0]} #{actor[1] == cast.last ? "in" : "on"} the #{actor[1]}, "
      end
    end
    str.capitalize
  end

  def remember(subject)
    cast.unshift subject
  end
end
