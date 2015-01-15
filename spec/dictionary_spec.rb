require('rspec')
require('dictionary')

describe(Term) do
  before do
    Term.clear()
  end

  describe(".all")do
    it('will start as an empty array') do
    expect(Term.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("will save the term") do
      test_term = Term.new("oriole", "orange bird")
      test_term.save()
      expect(Term.all()).to(eq([test_term]))
    end
  end

  describe(".clear") do
    it("will empty out the array") do
      Term.new("Kam", "awesome pair buddy").save()
      Term.clear()
      expect(Term.all()).to(eq([]))
    end
  end

  describe("#word") do
    it("returns the word") do
    test_term = Term.new("oriole", "orange bird")
    test_term.save()
    expect(test_term.word()).to(eq(["oriole"]))
    end
  end

  describe("#definition") do
    it("returns the definition") do
    test_term = Term.new("oriole", "orange bird")
    test_term.save()
    expect(test_term.definition()).to(eq(["orange bird"]))
    end
  end

  describe("#id") do
    it("identifies a particular term") do
      test_term = Term.new("oriole", "orange bird")
      test_term.save()
      test_term2 = Term.new("Benjamin", "you know, that guy")
      test_term2.save()
        expect(test_term.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("finds a specific term") do
      test_term = Term.new("oriole", "orange bird")
      test_term.save()
      test_term2 = Term.new("Benjamin", "you know, that guy")
      test_term2.save()
        expect(Term.find(test_term.id())).to(eq(test_term))
    end
  end

  describe(".search") do
    it("finds a specific term by word") do
      test_term = Term.new("oriole", "orange bird")
      test_term.save()
      test_term2 = Term.new("Benjamin", "you know, that guy")
      test_term2.save()
        expect(Term.search(test_term.word())).to(eq(test_term))
    end
  end

  describe("#multi_def") do
    it("allows an additional definition to be given to a term") do
      test_term = Term.new("oriole", "orange bird")
      test_term.save()
      test_term.multi_def("semi-awesome team")
      expect(Term.search("oriole").definition()).
      to(eq(["orange bird", "semi-awesome team"]))
    end
  end

  describe("#multi_word") do
    it("allows an additional words to be given to a term") do
      test_term = Term.new("oriole", "orange bird")
      test_term.save()
      test_term.multi_word("eloiro")
      expect(Term.search("oriole").word()).
      to(eq(["oriole", "eloiro"]))
    end
  end

end
