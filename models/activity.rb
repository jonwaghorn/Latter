class Activity
  include DataMapper::Resource

  property :id, Serial, :required => true
  property :message, String, :required => true
  property :created_at, DateTime, :default => lambda { |record, property| Time.now }

  def self.completed_challenge(challenge)
    result = challenge.winner?(challenge.from_player) ? "won!" : "lost!"
    message = "#{challenge.from_player.name} completed their challenge against #{challenge.to_player.name} and #{result} (#{challenge.score})"
    self.create(:message => message)
  end

  def self.new_challenge(challenge)
    message = "#{challenge.from_player.name} challenged #{challenge.to_player.name}."
    self.create(:message => message)
  end
end