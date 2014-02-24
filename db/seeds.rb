# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


bill=User.create(name: "Bill", phone: "4150000000", email: "bob@gmail.com", password:"lolololo", password_confirmation:"lolololo", username:"bigbob")
bob=User.create(name: 'Bob', email: 'bob@aol.com', password: 'foobar123', password_confirmation: 'foobar123', phone: 1234567894, username: 'bobisno1')
b=User.create(name: 'David', email: 'davidc@gmail.com', password: 'seahawks1', password_confirmation: 'seahawks1', phone: 1045678912, username: 'futbolover')
c=User.create(name: 'Sarah', email: 'saraht@yahoo.com', password: 'seattle88', password_confirmation: 'seattle88', phone: 1456789123, username: 'saraht98')
d=User.create(name: 'Matt', email: 'mattsmith@gmail.com', password: 'warriorsftw', password_confirmation: 'warriorsftw', phone: 1567890123, username: 'mjfan98')
e=User.create(name: 'Lydia', email: 'lydiaw@hotmail.com', password: 'lakers04', password_confirmation: 'lakers04', phone: 167890123, username: 'lydie99')
f=User.create(name: 'Tyler', email: 'tylerdavis@yahoo.com', password: 'tupac4lyfe', password_confirmation: 'tupac4lyfe', phone: 1456789123, username: 'tyler05')

g1=Invite.create(time: '4:30', address: '123 Crescent Avenue', lat: 4.5, lng: 5.6)
g2=Invite.create(time: '5:30', address: '431 Bullard Avenue', lat: 6.5, lng: 7.6)
g3=Invite.create(time: '2:45', address: '452 Wall Street', lat: 2.5, lng: 4.6)
g4=Invite.create(time: '1:30', address: '5432 Pollasky Avenue', lat: 7.5, lng: 9.6)
g5=Invite.create(time: '4:00', address: '321 Fowler Avenue', lat: 6.5, lng: 5.6)

bob.users << User.where(name:"David")
bob.users << User.where(name:"Bill")
bob.users << User.where(name:"Matt")


c.users << b
c.users << d
c.users << bob
c.users << bill
c.users << f

f.users << c
d.users << c


bob.invites << g1
g1.users << bob
b.invites << g1
g1.users << b

c.invites << g2
g2.users << c





