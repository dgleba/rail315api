class User < ActiveRecord::Base

  # notice this comes BEFORE the include statement below
  # also notice that :confirmable is not included in this block
  devise :database_authenticatable, :recoverable,
         :trackable, :validatable, :registerable,
         :omniauthable

  include DeviseTokenAuth::Concerns::User

  #validates :email, presence: true, uniqueness: true, email: true
  validates :email, presence: true, uniqueness: true 
  

  def to_s
    # show columns contents, not record object like: 	#<Vehicle:0x007f343b3f2890>	2016-06-08
    "#{email},#{name}"
  end

  validates_presence_of :name
  before_save :assign_role


  def assign_role
    self.role = Role.find_by name: "lr_minimal" if self.role.nil?
  end

  def lr_admin?
    self.role.name == "lr_admin"
  end

  def lr_minimal?
    self.role.name == "lr_minimal"
  end

  def lr_readonly?
    self.role.name == "lr_readonly"
  end
  
  def lr_create?
    self.role.name == "lr_create"
  end

  def lr_regular?
    self.role.name == "lr_regular"
  end

  def lr_supervisor?
    self.role.name == "lr_supervisor"
  end

  def lr_seller?
    self.role.name == "lr_seller"
  end

  belongs_to :role
  
  #validate :ensure_allowed_favorite_color

  def ensure_allowed_favorite_color
    if favorite_color and favorite_color != ""
      unless ApplicationHelper::COLOR_NAMES.any?{ |s| s.casecmp(favorite_color)==0 }
        matches = ApplicationHelper::COLOR_SEARCH.search(favorite_color)
        msg = "We've never heard of the color \"#{favorite_color}\""

        if matches.length > 1
          closest_match = matches.last[:string]
          second_closest_match = matches[-2][:string]
          msg += ". Did you mean \"#{closest_match}\"? Or perhaps \"#{second_closest_match}\"?"
        end

        errors.add(:favorite_color, msg)
      end
    end
  end

  private

  def password_update?
    password.present? || new_record?
  end
  
end
