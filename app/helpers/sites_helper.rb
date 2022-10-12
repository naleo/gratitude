module SitesHelper
  
    def title(name,show_title = true)
        @show_title = show_title
        content_for(:title) do
            name
        end
    end
  
    def nav_link(text, path)
        if current_page?(path)
            content_tag :li do
                link_to(text, path, class: "active")
            end
        else
            content_tag :li do
                link_to(text, path)
            end
        end
    end
end
