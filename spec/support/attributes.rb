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
