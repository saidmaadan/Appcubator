require 'spec_helper'

describe "Viewing the list of projects" do

  it "shows the projects" do
    visit 'http://example.com/projects'

    expect(page).to have_text("5 Projects")
  end

  xit "shows the projects" do
  project1 = Project.create(name: "Dating",
                        description: "Dating Social Network",
                        stage:
                        looking_for:
                        github_link:
                        web_url:
                        screenshot:



  movie2 = Movie.create(title: "Superman",
                        rating: "PG",
                        total_gross: 134218018.00,
                        description: "Clark Kent grows up to be the greatest super-hero",
                        released_on: "1978-12-15")

  movie3 = Movie.create(title: "Spider-Man",
                        rating: "PG-13",
                        total_gross: 403706375.00,
                        description: "Peter Parker gets bit by a genetically modified spider",
                        released_on: "2002-05-03")

  visit movies_url

  expect(page).to have_text("3 Movies")
  expect(page).to have_text(movie1.title)
  expect(page).to have_text(movie2.title)
  expect(page).to have_text(movie3.title)
end

end
