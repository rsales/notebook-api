class Contact < ApplicationRecord
  belongs_to :kind, foreign_key: "kind_id"

  def author
    "Rafael Sales"
  end
  
  def as_json(options={})
    super(methods: :author, root: true)
  end
end
