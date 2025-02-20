import 'package:flutter/material.dart';

List<Map<String, String>> cities = [
    {
      'name': 'Barcelona',
      'population': '1,620,000',
      'description':
          'Barcelona es conocida por su arte y arquitectura, destacando la icónica Sagrada Familia y las obras de Antoni Gaudí como el Parque Güell y la Casa Batlló. La ciudad combina playas urbanas, una vibrante vida nocturna, y una rica tradición cultural con festivales como La Mercè. Además, su barrio gótico, Las Ramblas y el moderno distrito 22@ ofrecen una mezcla perfecta entre historia y vanguardia.',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Aerial_view_of_Barceloneta_Beach_and_Port_Vell_in_Barcelona%2C_Spain.jpg/1280px-Aerial_view_of_Barceloneta_Beach_and_Port_Vell_in_Barcelona%2C_Spain.jpg'
    },
    {
      'name': 'Madrid',
      'population': '3,300,000',
      'description':
          'Madrid es la capital de España y un centro cultural vibrante, famosa por su animada vida nocturna, su oferta gastronómica y su patrimonio artístico. Destacan museos de renombre mundial como el Prado, el Reina Sofía y el Thyssen-Bornemisza. La ciudad también es hogar del Palacio Real, la Puerta del Sol y el Parque del Retiro. Madrid combina la elegancia de sus bulevares con la calidez de sus barrios tradicionales como Malasaña y Lavapiés.',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Palaciorealycatedraldelaalmudena_retouched.jpg/1280px-Palaciorealycatedraldelaalmudena_retouched.jpg'
    },
    {
      'name': 'Valencia',
      'population': '800,000',
      'description':
          'Valencia, situada en la costa mediterránea, es famosa por la Ciudad de las Artes y las Ciencias, un complejo futurista que contrasta con su casco antiguo lleno de historia. Sus playas extensas, como la Malvarrosa, y la Albufera, un parque natural con arrozales, son puntos destacados. Además, es el lugar de origen de la paella y celebra Las Fallas, una de las fiestas más espectaculares de España.',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Valencia_Sightseeing_0001_%28203798303%29_cropped.jpeg/1280px-Valencia_Sightseeing_0001_%28203798303%29_cropped.jpeg'
    },
    {
      'name': 'Sevilla',
      'population': '690,000',
      'description':
          'Sevilla es el alma de Andalucía, conocida por su rica herencia cultural y su arquitectura impresionante. La ciudad alberga la Catedral de Sevilla, una de las más grandes del mundo, y la Giralda, su famoso campanario. El Real Alcázar, con sus jardines moriscos, y la Plaza de España son otros lugares icónicos. Sevilla es la cuna del flamenco y celebra la Feria de Abril y la Semana Santa con gran pasión y tradición.',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Monumental_Plaza_de_Espa%C3%B1a_de_Sevilla_retouched.jpg/1280px-Monumental_Plaza_de_Espa%C3%B1a_de_Sevilla_retouched.jpg'
    },
    {
      'name': 'Bilbao',
      'population': '350,000',
      'description':
          'Bilbao es una ciudad del País Vasco que ha experimentado una impresionante transformación urbana en las últimas décadas. El Museo Guggenheim, diseñado por Frank Gehry, es su símbolo más reconocible, pero también destacan el Casco Viejo, el Puente Zubizuri y su rica oferta gastronómica basada en pintxos. Rodeada de montañas y ría, Bilbao combina modernidad y tradición en un entorno natural privilegiado.',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Museo_Guggenheim_Bilbao%2C_Bilbao._%2823811575351%29.jpg/1280px-Museo_Guggenheim_Bilbao%2C_Bilbao._%2823811575351%29.jpg'
    },
    {
      'name': 'Zaragoza',
      'population': '670,000',
      'description':
          'Zaragoza, capital de Aragón, es famosa por la Basílica del Pilar, situada a orillas del río Ebro. Su historia se refleja en monumentos como el Palacio de la Aljafería y la Catedral del Salvador (La Seo). La ciudad combina un rico legado romano, árabe y cristiano, y celebra las Fiestas del Pilar en octubre, atrayendo a miles de visitantes cada año.',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/0/0f/Zaragoza_-_Bas%C3%ADlica_del_Pilar_y_r%C3%ADo_Ebro.jpg'
    },
    {
      'name': 'Málaga',
      'population': '580,000',
      'description':
          'Málaga, ubicada en la Costa del Sol, es la cuna de Pablo Picasso y alberga el Museo Picasso, entre otros espacios culturales. Su centro histórico destaca por la Alcazaba, el Castillo de Gibralfaro y la Catedral. Además de su patrimonio, la ciudad ofrece playas, una animada vida nocturna y una gastronomía deliciosa basada en pescados y mariscos.',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/8/80/Da_Gibralfaro_%28cropped%29.jpg'
    },
    {
      'name': 'Granada',
      'population': '230,000',
      'description':
          'Granada es famosa por la Alhambra, un complejo palaciego de la época nazarí que domina la ciudad desde la colina de la Sabika. La ciudad combina la herencia morisca en barrios como el Albaicín con la vida estudiantil vibrante de la Universidad de Granada. Además, se encuentra cerca de la estación de esquí de Sierra Nevada y a poca distancia de la Costa Tropical.',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Alhambra_I_%2815381913145%29_cropped.jpg/1280px-Alhambra_I_%2815381913145%29_cropped.jpg'
    },
    {
      'name': 'Alicante',
      'population': '330,000',
      'description':
          'Alicante es una ciudad costera con un clima mediterráneo ideal durante todo el año. El Castillo de Santa Bárbara, ubicado en el Monte Benacantil, ofrece vistas espectaculares de la ciudad y el puerto. Su paseo marítimo, la Explanada de España, es un lugar icónico con su suelo de mosaico ondulado. La ciudad es famosa por sus playas y sus festividades de las Hogueras de San Juan.',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Vista_de_Alicante%2C_Espa%C3%B1a%2C_2014-07-04%2C_DD_49.JPG/1280px-Vista_de_Alicante%2C_Espa%C3%B1a%2C_2014-07-04%2C_DD_49.JPG'
    },
    {
      'name': 'Córdoba',
      'population': '325,000',
      'description':
          'Córdoba es una ciudad andaluza con un impresionante legado histórico. La Mezquita-Catedral es su monumento más emblemático, reflejando la convivencia de las culturas musulmana y cristiana. El barrio de la Judería y los patios cordobeses, declarados Patrimonio de la Humanidad, son lugares que no pueden faltar en una visita. Además, la ciudad celebra la Feria de Córdoba y la Fiesta de los Patios con gran entusiasmo.',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/e/e7/Centro_Hist%C3%B3rico%2C_16.9_--_2023_--_C%C3%B3rdoba%2C_Espa%C3%B1a.jpg'
    },
    {
      'name': 'San Sebastián',
      'population': '188,000',
      'description':
          'San Sebastián, conocida como Donostia en euskera, es famosa por su bahía de La Concha y su exquisita gastronomía, con numerosos restaurantes galardonados con estrellas Michelin. La ciudad también es conocida por el Festival Internacional de Cine y su vibrante vida cultural. Sus playas, el casco antiguo y el Monte Urgull ofrecen una combinación perfecta de naturaleza y ciudad.',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/6/6a/Panorama_from_Monte_Igueldo_%285106955283%29.jpg'
    },
    {
      'name': 'Toledo',
      'population': '85,000',
      'description':
          'Toledo, conocida como la "Ciudad de las Tres Culturas", es un testimonio viviente de la convivencia histórica entre cristianos, musulmanes y judíos. Su casco antiguo, declarado Patrimonio de la Humanidad, alberga la imponente Catedral de Toledo, la Sinagoga del Tránsito y el Alcázar. Las estrechas calles empedradas y sus murallas medievales transportan a los visitantes al pasado.',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/0/0c/1_toledo_spain_evening_sunset_2014.jpg'
    },
  ];




  class Globals {
    static ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);
    static ValueNotifier<Locale> localeNotifier = ValueNotifier(Locale('en'));
    static void changeLocale(Locale newLocale) {
      localeNotifier.value = newLocale;
    }
  }