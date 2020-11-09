class Credit
  attr_reader :source,
              :author,
              :logo

  def initialize(credit_params)
    @source = 'pexels.com'
    @author = credit_params
    @logo = 'https://theme.zdassets.com/theme_assets/9028340/1e73e5cb95b89f1dce8b59c5236ca1fc28c7113b.png'
  end
end
