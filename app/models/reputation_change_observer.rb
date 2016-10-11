# reputation_change_observer.rb
# class ReputationChangeObserver
#   def update(changed_data)
#     description = changed_data[:description]

    # If user is your meritable model, you can query for it doing:
    # user = User.where(sash_id: changed_data[:sash_id]).first

    # When did it happened:
#     datetime = changed_data[:granted_at]
#   end
# end


class ReputationChangeObserver
  def update(changed_data)
    # description will be something like:
    #   granted 5 points
    #   granted just-registered badge
    #   removed autobiographer badge
    description = changed_data[:description]

    # If user is your meritable model, you can grab it like:
    if changed_data[:merit_object]
      sash_id = changed_data[:merit_object].sash_id
      user = User.where(sash_id: sash_id).first
    end

    # To know where and when it happened:
    merit_action = Merit::Action.find changed_data[:merit_action_id]
    controller = merit_action.target_model
    action = merit_action.action_method
    when = merit_action.created_at

    # From here on, you can create a new Notification assuming that's an
    # ActiveRecord Model in your app, send an email, etc. For example:
    Notification.create(
      user: user,
      what: description,
      where: "#{controller}##{action}",
      when: when)
  end
end
