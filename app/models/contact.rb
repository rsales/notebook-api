class Contact < ApplicationRecord
  def author
    "Rafael Sales"
  end
  
  def as_json(options={})
    super(methods: :author, root: true)
  end
end
