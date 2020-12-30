# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

content = if File.exist? 'data/content.json'
            JSON.parse File.read('data/content.json')
          else
            []
          end

config[:content] = content

content.each do |blog|
  proxy(
    "#{blog["base_path"]}/index.html",
    '/dynamic-templates/blog',
    locals: {
      **blog,
    }
  )
end

ignore '/dynamic-templates/blog'

