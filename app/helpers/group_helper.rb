module GroupHelper
  def total_amount(group)
    group.purchases.sum(:amount)
  end

  def check_url(url)
    default = 'missing_avatar.png'
    if (File.extname(url) =~ /^(.png|.gif|.jpg)$/) || (url =~ /^#{URI::DEFAULT_PARSER.make_regexp}$/)
      url
    else
      default
    end
  end
end
