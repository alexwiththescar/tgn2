
module ProductsHelper
def wrap(content)
sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(' ')))
end

  def description_excerpt(c)
     return unlessc
     c.split(" ")[0..4].join + "..."
   end

private
def wrap_long_string(text, max_width = 30)
zero_width_space = "&#8203;"
regex = /.{1,#{max_width}}/
(text.length < max_width) ? text :
text.scan(regex).join(zero_width_space)
end
end