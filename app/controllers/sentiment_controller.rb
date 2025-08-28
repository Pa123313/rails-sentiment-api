class SentimentController < ApplicationController
  # POST /sentiment
  def analyze
    # Parse incoming JSON body
    text = params[:text].to_s.downcase

    # Very simple sentiment analyzer (demo purpose)
    positive_words = ["love", "awesome", "great", "good", "happy", "amazing"]
    negative_words = ["hate", "bad", "terrible", "awful", "sad", "angry"]

    score = 0

    positive_words.each do |word|
      score += 1 if text.include?(word)
    end

    negative_words.each do |word|
      score -= 1 if text.include?(word)
    end

    sentiment =
      if score > 0
        "positive"
      elsif score < 0
        "negative"
      else
        "neutral"
      end

    # Return JSON response
    render json: { sentiment: sentiment, score: score }
  end
end

