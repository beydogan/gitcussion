# Source https://github.com/koraktor/braumeister.org/blob/d6467a86e8f6bd552cd90712e3567b2989068600/config/initializers/monkey_patch_escaped_routes.rb
class ActionDispatch::Journey::Visitors::Formatter

  def visit_SYMBOL(node, name)
    if value = options[name]
      escape_path value
    end
  end

end