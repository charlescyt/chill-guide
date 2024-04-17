import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/models/paginated_response.dart';
import '../models/movie.dart';

part 'movies_provider.g.dart';

@riverpod
Future<List<Movie>> popularMovies(PopularMoviesRef ref) async {
  await Future<void>.delayed(const Duration(seconds: 3));
  final sampleJson = jsonDecode(sampleData) as Map<String, dynamic>;
  final paginatedResponse = PaginatedResponse.fromJson(sampleJson);

  return paginatedResponse.results.map(Movie.fromJson).toList();
}

const sampleData = '''
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg",
      "genre_ids": [
        878,
        12
      ],
      "id": 693134,
      "original_language": "en",
      "original_title": "Dune: Part Two",
      "overview": "Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.",
      "popularity": 3437.313,
      "poster_path": "/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg",
      "release_date": "2024-02-27",
      "title": "Dune: Part Two",
      "video": false,
      "vote_average": 8.3,
      "vote_count": 2899
    },
    {
      "adult": false,
      "backdrop_path": "/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg",
      "genre_ids": [
        16,
        28,
        10751,
        35,
        14
      ],
      "id": 1011985,
      "original_language": "en",
      "original_title": "Kung Fu Panda 4",
      "overview": "Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.",
      "popularity": 2340.977,
      "poster_path": "/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg",
      "release_date": "2024-03-02",
      "title": "Kung Fu Panda 4",
      "video": false,
      "vote_average": 7.137,
      "vote_count": 1056
    },
    {
      "adult": false,
      "backdrop_path": "/j3Z3XktmWB1VhsS8iXNcrR86PXi.jpg",
      "genre_ids": [
        28,
        878,
        12,
        14
      ],
      "id": 823464,
      "original_language": "en",
      "original_title": "Godzilla x Kong: The New Empire",
      "overview": "Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own.",
      "popularity": 1987.337,
      "poster_path": "/tMefBSflR6PGQLv7WvFPpKLZkyk.jpg",
      "release_date": "2024-03-27",
      "title": "Godzilla x Kong: The New Empire",
      "video": false,
      "vote_average": 6.708,
      "vote_count": 629
    },
    {
      "adult": false,
      "backdrop_path": "/7ZP8HtgOIDaBs12krXgUIygqEsy.jpg",
      "genre_ids": [
        878,
        28,
        14,
        12
      ],
      "id": 601796,
      "original_language": "ko",
      "original_title": "외계+인 1부",
      "overview": "Gurus in the late Goryeo dynasty try to obtain a fabled, holy sword, and humans in 2022 hunt down an alien prisoner that is locked in a human's body. The two parties cross paths when a time-traveling portal opens up.",
      "popularity": 1306,
      "poster_path": "/8QVDXDiOGHRcAD4oM6MXjE0osSj.jpg",
      "release_date": "2022-07-20",
      "title": "Alienoid",
      "video": false,
      "vote_average": 7.019,
      "vote_count": 267
    },
    {
      "adult": false,
      "backdrop_path": "/qekky2LbtT1wtbD5MDgQvjfZQ24.jpg",
      "genre_ids": [
        28,
        53
      ],
      "id": 984324,
      "original_language": "fr",
      "original_title": "Le salaire de la peur",
      "overview": "When an explosion at an oil well threatens hundreds of lives, a crack team is called upon to make a deadly desert crossing with nitroglycerine in tow.",
      "popularity": 907.496,
      "poster_path": "/jFK2ZLQUzo9pea0jfMCHDfvWsx7.jpg",
      "release_date": "2024-03-28",
      "title": "The Wages of Fear",
      "video": false,
      "vote_average": 5.821,
      "vote_count": 156
    },
    {
      "adult": false,
      "backdrop_path": "/atPlFdUrQl2U9MtUwujrrjnQHBA.jpg",
      "genre_ids": [
        28,
        80,
        18,
        53
      ],
      "id": 654739,
      "original_language": "ko",
      "original_title": "발신제한",
      "overview": "On his way to work, a bank manager receives an anonymous call claiming there's a bomb under his car seat, and if anyone exits the car, it will explode unless he can pay a ransom.",
      "popularity": 937.387,
      "poster_path": "/a9ySX1sTxxZfiy6gUJlEbuYrfET.jpg",
      "release_date": "2021-06-23",
      "title": "Hard Hit",
      "video": false,
      "vote_average": 7.637,
      "vote_count": 164
    },
    {
      "adult": false,
      "backdrop_path": "/oe7mWkvYhK4PLRNAVSvonzyUXNy.jpg",
      "genre_ids": [
        28,
        53
      ],
      "id": 359410,
      "original_language": "en",
      "original_title": "Road House",
      "overview": "Ex-UFC fighter Dalton takes a job as a bouncer at a Florida Keys roadhouse, only to discover that this paradise is not all it seems.",
      "popularity": 971,
      "poster_path": "/bXi6IQiQDHD00JFio5ZSZOeRSBh.jpg",
      "release_date": "2024-03-08",
      "title": "Road House",
      "video": false,
      "vote_average": 7.07,
      "vote_count": 1434
    },
    {
      "adult": false,
      "backdrop_path": "/9c0lHTXRqDBxeOToVzRu0GArSne.jpg",
      "genre_ids": [
        878,
        28
      ],
      "id": 935271,
      "original_language": "en",
      "original_title": "After the Pandemic",
      "overview": "Set in a post-apocalyptic world where a global airborne pandemic has wiped out 90% of the Earth's population and only the young and immune have endured as scavengers. For Ellie and Quinn, the daily challenges to stay alive are compounded when they become hunted by the merciless Stalkers.",
      "popularity": 739.155,
      "poster_path": "/p1LbrdJ53dGfEhRopG71akfzOVu.jpg",
      "release_date": "2022-03-01",
      "title": "After the Pandemic",
      "video": false,
      "vote_average": 4.933,
      "vote_count": 52
    },
    {
      "adult": false,
      "backdrop_path": "/pwGmXVKUgKN13psUjlhC9zBcq1o.jpg",
      "genre_ids": [
        28,
        14
      ],
      "id": 634492,
      "original_language": "en",
      "original_title": "Madame Web",
      "overview": "Forced to confront revelations about her past, paramedic Cassandra Webb forges a relationship with three young women destined for powerful futures...if they can all survive a deadly present.",
      "popularity": 830.964,
      "poster_path": "/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg",
      "release_date": "2024-02-14",
      "title": "Madame Web",
      "video": false,
      "vote_average": 5.7,
      "vote_count": 1079
    },
    {
      "adult": false,
      "backdrop_path": "/2C3CdVzINUm5Cm1lrbT2uiRstwX.jpg",
      "genre_ids": [
        28,
        14,
        10752
      ],
      "id": 856289,
      "original_language": "zh",
      "original_title": "封神第一部：朝歌风云",
      "overview": "Based on the most well-known classical fantasy novel of China, Fengshenyanyi, the trilogy is a magnificent eastern high fantasy epic that recreates the prolonged mythical wars between humans, immortals and monsters, which happened more than three thousand years ago.",
      "popularity": 628.972,
      "poster_path": "/ccJpK0rqzhQeP7Mrs2uKqObFY4L.jpg",
      "release_date": "2023-07-20",
      "title": "Creation of the Gods I: Kingdom of Storms",
      "video": false,
      "vote_average": 6.9,
      "vote_count": 198
    },
    {
      "adult": false,
      "backdrop_path": "/2KGxQFV9Wp1MshPBf8BuqWUgVAz.jpg",
      "genre_ids": [
        16,
        28,
        12,
        35,
        10751
      ],
      "id": 940551,
      "original_language": "en",
      "original_title": "Migration",
      "overview": "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.",
      "popularity": 690.808,
      "poster_path": "/ldfCF9RhR40mppkzmftxapaHeTo.jpg",
      "release_date": "2023-12-06",
      "title": "Migration",
      "video": false,
      "vote_average": 7.525,
      "vote_count": 1169
    },
    {
      "adult": false,
      "backdrop_path": "/wUp0bUXaveR40ikBhDgWwNTijuD.jpg",
      "genre_ids": [
        28,
        9648,
        53
      ],
      "id": 1181548,
      "original_language": "en",
      "original_title": "Heart of the Hunter",
      "overview": "A retired assassin is pulled back into action when his friend uncovers a dangerous conspiracy at the heart of the South African government.",
      "popularity": 638.328,
      "poster_path": "/n726fdyL1dGwt15bY7Nj3XOXc4Q.jpg",
      "release_date": "2024-03-28",
      "title": "Heart of the Hunter",
      "video": false,
      "vote_average": 5.892,
      "vote_count": 65
    },
    {
      "adult": false,
      "backdrop_path": "/b4xaqpUZFUkgyJ1VcFEPXmDML34.jpg",
      "genre_ids": [
        27,
        53
      ],
      "id": 845783,
      "original_language": "en",
      "original_title": "Baghead",
      "overview": "Following the death of her estranged father, Iris learns she has inherited a run-down, centuries-old pub. She travels to Berlin to identify her father’s body and meet with The Solicitor to discuss the estate. Little does she know, when the deed is signed she will become inextricably tied to an unspeakable entity that resides in the pub’s basement – Baghead – a shape-shifting creature that can transform into the dead.",
      "popularity": 544.715,
      "poster_path": "/lbOyeiiRYAE6Nm2e7xiNAAaRwZB.jpg",
      "release_date": "2023-12-28",
      "title": "Baghead",
      "video": false,
      "vote_average": 6.782,
      "vote_count": 103
    },
    {
      "adult": false,
      "backdrop_path": "/e3gVl1gnxEFKLTF6pn6KRqUPi9K.jpg",
      "genre_ids": [
        10749,
        18
      ],
      "id": 1127166,
      "original_language": "it",
      "original_title": "Fabbricante di lacrime",
      "overview": "Adopted together after a tough childhood in an orphanage, Nica and Rigel realize that unexpected but irresistible feelings pull them together.",
      "popularity": 650.996,
      "poster_path": "/uoBHsxSgfc3PQsSn98RfnbePHOy.jpg",
      "release_date": "2024-04-03",
      "title": "The Tearsmith",
      "video": false,
      "vote_average": 6.71,
      "vote_count": 341
    },
    {
      "adult": false,
      "backdrop_path": "/2c2Osibm2Q1eEJCW8jc98GQhGdc.jpg",
      "genre_ids": [
        12,
        28
      ],
      "id": 893334,
      "original_language": "en",
      "original_title": "The Adventures of Maid Marian",
      "overview": "Everyone knows the stories of Robin Hood and Maid Marian, but this the story of what happens next. Out of the shadows, a legend returns to save her people from the tyranny of the disgraced Sheriff of Nottingham. Robin Hood remains at war and Marian must put her own combat skills to the test, creating a new tale that will be heralded throughout the ages.",
      "popularity": 514.457,
      "poster_path": "/oPXzCV01ysDmnmpJOkiVqaZQ5QR.jpg",
      "release_date": "2022-05-09",
      "title": "The Adventures of Maid Marian",
      "video": false,
      "vote_average": 5.2,
      "vote_count": 15
    },
    {
      "adult": false,
      "backdrop_path": "/TGsfNWkASegCfAn6ED1b08a9O6.jpg",
      "genre_ids": [
        27,
        9648,
        53
      ],
      "id": 1125311,
      "original_language": "en",
      "original_title": "Imaginary",
      "overview": "When Jessica moves back into her childhood home with her family, her youngest stepdaughter Alice develops an eerie attachment to a stuffed bear named Chauncey she finds in the basement. Alice starts playing games with Chauncey that begin playful and become increasingly sinister. As Alice’s behavior becomes more and more concerning, Jessica intervenes only to realize Chauncey is much more than the stuffed toy bear she believed him to be.",
      "popularity": 466.091,
      "poster_path": "/9u6HEtZJdZDjPGGJq6YEuhPnoan.jpg",
      "release_date": "2024-03-06",
      "title": "Imaginary",
      "video": false,
      "vote_average": 6.3,
      "vote_count": 210
    },
    {
      "adult": false,
      "backdrop_path": "/lzWHmYdfeFiMIY4JaMmtR7GEli3.jpg",
      "genre_ids": [
        878,
        12
      ],
      "id": 438631,
      "original_language": "en",
      "original_title": "Dune",
      "overview": "Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet's exclusive supply of the most precious resource in existence-a commodity capable of unlocking humanity's greatest potential-only those who can conquer their fear will survive.",
      "popularity": 622.436,
      "poster_path": "/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
      "release_date": "2021-09-15",
      "title": "Dune",
      "video": false,
      "vote_average": 7.789,
      "vote_count": 11256
    },
    {
      "adult": false,
      "backdrop_path": "/xThuEoirx0vXismkVbnMQqkMkHK.jpg",
      "genre_ids": [
        28,
        53
      ],
      "id": 849509,
      "original_language": "en",
      "original_title": "Jade",
      "overview": "Jade presents the story of a woman who comes between a powerful businessman and a gang leader in their search for a hard drive that could damage the operations of Interpol. Despite grieving for the brother she accidentally killed, the woman is required to use her unique set of skills to retrieve the drive and protect her brother's unborn child being carried by another woman.",
      "popularity": 606.691,
      "poster_path": "/pqotEkHRbhUPUuX9Gq4U6aJzK55.jpg",
      "release_date": "2024-02-16",
      "title": "Jade",
      "video": false,
      "vote_average": 6.111,
      "vote_count": 9
    },
    {
      "adult": false,
      "backdrop_path": "/4woSOUD0equAYzvwhWBHIJDCM88.jpg",
      "genre_ids": [
        28,
        27,
        53
      ],
      "id": 1096197,
      "original_language": "en",
      "original_title": "No Way Up",
      "overview": "Characters from different backgrounds are thrown together when the plane they're travelling on crashes into the Pacific Ocean. A nightmare fight for survival ensues with the air supply running out and dangers creeping in from all sides.",
      "popularity": 463.635,
      "poster_path": "/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg",
      "release_date": "2024-01-18",
      "title": "No Way Up",
      "video": false,
      "vote_average": 6.356,
      "vote_count": 376
    },
    {
      "adult": false,
      "backdrop_path": "/uv2twFGMk2qBdyJBJAVcrpRtSa9.jpg",
      "genre_ids": [
        28,
        10752,
        878
      ],
      "id": 929590,
      "original_language": "en",
      "original_title": "Civil War",
      "overview": "In the near future, a group of war journalists attempt to survive while reporting the truth as the United States stands on the brink of civil war.",
      "popularity": 501.142,
      "poster_path": "/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg",
      "release_date": "2024-04-10",
      "title": "Civil War",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 81
    }
  ],
  "total_pages": 43588,
  "total_results": 871751
}''';
