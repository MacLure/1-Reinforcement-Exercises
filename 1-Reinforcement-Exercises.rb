# Exercise 1
# Think of a documentary, a drama, a comedy, and a dramedy.
# Store the titles of these films in variables.
# Ask the user if they enjoy 1. documentaries 2. dramas 3. comedies.
#     If they answer yes to documentaries, display a message recommending the documentary to them.
#     If they answer no to documentaries but yes to dramas and comedies, recommend the dramedy.
#     If they answer yes to only dramas, recommend the drama.
#     If they say yes to only comedies, recommend the comedy.
#     If they answer no to all three, recommend a good book instead.


# def ask_about_genre(genre)
#     answer = ''
#     while answer != "yes" && answer != "no"
#         puts "Do you like #{genre}?"
#         answer = gets.chomp
#     end
#     if answer == "yes" 
#         user_likes_genre = true
#     elsif answer == "no"
#         user_likes_genre = false
#     end
#     return user_likes_genre
# end

# def give_recommendation

#     documentary = "Planet Earth"
#     drama = "Moonlight"
#     comedy = "Hot Fuzz"
#     dramedy = "some dramedy"
#     book = "Crime and Punishment"

#     verb = 'watch'
#     recommendation = ''

#     user_likes_documentaries = ask_about_genre("documentaries")
#     user_likes_dramas = ask_about_genre("dramas")
#     user_likes_comedies = ask_about_genre("comedies")

#     # If they answer yes to documentaries, display a message recommending the documentary to them.
#     if
#         user_likes_documentaries
#         recommendation = documentary
#     end
#     # If they answer no to documentaries but yes to dramas and comedies, recommend the dramedy.
#     if
#         user_likes_documentaries == false && user_likes_dramas && user_likes_comedies
#         recommendation = dramedy
#     end
#     # If they answer yes to only dramas, recommend the drama.
#     if
#         user_likes_documentaries == false && user_likes_dramas && user_likes_comedies == false
#         recommendation = drama
#     end
#     # If they say yes to only comedies, recommend the comedy.
#     if
#         user_likes_documentaries == false && user_likes_dramas == false && user_likes_comedies
#         recommendation = comedy
#     end
#     # If they answer no to all three, recommend a good book instead.
#     if
#         user_likes_documentaries == false && user_likes_dramas == false && user_likes_comedies == false
#         verb = 'read'
#         recommendation = book
#     end

#     return "You should #{verb} #{recommendation}."
# end

# puts give_recommendation

# Stretch Challenge

def ask_about_genre(genre)
    answer = 0
    while answer < 1 || answer > 5
        puts "On a scale of 1-5, how much do you like #{genre}?"
        puts "1 <-- dislike ... like --> 5"
        answer = gets.chomp.to_i
    end
    return answer
end

def give_recommendation

    movies_and_books = {
        documentary: {
            title: "Planet Earth",
            ranking: 0
        },
        drama: {
            title: "Moonlight",
            ranking: 0
        },
        comedy: {
            title: "Hot Fuzz",
            ranking: 0
        },
        dramedy: {
            title: "Rushmore",
            ranking: 0
        },
        book: {
            title: "Crime and Punishment",
            ranking: 0
        }
    }

    documentary_ranking = ask_about_genre("documentaries")
    drama_ranking = ask_about_genre("dramas")
    comedy_ranking = ask_about_genre("comedies")

    movies_and_books[:documentary][:ranking] = documentary_ranking
    movies_and_books[:drama][:ranking] = drama_ranking
    movies_and_books[:comedy][:ranking] = comedy_ranking

    verb = 'watch'
    recommendation = ''
    
    documentary_genre = movies_and_books[:documentary]
    drama_genre = movies_and_books[:drama]
    comedy_genre = movies_and_books[:comedy]
    dramedy_genre = movies_and_books[:dramedy]
    book_genre = movies_and_books[:book]

    # If they rate documentaries four or higher, recommend the documentary.
    if documentary_genre[:ranking] >= 4
        recommendation = documentary_genre[:title]
    # If they rate documentaries 3 or lower but both comedies and dramas 4 or higher, recommend the dramedy.
    elsif documentary_genre[:ranking] < 4 && drama_genre[:ranking] >= 4 && comedy_genre[:ranking] >= 4 
        recommendation = dramedy_genre[:title]
    # If they rate only dramas 4 or higher, recommend the drama.
    elsif documentary_genre[:ranking] < 4 && drama_genre[:ranking]  >= 4 && comedy_genre[:ranking] < 4
        recommendation = drama_genre[:title]
    # If they rate just comedies 4 or higher, recommend the comedy.
    elsif documentary_genre[:ranking] < 4 && drama_genre[:ranking] < 4 && comedy_genre[:ranking] >= 4 
        recommendation = comedy_genre[:title]


    # If they didn't rate any genre higher than 3 but they did rate one genre higher than the other two, recommend the film from that genre.
    elsif documentary_genre[:ranking] != drama_genre[:ranking] && drama_genre[:ranking] != comedy_genre[:ranking] && comedy_genre[:ranking] != documentary_genre[:ranking]
        recommendation = movies_and_books.sort_by{|genre, details| details[:ranking]}.last[1][:title]

    # Otherwise, recommend a good book.
    else
        documentary_genre[:ranking] < 4 && drama_genre[:ranking] < 4 && comedy_genre[:ranking] < 4
        verb = 'read'
        recommendation = book_genre[:title]
    end

    return "You should #{verb} #{recommendation}."
end

puts give_recommendation
