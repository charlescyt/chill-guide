import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/utils/formatting.dart';
import '../../../app/widgets/app_card.dart';
import '../../../app/widgets/buttons.dart';
import '../../../app/widgets/carousel.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../../../app/widgets/section.dart';
import '../models/person_details.dart';
import '../providers/person_providers.dart';

class PersonDetailsPage extends ConsumerWidget {
  const PersonDetailsPage({
    super.key,
    required this.personId,
  });

  final int personId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPersonDetails = ref.watch(personDetailsProvider(personId: personId));

    return SizedBox.expand(
      child: Material(
        child: switch (asyncPersonDetails) {
          AsyncData(value: final personDetails) => _Data(personDetails),
          AsyncError(:final error, :final stackTrace) => _Error(error, stackTrace),
          _ => const _Loading(),
        },
      ),
    );
  }
}

class _Data extends StatelessWidget {
  const _Data(this.personDetails);

  final PersonDetails personDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyAppBar(
          title: Text(personDetails.name),
        ),
        if (personDetails.profilePath case final profilePath?) //
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(profilePath.url()),
          ),
        const Divider(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (personDetails.biography case final biography?) ...[
                  Section(
                    title: const Text('Biography'),
                    content: Text(biography),
                  ),
                ],
                if (personDetails.placeOfBirth case final placeOfBirth?) ...[
                  const Divider(),
                  Section(
                    title: const Text('Place of birth'),
                    content: Text(placeOfBirth),
                  ),
                ],
                if (personDetails.birthday case final birthday?) ...[
                  const Divider(),
                  Section(
                    title: const Text('Birthday'),
                    content: Text(formatDate(birthday)),
                  ),
                ],
                if (personDetails.deathday case final deathday?) ...[
                  const Divider(),
                  Section(
                    title: const Text('Deathday'),
                    content: Text(formatDate(deathday)),
                  ),
                ],
                if (personDetails.movieCastCredits case final movieCastCredits when movieCastCredits.isNotEmpty) ...[
                  const Divider(),
                  SectionTitle(
                    title: const Text('Movie Casts'),
                    trailing: movieCastCredits.length > 10
                        ? SeeAllButton(
                            onPressed: () {},
                          )
                        : null,
                  ),
                  Carousel(
                    itemCount: movieCastCredits.take(10).length,
                    height: 240,
                    aspectRatio: 9 / 16,
                    enableInfiniteScroll: false,
                    itemBuilder: (context, index) {
                      final movieCastCredit = movieCastCredits[index];
                      return CarouselCard.fromPersonMovieCastCredit(
                        movieCastCredit,
                        () {},
                      );
                    },
                  ),
                ],
                if (personDetails.movieCrewCredits case final movieCrewCredits when movieCrewCredits.isNotEmpty) ...[
                  const Divider(),
                  SectionTitle(
                    title: const Text('Movie Crews'),
                    trailing: movieCrewCredits.length > 10
                        ? SeeAllButton(
                            onPressed: () {},
                          )
                        : null,
                  ),
                  Carousel(
                    itemCount: movieCrewCredits.take(10).length,
                    height: 240,
                    aspectRatio: 9 / 16,
                    enableInfiniteScroll: false,
                    itemBuilder: (context, index) {
                      final movieCrewCredit = movieCrewCredits[index];
                      return CarouselCard.fromPersonMovieCrewCredit(
                        movieCrewCredit,
                        () {},
                      );
                    },
                  ),
                ],
                if (personDetails.tvShowCastCredits case final tvShowCastCredits when tvShowCastCredits.isNotEmpty) ...[
                  const Divider(),
                  SectionTitle(
                    title: const Text('TV Show Casts'),
                    trailing: tvShowCastCredits.length > 10
                        ? SeeAllButton(
                            onPressed: () {},
                          )
                        : null,
                  ),
                  Carousel(
                    itemCount: tvShowCastCredits.take(10).length,
                    height: 240,
                    aspectRatio: 9 / 16,
                    enableInfiniteScroll: false,
                    itemBuilder: (context, index) {
                      final tvShowCastCredit = tvShowCastCredits[index];
                      return CarouselCard.fromPersonTvShowCastCredit(
                        tvShowCastCredit,
                        () {},
                      );
                    },
                  ),
                ],
                if (personDetails.tvShowCrewCredits case final tvShowCrewCredits when tvShowCrewCredits.isNotEmpty) ...[
                  const Divider(),
                  SectionTitle(
                    title: const Text('TV Show Crews'),
                    trailing: tvShowCrewCredits.length > 10
                        ? SeeAllButton(
                            onPressed: () {},
                          )
                        : null,
                  ),
                  Carousel(
                    itemCount: tvShowCrewCredits.take(10).length,
                    height: 240,
                    aspectRatio: 9 / 16,
                    enableInfiniteScroll: false,
                    itemBuilder: (context, index) {
                      final tvShowCrewCredit = tvShowCrewCredits[index];
                      return CarouselCard.fromPersonTvShowCrewCredit(
                        tvShowCrewCredit,
                        () {},
                      );
                    },
                  ),
                ],
                if (personDetails.images case final images when images.isNotEmpty) ...[
                  const Divider(),
                  SectionTitle(
                    title: const Text('Images'),
                    trailing: images.length > 10
                        ? SeeAllButton(
                            onPressed: () {},
                          )
                        : null,
                  ),
                  Carousel(
                    itemCount: images.take(10).length,
                    height: 240,
                    aspectRatio: 9 / 16,
                    enableInfiniteScroll: false,
                    itemBuilder: (context, index) {
                      final image = images[index];
                      return Card(
                        child: InkWell(
                          onTap: () {},
                          child: Image.network(
                            image.url(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: MediaQuery.paddingOf(context).bottom),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error(this.error, this.stackTrace);

  final Object error;
  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Error: $error'),
    );
  }
}
