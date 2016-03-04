require_relative '../models/address_book'

RSpec.describe AddressBook do
  let (:book) {book = AddressBook.new}

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
  end

  def import_any(file_name, entry_number, name, phone_number, email)
    book.import_from_csv(file_name)
    desired_entry = book.entries[entry_number]
    check_entry(desired_entry, name, phone_number, email)
  end

  describe "attributes" do
    it "responds to entries" do
      expect(book).to respond_to(:entries)
    end
    it "initializes entries as an array" do
      expect(book.entries).to be_a(Array)
    end
    it "initializes entries as empty" do
      expect(book.entries.size).to eq(0)
    end
  end

  describe "add_entry" do
    it "adds only one entry to the address book" do
      book.add_entry('some name','312.233.222','somename@email.com')
      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book.add_entry('some name','312.233.222','somename@email.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('some name')
      expect(new_entry.phone_number).to eq('312.233.222')
      expect(new_entry.email).to eq('somename@email.com')
    end
  end

  describe "remove entry" do
    it "removes a single entry" do
      book.add_entry('some name','312.233.222','somename@email.com')
      book.add_entry('some name','312.233.222','somename@email.com')
      original_size = book.entries.size
      book.remove_entry('some name','312.233.222','somename@email.com')
      expect(book.entries.size).to eq(original_size-1)
      end
  end
  #Tests .import_from_csv()
  describe "import from csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size

      #Check the size of the entries in AddressBook
      expect(book_size).to eq 5
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      #check the first entry
      entry_one = book.entries[0]
      check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries.csv")
      #check the second entry
      entry_two = book.entries[1]
      check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries.csv")
      #check the 3rd entry
      entry_three = book.entries[2]
      check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
    end

    it "imports the 4th entry" do
      book.import_from_csv("entries.csv")
      #check the 4th entry
      entry_four = book.entries[3]
      check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
    end

    it "imports the 5th entry" do
      book.import_from_csv("entries.csv")
      #check the 5th entry
      entry_five = book.entries[4]
      check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
    end

    it "imports 1st entry from entries_2" do
      import_any("entries_2.csv",0,"Javier", "555-555-5415", "javier@blocmail.com")
    end

    it "imports 2nd entry from entries_2" do
      import_any("entries_2.csv",1, "Joe", "555-555-3660", "joe@blocmail.com")
    end

    it "imports 3rd entry from entries_2" do
      import_any("entries_2.csv",2, "May", "555-555-4854", "may@blocmail.com")
    end
  end

end
