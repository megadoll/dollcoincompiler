puts "Added a Node #{ThreadGroup::Default.list}"
node = ThreadGroup.new
added = Thread.new { sleep }

puts "added node is #{added}"

node.add(added)
puts "Initial group now #{ThreadGroup::Default.list}"
puts "node group now #{node.list}"