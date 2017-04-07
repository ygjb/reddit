if !@links.blank?
  render json: { :links => @links}, status: 200
else
  render json: @links.errors, status: :unprocessable_entity
end