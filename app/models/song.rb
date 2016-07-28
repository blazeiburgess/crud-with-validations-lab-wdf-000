class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :release_year, presence: true, if: :released 
  validate :release_year_is_before_current_year
  def release_year_is_before_current_year
    if release_year && release_year > Time.now.year
      errors.add(:release_year, "can't be in the past")
    end
  end  
end
