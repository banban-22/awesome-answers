class Question < ApplicationRecord

    #  a Question has many answers
    # when a Question object is deleted, all of its associated Answer objects should also be deleted
    has_many :answers, dependent: :destroy

    validates :title, presence: true, uniqueness: {message: "needs to be unique!"}
    validates :body, length: {minimum: 5, maximum: 100} 

    # custom validation
    validate :no_monkey
    validate :no_title_in_body

    belongs_to :user, optional: true

    # life cycle events
    before_save {
        # before saving it to db capitalize the title
        self.title = title.capitalize
    }

    before_validation(:set_default_view_count)

    # Scope: Scopes are class methods for Model
    # scope(:name_of_method, ->{lambda})
    scope(:recent_ten, ->{ order("created_at desc").limit(10) })
    # The above is equivalent to:
    # def self.recent_ten
    #     order("created_at desc").limit(10)
    # end

    def self.search(keyword)
        where('title ILIKE ? or body ILIKE ?', "%"+keyword+"%", "%"+keyword+"%")
    end

    private
    # custom validation method
    def no_monkey
        if body && body.downcase.include?("monkey")
            self.errors.add(:body, "must not contain monkey")
        end
    end

    def no_title_in_body
        if body&.downcase.include?(title.downcase)
            self.errors.add(:body, "must not include title of question")
        end
    end

    def set_default_view_count
        self.view_count ||=0
    end
end