import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'cz4iw1r2': {
      'es': 'Empezar',
      'en': '',
    },
    'fi8z0iet': {
      'es': 'Home',
      'en': '',
    },
  },
  // login
  {
    'hetjxrup': {
      'es': 'Logeate',
      'en': '',
    },
    'pfjqee7q': {
      'es': 'Empecemos llenando la informacion de abajo',
      'en': '',
    },
    '7luqth8c': {
      'es': 'Email',
      'en': '',
    },
    'to6p38ss': {
      'es': 'Password',
      'en': '',
    },
    'oi5wl9r5': {
      'es': 'Entrar',
      'en': '',
    },
    'hu7yt5d7': {
      'es': 'Olvido su clave?',
      'en': '',
    },
    'sguzxi17': {
      'es': 'O entra con:',
      'en': '',
    },
    '0mi30jq1': {
      'es': 'Continue with Google',
      'en': '',
    },
    's232s1of': {
      'es': 'Continue with Apple',
      'en': '',
    },
    '0fx07wru': {
      'es': 'Registrate',
      'en': '',
    },
    'hqaumkdo': {
      'es': 'Empecemos llenando la infomacion que encuntras abajo',
      'en': '',
    },
    'n401o4jr': {
      'es': 'Email',
      'en': '',
    },
    'cnh78n4s': {
      'es': 'Password',
      'en': '',
    },
    'hz8y6m7g': {
      'es': 'Confirm Password',
      'en': '',
    },
    'esfazuq3': {
      'es': 'Crear cuenta',
      'en': '',
    },
    '8slzi32g': {
      'es': 'O registrate con:',
      'en': '',
    },
    'f7l20q5g': {
      'es': 'Continue with Google',
      'en': '',
    },
    'gnbjca4t': {
      'es': 'Continue with Apple',
      'en': '',
    },
    '28lkanfv': {
      'es': 'Home',
      'en': '',
    },
  },
  // olvidolaclave
  {
    'xmxsh48c': {
      'es': 'Volver',
      'en': '',
    },
    'uqyqecoq': {
      'es': 'Olvido clave',
      'en': '',
    },
    '0t5098wf': {
      'es': 'Te enviaremos un correo en el que podras restablecer tu clave',
      'en': '',
    },
    'lhvb4kzv': {
      'es': 'Your email address...',
      'en': '',
    },
    'zaztqfeg': {
      'es': 'Enter your email...',
      'en': '',
    },
    'e394z8oj': {
      'es': 'Send Link',
      'en': '',
    },
    'ovr2j5ej': {
      'es': 'Volver',
      'en': '',
    },
    'eha9apqa': {
      'es': 'Home',
      'en': '',
    },
  },
  // quienessomos
  {
    'dqaihvy0': {
      'es': 'Bienvenido a CultivoA',
      'en': '',
    },
    'tef3cbjf': {
      'es':
          'Somos unos estudiantes apasionados por facilitar la vida a cualquie rpersona interesada en el cultivo de papa',
      'en': '',
    },
    'oi74dgfc': {
      'es': 'Nuestra Mision',
      'en': '',
    },
    '6u4w3mkf': {
      'es':
          'Somos una aplicación dedicada a empoderar a cualquier persona interesada en el cultivo, ya sea un agricultor experimentado o alguien que recién comienza a explorar el mundo de la agricultura. Nuestro objetivo es proporcionar un espacio donde puedas aprender, gestionar y optimizar tus cultivos a través de recursos educativos, herramientas de gestión de parcelas, y asesoría técnica personalizada.',
      'en': '',
    },
    '8wrt8nml': {
      'es': 'Que ofrecemos',
      'en': '',
    },
    'zcj4s6ww': {
      'es': 'Practicas de sembrado sustentables',
      'en': '',
    },
    'l1awe1er': {
      'es': 'Recomendaciones de estudiantes',
      'en': '',
    },
    'ozsew5ry': {
      'es': 'Recomendaciones de cosecha',
      'en': '',
    },
    '4yz11fbt': {
      'es': 'Veamos algunos tips',
      'en': '',
    },
  },
  // tips
  {
    'jlq4yuvz': {
      'es': 'Como sembrar papa',
      'en': '',
    },
    'x891mebg': {
      'es': 'Descubra los mejores tips y formas de cultivar papa',
      'en': '',
    },
    'dlxh605v': {
      'es': 'Busque el mejor tip',
      'en': '',
    },
    'ce05h5r5': {
      'es': 'Tips de cultivo',
      'en': '',
    },
    'mou27nsr': {
      'es': 'Preparacion del suelo',
      'en': '',
    },
    '171j76qm': {
      'es':
          'Los procedimientos convencionales de preparación del suelo consisten en labrar la tierra a una profundidad de 20-31 cm y aplicar 8-10 cm de abono orgánico o compost entre 4 y 6 semanas antes de plantar. Para los campos con suelo arcilloso o mal drenaje, los lechos elevados pueden ser la mejor opción',
      'en': '',
    },
    'tpuqjhmv': {
      'es': 'Regado',
      'en': '',
    },
    '1eol33ab': {
      'es':
          'Frecuencia\nRegar con más frecuencia, pero con caudales menores, es más eficiente. \n \nMétodo\nLos sistemas de riego por goteo son más eficientes que los de aspersión y requieren entre un 10 y un 20 % menos de agua. \n \nVelocidad\nRegar lentamente y de forma moderada, permitiendo que el agua penetre en el suelo antes de continuar.',
      'en': '',
    },
    '2r84c1xw': {
      'es': 'Control de pestes ',
      'en': '',
    },
    'gqc85bqi': {
      'es':
          'Prevención\nUsar semilla libre de enfermedades, desinfectar el suelo con fungicidas, y hacer rotaciones de cultivos. También es importante eliminar los residuos de cosechas anteriores, especialmente los tubérculos. \n \nManejo de la temperatura, humedad y circulación de aire\nEstos factores pueden ayudar a prevenir plagas y enfermedades. \n \nControl biológico\nEste método utiliza organismos y microorganismos vivos para reducir la población de plagas y enfermedades. ',
      'en': '',
    },
    'tlb0aqm5': {
      'es': 'Cosecha',
      'en': '',
    },
    'q0t3urzu': {
      'es':
          'Cultivo casero\nSe excavan los tubérculos con cuidado, separándolos de las raíces de la planta. Se deben desechar las semillas y los tubérculos verdes. Para evitar dañar los tubérculos, se recomienda utilizar herramientas como un azadón, suacho o cuma corta. \n \nCultivo industrial\nSe utilizan cosechadoras sólidas que cavan dos o más hileras a la vez y cargan los tubérculos en camiones. \n \nEl momento adecuado para cosechar la papa depende del destino final de la cosecha. Si se van a almacenar, se debe dejar que la planta muera (madure) antes de cosechar. \n \nDespués de la cosecha, se recomienda dejar los tubérculos extendidos en el suelo y expuestos al sol durante unas dos horas. Esto permite que se sequen y se aireen, lo que ayuda a prevenir daños durante el almacenamiento y el transporte.',
      'en': '',
    },
    'vboi18by': {
      'es': 'Quiere atencion mas personalizada?',
      'en': '',
    },
  },
  // pago
  {
    'i9vh52fg': {
      'es': 'Cultiva como un Boyacense',
      'en': '',
    },
    '91lixjct': {
      'es': 'Expertos en 18 variedades de papa',
      'en': '',
    },
    'b9gzx35t': {
      'es': 'Elige tu plan de suscripción',
      'en': '',
    },
    'swa6leir': {
      'es': 'Plan Básico',
      'en': '',
    },
    '55yja1sh': {
      'es': '\$29.99/mes',
      'en': '',
    },
    '3d2xzpk1': {
      'es': 'Acceso a recursos educativos y asesoría básica',
      'en': '',
    },
    '5bsizxke': {
      'es': 'Plan Premium',
      'en': '',
    },
    '5dx65m6z': {
      'es': '\$49.99/mes',
      'en': '',
    },
    'xhxe4ptf': {
      'es': 'Asesoría personalizada y acceso a todas las herramientas',
      'en': '',
    },
    'sjejizwr': {
      'es': 'Variedades de Papa en Boyacá',
      'en': '',
    },
    'ni9cylai': {
      'es': 'Pastusa',
      'en': '',
    },
    'fw8q0pzf': {
      'es': 'Sabanera',
      'en': '',
    },
    'e4we05m8': {
      'es': 'Criolla',
      'en': '',
    },
    '22if0y39': {
      'es': 'ICA Única',
      'en': '',
    },
    'ttslh3lv': {
      'es': 'Tuquerreña',
      'en': '',
    },
    'kwjf3dk8': {
      'es': 'Y 13 variedades más',
      'en': '',
    },
    'zp25swwb': {
      'es': '¿Qué incluye tu suscripción?',
      'en': '',
    },
    '5zz3uefk': {
      'es': 'Asesoría personalizada de expertos boyacenses',
      'en': '',
    },
    '97aeagz3': {
      'es': 'Guías de cultivo para las 18 variedades de papa',
      'en': '',
    },
    'p3ybr652': {
      'es': 'Herramientas de análisis de suelo y clima',
      'en': '',
    },
    '8h0edcu1': {
      'es': 'Acceso a comunidad de agricultores boyacenses',
      'en': '',
    },
    'lvubznv6': {
      'es': 'Suscríbete Ahora',
      'en': '',
    },
    'je571bk4': {
      'es': 'Al suscribirte, aceptas nuestros términos y condiciones',
      'en': '',
    },
  },
  // tipos
  {
    'w5bk4lkb': {
      'es': 'Descubre las variedades de papa cultivadas en Boyacá',
      'en': '',
    },
    'cisyoam7': {
      'es': 'Tocareña o Tuquerreña',
      'en': '',
    },
    'eqtx24v2': {
      'es': 'Variedad tradicional con alto rendimiento y buena adaptabilidad.',
      'en': '',
    },
    'f5t8gxde': {
      'es': 'Tip: Ideal para suelos bien drenados y clima frío.',
      'en': '',
    },
    'qtdy3dnk': {
      'es': 'Sabanera',
      'en': '',
    },
    'v96n80ue': {
      'es':
          'Conocida por su sabor y textura, popular en la cocina tradicional.',
      'en': '',
    },
    'sfkwqhd0': {
      'es': 'Tip: Requiere suelos fértiles y riego moderado.',
      'en': '',
    },
    'h1wc2ofj': {
      'es': 'Pastusa',
      'en': '',
    },
    '97wqs1a1': {
      'es': 'Pequeña y de color amarillo intenso, con sabor único.',
      'en': '',
    },
    'eiktm078': {
      'es': 'Tip: Prefiere climas fríos y suelos ricos en materia orgánica.',
      'en': '',
    },
    'qz3lbn1i': {
      'es': ' Criolla Colombia',
      'en': '',
    },
    'vvek2cef': {
      'es':
          'Variedad mejorada con alta productividad y resistencia a enfermedades.',
      'en': '',
    },
    'xtl49kyb': {
      'es': 'Tip: Excelente para cultivo en zonas de altitud media.',
      'en': '',
    },
    '6i6b853l': {
      'es': 'Diacol',
      'en': '',
    },
    'w4sud9fw': {
      'es': 'Originaria de Nariño, adaptada a las condiciones de Boyacá.',
      'en': '',
    },
    '7mex2rqi': {
      'es': 'Tip: Requiere suelos profundos y bien drenados.',
      'en': '',
    },
    '4qy8d4rg': {
      'es': 'Borrega ',
      'en': '',
    },
    '38mg1ji2': {
      'es': 'Excelente para la industria de chips y papas fritas.',
      'en': '',
    },
    '5gh8m6jq': {
      'es': 'Tip: Necesita suelos fértiles y buen manejo de plagas.',
      'en': '',
    },
    'j7jqeo8e': {
      'es': 'Morada',
      'en': '',
    },
    'go6y1yi0': {
      'es': 'Resistente a enfermedades y de buen rendimiento.',
      'en': '',
    },
    'v8c8r72i': {
      'es': 'Tip: Adaptada a zonas altas y frías.',
      'en': '',
    },
    '69g9r3nz': {
      'es': 'Quincha',
      'en': '',
    },
    'spd103mx': {
      'es': 'Variedad de alto rendimiento y buena calidad culinaria.',
      'en': '',
    },
    'l1m5wzig': {
      'es': 'Tip: Prefiere suelos profundos y bien drenados.',
      'en': '',
    },
    't8ektarz': {
      'es': 'Cacho de chivo',
      'en': '',
    },
    'vt6oa9xu': {
      'es': 'Resistente a la gota y de buena producción.',
      'en': '',
    },
    'e6sfakuo': {
      'es': 'Tip: Ideal para zonas con alta presión de enfermedades.',
      'en': '',
    },
    'gg5gxrr8': {
      'es': 'Trompeta',
      'en': '',
    },
    'wq7i1usz': {
      'es': 'De piel morada y pulpa blanca, ideal para sopas.',
      'en': '',
    },
    'i0mq4c5u': {
      'es': 'Tip: Prefiere climas fríos y húmedos.',
      'en': '',
    },
    'uy8apeqv': {
      'es': 'De rápido crecimiento y buena producción.',
      'en': '',
    },
    '5hs62pxj': {
      'es': 'Tip: Ideal para rotación de cultivos.',
      'en': '',
    },
    '2g4a4dyx': {
      'es': 'Aguacata',
      'en': '',
    },
    'yjs14thb': {
      'es': 'Adaptada a zonas altas, resistente a heladas.',
      'en': '',
    },
    'rqify3z4': {
      'es': 'Tip: Necesita suelos profundos y bien drenados.',
      'en': '',
    },
    'm6onepx1': {
      'es':
          'Descubre las características únicas de cada variedad y mejora tu cultivo con nuestros consejos expertos.',
      'en': '',
    },
  },
  // pago2
  {
    't8ra97vl': {
      'es': 'Pago',
      'en': '',
    },
    '3wq0bymj': {
      'es': 'Método de Pago',
      'en': '',
    },
    'wosmvofo': {
      'es': 'Seleccione su método de pago preferido',
      'en': '',
    },
    '7pzcrjbs': {
      'es': 'Tarjeta de Crédito',
      'en': '',
    },
    'his4zvh5': {
      'es': 'Transferencia Bancaria',
      'en': '',
    },
    '13gnc3zo': {
      'es': 'Detalles de Pago',
      'en': '',
    },
    'no0ry1sw': {
      'es': 'Número de Tarjeta',
      'en': '',
    },
    'h4v362oq': {
      'es': 'Fecha de Vencimiento',
      'en': '',
    },
    'emekrbqt': {
      'es': 'CVV',
      'en': '',
    },
    '2nyvvqbx': {
      'es': 'Nombre en la Tarjeta',
      'en': '',
    },
    'aencwqb9': {
      'es': 'Resumen de Pago',
      'en': '',
    },
    'dfp4qvng': {
      'es': 'Subtotal',
      'en': '',
    },
    'l4qt2doz': {
      'es': '\$50.00',
      'en': '',
    },
    'q6di88nc': {
      'es': 'IVA (12%)',
      'en': '',
    },
    'dq9xbds0': {
      'es': '\$6.00',
      'en': '',
    },
    '9vwfjtai': {
      'es': 'Total',
      'en': '',
    },
    '34wniu92': {
      'es': '\$56.00',
      'en': '',
    },
    'my6las4z': {
      'es': 'Confirmar Pago',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'mqsw35xl': {
      'es': '',
      'en': '',
    },
    'erubwrk8': {
      'es': '',
      'en': '',
    },
    's0xcb4gt': {
      'es': '',
      'en': '',
    },
    'qkhpsfhw': {
      'es': '',
      'en': '',
    },
    '57vrntbh': {
      'es': '',
      'en': '',
    },
    'ipxpg31z': {
      'es': '',
      'en': '',
    },
    '058fsb92': {
      'es': '',
      'en': '',
    },
    'nenlbg5d': {
      'es': '',
      'en': '',
    },
    'lq051gyo': {
      'es': '',
      'en': '',
    },
    'a3yr4wi5': {
      'es': '',
      'en': '',
    },
    'byds8qtd': {
      'es': '',
      'en': '',
    },
    'yncbmukp': {
      'es': '',
      'en': '',
    },
    'vy20x2ee': {
      'es': '',
      'en': '',
    },
    'ti5s79wr': {
      'es': '',
      'en': '',
    },
    '3ba3qi5z': {
      'es': '',
      'en': '',
    },
    'fok1ykyc': {
      'es': '',
      'en': '',
    },
    'd0ektxk0': {
      'es': '',
      'en': '',
    },
    'fqudgyeb': {
      'es': '',
      'en': '',
    },
    '0sabm0g6': {
      'es': '',
      'en': '',
    },
    'ib75yyu6': {
      'es': '',
      'en': '',
    },
    'k6chx06p': {
      'es': '',
      'en': '',
    },
    'kfa9t1ot': {
      'es': '',
      'en': '',
    },
    'uua095m2': {
      'es': '',
      'en': '',
    },
    'yh7dl2gc': {
      'es': '',
      'en': '',
    },
    'l2l3a31r': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
