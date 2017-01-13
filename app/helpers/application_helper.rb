module ApplicationHelper

  def allow?(controller, action, listing_id)
    if current_user.customer?
      # controller == 'listings' && action == 'index'
      # controller == 'listings' && action.in?(%w[index show new create edit update])

      if controller == 'listings'
        # Rails.logger.debug{action}

        if action.in?(%w[index show new create])
          return true
        elsif action.in?(%w[edit update])
          # user can only edit his own listing
          if Listing.find(listing_id).user_id == current_user.id
            return true
          end
        end
      end

      false

    elsif current_user.moderator?
      controller == 'listings' && action.in?(%w[index show new create edit update verify])
    elsif current_user.superadmin?
      true
    else
      false
    end
  end

end
