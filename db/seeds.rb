# Clear existing records
Activity.destroy_all
Comment.destroy_all
Project.destroy_all
User.destroy_all

# Create Admin
admin = User.create!(name: "Admin User", email: "admin@example.com", password: "password", role: "admin")

# Create Managers
managers = [
  User.create!(name: "Manager 1", email: "manager1@example.com", password: "password", role: "manager"),
  User.create!(name: "Manager 2", email: "manager2@example.com", password: "password", role: "manager")
]

# Create Developers
developers = [
  User.create!(name: "Developer 1", email: "dev1@example.com", password: "password", role: "developer"),
  User.create!(name: "Developer 2", email: "dev2@example.com", password: "password", role: "developer"),
  User.create!(name: "Developer 3", email: "dev3@example.com", password: "password", role: "developer")
]

# Create Projects and Assign Managers & Developers
projects = [
  Project.create!(name: "Project Alpha", status: "Pending", manager: managers[0], developer: developers[0]),
  Project.create!(name: "Project Beta", status: "In Progress", manager: managers[1], developer: developers[1]),
  Project.create!(name: "Project Gamma", status: "Completed", manager: managers[0], developer: developers[2])
]

# Add status change activities
projects.each do |project|
  Activity.create!(
    project: project,
    user: project.manager,
    activity_type: "status_change",
    message: "Project created with status '#{project.status}'"
  )
end

# Create Comments and Associated Activities
comments_data = [
  { user: managers[0], project: projects[0], content: "This project is in the initial phase." },
  { user: developers[0], project: projects[0], content: "We need to add more features." },
  { user: managers[1], project: projects[1], content: "Testing phase started!" },
  { user: developers[1], project: projects[1], content: "Bug fixing in progress." },
  { user: developers[2], project: projects[2], content: "Project completed successfully!" }
]

comments_data.each do |data|
  comment = Comment.create!(
    content: data[:content],
    user: data[:user],
    project: data[:project]
  )

  Activity.create!(
    project: data[:project],
    user: data[:user],
    activity_type: "comment",
    message: comment.content
  )
end

puts "✅ Seeded #{User.count} users, #{Project.count} projects, #{Comment.count} comments, and #{Activity.count} activities!"
