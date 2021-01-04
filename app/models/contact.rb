class Contact < ApplicationRecord

  belongs_to :kind, optional: true

  # def author
  #   "Harysson Soares"
  # end

  # def kind_description
  #   self.kind.description
  # end

  # def as_json(option={})
  #   super(
  #     root: true,
  #     methods: [:author, :kind_description],
  #     # include: {
  #     #   kind: { only: :description }
  #     # }
  #   )
  # end

  def language
    I18n.default_locale
  end
end
