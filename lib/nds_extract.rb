# Provided, don't edit
require 'directors_database'
require 'pp'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0
  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end
  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end

def movies_with_director_key(name, movies_collection)
  movie_array = []
  index=0
  while index < movies_collection.length do
    movie_array.push(movie_with_director_name(name, movies_collection[index]))
    index+=1
  end
  movie_array
end

def movies_with_directors_set(source)
  directors_name_array = []
  index = 0
  while index < source.length do
    directors_name_array.push(movies_with_director_key(source[index][:name], source[index][:movies]))
    index+=1
  end
  directors_name_array
end


  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash

def gross_per_studio(collection)
  studio_gross = {}
  total_gross = {}
  index = 0
  while index < collection.length do
    
    if !total_gross[:studio]
      total_gross
    collection[index][:worldwide_gross]
    studio_gross[collection[index][:studio]] = collection[index][total_gross]
  
end




# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
