# frozen_string_literal: true

# The data can be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
default_team = Team.create(name: 'Best team')
not_default_team = Team.create(name: 'Not default team')

Player.create(name: 'Lionel Messi', role: 'forward', team: default_team)
Player.create(name: 'Manuel Neuer', role: 'goalkeeper', team: not_default_team)
Player.create(name: 'Sergio Ramos', role: 'defender', team: default_team)
Player.create(name: 'Luka Modric', role: 'midfielder', team: not_default_team)
