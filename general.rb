inside "app/views/layouts" do
  file "_meta_tags.html.slim", <<-CODE
meta charset='utf-8'
meta name="description" content=\"\#\{description\}\"
// OG Tags
meta property="og:site_name"    content="Katana Code"
meta property="og:url"          content== canonical_url
meta property="og:title"        content== og_title
meta property="og:description"  content== og_description
- if og_updated_time
  meta property="og:updated_time" content== og_updated_time

- if og_image_url
  meta property="og:image"       content== og_image_url

// Geo Tags  
meta name="geo.placename"  content="Edinburgh EH10 4DY, UK"
meta name="geo.position" content="55.936611;-3.209363"
meta name="geo.region" content="GB-Midlothian"
meta name="ICBM" content="55.936611, -3.209363"

// Mobile tags
meta content="IE=Edge,chrome=1" http-equiv="X-UA-Compatible"
meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"
meta content="yes" name="apple-mobile-web-app-capable"

// Author tags
meta name="author" content== author 

= yield(:meta)

// CSRF Tags
= csrf_meta_tags
CODE
end


file "app/helpers/layout_helper.rb", <<-CODE
module LayoutHelper
  
  def title(content = nil)
    if content
      content_for(:title, content)
    else
      content_for(:title)
    end
  end
  

  def description(content = nil)
    raise "Description content too long" if content.to_s.length > 160 
    if content
      content_for(:description, content)
    else
      content_for(:description) || DEFAULT_DESCRIPTION
    end
  end
    
  def copyright_statement
    "&copy; \#{(Date.today.year..2015).to_a.join(" &dash; ")} Katana Code Ltd".html_safe
  end
 
end
CODE
