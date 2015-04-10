module ApiV1
  module Helpers
    module TodoHelper
      def set_user(token)
        user = UserRepository.find_by_remember_token(token)
        halt 401 if token.blank? || !user
        user
      end
    end
  end
end
