module Admin::TopHelper
	def go
		if @user.admin?
			render '/admin'
		end
	end
end
