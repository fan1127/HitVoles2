Account = { balance = 0,
			withDraw = function (self,v)
						self.balance = self.balance - v 
					   end
		  }

function Account : deposit(v)
	self.balance = self.balance + v 
end

Account.withDraw(Account,10.00)
Account:deposit(20.00)

Account.deposit(Account,30.00)
Account:withDraw(30.00)


