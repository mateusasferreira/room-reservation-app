class DateValidator < ActiveModel::Validator

    def validate(record)
        if options[:fields].any? { |field| record.send(field) < Time.current }
            record.errors.add :base, "Can't book a room with a past date"
        end
    end
end

class Reserva < ApplicationRecord
    belongs_to :user

    validates :solicitante, :data, :descricao, :user_id, presence: true

    validates :data, uniqueness: true

    validates_with DateValidator, fields: [:data]
end




