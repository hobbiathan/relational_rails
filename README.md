# README

## General Database Structuring


#### War Games

The War Games directory had a relatively simple setup.

The Parent table was known as 'Countries', which consisted of a Unique ID, an integer military power rank, and a boolean nuclear power,
as shown below:

![Screen Shot 2021-12-08 at 2 30 30 PM](https://user-images.githubusercontent.com/77761679/145288020-ef3d1199-0400-4e75-952e-2239a3cd5de4.png)


The Child table was known as 'WarRooms', of which consisted of a primary key `id`, a foreign key `country_id`, an integer `strategic_importance`,
a string `warroom_name`, and two booleans, `deadman_switch` and `contains_wmd`, respectively:

![Screen Shot 2021-12-08 at 2 30 33 PM](https://user-images.githubusercontent.com/77761679/145288032-7195638d-cfba-4574-9d30-a3af81d739e7.png)

The Parent-Child relationship is as such:

![Screen Shot 2021-12-08 at 2 29 24 PM](https://user-images.githubusercontent.com/77761679/145288058-db98d61c-961b-4efb-8692-c7304b0b22fa.png)

#### Companies
