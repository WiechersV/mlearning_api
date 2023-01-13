module UserConcern
  extend ActiveSupport::Concern

  def validate_college_existence
    if !College.exists?(params[:college_id])
      error_response('The specified college doesn\'t exist')
    end
  end

  def validate_exam_existence
    if !Exam.exists?(user_params[:exam_id])
      error_response('The specified exam doesn\'t exist')
    end
  end

  def validate_exam_associations
    @exam = Exam.find(user_params[:exam_id])
    if !@exam.college_id.to_s.eql?(params[:college_id].to_s)
      error_response('The specified exam doesn\'t belong to the current college')
    elsif !@exam.exam_window.start_time.to_datetime.eql?(DateTime.strptime(params[:start_time], '%Y-%m-%d'))
      error_response('The specified exam window is incorrect')
    end
  end

  def error_response(message, status = :bad_request)
    render json: { error: message }, status: status
  end
end