module ApplicationHelper
	
	def data_currency(data)
    	number_to_currency(data, unit: 'Rp. ', :precision => 0)
  	end

  	
end
