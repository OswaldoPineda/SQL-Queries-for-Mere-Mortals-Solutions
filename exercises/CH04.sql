  /* =========== SALES ORDER DATABASE =========== */
  /* 1.- Show me all the information on our employees (8 rows) */
  select * from employees;

  /* 2.- Show me a list of cities, in alphabetical order, where our vendors
  are located, and incluted the names of the vendors we work with in each city (10 rows) */
  Select vendcity, vendname from Vendors Order by VendCity;

  /* ===========  ENTERTAINMENT AGENCY DATABASE =========== */
  /* 1.- Give me the names and phone numbers of all our agents
  and list them in last name/first name order (9 rows) */
  select concat(agtfirstname, ' ', agtlastname) as name, agtphonenumber from agents order by agtfirstname, agtlastname;

  /* 2.- Give me the information on all our engagements (111 rows) */
  select * from engagements;
    /* 3.- List all engagements and their associated start dates,
  sort the records by date in descending order and by engagement
  in ascending order (111 rows) */
  select engagementnumber, startdate as asociated_start_date from engagements order by startdate desc, engagementnumber;

  /* ===========  SCHOOL SCHEDULING DATABASE =========== */
  /* 1.- Show me a complete list of all the subjects we offer (56 rows) */
  select * from subjects;

  /* 2.- What kinds of titles are asociated with our faculty? (3 rows) */
  select title from faculty group by title;

  /* 3.- List the names and phone numbers of all our staff
  and sort them by lastname and firstname (27 rows) */
  select concat(stffirstname, ' ', stflastname), stfphonenumber from staff order by stffirstname, stflastname;

  /* ===========  BOWLING LEAGUE DATABASE =========== */
  /* 1.- List all of the teams in alphabetical order (10 rows) */
  select * from teams order by teamname;

  /* 2.- Show me all the bowling score information for each of our members (1,344 rows) */
  select * from bowler_scores;

  /* 3.- Show me a list of bowlers and their addresses and sort
  it in alphabetical order (32 rows) */
  select concat(bowlerfirstname, ' ', bowlerlastname), bowleraddress from bowlers order by bowleraddress;

  /* ===========  RECIPIES DATABASE =========== */
  /* 1.- Show me a list of all the ingredients we currently keep track of (79 rows) */
  select ingredientname from ingredients group by ingredientname;

  /* 2.- Show me all the main recipe information, and sort
  it by the name of the recipe in alphabetical order (15 rows) */
  select * from recipes order by recipetitle;
