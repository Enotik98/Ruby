class Student
  attr_accessor :surname, :street, :numHouse, :numFlat

  def initialize(surname, street, numHouse, numFlat)
    @surname = surname.to_s
    @street = street.to_s
    @numHouse = numHouse.to_i
    @numFlat = numFlat.to_i
  end

end

class Students
  attr_reader :students_array, :count

  def initialize
    @students_array = Array.new
    @students_array.each { |student| @students_array << student.dup }
    @count = 0
  end

  def addStudent(student)
    @students_array.append(student)
    @count += 1
  end

  def arrStreet
    arrStreet = Array.new
    count = 0
    @students_array.each do |student|
      unless arrStreet.include?(student.street)
        flag = false
        (0...arrStreet.length).each { |i|
          if student.street.include?(arrStreet[i][0])
            flag = true
          end
        }
        unless flag
          arrStreet[count] = Array.new(2)
          arrStreet[count][0] = student.street
          arrStreet[count][1] = 0
          count += 1
        end

      end
    end
    arrStreet
  end

  def calStudentsOnStreet
    arr = arrStreet
    (0...arr.length).each do |i|
      @students_array.each { |student|
        if student.street == arr[i][0]
          arr[i][1] += 1
        end
      }
    end
    arr
  end
  def listStudentInNumHouse(numHouse)
    listStudent = Array.new
    @students_array.each do |student|
      if student.numHouse == numHouse
        listStudent.append(student.surname)
      end
    end
    listStudent
  end

end

aa = Students.new

aa.addStudent(Student.new("Bondarevska", "Teremky", 7, 16))
aa.addStudent(Student.new("Bond", "Holos", 7, 8))
aa.addStudent(Student.new("Boba", "Teremky", 7, 59))
aa.addStudent(Student.new("Boba", "Teremky", 6, 19))
aa.addStudent(Student.new("Bondarev", "Teremky", 6, 1))

p aa.calStudentsOnStreet

numberHouse = 6
p aa.listStudentInNumHouse(numberHouse)


