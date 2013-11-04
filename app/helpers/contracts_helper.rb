module ContractsHelper
  def random_money
    number_to_currency(rand(99999999))
  end

  def random_date
    (rand(365)).days.from_now
  end

  def safe_status(status)
    status.gsub(/\s/, "_").downcase
  end

  def warning_class(card = true)
    klass = card ? ' card--warning' : 'warning'
    [true, false, false, false, false, false, false, false].sample ? klass : ''
  end
end
