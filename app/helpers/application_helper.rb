module ApplicationHelper

	def full_title(title)
    base = "Unsung Audio"
    if title.empty?
      return base
    else
      return "#{title}"
    end
  end

end
