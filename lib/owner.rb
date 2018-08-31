require 'pry'

class Owner

  attr_reader :species

  attr_accessor :name, :pets

  @@all = []

  def initialize(species, *name)
    @pets ={fishes: [], cats: [], dogs: []}
    @species = species
    @name = name
    @@all<<self
  end


  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all=[]
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes]<<fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats]<<cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs]<<dog
  end

  def walk_dogs
    @pets[:dogs].map do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].map do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].map do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.map do |key, value|
      value.map do |pet|
        pet.mood= "nervous"
      end
    end
    @pets.map do |key, value|
      @pets[key]= []
    end
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end


end
