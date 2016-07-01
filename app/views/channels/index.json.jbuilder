json.array! @channels do |channel|
  json.id channel.id
  json.name channel.name
  json.description channel.description
  json.img150 image_path(channel.image.url(:thumb))
  json.img256 image_path(channel.image.url(:medium))
end