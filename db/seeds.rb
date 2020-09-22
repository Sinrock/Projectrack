michael = User.create(email:"mruhaak@gmail.com", name: "Michael", password: "pw")
bob = User.create(email:"bob@gmail.com", name: "Bob", password: "1234")

Project.create(
    title: "Test Project 1",
    description: "Test description",
    difficulty: "8",
    duration: "Half Hour",
    tools: "laptop",
    parts: "none",
    location: "Back Room",
    completion: "tomorrow",
    cost: "500",
    user_id: michael.id
)

Project.create(
    title: "Test Project 1",
    description: "Test description",
    difficulty: "8",
    duration: "Half Hour",
    tools: "laptop",
    parts: "none",
    location: "Back Room",
    completion: "tomorrow",
    cost: "200",
    user_id: bob.id
)