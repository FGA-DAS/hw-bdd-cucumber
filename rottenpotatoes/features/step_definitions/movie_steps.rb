# Add a declarative step here for populating the DB with movies.

value = 0
Given /the following movies exist/ do |movies_table|

  value = movies_table.hashes.length
  value += 1

  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end
# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  ratings = rating_list.split(', ')

  if uncheck == "un"
    step_string = 'I uncheck "ratings_'
  else
    step_string = 'I check "ratings_'
  end

  ratings.each {|rating| step (step_string+"#{rating}\"")}
    

end

Then /I should see all the movies/ do
    page.all('table#movies tr').count.should == value 
end
