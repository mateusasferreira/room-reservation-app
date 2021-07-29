class Reserva < ApplicationRecord
    belongs_to :user

    validates :solicitante, :data, :descricao, presence: true

    validates :data, uniqueness: true

    validates_with DateValidator
end

class DateValidator < ActiveModel::Validator

    def validate(record)
        if(record.data < Time.current)
            record.errors.add :base, "Can't book a room with a past date"
        end
    end
end


