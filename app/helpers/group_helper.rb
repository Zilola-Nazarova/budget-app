module GroupHelper
  def total_amount(group)
    group.purchases.sum(:amount)
  end
end