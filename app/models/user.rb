class User < ActiveRecord::Base
	include Analyzable
	after_create :analyze


end
