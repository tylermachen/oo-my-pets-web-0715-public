require 'pry'
class Owner
  attr_accessor :pets, :name
  attr_reader :species

  @@owners = []

  def initialize(name)
    @species = 'human'
    @name = name
    @pets = { :fishes => [], :dogs => [], :cats => [] }
    @@owners << self
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets[:dogs].each { |dog| dog.mood = 'happy' }
  end

  def play_with_cats
    @pets[:cats].each { |cat| cat.mood = 'happy' }
  end

  def feed_fish
    @pets[:fishes].each { |fish| fish.mood = 'happy' }
  end

  def sell_pets
    @pets.each { |types, animals| animals.each { |a| a.mood = 'nervous' }}
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, " +
    "#{@pets[:dogs].count} dog(s), " +
    "and #{@pets[:cats].count} cat(s)."
  end

  def self.reset_all
    @@owners = []
  end

  def self.count
    @@owners.count
  end

  def self.all
    @@owners
  end
end
