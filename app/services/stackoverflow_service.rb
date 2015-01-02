class StackoverflowService < BaseService
  require 'stack_overflow'

  def call(tag)
    so_data = {}
    begin
      so = StackOverflow.new
      so_data["total_questions"] = so.get_question_count(tag, nil)
      so_data["answered_questions"] = so.get_question_count(tag, true)
      so_data["unanswered_questions"] = so_data["total_questions"] - so_data["answered_questions"]
    rescue Exception => e
      return error(e.body)
    end
    return success(so_data)
  end

end