class Question
  attr_accessor :numA,:numB,:ans
  def initialize
    @numA=rand(1..20)
    @numB=rand(1..20)
    @ans=@numA+@numB
    
  end
end
