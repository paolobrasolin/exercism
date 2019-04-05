class School
  def initialize
    @students = Hash.new { |h,k| h[k] = Array.new }
  end

  def add(student, grade)
    @students[grade].append(student).sort!
  end

  def students(grade)
    @students[grade]
  end

  def students_by_grade
    @students.sort_by(&:first).map do |grade, students|
      { grade: grade, students: students }
    end
  end
end
