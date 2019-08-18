# coding: utf-8

#####
# main.rb
# This is a discord bot for my club members.
#
# execute:
#   ruby main.rb
#
# Copyright (c) 2019, K.Kanai
#####

require 'discordrb'
require 'net/http'
require 'uri'
require 'json'

module Bot
  BOT_TOKEN = ENV["TOKEN"].freeze
  BOT_CLIENT_ID = ENV["CLIENT_ID"].freeze

  # Create bot
  BOT = Discordrb::Commands::CommandBot.new(client_id: BOT_CLIENT_ID,
                                            token: BOT_TOKEN,
                                            prefix: "!")

  # Load modules
  def self.load_modules(klass, path)
    new_module = Module.new
    const_set(klass.to_sym, new_module)
    Dir["src/#{path}/*.rb"].each { |file| load file}
    new_module.constants.each do |mod|
      BOT.include! new_module.const_get(mod)
    end
  end

  load_modules(:DiscordCommands, 'commands')
  
  # Run bot
  BOT.run
end
