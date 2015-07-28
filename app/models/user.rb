class User < ActiveRecord::Base

  validates :email, presence: true,
                    uniqueness: true

  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end

end
