require 'test-unit'
class Test1 < Test::Unit::TestCase
  attr_accessor :contacts, :result
  def test_sortBy_Name
    contact1 = Contact.new("Polina Bondarevska","098324434", "@poli", nil, "@donut")
    contact2 = Contact.new("Aboba Bobus", "098567434", nil, "boba@gf.com", "@dsfdsfdsf")
    contact3 = Contact.new("Sasha Bilok", "098844545", "@bilok", "nope@gf.com", "@Bilok98")

    contacts = Contacts.new
    contacts.add(contact1)
    contacts.add(contact2)
    contacts.add(contact3)
    contacts.add(contact1.merge(contact2))

    result = Contacts.new
    result.add(contact2)
    result.add(contact1)
    result.add(contact1.merge(contact2))
    result.add(contact3)

    contacts.sort_by_name
    a=[]
    contacts.contacts.each{|con| a.push(con.name)}
    b=[]
    result.contacts.each{|con| b.push(con.name)}
    assert_equal(a, b)
  end
  def test_findByName
    contact1 = Contact.new("Polina Bondarevska","098324434", "@poli", nil, "@donut")
    contact2 = Contact.new("Aboba Bobus", "098567434", nil, "boba@gf.com", "@dsfdsfdsf")
    contact3 = Contact.new("Sasha Bilok", "098844545", "@bilok", "nope@gf.com", "@Bilok98")

    contacts = Contacts.new
    contacts.add(contact1)
    contacts.add(contact2)
    contacts.add(contact3)
    contacts.add(contact1.merge(contact2))

    result = Contacts.new
    result.add(contact1)
    result.add(contact1.merge(contact2))

    contacts.find_by_name("Pol")
    a=[]
    contacts.contacts.each{|con| a.push(con.name)}
    b=[]
    result.contacts.each{|con| b.push(con.name)}
    assert_equal(a, b)
  end
  def test_findByPhone
    contact1 = Contact.new("Polina Bondarevska","098324434", "@poli", nil, "@donut")
    contact2 = Contact.new("Aboba Bobus", "098567434", nil, "boba@gf.com", "@dsfdsfdsf")
    contact3 = Contact.new("Sasha Bilok", "098844545", "@bilok", "nope@gf.com", "@Bilok98")

    contacts = Contacts.new
    contacts.add(contact1)
    contacts.add(contact2)
    contacts.add(contact3)
    contacts.add(contact1.merge(contact2))

    result = Contacts.new
    result.add(contact2)

    contacts.find_by_phone("856")
    a=[]
    contacts.contacts.each{|con| a.push(con.name)}
    b=[]
    result.contacts.each{|con| b.push(con.name)}
    assert_equal(a, b)
  end
end

class Field
  attr_accessor :value
  def initialize(value)
    @value = value
  end
end

class Phone < Field
end

class Skype < Field
end

class Email < Field
end

class Social < Field
end

class Contact
  attr_accessor :name, :phone, :skype, :email, :social
  def initialize(name, phone, skype , email , social )
    @name = name
    @phone = Phone.new(phone)
    @skype = Skype.new(skype)
    @email = Email.new(email)
    @social = Social.new(social)
  end

  def merge(c)
    Contact.new(name || c.name,
                phone.value || c.phone.value,
                skype.value || c.skype.value,
                email.value || c.email.value,
                social.value || c.social.value)
  end

  def to_s
    "#{name.to_s}: { #{phone.value}, #{skype.value}, #{email.value}, #{social.value} }"
  end
end

class Contacts
  attr_accessor :contacts
  def initialize
    @contacts = []
  end

  def add(contact)
    @contacts.push(contact)
  end

  def to_s
    res = ''
    @contacts.each do |a|
      res += "#{a}\n"
    end
    res
  end

  def sort_by_name
    @contacts = @contacts.sort_by(&:name)
  end

  def find_by_name(name)
    @contacts = @contacts.select { |c| c.name.include? name}
  end

  def find_by_phone(phone)
    @contacts = @contacts.select { |c| c.phone.value.include? phone}
  end
end

def arr_to_s(arr)
  res = ''
  arr.each do |a|
    res += "#{a}\n"
  end
  res
end





