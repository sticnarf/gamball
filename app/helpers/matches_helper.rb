module MatchesHelper
  include Capybara::DSL
  def fetch_matches(league_name)
    Capybara.current_driver = :webkit
    Capybara.app_host = 'http://www.macauslot.com'
    page.visit '/slot/html/fixture/fixture.htm?a=0&K=1&l=2'
    page.select league_name, :from => 'filter0'
    sleep 10
    html = Nokogiri::HTML(page.html)
    fetch_standard(html, league_name)
  end

  private

  def replace_name(league, name)
    TEAM_NAME[league][name] || name
  end

  def fetch_standard(html, league_name)
    trs = html.at_css('#hdr_table').child.children
    return false if (trs.size - 4) % 3 != 0
    num = (trs.size - 4) / 3
    league = League.find_by(:name => league_name)
    (0...num).each do |n|
      start = n * 3 + 3
      row1 = trs[start + 1].children
      time = Time.strptime(row1[0].attribute('title').value.gsub(/\(.*\)\ /, "") + " +0800", "%Y 年 %m 月 %d  日 %H:%M %z")
      home = Team.find_by(:name => replace_name(league_name, row1[2].children[0].text))
      home_odd = row1[8].children[1].text.to_f
      row2 = trs[start + 2].children
      away = Team.find_by(:name => replace_name(league_name, row2[1].children[0].text))
      away_odd = row2[7].children[1].text.to_f
      row3 = trs[start + 3].children
      draw_odd = row3[3].children[1].text.to_f
      match = Match.where(:time => (time - 24.hours)..(time + 24.hours), :home => home, :away => away, :league => league)[0]
      if match
        gamble = Gamble.find_by(:match => match, :mode => :standard)
        gamble.data[:home_odd] = home_odd
        gamble.data[:away_odd] = away_odd
        gamble.data[:draw_odd] = draw_odd
        gamble.save
        match.time = time
        match.save
      else
        match = Match.create(:time => time, :home => home, :away => away, :league => league)
        gamble = Gamble.create(:match => match, :mode => :standard, :data => {:home_odd => home_odd, :away_odd => away_odd, :draw_odd => draw_odd})
      end
    end
    Match.where(['updated_at < ?', DateTime.now - 2.minutes]).each do |m|
      m.update_attribute('cancelled', true)
    end
  end
end
