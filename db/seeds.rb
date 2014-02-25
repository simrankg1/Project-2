# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u = User.create(name: 'Bob', email: 'bob@aol.com', password: 'foobar123', password_confirmation: 'foobar123', phone: 1234567894, username: 'bobisno1')
v = User.create(name: 'David', email: 'davidc@gmail.com', password: 'seahawks1', password_confirmation: 'seahawks1', phone: 1045678912, username: 'futbolover')
w = User.create(name: 'Sarah', email: 'saraht@yahoo.com', password: 'seattle88', password_confirmation: 'seattle88', phone: 1456789123, username: 'saraht98')

a = Invite.create(date: Date.today, time: Time.now, address: '123 Crescent Avenue', lat: 4.5, lng: 5.6, ownerid: u.id)
b = Invite.create(date: Date.today, time: Time.now, address: '431 Bullard Avenue', lat: 6.5, lng: 7.6, ownerid: u.id)
c = Invite.create(date: Date.today, time: Time.now, address: '452 Wall Street', lat: 2.5, lng: 4.6, ownerid: v.id)
d = Invite.create(date: Date.today, time: Time.now, address: '5432 Pollasky Avenue', lat: 7.5, lng: 9.6, ownerid: w.id)
e = Invite.create(date: Date.today, time: Time.now, address: '321 Fowler Avenue', lat: 6.5, lng: 5.6, ownerid: w.id)

f = Meet.create(date: Date.today, time: Time.now, address: '321 Fowler Avenue', lat: 6.5, lng: 5.6)
g = Meet.create(date: Date.today, time: Time.now, address: '431 Bullard Avenue', lat: 6.5, lng: 5.6)
h = Meet.create(date: Date.today, time: Time.now, address: '321 Fowler Avenue', lat: 6.5, lng: 5.6)
i = Meet.create(date: Date.today, time: Time.now, address: '5432 Pollasky Avenue', lat: 6.5, lng: 5.6)

u.users << v
u.users << w

v.users << u
v.users << w

w.users << u

u.invites << a
u.invites << b
u.invites << c
u.invites << d

a.users << u
b.users << u
c.users << u
d.users << u

v.invites << c
v.invites << d

c.users << v
d.users << v

w.invites << d
w.invites << e
w.invites << a

d.users << w
e.users << w
a.users << w



u.meets << f
u.meets << g
u.meets << h
u.meets << i

f.users << u
g.users << u
h.users << u
i.users << u

v.meets << h
v.meets << i

h.users << v
i.users << v

w.meets << i
w.meets << h
w.meets << f

i.users << w
h.users << w
f.users << w
f.users << w
