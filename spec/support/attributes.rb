def project_attributes(overrides = {})
  {
     name: "Web Search",
     description: "PSearch engine for everything on the web",
     teams: "Wale Alex, Ted Scars",
     looking_for: "Partnership",
     target_amount: 700000
  }.merge(overrides)
end

def review_attributes(overrides = {})
  {
    name: "Said M",
    stars: 3,
    remark: "One of the best web app of 2014"
  }.merge(overrides)
end

def idea_attributes(overrides = {})
  {
    title: "Social Network",
    description: 'rivate social network for family',
    goal: "Looking for developer to work on this project",
    category: "Mobile App",
    market: "Global"
  }.merge(overrides)
end

def checkin_attributes(overrides = {})
  {
    name: "Said M",
    email: "said@said.com",
    skills: "Ruby on Rails",
    experience: 3,
    position: "Full Time",
    comment: "Like to know more about this project"
  }.merge(overrides)
end



