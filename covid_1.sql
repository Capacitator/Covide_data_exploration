{\rtf1\ansi\ansicpg1252\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue255;\red255\green255\blue254;\red25\green25\blue25;
\red0\green0\blue0;\red15\green112\blue1;\red19\green120\blue72;\red144\green1\blue18;\red101\green76\blue29;
}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c100000;\cssrgb\c100000\c100000\c99608;\cssrgb\c12941\c12941\c12941;
\cssrgb\c0\c0\c0;\cssrgb\c0\c50196\c0;\cssrgb\c3529\c53333\c35294;\cssrgb\c63922\c8235\c8235;\cssrgb\c47451\c36863\c14902;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl360\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 SELECT\cf4 \strokec4  \cf5 \strokec5 *\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   \cf2 \strokec2 FROM\cf4 \strokec4  CovidDeaths2\cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 -- Data used\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cf2 \strokec2 Location\cf4 \strokec4 , \cf2 \strokec2 date\cf4 \strokec4 , total_cases, new_cases, total_deaths, \cf2 \strokec2 population\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 FROM\cf4 \strokec4  CovidDeaths2\cb1 \
\cf2 \cb3 \strokec2 ORDER BY\cf4 \strokec4  \cf7 \strokec7 1\cf4 \strokec4 ,\cf7 \strokec7 2\cf4 \strokec4  \cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 -- Total cases vs total deaths\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 -- Likelihood of dying if you contract covid in ur country\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cf2 \strokec2 Location\cf4 \strokec4 , \cf2 \strokec2 date\cf4 \strokec4 , total_cases, total_deaths, \cf2 \strokec2 population\cf4 \strokec4 , (total_deaths\cf5 \strokec5 /\cf4 \strokec4 total_cases)\cf5 \strokec5 *\cf7 \strokec7 100\cf4 \strokec4  \cf2 \strokec2 AS\cf4 \strokec4  percent_chance\cb1 \
\cf2 \cb3 \strokec2 FROM\cf4 \strokec4  CovidDeaths2\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf4 \strokec4  \cf2 \strokec2 location\cf4 \strokec4  \cf2 \strokec2 like\cf4 \strokec4  \cf8 \strokec8 '%india%'\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 ORDER BY\cf4 \strokec4  \cf7 \strokec7 1\cf4 \strokec4 ,\cf7 \strokec7 2\cf4 \strokec4  \cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 -- Total cases vs total Population\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 -- Percentage of population that got covid\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cf2 \strokec2 Location\cf4 \strokec4 , \cf2 \strokec2 date\cf4 \strokec4 , total_cases, total_deaths, \cf2 \strokec2 population\cf4 \strokec4 , (total_cases\cf5 \strokec5 /\cf2 \strokec2 population\cf4 \strokec4 )\cf5 \strokec5 *\cf7 \strokec7 100\cf4 \strokec4  \cf2 \strokec2 AS\cf4 \strokec4  percent_population_infected\cb1 \
\cf2 \cb3 \strokec2 FROM\cf4 \strokec4  CovidDeaths2\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf4 \strokec4  \cf2 \strokec2 location\cf4 \strokec4  \cf2 \strokec2 like\cf4 \strokec4  \cf8 \strokec8 '%india%'\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 ORDER BY\cf4 \strokec4  \cf7 \strokec7 1\cf4 \strokec4 ,\cf7 \strokec7 2\cf4 \strokec4  \cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 -- Highest infection rate\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cf2 \strokec2 Location\cf4 \strokec4 , \cf2 \strokec2 population\cf4 \strokec4 , \cf9 \strokec9 MAX\cf4 \strokec4 (total_cases) \cf2 \strokec2 AS\cf4 \strokec4  highest_infection_count, \cf9 \strokec9 MAX\cf4 \strokec4 ((total_cases\cf5 \strokec5 /\cf2 \strokec2 population\cf4 \strokec4 )\cf5 \strokec5 *\cf7 \strokec7 100\cf4 \strokec4 ) \cf2 \strokec2 AS\cf4 \strokec4  percent_population_infected\cb1 \
\cf2 \cb3 \strokec2 FROM\cf4 \strokec4  CovidDeaths2\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 --WHERE location like '%india%'\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 GROUP BY\cf4 \strokec4  \cf2 \strokec2 location\cf4 \strokec4 , \cf2 \strokec2 population\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 ORDER BY\cf4 \strokec4  percent_population_infected \cf2 \strokec2 DESC\cf4 \cb1 \strokec4 \
\
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 -- Countries with highest death count per Population\cf4 \cb1 \strokec4 \
\
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cf2 \strokec2 Location\cf4 \strokec4 , \cf9 \strokec9 FORMAT\cf4 \strokec4 (\cf9 \strokec9 MAX\cf4 \strokec4 (total_deaths), \cf8 \strokec8 '##,##,###'\cf4 \strokec4 ) \cf2 \strokec2 AS\cf4 \strokec4  TotalDeathCount\cb1 \
\cf2 \cb3 \strokec2 FROM\cf4 \strokec4  CovidDeaths2\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf4 \strokec4  continent \cf2 \strokec2 IS NOT NULL\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 GROUP BY\cf4 \strokec4  \cf2 \strokec2 Location\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 ORDER BY\cf4 \strokec4  \cf9 \strokec9 MAX\cf4 \strokec4 (total_deaths) \cf2 \strokec2 DESC\cf4 \strokec4 ;\cb1 \
\
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 -- By continent\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cf2 \strokec2 location\cf4 \strokec4 , \cf9 \strokec9 MAX\cf4 \strokec4 (total_deaths) \cf2 \strokec2 AS\cf4 \strokec4  TotalDeathCount\cb1 \
\cf2 \cb3 \strokec2 FROM\cf4 \strokec4  CovidDeaths2\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf4 \strokec4  continent \cf2 \strokec2 IS\cf4 \strokec4  \cf2 \strokec2 NULL\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 GROUP BY\cf4 \strokec4  \cf2 \strokec2 location\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 ORDER BY\cf4 \strokec4  TotalDeathCount \cf2 \strokec2 DESC\cf4 \strokec4 ;\cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 -- Showing the continent with highest death count\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cf2 \strokec2 location\cf4 \strokec4 , \cf9 \strokec9 MAX\cf4 \strokec4 (total_deaths) \cf2 \strokec2 AS\cf4 \strokec4  TotalDeathCount\cb1 \
\cf2 \cb3 \strokec2 FROM\cf4 \strokec4  CovidDeaths2\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf4 \strokec4  continent \cf2 \strokec2 IS\cf4 \strokec4  \cf2 \strokec2 NULL\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 GROUP BY\cf4 \strokec4  \cf2 \strokec2 location\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 ORDER BY\cf4 \strokec4  TotalDeathCount \cf2 \strokec2 DESC\cf4 \strokec4 ;\cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 -- Global numbers\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cf2 \strokec2 date\cf4 \strokec4 , \cf9 \strokec9 SUM\cf4 \strokec4 (new_cases) \cf2 \strokec2 AS\cf4 \strokec4  Total_New_Cases, \cf9 \strokec9 SUM\cf4 \strokec4 (new_deaths) \cf2 \strokec2 AS\cf4 \strokec4  Total_New_Deaths, (\cf9 \strokec9 SUM\cf4 \strokec4 (new_deaths) \cf5 \strokec5 /\cf4 \strokec4  \cf9 \strokec9 CAST\cf4 \strokec4 (\cf9 \strokec9 SUM\cf4 \strokec4 (new_cases) \cf2 \strokec2 AS\cf4 \strokec4  \cf2 \strokec2 float\cf4 \strokec4 )) \cf5 \strokec5 *\cf4 \strokec4  \cf7 \strokec7 100\cf4 \strokec4  \cf2 \strokec2 AS\cf4 \strokec4  Death_percentage\cb1 \
\cf2 \cb3 \strokec2 FROM\cf4 \strokec4  CovidDeaths2\cb1 \
\cf2 \cb3 \strokec2 WHERE\cf4 \strokec4  continent \cf2 \strokec2 IS NOT NULL\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 GROUP BY\cf4 \strokec4  \cf2 \strokec2 date\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 ORDER BY\cf4 \strokec4  \cf7 \strokec7 1\cf4 \strokec4 ,\cf7 \strokec7 2\cf4 \strokec4  \cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 -- Exploring both tables\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cf2 \strokec2 TOP\cf4 \strokec4  \cf7 \strokec7 100\cf4 \strokec4  \cf5 \strokec5 *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 FROM\cf4 \strokec4  CovidVaccinations\cb1 \
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cf2 \strokec2 TOP\cf4 \strokec4  \cf7 \strokec7 100\cf4 \strokec4  \cf5 \strokec5 *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 FROM\cf4 \strokec4  CovidDeaths2\cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 -- Looking at total population Vs vacctination\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  CovidDeaths2.continent, CovidDeaths2.location, CovidDeaths2.date, CovidDeaths2.population, CovidVaccinations.new_vaccinations,\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf9 \cb3 \strokec9 SUM\cf4 \strokec4 (CovidVaccinations.new_vaccinations) \cf2 \strokec2 OVER\cf4 \strokec4  (\cf2 \strokec2 PARTITION\cf4 \strokec4  \cf2 \strokec2 BY\cf4 \strokec4  CovidDeaths2.location \cf2 \strokec2 ORDER BY\cf4 \strokec4  CovidDeaths2.location, CovidDeaths2.date ) \cf2 \strokec2 AS\cf4 \strokec4  RollingPeopleVaccinated\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3  \cf6 \strokec6 --MAX(RollingPeopleVaccinated/population)*100\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf4 \strokec4  CovidDeaths2\cb1 \
\cf2 \cb3 \strokec2 JOIN\cf4 \strokec4  CovidVaccinations\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3  \cf2 \strokec2 ON\cf4 \strokec4  CovidDeaths2.location \cf5 \strokec5 =\cf4 \strokec4  CovidVaccinations.location  \cb1 \
\cb3  \cf2 \strokec2 AND\cf4 \strokec4  CovidDeaths2.date \cf5 \strokec5 =\cf4 \strokec4  CovidVaccinations.date\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 WHERE\cf4 \strokec4  CovidDeaths2.continent \cf2 \strokec2 IS NOT NULL\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 ORDER BY\cf4 \strokec4  \cf7 \strokec7 2\cf4 \strokec4 ,\cf7 \strokec7 3\cf4 \cb1 \strokec4 \
\
\
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 --use cte\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 /*\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 WITH PopvsVac (Continent, Location, Date, Population, New_vaccinations, RollingPeopleVaccinated ) \cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 AS \cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 (\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 SELECT CovidDeaths2.continent, CovidDeaths2.location, CovidDeaths2.date, CovidDeaths2.population, CovidVaccinations.new_vaccinations,\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 SUM(CovidVaccinations.new_vaccinations) OVER (PARTITION BY CovidDeaths2.location ORDER BY CovidDeaths2.location, CovidDeaths2.date ) AS RollingPeopleVaccinated\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6  --MAX(RollingPeopleVaccinated/population)*100\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 FROM CovidDeaths2\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 JOIN CovidVaccinations\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6  ON CovidDeaths2.location = CovidVaccinations.location  \cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6  AND CovidDeaths2.date = CovidVaccinations.date\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 WHERE CovidDeaths2.continent IS NOT NULL\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 ORDER BY 2,3\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 )\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 SELECT * , (RollingPeopleVaccinated/Population)*100\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 FROM PopvsVac\cf4 \cb1 \strokec4 \
\cf6 \cb3 \strokec6 */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 WITH\cf4 \strokec4  PopvsVac (Continent, \cf2 \strokec2 Location\cf4 \strokec4 , \cf2 \strokec2 Date\cf4 \strokec4 , \cf2 \strokec2 Population\cf4 \strokec4 , New_vaccinations, RollingPeopleVaccinated) \cf2 \strokec2 AS\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3 (\cb1 \
\cb3     \cf2 \strokec2 SELECT\cf4 \strokec4  \cb1 \
\cb3         CovidDeaths2.continent, \cb1 \
\cb3         CovidDeaths2.location, \cb1 \
\cb3         CovidDeaths2.date, \cb1 \
\cb3         CovidDeaths2.population, \cb1 \
\cb3         CovidVaccinations.new_vaccinations,\cb1 \
\cb3         \cf9 \strokec9 SUM\cf4 \strokec4 (CovidVaccinations.new_vaccinations) \cf2 \strokec2 OVER\cf4 \strokec4  (\cf2 \strokec2 PARTITION\cf4 \strokec4  \cf2 \strokec2 BY\cf4 \strokec4  CovidDeaths2.location \cf2 \strokec2 ORDER BY\cf4 \strokec4  CovidDeaths2.date) \cf2 \strokec2 AS\cf4 \strokec4  RollingPeopleVaccinated\cb1 \
\cb3     \cf2 \strokec2 FROM\cf4 \strokec4  \cb1 \
\cb3         CovidDeaths2\cb1 \
\cb3     \cf2 \strokec2 JOIN\cf4 \strokec4  \cb1 \
\cb3         CovidVaccinations \cf2 \strokec2 ON\cf4 \strokec4  CovidDeaths2.location \cf5 \strokec5 =\cf4 \strokec4  CovidVaccinations.location  \cb1 \
\cb3                           \cf2 \strokec2 AND\cf4 \strokec4  CovidDeaths2.date \cf5 \strokec5 =\cf4 \strokec4  CovidVaccinations.date\cb1 \
\cb3     \cf2 \strokec2 WHERE\cf4 \strokec4  \cb1 \
\cb3         CovidDeaths2.continent \cf2 \strokec2 IS NOT NULL\cf4 \cb1 \strokec4 \
\cb3 )\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3     \cf5 \strokec5 *\cf4 \strokec4 , \cb1 \
\cb3     (\cf9 \strokec9 CAST\cf4 \strokec4 (RollingPeopleVaccinated \cf2 \strokec2 AS\cf4 \strokec4  \cf2 \strokec2 float\cf4 \strokec4 ) \cf5 \strokec5 /\cf4 \strokec4  \cf2 \strokec2 Population\cf4 \strokec4 ) \cf5 \strokec5 *\cf4 \strokec4  \cf7 \strokec7 100\cf4 \strokec4  \cf2 \strokec2 AS\cf4 \strokec4  VaccinationPercentage\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf4 \strokec4  \cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3     PopvsVac;\cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 -- TEMP Table\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 DROP\cf4 \strokec4  \cf2 \strokec2 TABLE\cf4 \strokec4  \cf2 \strokec2 IF\cf4 \strokec4  \cf2 \strokec2 EXISTS\cf4 \strokec4  #PercentPopulationVaccinated\cb1 \
\cf2 \cb3 \strokec2 CREATE\cf4 \strokec4  \cf2 \strokec2 TABLE\cf4 \strokec4  #PercentPopulationVaccinated\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3 (\cb1 \
\cb3     Continent \cf2 \strokec2 NVARCHAR\cf4 \strokec4 (\cf7 \strokec7 255\cf4 \strokec4 ),\cb1 \
\cb3     \cf2 \strokec2 Location\cf4 \strokec4  \cf2 \strokec2 NVARCHAR\cf4 \strokec4 (\cf7 \strokec7 255\cf4 \strokec4 ),\cb1 \
\cb3     \cf2 \strokec2 Date\cf4 \strokec4  \cf2 \strokec2 datetime\cf4 \strokec4 , \cb1 \
\cb3     \cf2 \strokec2 Population\cf4 \strokec4  \cf2 \strokec2 numeric\cf4 \strokec4 ,\cb1 \
\cb3     New_vaccinations \cf2 \strokec2 numeric\cf4 \strokec4 ,\cb1 \
\cb3     RollingPeopleVaccinated \cf2 \strokec2 numeric\cf4 \cb1 \strokec4 \
\cb3 )\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 INSERT INTO\cf4 \strokec4  #PercentPopulationVaccinated\cb1 \
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3         CovidDeaths2.continent, \cb1 \
\cb3         CovidDeaths2.location, \cb1 \
\cb3         CovidDeaths2.date, \cb1 \
\cb3         CovidDeaths2.population, \cb1 \
\cb3         CovidVaccinations.new_vaccinations,\cb1 \
\cb3         \cf9 \strokec9 SUM\cf4 \strokec4 (CovidVaccinations.new_vaccinations) \cf2 \strokec2 OVER\cf4 \strokec4  (\cf2 \strokec2 PARTITION\cf4 \strokec4  \cf2 \strokec2 BY\cf4 \strokec4  CovidDeaths2.location \cf2 \strokec2 ORDER BY\cf4 \strokec4  CovidDeaths2.date) \cf2 \strokec2 AS\cf4 \strokec4  RollingPeopleVaccinated\cb1 \
\cb3     \cf2 \strokec2 FROM\cf4 \strokec4  \cb1 \
\cb3         CovidDeaths2\cb1 \
\cb3     \cf2 \strokec2 JOIN\cf4 \strokec4  \cb1 \
\cb3         CovidVaccinations \cf2 \strokec2 ON\cf4 \strokec4  CovidDeaths2.location \cf5 \strokec5 =\cf4 \strokec4  CovidVaccinations.location  \cb1 \
\cb3                           \cf2 \strokec2 AND\cf4 \strokec4  CovidDeaths2.date \cf5 \strokec5 =\cf4 \strokec4  CovidVaccinations.date\cb1 \
\cb3     \cf2 \strokec2 WHERE\cf4 \strokec4  \cb1 \
\cb3         CovidDeaths2.continent \cf2 \strokec2 IS NOT NULL\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cf5 \strokec5 *\cf4 \strokec4 , (RollingPeopleVaccinated\cf5 \strokec5 /\cf2 \strokec2 Population\cf4 \strokec4 )\cf5 \strokec5 *\cf7 \strokec7 100\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 FROM\cf4 \strokec4  #PercentPopulationVaccinated\cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 -- Creating view to store data for later visualisations\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 CREATE\cf4 \strokec4  \cf2 \strokec2 View\cf4 \strokec4  \cf9 \strokec9 PercentPopulationVaccinated\cf4 \strokec4  \cf2 \strokec2 AS\cf4 \cb1 \strokec4 \
\
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3         CovidDeaths2.continent, \cb1 \
\cb3         CovidDeaths2.location, \cb1 \
\cb3         CovidDeaths2.date, \cb1 \
\cb3         CovidDeaths2.population, \cb1 \
\cb3         CovidVaccinations.new_vaccinations,\cb1 \
\cb3         \cf9 \strokec9 SUM\cf4 \strokec4 (CovidVaccinations.new_vaccinations) \cf2 \strokec2 OVER\cf4 \strokec4  (\cf2 \strokec2 PARTITION\cf4 \strokec4  \cf2 \strokec2 BY\cf4 \strokec4  CovidDeaths2.location \cf2 \strokec2 ORDER BY\cf4 \strokec4  CovidDeaths2.date) \cf2 \strokec2 AS\cf4 \strokec4  RollingPeopleVaccinated\cb1 \
\cb3     \cf2 \strokec2 FROM\cf4 \strokec4  \cb1 \
\cb3         CovidDeaths2\cb1 \
\cb3     \cf2 \strokec2 JOIN\cf4 \strokec4  \cb1 \
\cb3         CovidVaccinations \cf2 \strokec2 ON\cf4 \strokec4  CovidDeaths2.location \cf5 \strokec5 =\cf4 \strokec4  CovidVaccinations.location  \cb1 \
\cb3                           \cf2 \strokec2 AND\cf4 \strokec4  CovidDeaths2.date \cf5 \strokec5 =\cf4 \strokec4  CovidVaccinations.date\cb1 \
\cb3     \cf2 \strokec2 WHERE\cf4 \strokec4  \cb1 \
\cb3         CovidDeaths2.continent \cf2 \strokec2 IS NOT NULL\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf4 \strokec4  \cf5 \strokec5 *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 FROM\cf4 \strokec4  PercentPopulationVaccinated\cb1 \
\
\
\
}