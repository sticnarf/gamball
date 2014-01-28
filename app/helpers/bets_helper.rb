module BetsHelper
  def trans_result(str)
    dic = {'home' => '主队胜', 'draw' => '两队打平', 'away' => '客队胜'}
    dic[str]
  end
end
