#seed data
tesa = User.create(username: "tesa", email: "tesa@test.com", password: "test")
Exercise.create(name: "barbell deadlift", duration: 20, detail: "weight training")
Exercise.create(name: "treadmill running", duration: 15, detail: "cardio")