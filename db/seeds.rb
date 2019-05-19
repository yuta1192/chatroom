user = User.new(:username => 'ahoge', :email => 'hogehoge@hoge.com', :password => 'hugahuga')
user.save!
Message.create!(
  user_id: user.id, content: "ohayou"
)
