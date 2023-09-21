User.destroy_all
User.create!([{
  username: "user1"
},
{
  username: "user2"
},
{
  username: "user3"
}])
p "Created #{User.count} Users"