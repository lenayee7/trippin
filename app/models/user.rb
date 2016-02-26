class User < ActiveRecord::Base

	has_many :trips
	
	validates :first_name, :last_name, presence: true
	validates :username, presence: true, length: {in: 3..20}, uniqueness: true
	validates :password, presence: true, length: {in: 5..20}, :on => :create
	validates :password, length: {in:5..20}, :allow_blank => true, :on => :update
	has_secure_password

	# has_many :trips, dependent: :destroy
	# has_many :posts, dependent: :destroy
	
	def self.confirm(params)
    @user = User.find_by({username: params[:username]})
    @user.try(:authenticate, params[:password])
  end

end
