require_relative '../models/address_book'

RSpec.describe AddressBook do
  describe "attributes" do
    let (:book) {book = AddressBook.new}
    it "responds to entries" do
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      expect(book.entries.size).to eq(0)
    end
  end
  describe "add_entry" do
    let (:book) {book = AddressBook.new}
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
end
