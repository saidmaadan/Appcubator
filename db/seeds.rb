# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create!([
    {
       name: "Web Game",
       description: "Search game for everything on the web",
       teams: "Wale Alex, Ted Scars",
       looking_for: "Partnership",
       target_amount: 800000
     },
     {
       name: "Restaurant Locator",
       description: "Restourant locator mobile application",
       teams: "Ben Okaf, Maltida Williamx",
       looking_for: "Buyer",
       target_amount: 9500000
     },
     {
       name: "Family Social",
       description: "Family private social network that connect",
       teams: "NiKKo Wee, Ted Ibrah, Alve Rhino",
       looking_for: "Partnership",
       target_amount: 5500000
     }

     ])

idea = Idea.first
idea.checkins.create(name: "Bobby S", email: "bobby@bobby.com", skills: "Backend", experience: 3, position: 'Part time', comment: "Tell me more about the project")

 strenghts = [" HTML ", "CSS ", " RUBY", " JAVASCRIPT", " JAVA", " C", " C++", " C#", " CLOJURE", " PYTHON", " PERL", " SCALA", " COFFEE-SCRIPT", " HASKELL", "  PHP", " ADA", " ATS", " RUBY on RAILS", " BACKBONE", " EMBER", " ANGULAR", " NODE", " JQUERY", " RIOT", " GIT VERSION CONTROL", " TDD", " CSS FRAMEWORK", " MYSQL", " POSTGRES", " SQLITE3" ]
 strenghts.each { |strenght| Ability.create!(strenght:strenght) }

