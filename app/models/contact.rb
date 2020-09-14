class Contact < ApplicationRecord
  belongs_to :kind, foreign_key: "kind_id", optional: true

  # def author
  #   "Rafael Sales"
  # end

  # def kind_description
  #   self.kind.description
  # end
  
  # def as_json(options={})
  #   super(
  #     root: true,
  #     methods: [:kind_description, :author], 
  #     include: { kind: { only: :description }}
  #   )
  # end
end
