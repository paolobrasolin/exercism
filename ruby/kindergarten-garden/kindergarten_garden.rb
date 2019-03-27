class Garden
  DEFAULT_PLANTS = %w{
    Grass Clover Radishes Violets}

  DEFAULT_STUDENTS = %w{
    Alice Bob Charlie David
    Eve Fred Ginny Harriet
    Ileana Joseph Kincaid Larry}

  def initialize(diagram, students=DEFAULT_STUDENTS, plants=DEFAULT_PLANTS)
    @diagram = diagram
    @students = normalize_students(students)
    @plants = normalize_plants(plants)
  end

private

  def method_missing(method_sym, *arguments, &block)
    student_index = @students.index(method_sym)
    return super if student_index.nil?
    plants_in_nth_slot(student_index).map(&@plants)
  end

  def respond_to?(method_sym, include_private=false)
    !KIDS.index(method_sym).nil? || super
  end

  def plants_in_nth_slot(n)
    @diagram.split("\n").flat_map do |row|
      row.chars[2*n..2*n+1]
    end
  end

  def normalize_students(students)
    students.map(&:downcase).sort.map(&:to_sym)
  end

  def normalize_plants(plants)
    plants.each_with_object({}) do |plant_name, plants_hash|
      plants_hash[plant_name.chr.upcase] = plant_name.downcase.to_sym
    end
  end
end
