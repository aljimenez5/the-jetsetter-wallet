- User accounts
- Gmail oauth 
- Gmail API
- Expedia API


Models:
- User (username, email, password_digest) (has_many trips, favorites, reviews, ratings || has_many countries, cities, through trips)
- Country (name) (has_many cities, lodging, transportation, activities)
- City (name, country_id) (belongs_to country || has_many trips, transportations, lodgings, activities)
- Trip (name, start date, end date, user_id) (has_many cities, lodgings, transportations, activities || belongs_to user || has_many countries through cities)
- Transportation (category, company, departure_date_time, arrival_date_time, departure city, arrival city)
- Lodging (category, name, address, website, dept_datetime, arriv_datetime, city_id)
- Activity (category, name, address, website, dept_datetime, arriv_datetime, city_id)


- Review/Rate (Be able to review your trip so others can see)
- Favorite Trips 
- Favorite ThingsToDo (Add to your trip or dream trip)
- Favorite Hotel Stays (Add to your trip or dream trip)
