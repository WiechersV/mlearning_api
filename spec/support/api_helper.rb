module ApiHelpers
  def json
    JSON.parse(response.body)
  end

  def omit_params(params, params_to_omit = [], deep = false)
    if deep
      {
        **params.except(:user),
        user: params[:user].except(*params_to_omit)
      }
    else
      params.except(*params_to_omit)
    end
  end
end