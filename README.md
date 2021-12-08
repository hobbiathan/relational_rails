# README

## General Database Structuring


#### War Games

The War Games directory had a relatively simple setup.

The Parent table was known as 'Countries', which consisted of a Unique ID, an integer military power rank, and a boolean nuclear power,
as shown below:

[image of thing]

The Child table was known as 'WarRooms', of which consisted of a primary key `id`, a foreign key `country_id`, an integer `strategic_importance`,
a string `warroom_name`, and two booleans, `deadman_switch` and `contains_wmd`, respectively:

[image of child]

The Parent-Child relationship is as such:

[image of parent-child relationship schema]


#### Companies
