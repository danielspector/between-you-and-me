module ApplicationHelper
  def render_js(*args)
    j(render(*args))
  end
end
