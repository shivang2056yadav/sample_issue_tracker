module UsersHelper
  # Returns a string for users/groups option tags
  def options_for_assigned_to_id_select_for_user(collection, selected=nil)
    s = ''
    if collection.include?(current_user)
      s << content_tag('option', "<< me >>", :value => current_user.id)
    end
    collection.sort.each do |element|
      selected_attribute = ' selected="selected"' if option_value_selected?(element, selected) || element.id.to_s == selected
      s << %(<option value="#{element.id}"#{selected_attribute}>#{h (element.name || element.email)}</option>)
    end
    s.html_safe
  end

end
