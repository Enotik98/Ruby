require 'test-unit'
class Test4 < Test::Unit::TestCase
  attr_accessor :arr, :res1

  def test_diagnosis
    p1 = Patient.new("Bondarevska", "Polina", "Oleksandrivna", "Teremkivska", "0984125118", "12", "ORV")
    p2 = Patient.new("Aboba", "Petro", "Petrovuch", "Teremor", "0982345224", "11", "Appendix")
    p3 = Patient.new("Bob", "Oleg", "OLegovuch", "Terem", "0984125118", "15", "Appendix")
    arr = [p1, p2, p3]
    res_ORV = [p1]
    res_Appendix = [p2, p3]
    test1 = ListPatients.searchDiagnosis(arr, "ORV")
    test2 = ListPatients.searchDiagnosis(arr, "Appendix")
    assert_equal(test1, res_ORV)
    assert_equal(test2, res_Appendix)
  end
  def test_MedicalCard
    p1 = Patient.new("Bondarevska", "Polina", "Oleksandrivna", "Teremkivska", "0984125118", "12", "ORV")
    p2 = Patient.new("Aboba", "Petro", "Petrovuch", "Teremor", "0982345224", "11", "Appendix")
    p3 = Patient.new("Bob", "Oleg", "OLegovuch", "Terem", "0984125118", "15", "Appendix")
    arr = [p1, p2, p3]
    res1 = [p1, p3]
    res2 = [p2]
    test1 = ListPatients.listMedicalCardInDiapason(arr, 12, 16)
    test2 = ListPatients.listMedicalCardInDiapason(arr, 10, 11)
    assert_equal(test1, res1)
    assert_equal(test2, res2)
  end

end
class Patient
  attr_accessor :id, :surname, :name, :patronymic, :address, :phone, :numOfMedicalCard, :diagnosis
  @@id = 1

  def initialize(surname, name, patronymic, address, phone, numOfMedicalCard, diagnosis)
    @id = @@id
    @@id = @@id + 1
    @surname = surname
    @name = name
    @patronymic = patronymic
    @address = address
    @phone = phone
    @numOfMedicalCard = numOfMedicalCard
    @diagnosis = diagnosis
  end

  def to_s
    @id.to_s + " " + @surname.to_s + " " + @name.to_s + " " + @patronymic.to_s + " " + @address.to_s + " " + @phone.to_s + " " + @numOfMedicalCard.to_s + " " + @diagnosis.to_s
  end
end

class ListPatients
  def self.searchDiagnosis(arrayPatients, diagnosis)
    list = Array.new
    arrayPatients.each { |patient|
      if patient.diagnosis == diagnosis
        # puts patient.to_s
        list.append(patient)
      end
    }
    list
  end

  def self.listMedicalCardInDiapason(arrPatients, start_interval, end_interval)
    list = Array.new
    arrPatients.each do |patient|
      if start_interval <= patient.numOfMedicalCard.to_i && patient.numOfMedicalCard.to_i <= end_interval

        list.append(patient)
      end
    end
    list
  end
end

p1 = Patient.new("Bondarevska", "Polina", "Oleksandrivna", "Teremkivska", "0984125118", "12", "ORV")
p2 = Patient.new("Aboba", "Petro", "Petrovuch", "Teremor", "0982345224", "11", "Appendix")
p3 = Patient.new("Bob", "Oleg", "OLegovuch", "Terem", "0984125118", "15", "Appendix")
arrPatients = [p1, p2, p3]

puts "Diagnos "
a = ListPatients.searchDiagnosis(arrPatients, "ORV")
puts a
puts "Medical card"
puts ListPatients.listMedicalCardInDiapason(arrPatients, 12, 16)