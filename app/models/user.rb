class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :hashed_password, :last_name, :salt, :title

  has_many :permissions
  has_many :projects, through: :permissions
  has_many :created_projects, :class_name => "Project", :foreign_key => "creator_id"
  has_many :managed_projects, :class_name => "Project", :foreign_key => "manager_id"
  has_many :notes
  has_many :created_tasks, :class_name => "Task", :foreign_key => "creator_id"
  has_many :assigned_tasks, :class_name => "Task", :foreign_key => "assigned_id"

  validates_length_of :password, :within => 5..40
  validates_presence_of :email, :password, :password_confirmation, :salt
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"  

  attr_protected :id, :salt
  attr_accessor :password, :password_confirmation

  def self.random_string(len)
    #generate a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end

  def password=(pass)
    @password=pass
    self.salt = User.random_string(10) if !self.salt?
    self.hashed_password = User.encrypt(@password, self.salt)
  end

  def self.authenticate(email, pass)
	  u=find(:first, :conditions=>["email = ?", email])
	  return nil if u.nil?
	  return u if User.encrypt(pass, u.salt)==u.hashed_password
	  nil
  end 

  def send_new_password
	new_pass = User.random_string(10)
	self.password = self.password_confirmation = new_pass
	self.save
	Notifications.deliver_forgot_password(self.email, new_pass)
  end

  protected

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass+salt)
  end

  def self.random_string(len)
    #generat a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end

end
