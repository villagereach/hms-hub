collection @message_streams
attributes :name, :title
child :messages => :messages do
  attributes :name, :title, :offset_days, :sms_text
end
