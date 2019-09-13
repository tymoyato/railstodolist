require "dry/transaction"

class StartFinish
  include Dry::Transaction

  step :finish_transition

  def finish_transition(input)
    if input[:item].finished!
      Success(input)
    else
      Failure(error: input[:item].errors.full_messages.join(', '), resource: input[:item])
    end
  end
end