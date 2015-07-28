class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :content, presence: true,
                      length: { minimum: 2 }

  # these scopes will return all items of a given list that meet the SQL criterias in the { }
  scope :complete, -> { where('completed_at is not null') }
  scope :incomplete, -> { where(completed_at: nil) }

  def completed?
    !completed_at.nil?
  end
end
