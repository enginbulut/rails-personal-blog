module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Engin Bulut | My Portfolio Website"
    @seo_keywords = "Engin Bulut portfolio"
  end
end
