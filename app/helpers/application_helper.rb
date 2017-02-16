module ApplicationHelper
  # def paginator(links)
  #   params[:page] = 111
  #   cur_page ||= params[:page] 
  #   last_page = links.count
  #   delta=2
  #   left_page = cur_page-delta
  #   right_page = cur_page+delta+1
  #   range = []
  #   paginator = []
  #   per_index = nil
  #   (1..last_page).each do |index|
  #     if index == 1 || index == last_page || index >= left_page && index < right_page
  #       range.push index
  #     end
  #   end
  #   range.each do |index|
  #     if per_index != nil
  #       if index-per_index == 2
  #         paginator.push(per_index+1) 
  #       elsif index-per_index != 1
  #         paginator << '...'
  #       end
  #     end
  #     paginator.push(index)
  #     per_index = index
  #   end
  #   paginator
  # end
  def time_ago(time)
    "#{time_ago_in_words(time)} ago"
  end
end
