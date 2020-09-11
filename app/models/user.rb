class User < ApplicationRecord
  # as Admin
  has_one :user_profile

  has_many :programs, class_name: "GraduationPath"
  has_many :created_courses, class_name: "Course"

  #has_many :students, through: :created_courses, class_name: "User"
  has_many :teacher_courses, foreign_key: :admin_id
  has_many :teachers, through: :teacher_courses, class_name: "User"
  

  # Try 'has_many :enrolled_courses, :through => :student_grad_courses, :source => <name>'. 
  # Is it one of user_profile, programs, created_courses, student_grad, enrolled_program, 
  # student_grad_courses, enrolled_courses, enrolled_lessons, student_tests, taken_tests, 
  # teachers, teacher_courses, teaching_courses, created_lessons, created_tests, or students?

  # as student
  has_many :notes
  has_one :student_grad

  has_one :enrolled_program, through: :student_grad, class_name: :GraduationPath, source: :student
  
  has_many :student_grad_courses, through: :student_grad, source: :student_grad_courses

  has_many :enrolled_courses, through: :student_grad_courses, class_name: :Course, source: :course
  has_many :enrolled_lessons, through: :enrolled_courses, class_name:"Lesson", source: "courses"
  has_many :student_tests, through: :student_grad_courses
  has_many :taken_tests, through: :student_tests, class_name:"Test"
  has_many :teachers, through: :enrolled_courses
  

  # as Teacher
  has_many :teacher_courses, foreign_key: :user_id
  has_many :teaching_courses, through: :teacher_courses, class_name: "Course", source: "course"
  #has_many :created_courses, through: :teacher_courses, class_name: "Course"
  has_many :created_lessons, through: :teaching_courses, class_name:"Lesson", source: "lessons"
  has_many :created_tests, through: :created_lessons, class_name:"Test"
  has_many :students, through: :teaching_courses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :twitter, :github]

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name
      # user.image = auth.info.image
    end
    return user
  end
  
  def type
    if self.isAdmin?
      return :admin
    elsif self.isStudent?
      return :student
    elsif self.isTeacher?
      return :teacher
    else
      return :unassigned
    end
  end

  def isAdmin?
    self.user_profile.is_admin
  end



  def isTeacher?
    # teacher_ids = TeacherCourse.all.map{|tc| tc.user_id}.uniq
    # if teacher_ids
    #   return teacher_ids.
    self.teacher_courses.length > 0
  end

  def isStudent?
    !!self.enrolled_program
  end

  def full_name
    "#{self.user_profile.l_name}, #{self.user_profile.f_name}"
  end


  def enrolled_per_type
    res = {"Sciences" => 0, "Languages" => 0, "Social Studies" => 0, "Economics" => 0, "Arts" => 0, "Physical Education" =>0}
    self.enrolled_courses.each do |ec|
      res[ec.course_type] += 1
    end
    return res
  end

  def remaining(enrolled)
    res = {"Sciences" => 0, "Languages" => 0, "Social Studies" => 0, "Economics" => 0, "Arts" => 0, "Physical Education" =>0}
    self.enrolled_program.grad_programs.each do |gp|
      # byebug
      res[gp.course_type] =  gp.course_count ? gp.course_count : 0 - enrolled[gp.course_type]
    end
    return res
  end
end
