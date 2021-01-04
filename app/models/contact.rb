class Contact < ApplicationRecord

  # Associations
  belongs_to :kind #, optional: true
  has_many :phones
  
  accepts_nested_attributes_for :phones

  def as_json(options={})
    h = super(options)
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?) 
    h
  end
  
  # def to_br
  #   {
  #     name: self.name,
  #     email: self.email,
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?),
  #     kind: self.kind
  #   }
  # end
  
  # def birthdate_br
  #   I18n.l(self.birthdate) unless self.birthdate.blank?
  # end

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

  # def language
  #   I18n.default_locale
  # end


end
