json.id      @message.id
json.content @message.content 
json.date    @message.created_at.strftime("%Y/%m/%d %H:%M:%S")
json.user_name @message.user.name
json.user_id @message.user_id
if @message.user.avatar.present?
  json.image url_for(@message.user.avatar)
end