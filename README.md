# README


## War Games

The War Games directory had a relatively simple setup.

The Parent table was known as 'Countries', which consisted of a unqiue `id`, integer `military_power_rank`, and a boolean `nuclear_power`,
as shown below:

![Screen Shot 2021-12-08 at 2 30 30 PM](https://user-images.githubusercontent.com/77761679/145288020-ef3d1199-0400-4e75-952e-2239a3cd5de4.png)


The Child table was known as 'WarRooms', of which consisted of a primary key `id`, a foreign key `country_id`, an integer `strategic_importance`,
a string `warroom_name`, and two booleans, `deadman_switch` and `contains_wmd`, respectively:

![Screen Shot 2021-12-08 at 2 30 33 PM](https://user-images.githubusercontent.com/77761679/145288032-7195638d-cfba-4574-9d30-a3af81d739e7.png)

The Parent-Child relationship is as such:

![Screen Shot 2021-12-08 at 2 29 24 PM](https://user-images.githubusercontent.com/77761679/145288058-db98d61c-961b-4efb-8692-c7304b0b22fa.png)

## Companies

The Companies directory had a relatively simple setup.

The Parent table was known as 'Companies', which consisted of a unique `id`, string `name`, boolean `independent`, and integer `games invented`, alongside general date timestamps

<img width="306" alt="Screen Shot 2021-12-08 at 2 38 16 PM" src="https://user-images.githubusercontent.com/77761679/145288492-a9ce16fd-4208-4384-a450-4e18ce371a55.png">


The Child table was known as 'BoardGame', of which consisted of a primary key `id`, a foreign key `BoardGameCompany_ID`, an integer `Rank`,
a string `name`, a boolean `out_of_print` its respective dates:

<img width="356" alt="Screen Shot 2021-12-08 at 2 39 22 PM" src="https://user-images.githubusercontent.com/77761679/145288604-e47c3a82-62dd-4637-8577-ff010851dd0d.png">

The Parent-Child relationship is as such:

<img width="851" alt="Screen Shot 2021-12-08 at 2 39 37 PM" src="https://user-images.githubusercontent.com/77761679/145288645-02951d9f-2f18-4be7-8fc8-9e2004c2ccd7.png">

