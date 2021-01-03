class Contact < ApplicationRecord

  belongs_to :kind

  def author
    "Harysson Soares"
  end

  def as_json(option={})
    super(methods: :author, root: true)
  end
end
