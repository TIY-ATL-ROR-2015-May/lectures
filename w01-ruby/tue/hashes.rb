example_hash = {
  brit: "likes dogs",
  tim: "likes whiskey",
  jd: "likes dark souls",
  jo: "likes ping pong"
}

hsh = {'brit' => 'likes dogs',
       'tim' => 'likes whiskey'}

ages = {
  brit: 28,
  juan: 24,
  philip: 30
}

ages[:brit]
ages[:juan] = 25

phones = [["brit", "404-bla-dont-even-try"],
          ["sam", "770-num-fake"],
          ["cookies", "del-ici-ous"]]

phones.each do |phone|
  if phone.first == 'cookies'
    phone[1].call
  end
end

# if it were a hash
phones['cookies'].call
