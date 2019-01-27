namespace :project do
  task test: :environment do
    project_client = Tantoapp::Project::V1::Client.new("http://127.0.0.1:3000")
    test_case_client = Tantoapp::Test::Case::V1::Client.new("http://127.0.0.1:3000")
    test_client = Tantoapp::Test::V1::Client.new("http://127.0.0.1:3000")
    test_line_client = Tantoapp::Test::Line::V1::Client.new("http://127.0.0.1:3000")


    puts "Create a Projects"
    project = project_client.projects.post(name: "Travel Engine", description: "Testing Travel Engine")
    puts [project.to_json]
    puts "Updating a Project"
    project = project_client.projects.put_by_id(project.id, name: "Name should not be updated", description: "Updated Testing Travel Engine")
    puts [project.to_json]

    puts "Creating Test Cases"
    tc1 = test_case_client.test_cases.post(project_id: project.id, description: "Flight Test when API down")
    tc2 = test_case_client.test_cases.post(project_id: project.id, description: "Flight Test when API up")
    puts test_case_client.test_cases.get(project_id: project.id).map(&:to_json)

    puts "Creating Tests"
    t1 = test_client.tests.post(test_case_id: tc1.id, description: "Flight Test 1")
    t2 = test_client.tests.post(test_case_id: tc1.id, description: "Flight Test 2")
    t3 = test_client.tests.post(test_case_id: tc2.id, description: "Flight Test 3")
    t4 = test_client.tests.post(test_case_id: tc2.id, description: "Flight Test 4")

    puts "Tests for test Case 1"
    puts test_client.tests.get(test_case_id: tc1.id).map(&:to_json)
    puts "Tests for test Case 2"
    puts test_client.tests.get(test_case_id: tc1.id).map(&:to_json)

    puts "Creating Tests"
    tl1 = test_line_client.test_lines.post(test_id: t1.id, description: "Flight Test Line 1")
    tl2 = test_line_client.test_lines.post(test_id: t1.id, description: "Flight Test Line 2")
    tl3 = test_line_client.test_lines.post(test_id: t2.id, description: "Flight Test Line 3")
    tl4 = test_line_client.test_lines.post(test_id: t2.id, description: "Flight Test Line 4")
    tl5 = test_line_client.test_lines.post(test_id: t3.id, description: "Flight Test Line 5")
    tl6 = test_line_client.test_lines.post(test_id: t3.id, description: "Flight Test Line 6")
    tl7 = test_line_client.test_lines.post(test_id: t4.id, description: "Flight Test Line 7")
    tl8 = test_line_client.test_lines.post(test_id: t4.id, description: "Flight Test Line 8")

    puts "Tests Lines for test Case 1 test 1"
    puts test_line_client.test_lines.get(test_id: t1.id).map(&:to_json)
    puts "Tests Lines for test Case 1 test 2"
    puts test_line_client.test_lines.get(test_id: t2.id).map(&:to_json)
    puts "Tests Lines for test Case 2 test 3"
    puts test_line_client.test_lines.get(test_id: t3.id).map(&:to_json)
    puts "Tests Lines for test Case 2 test 4"
    puts test_line_client.test_lines.get(test_id: t4.id).map(&:to_json)


    puts "Testing Dependency Removal. Removing the project should remove every dependent models"
    puts project_client.projects.delete_by_id(project.id).inspect
    puts "Check Test Cases"
    puts test_case_client.test_cases.get(project_id: project.id).inspect
    puts "Check Tests"
    puts test_client.tests.get(test_case_id: tc1.id).inspect
    puts test_client.tests.get(test_case_id: tc2.id).inspect
    puts "Check Test Lines"
    puts test_line_client.test_lines.get(test_id: t1.id).inspect
    puts test_line_client.test_lines.get(test_id: t2.id).inspect
    puts test_line_client.test_lines.get(test_id: t3.id).inspect
    puts test_line_client.test_lines.get(test_id: t4.id).inspect
    puts "Server Check Complete"
  end
end
