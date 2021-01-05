class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate, :age

  belongs_to :kind do
    link(:related) { kind_url(object.kind.id)}
  end
  has_many :phones
  has_one :address

  #HATEOAS
  link(:self) { contact_url(object.id)}
  # link(:kind) { kind_url(object.kind.id)}

  def age
    Date.today.year - object.birthdate.year
  end

  def attributes(*args)
    h = super(*args)
    # h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?) 
    h[:birthdate] = (object.birthdate.to_time.iso8601 unless object.birthdate.blank?) 
    h
  end

  meta do
    {author: "Harysson Soares"}
  end

end
