require 'net/http'

class SentimentAnalysis
  attr_reader :postData

  def initialize(text)
    @postData = Net::HTTP.post_form(URI.parse('http://text-processing.com/api/sentiment/'), {'text'=>"#{text}"})
  end

  def results
    JSON.parse(postData.body)
  end

  def label
    results['label']
  end
end
