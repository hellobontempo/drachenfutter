# README


# Welcome to Drachenfutter.
The main purpose of this application is so users can search for recipes with what they already have on hand and network with those who have similar taste

## Getting Started
Run `bundle install` to get all of the necessary gems. Make sure you also have Webpacker installed you can do so by running: `rails webpacker:install`. It is also necessary to seed the database with recipes, this is done so through an API that generates a random recipe. For the initial database seed, an Admin user will be created so that all recipes created from the API will be created by the Admin user. Delete or comment this line out once you have initially seeded. Comment in the "Optional Faker Data" if you would like to start with some user content. When the seed file is to your liking, run `rake db:migrate` and `rake db:seed`. You may seed as much as you want to add recipes to the database, repeat recipes will not be added. Have fun!

## Attribution

Thanks to Rachael Ghorbani and Anson Nickel for guidance on building Recipe/Ingredient relationships through their code: [Link to CookBook Backend]( https://github.com/rachaelghorbani/cookbook-backend)


## Contributors 
If you have any interest in adding or collaborating feel free to reach out. I welcome any input!


## License
[CC BY-NC-SA 4.0]( https://creativecommons.org/licenses/by-nc-sa/4.0/
)

