import 'package:flutter/material.dart';
import 'package:pokemon_flutter/models/pokemon_basic_data.dart';
import 'package:pokemon_flutter/utils/constants.dart' as constants;
import 'package:pokemon_flutter/ui/widgets/white_sheet_widgets/stat_bar_widget.dart';

class StatsWidget extends StatelessWidget {
  final PokemonBasicData pokemon;

  const StatsWidget({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonStats = pokemon.pokemonStatsData;
    List<Map<String, dynamic>> stats = [];
    // return at most 100 from the stats

    if (pokemonStats != null) {
      stats = [
        {'statTitle': 'Hp', 'statNumber': pokemonStats.hp!},
        {'statTitle': 'Ataque', 'statNumber': pokemonStats.attack!},
        {'statTitle': 'Defensa', 'statNumber': pokemonStats.defense!},
        {'statTitle': 'Sp. Ataque', 'statNumber': pokemonStats.specialAttack!},
        {
          'statTitle': 'Sp. Defensa',
          'statNumber': pokemonStats.specialDefence!
        },
        {'statTitle': 'Velocidad', 'statNumber': pokemonStats.speed!}
      ];
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: constants.mediumPadding),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ...stats
                .map((stat) => StatRowWidget(
                      statTitle: stat['statTitle'],
                      statNumber: stat['statNumber'],
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}

