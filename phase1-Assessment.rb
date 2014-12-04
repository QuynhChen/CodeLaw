#ANSWER 1:SIMPLEST! ANSWER 2:TRADITIONA/LONGER. ANSWER 3: INTERESTING. Please share better solutions!

#(A) ARRAYS
  #1) Create an empty array for student names.
    # =>  Answer 1
      student_names = []
    # =>  Answer 2
      student_names = Array.new

  #2) Create an empty 3-element array for student names.
    # =>  Answer 1
      student_names = Array.new(3)
    # =>  Answer 2
      student_names = [nil, nil, nil]

  #3) Create a student name array for one student "Bill".
    # => Answer 1
      student_names = ["Bill"]
    # => Answer 2
      student_names = Array.new(1, "Bill")
      student_names = Array.new(1){"Bill"}

  #4) Create an array for other names with three students: Bob, Sue, and Jen.
    # => Answer 1
      other_names = %w(Bob Sue Jen)
    # => Answer 2
      other_names = ["Bob", "Sue", "Jen"]
    # => Answer 3 Here I added more Bob, sue and jen's to the group.
      other_names = []
      other_names << "Bob"
      other_names << "Sue"
      other_names << "Jen"

  #5) Add the other names array to the student names array.
    # => Answer 1
      student_names = student_names + other_names
    # => Answer 2
      student_names << other_names #other_names becomes a nested array.
      student_names = student_names.flatten

  #6) Print out the names in the array and number each name from 1 to whatever, with each name to its own line.
    # Psuedo: Loop through array. print each: index +1 & name element. Use puts to print out on each line. p will print out same info with quotes.
      def numbered_name(array_of_names)
        array_of_names.each_with_index do |name, index|
          # puts "#{index+1}. " + name
            #--- OR ---
          # puts (index+1).to_s + ". " + name
            #--- OR ---
          puts "#{index+1}. #{name}"
       end
      end

      numbered_name(student_names)
# => ===================== =>
#(B) HASHES
  #1 Create a hash that holds the names and ages of three students.
    # =>  Answer 1
      students = {
        bob: 22,
        sue: 21,
        jen: 20
      }
    #Answer 2
      students = {"bob" => 21, "Sue" => 22, "Jen" => 10}
# => ===================== =>
#(C) NESTED ARRAYS AND HASHES
  #1 Create a nested array for the above data.
      students_nested_array = [["Bob", 22],["Sue", 21],["Jen", 20]]
  #2) Create an array of hashes
    # => Answer 1 Use this syntax for storage.
      students_hash_array = [{name: "Bob", age: 22}, {name: "Sue", age: 21}, {name: "Jen", age: 20}]
     # => Answer 2 This works but not optimal for storage.
      students_hash_array = [{:Bob => 22}, {:Sue => 21}, {:Jen => 20}]

  #3) Write TEST CODE to access the nested array and array of hashes.
    #a) What's the age of the 2nd student?
      p students_nested_array[1][1] == 21
      p students_hash_array[1][:Sue] == 21

    #b) print out a list all the student names (use puts instead of p to print names outside of an array and not as string.)
      students_nested_array.map {|array| puts array[0]}

      students_hash_array = [{name: "Tha", age: 22}, {name: "NK", age: 21}, {name: "You", age: 20}]
      students_hash_array.each do |hash| puts hash[:name]
      end

#(D) CLASSES AND OBJECTS
  #1 Given a hash create Student objects. 2 WAYS.
    # =>  Answer #1
      class Student
        attr_reader :age, :name #local variable
        def initialize(args = {})
          @name = args[:name] #instance variables
          @age = args[:age]
        end
      end

      p bob = Student.new(name: "bob", age: 5) # will be hash even without {}
      p bob.name == "bob"

    # =>  Answer #2
      class Student
        attr_reader :age, :name
        def initialize(args)
          @name = args[:name]
          @age = args[:age]
        end
      end
      p tom = Student.new({name: "tom", age: 5}) # will be hash even without {}
      p tom.age == 5
      p tom.name == "tom"

#(E) OBJECT MANIPULATION
  #1 Given Input = array of hashes. Create output: an array of student objects.
    class Student
      attr_reader :age, :name #local variable
      def initialize(args = {})
          @name = args[:name] #instance variables
          @age = args[:age]
      end
    end

    students_hash_array = [{name: "Bob", age: 22}, {name: "Sue", age: 21}, {name: "Jen", age: 20}]
    p array_student_objects = students_hash_array.map{ |hash| Student.new(hash)}

  #2 Create a StudentOrganizer object that accepts a group of student objects and can print out the list of student names w/ numbers.
    class Student
      attr_accessor :age, :name #local variable
      def initialize(args = {})
          @name = args[:name] #instance variables
          @age = args[:age]
        end
      end

    students_hash_array = [{name: "Bob", age: 22}, {name: "Sue", age: 21}, {name: "Jen", age: 20}]

    p array_student_objects = students_hash_array.map { |hash| Student.new(hash) }

    class StudentOrganizer

      def initialize(students)
        @students = students
      end

      def list
        @students.each_with_index do |student, index|
          # puts "#{@student.index+1}" "#{student.name} "
          puts "#{index+1}" + ". " + "#{student.name} " + "#{student.age}"
        end
      end
    end

    student_organizer = StudentOrganizer.new(array_student_objects)
    p student_organizer.list.length == 3
