class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate, :age

  belongs_to :kind
  has_many :phones
  has_one :address

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
