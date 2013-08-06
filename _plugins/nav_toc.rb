module Jekyll
  class NavTocTag < Liquid::Tag

    def render(context)
      site = context.registers[:site]
      curr = context.registers[:page]
      toc = site.config['toc']

      ans = '<ul class="nav-toc">'
      toc.each { |item| ans += render_group(site, item, curr) }
      ans += '</ul>'

      ans
    end

    def render_group(site, group, curr)
      head = group['head']
      body = group['body']

      ans = ''

      if head && body
        page = find_page(site, head)

        ans += '<li' + render_active(page, curr, 'nav-toc-group') + '>'

        if page
          ans += render_link(page, 'nav-toc-heading')
        else
          ans += '<span class="nav-toc-heading">' + head + '</span>'
        end

        ans += '<ul class="nav-toc-menu">'
        body.each do |path|
          page = find_page(site, path)
          ans += '<li' + render_active(page, curr) + '>' + render_link(page, nil) + '</li>'
        end
        ans += '</ul>'

        ans += '</li>'
      end

      ans
    end

    def find_page(site, path)
      path && site.pages.find { |page| page.url == path }
    end

    def render_link(page, css_class = nil)
      ans = ''
      ans += '<a' + (if css_class then ' class="' + css_class + '"' else '' end) + ' href="' + page.url + '">'
      ans += (page.data['title'] || page.url)
      ans += '</a>'
      ans
    end

    def render_active(page, curr, css_class = nil)
      if page && curr['url'] == page.url
        if css_class
          ' class="active ' + css_class + '"'
        else
          ' class="active"'
        end
      else
        if css_class
          ' class="' + css_class + '"'
        else
          ''
        end
      end
    end
  end
end

Liquid::Template.register_tag('nav_toc', Jekyll::NavTocTag)