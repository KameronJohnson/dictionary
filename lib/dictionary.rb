class Term
  @@terms = []


  define_method(:initialize) do |word, definition|
    @words = [word]
    @definitions = [definition]
    @id = @@terms.length().+(1)
  end

  define_singleton_method(:all) do
    @@terms
  end

  define_method(:save) do
    @@terms.push(self)
  end

  define_singleton_method(:clear) do
    @@terms = []
  end

  define_method(:word) do
    @words
  end

  define_method(:definition) do
    @definitions
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |identification|
    found_term = nil
    @@terms.each() do |term|
      if term.id().eql?(identification.to_i())
        found_term = term
      end
    end
  found_term
  end

  define_singleton_method(:search) do |search_by|
    found_term = nil
    @@terms.each() do |term|
      if term.word().include?(search_by) || term.word().eql?(search_by)
        found_term = term
      end
    end
  found_term
  end

  define_method(:multi_def) do |defx|
    @definitions.push(defx)
  end

  define_method(:multi_word) do |wordx|
    @words.push(wordx)
  end

end
