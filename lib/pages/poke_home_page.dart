import 'package:flutter/material.dart';
import 'package:poke_dex/models/pokemon_model.dart';
import 'package:poke_dex/pages/pokemon_detalis..dart';
import 'package:poke_dex/pages/pokemon_service.dart';

class PokeHomePage extends StatelessWidget {
  const PokeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poke Home"),
      ),
      body: _buildBody(),
    );
  }

 
  Widget _buildBody() {
    final PokemonService pokemonService = PokemonService();

    return FutureBuilder<List<PokemonModel>>(
      future: pokemonService.getPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var lista = snapshot.data;
          if (lista == null || lista.isEmpty) {
            return Center(child: Text("Nenhum pokemon encontrado!"));
          }
          return ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              var pokemon = lista[index];
              return ListTile(
                title: Text(pokemon.name),
                onTap: () async {
              
                  var details =
                      await pokemonService.getPokemonDetails(pokemon.url);

                 
                  var imageUrl = details['sprites']['front_default'];
                  var types = details['types']
                      .map((type) => type['type']['name'])
                      .toList()
                      .join(', ');
                  var abilities = details['abilities']
                      .map((ability) => ability['ability']['name'])
                      .toList()
                      .join(', ');
                  var speciesUrl = details['species']['url'];

                  var generation =
                      await pokemonService.getPokemonGeneration(speciesUrl);

            
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PokemonDetailsPage(
                        name: pokemon.name,
                        imageUrl: imageUrl,
                        types: types,
                        abilities: abilities,
                        generation: generation,
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
