import 'package:dio/dio.dart';
import 'package:poke_dex/models/pokemon_list_model.dart';
import 'package:poke_dex/models/pokemon_model.dart';

class PokemonService {
  final Dio _dio = Dio();


  Future<List<PokemonModel>> getPokemons() async {
    final response =
        await _dio.get('https://pokeapi.co/api/v2/pokemon?limit=1034');
    var model = PokemonListModel.fromMap(response.data);
    return model.results.cast<PokemonModel>();
  }


  Future<Map<String, dynamic>> getPokemonDetails(String url) async {
    final response = await _dio.get(url);
    return response.data; 
  }


  Future<String> getPokemonGeneration(String speciesUrl) async {
    final response = await _dio.get(speciesUrl);
    final generationUrl = response.data['generation']['url'];
    final generationResponse = await _dio.get(generationUrl);
    final generationName =
        generationResponse.data['name']; 

 
    final generationMap = {
      "generation-i": "Generation 1",
      "generation-ii": "Generation 2",
      "generation-iii": "Generation 3",
      "generation-iv": "Generation 4",
      "generation-v": "Generation 5",
      "generation-vi": "Generation 6",
      "generation-vii": "Generation 7",
      "generation-viii": "Generation 8",
      "generation-ix": "Generation 9",
    };

   
    return generationMap[generationName] ?? "Unknown Generation";
  }
}
