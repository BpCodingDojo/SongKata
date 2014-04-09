require 'rspec'
require_relative '../lib/song_ranking'

def testcases
  [
      {
          context: "empty array",
          title: "should return empty array",
          songs: [],
          best: 0,
          expected: []
      },
      {
          context: "one sample",
          title: "should return the first element",
          songs: [{name: 'name', listened: 40}],
          best: 1,
          expected: ['name']
      },
      {
          context: "no song is requested",
          title: "should return empty array",
          songs: [{name: 'name', listened: 40}],
          best: 0,
          expected: []
      },
      {
          context: "two songs, first not listened",
          title: "should take the one that has been listened",
          songs: [{name: 'never listened', listened: 0}, {name: 'name', listened: 40}],
          best: 1,
          expected: ['name']
      },
      {
          context: "two songs, second listened less but better quality",
          title: "should take the one that has the better quality",
          songs: [{name: 'listened more', listened: 50}, {name: 'better quality', listened: 40}],
          best: 1,
          expected: ['better quality']
      },
      {
          context: "first sample",
          title: "should return the expected songs",
          songs: [{name: 'one', listened: 30}, {name: 'two', listened: 30}, {name: 'three', listened: 15}, {name: 'four', listened: 25}],
          best: 2,
          expected: ['four', 'two']
      },
      {
          context: "second sample",
          title: "should return the expected songs",
          songs: [
              {name: '3', listened: 15},
              {name: 're_hash', listened: 197812},
              {name: 'tomorrow_comes_today', listened: 189518},
              {name: 'new_genious', listened: 39453},
              {name: 'clint_eastwood', listened: 210492},
              {name: 'man_research', listened: 26302},
              {name: 'punk', listened: 22544},
              {name: 'sound_check', listened: 19727},
              {name: 'double_bass', listened: 17535},
              {name: 'rock_the_house', listened: 18782},
              {name: '19_2000', listened: 198189},
              {name: 'latin_simone', listened: 13151},
              {name: 'starshine', listened: 12139},
              {name: 'slow_country', listened: 11272},
              {name: 'm1_a1', listened: 10521},
          ],
          best: 3,
          expected: ['19_2000', 'clint_eastwood', 'tomorrow_comes_today']
      },

  ]
end

describe SongRanking do

  testcases.each do |testcase|
    context testcase[:context] do
      it testcase[:title] do
        expect(SongRanking.new(testcase[:songs]).take_best testcase[:best]).to eq(testcase[:expected])
      end
    end
  end
end