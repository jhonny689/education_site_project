class User < ApplicationRecord
  # as Admin
  has_one :user_profile
  has_many :programs, class_name: "GraduationPath"
  has_many :created_courses, class_name: "Course"
  has_many :students, through: :created_courses, class_name: "User"
  has_many :teacher_courses, foreign_key: :admin_id
  has_many :teachers, through: :teacher_courses, class_name: "User"
  

  # as student
  has_many :student_grad_courses
  has_one :graduation_path, through: :student_grad_courses
  has_many :enrolled_courses, through: :student_grad_courses, class_name:"Course"
  has_many :enrolled_lessons, through: :enrolled_courses, class_name:"Lesson"
  has_many :student_tests, through: :student_grad_courses
  has_many :taken_tests, through: :student_tests, class_name:"Test"
  has_many :teachers, through: :enrolled_courses

  # as Teacher
  has_many :teacher_courses, foreign_key: :user_id
  has_many :teaching_courses, through: :teacher_courses, class_name: "Course"
  #has_many :created_courses, through: :teacher_courses, class_name: "Course"
  has_many :created_lessons, through: :created_courses, class_name:"Lesson"
  has_many :created_tests, through: :created_lessons, class_name:"Test"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :twitter, :github]

  def self.from_omniauth(auth)
    byebug
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      byebug
      # user.name = auth.info.name
      # user.image = auth.info.image
    end
    byebug
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
    self.student_grad_courses.count > 0
  end

  def full_name
    "#{self.user_profile.l_name}, #{self.user_profile.f_name}"
  end
end
