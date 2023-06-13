
require 'discordrb'

# Here we instantiate a `CommandBot` instead of a regular `Bot`, which has the functionality to add commands using the
# `command` method. We have to set a `prefix` here, which will be the character that triggers command execution.
bot = Discordrb::Commands::CommandBot.new token: 'MTExNTc5ODg4ODMzOTczODY2NA.GvXrGE.CtjYriGOhVeOYhiCrnbeiSqApe0FX3bdSBOfkw', prefix: '/'

bot.command :user do |event|
  # Commands send whatever is returned from the block to the channel. This allows for compact commands like this,
  # but you have to be aware of this so you don't accidentally return something you didn't intend to.
  # To prevent the return value to be sent to the channel, you can just return `nil`.
  event.user.name
end

bot.command(:invite, chain_usable: true) do |event|
  # This simply sends the bot's invite URL, without any specific permissions,
  # to the channel.
  event.bot.invite_url
end

bot.command :burgers do |_event|
  "Alec makes the best burgers."
end

bot.run