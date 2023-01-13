class APIKey < ApplicationRecord
    # attr_accessor :access_token, :expires_at, :user_id, :active, :application
    before_create :set_expiration
    belongs_to :user
  
    def expired?
      DateTime.now >= self.expires_at
    end
  
    private
    def set_expiration
      self.expires_at = DateTime.now+30
    end
end