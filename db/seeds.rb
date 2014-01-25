# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
league = League.create(:name => '英超')
Team.create(:name => '曼联', :league => league)
Team.create(:name => '斯旺西', :league => league)
Team.create(:name => '胡尔城', :league => league)
Team.create(:name => '纽卡斯尔', :league => league)
Team.create(:name => '斯托克城', :league => league)
Team.create(:name => '卡迪夫城', :league => league)
Team.create(:name => '诺维奇城', :league => league)
Team.create(:name => '南安普顿', :league => league)
Team.create(:name => '阿森纳', :league => league)
Team.create(:name => '富勒姆', :league => league)
Team.create(:name => '水晶宫', :league => league)
Team.create(:name => '利物浦', :league => league)
Team.create(:name => '埃弗顿', :league => league)
Team.create(:name => '阿斯顿维拉', :league => league)
Team.create(:name => '西布朗', :league => league)
Team.create(:name => '切尔西', :league => league)
Team.create(:name => '西汉姆', :league => league)
Team.create(:name => '桑德兰', :league => league)
Team.create(:name => '托特纳姆热刺', :league => league)
Team.create(:name => '曼城', :league => league)