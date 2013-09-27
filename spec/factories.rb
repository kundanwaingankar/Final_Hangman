Factory.define :user do |user|

  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

#Factory.sequence :name do |n|
#  "Person #{n}"
#end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end