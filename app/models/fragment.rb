class Fragment < ActiveRecord::Base
  include Tokenable

  TEMPLATE_LANGUAGES = ['markdown', 'textile']

  def render
    MarkdownService.new.render(content)
  end

end
