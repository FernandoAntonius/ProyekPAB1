import 'package:gamepedia/models/game.dart';

var gameList = [
  Game(
    title: 'Rise of Tomb Raider',
    developer:
        'Crystal Dynamics, Eidos-Montréal, Feral Interactive (Mac), Feral Interactive (Linux), Nixxes',
    releaseDate: DateTime(2016, 01, 28),
    rating: 9.2,
    price: 2.99,
    avaible: ['Windows', 'MacOS', 'Linux'],
    genre: ['Shooter', 'Adventure', 'Sports', 'Platformer'],
    description:
        'Rise of the Tomb Raider: 20 Year Celebration includes the base game and Season Pass featuring all-new content. Explore Croft Manor in the new “Blood Ties” story, then defend it against a zombie invasion in “Lara’s Nightmare”. Survive extreme conditions with a friend in the new online Co-Op Endurance mode, and brave the new “Extreme Survivor” difficulty. Also features an outfit and weapon inspired by Tomb Raider III, and 5 classic Lara skins. Existing DLC will challenge you to explore a new tomb that houses an ancient terror in Baba Yaga: The Temple of the Witch, and combat waves of infected predators in Cold Darkness Awakened.',
    imageAssets: 'images/riseoftombrider.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2378500/ss_3250c1e6aeae1968dfa085eac1cd33da2b00b253.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2378500/ss_5c6df47fd4137af659bd8bf962a3f75a2d2362cd.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2378500/ss_3ac12b9b101f75921af73784abad91bea9ccbf6a.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2378500/ss_5d48a7a5eee94c5f941bed03e17c7c340a7bfd3f.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 7 64bit",
        "Processor": "Intel Core i3-2100 or AMD equivalent",
        "Memory": "6 GB RAM",
        "Graphics": "NVIDIA GTX 650 2GB or AMD HD7770 2GB",
        "Storage": "25 GB",
      },
      "maximum": {
        "OS": "Windows 10 64 bit",
        "Processor": " Intel Core i7-3770K",
        "Memory": "8 GB RAM",
        "Graphics": "NVIDIA GTX 980Ti 2560x1440 or NVIDIA GTX 970 1920x1080",
        "Storage": "25 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Deep Rock Galactic',
    developer: 'Ghost Ship Games',
    releaseDate: DateTime(2020, 05, 13),
    rating: 9.6,
    price: 8.99,
    avaible: ['Windows'],
    genre: ['Shooter'],
    description:
        'Deep Rock Galactic is a 1-4 player co-op FPS featuring badass space Dwarves, 100% destructible environments, procedurally-generated caves, and endless hordes of alien monsters.',
    imageAssets: 'images/deeprockgalactic.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/391220/ss_4ef0868ecfc6b19bc1af18b88cabe33fe8147cf7.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/391220/ss_749f99146e5ebad371e37d95bfab7b17847c1d81.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/391220/ss_2b612bfa62d920b061e900e1f7a975a2de6729ec.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/391220/ss_3b46aa127290e6ad2f62c125096bf5e901458ad6.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 7 64 Bit",
        "Processor": "Intel i5, 3rd gen (or equivalent)",
        "Memory": "6 GB RAM",
        "Graphics": "NVIDIA GeForce GTX 660 or AMD Radeon HD 7870",
        "Storage": "3 GB",
      },
      "maximum": {
        "OS": "Windows 10 64 Bit",
        "Processor": "Intel i5, 7th gen (or equivalent)",
        "Memory": "8 GB RAM",
        "Graphics": "NVIDIA 970 / AMD Radeon 290",
        "Storage": "3 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'ACE COMBAT 7: SKIES UNKNOWN',
    developer: 'Bandai Namco Studios Inc.',
    releaseDate: DateTime(2019, 01, 31),
    rating: 8.6,
    price: 4.79,
    avaible: ['Windows'],
    genre: ['Shooter', 'Arcade'],
    description:
        'Become an ace pilot and soar through photorealistic skies with full 360 degree movement; down enemy aircraft and experience the thrill of engaging in realistic sorties! Aerial combat has never looked or felt better!',
    imageAssets: 'images/acecombat7.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/502500/ss_2240172f5e842938e1c32adc6ad1451d3ddad747.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/502500/ss_66e4f50c10b0edcb63b6eb41bdbf2b376f34a924.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/502500/ss_6d18660705fe2f2950c64b10cea116b00d232774.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/502500/ss_8c540a07244c80211c0218e272abce97073332d7.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 7",
        "Processor": "Intel i5, 3rd gen (or equivalent)",
        "Memory": "6 GB RAM",
        "Graphics": "NVIDIA GeForce GTX 660 or AMD Radeon HD 7870",
        "Storage": "3 GB",
      },
      "maximum": {
        "OS": "Windows 10",
        "Processor": "Intel i5, 7th gen (or equivalent)",
        "Memory": "8 GB RAM",
        "Graphics": "NVIDIA 970 / AMD Radeon 290",
        "Storage": "3 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Grand Theft Auto V Enhanced',
    developer: 'Rockstar North',
    releaseDate: DateTime(2025, 04, 04),
    rating: 7.7,
    price: 19.79,
    avaible: ['Windows'],
    genre: ['Shooter', 'Adventure', 'Racing'],
    description:
        'Experience entertainment blockbusters Grand Theft Auto V and Grand Theft Auto Online — now upgraded for a new generation with stunning visuals, faster loading, 3D audio, and more, plus exclusive content for GTA Online players.',
    imageAssets: 'images/gtav.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/3240220/d61184a98c1cf2db2b08b2999c04b0519e3615bb/ss_d61184a98c1cf2db2b08b2999c04b0519e3615bb.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/3240220/60690d0fdbd022ab1527ba6d080d42c1812a0f39/ss_60690d0fdbd022ab1527ba6d080d42c1812a0f39.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/3240220/808b550269f898e227dae2c64b5e026f90da85f9/ss_808b550269f898e227dae2c64b5e026f90da85f9.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/3240220/7f432690bd6365e871a2463a5db9cc4e7ebe1151/ss_7f432690bd6365e871a2463a5db9cc4e7ebe1151.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 7 64 Bit",
        "Processor": "Intel i5, 3rd gen (or equivalent)",
        "Memory": "6 GB RAM",
        "Graphics": "NVIDIA GeForce GTX 660 or AMD Radeon HD 7870",
        "Storage": "3 GB",
      },
      "maximum": {
        "OS": "Windows 10 64 Bit",
        "Processor": "Intel i5, 7th gen (or equivalent)",
        "Memory": "8 GB RAM",
        "Graphics": "NVIDIA 970 / AMD Radeon 290",
        "Storage": "3 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Metro Exodus',
    developer: '4A Games',
    releaseDate: DateTime(2020, 09, 08),
    rating: 8.8,
    price: 4.49,
    avaible: [' Windows', 'macOS', 'Linux'],
    genre: ['Shooter', 'Adventure'],
    description:
        'Flee the shattered ruins of the Moscow Metro and embark on an epic, continent-spanning journey across the post-apocalyptic Russian wilderness. Explore vast, non-linear levels, lose yourself in an immersive, sandbox survival experience, and follow a thrilling story-line that spans an entire year in the greatest Metro adventure yet.',
    imageAssets: 'images/metro.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/412020/ss_f0297eacbfb4266f311a8cb4137e4ef8b7cdd00b.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/412020/ss_23815433fdd4a63064da79222fdefb569eeafaba.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/412020/ss_4613c0b4d861ac5dbbac9a1e06a8abecfa3b34d5.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/412020/ss_46cdfb7cda6e1ca0873e93b2133d277ba2191e32.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 7/8/10",
        "Processor": "Intel Core i5-4440 or equivalent",
        "Memory": "8 GB RAM",
        "Graphics": "GeForce GTX 670 / GeForce GTX 1050 / AMD Radeon HD 7870",
        "Storage": "59 GB",
      },
      "maximum": {
        "OS": "Windows 10",
        "Processor": "Intel Core i7-4770k or equivalent",
        "Memory": "8 GB RAM",
        "Graphics": "GeForce GTX 1070 / GeForce RTX 2060 / AMD RX VEGA 56",
        "Storage": "59 GB ",
      },
    },
    isFavorite: false,
  ),

  Game(
    title: 'Rust',
    developer: 'Facepunch Studios',
    releaseDate: DateTime(2018, 02, 08),
    rating: 8.6,
    price: 19.99,
    avaible: ['Windows', 'macOS'],
    genre: ['Shooter', 'Adventure', 'RPG'],
    description:
        'The only aim in Rust is to survive. Everything wants you to die - the island’s wildlife, other inhabitants, the environment, and other survivors. Do whatever it takes to last another night.',
    imageAssets: 'images/rust.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/252490/ss_271feae67943bdc141c1249aba116349397e9ba9.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/252490/ss_e825b087b95e51c3534383cfd75ad6e8038147c3.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/252490/ss_1c2d0d1eefee54f0c67626c74eb21699bbb0ef52.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/252490/ss_bbf6c96e490326ec877ae548cb148e53516b5f83.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 11 64bit",
        "Processor": "AMD Ryzen 5 1400 or Intel Core i5-6600",
        "Memory": "12 GB RAM",
        "Graphics":
            "AMD Radeon RX 470, NVIDIA GeForce GTX 1060, Intel® Arc™ A580",
        "Storage": " 45 GB",
      },
      "maximum": {
        "OS": "Windows 11 64bit",
        "Processor": "AMD Ryzen 7 3700X or Intel® Core i7-6700K",
        "Memory": "16 GB RAM",
        "Graphics":
            "AMD Radeon RX 6600XT, NVIDIA GeForce RTX 3060, Intel Arc B580",
        "Storage": "45 GB",
      },
    },
    isFavorite: false,
  ),

  Game(
    title: 'Human Fall Flat',
    developer: 'No Brakes Games',
    releaseDate: DateTime(2016, 07, 22),
    rating: 9.3,
    price: 5.99,
    avaible: ['Windows', 'macOS'],
    genre: ['Puzzle', 'Adventure'],
    description:
        'Human Fall Flat is a hilarious, light-hearted platformer set in floating dreamscapes that can be played solo or with up to 8 players online. Free new levels keep its vibrant community rewarded.',
    imageAssets: 'images/humanfallflat.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/477160/2f79e50b6aa294a0c9aa8f6fa65a5f4335d9f216/ss_2f79e50b6aa294a0c9aa8f6fa65a5f4335d9f216.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/477160/324ea457c102d5223bb4e0d3fc1128922534e681/ss_324ea457c102d5223bb4e0d3fc1128922534e681.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/477160/72fb001dad4b56fe9f1df4428f85cb14bbdb0b34/ss_72fb001dad4b56fe9f1df4428f85cb14bbdb0b34.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/477160/3256acf966f1038b43855f7251757d4dbfa3b605/ss_3256acf966f1038b43855f7251757d4dbfa3b605.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows XP/Vista/7/8/8.1/10 x86 and x64",
        "Processor":
            "Intel Core2 Duo E6750 (2 * 2660) or equivalent | AMD Athlon 64 X2 Dual Core 6000+ (2 * 3000) or equivalent",
        "Memory": "1024 MB RAM",
        "Graphics":
            "GeForce GT 740 (2048 MB) or equivalent | Radeon HD 5770 (1024 MB)",
        "Storage": " 500 MB",
      },
      "maximum": {
        "OS": "Windows XP/Vista/7/8/8.1/10 x86 and x64",
        "Processor":
            "Intel Core2 Quad Q9300 (4 * 2500) or equivalent | AMD A10-5800K APU (4*3800) or equivalent",
        "Memory": " 2048 MB RAM",
        "Graphics":
            "eForce GTX 460 (1024 MB) or equivalent | Radeon HD 7770 (1024 MB)",
        "Storage": "500 MB",
      },
    },
    isFavorite: false,
  ),

  Game(
    title: 'SOMA',
    developer: 'Frictional Games',
    releaseDate: DateTime(2015, 09, 22),
    rating: 9.4,
    price: 1.49,
    avaible: ['Windows', 'macOS', 'Linux '],
    genre: ['Puzzle', 'Adventure'],
    description:
        'From the creators of Amnesia: The Dark Descent comes SOMA, a sci-fi horror game set below the waves of the Atlantic ocean. Struggle to survive a hostile world that will make you question your very existence.',
    imageAssets: 'images/soma.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/282140/ss_e19b8e8b9b453aff00651ebd3e8a2639b581bc73.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/282140/ss_5ee5231b847ec7397554af8b2efe25caeef5d7c5.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/282140/ss_17154e69032890890c1fa5920786d858968d8f9c.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/282140/ss_f72532983850e64b32428fd0e4b09e0ff8fcfc55.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": " 64-bit Windows Vista",
        "Processor": "Core i3 / AMD A6 2.4Ghz",
        "Memory": "4 GB RAM",
        "Graphics": "NVIDIA GeForce GTX 260 / AMD Radeon HD 5750. OpenGL 3.3",
        "Storage": "25 GB",
      },
      "maximum": {
        "OS": "64-bit Windows 7",
        "Processor": "Core i5 / AMD FX 2.4Ghz",
        "Memory": "8 GB RAM",
        "Graphics": "NVIDIA GeForce GTX 480 / AMD Radeon HD 5970. OpenGL 3.3",
        "Storage": "25 GB",
      },
    },
    isFavorite: false,
  ),

  Game(
    title: 'Resident Evil',
    developer: 'CAPCOM Co., Ltd.',
    releaseDate: DateTime(2015, 01, 20),
    rating: 9.0,
    price: 4.99,
    avaible: ['Windows'],
    genre: ['Puzzle', 'Adventure'],
    description:
        'The game that defined the survival-horror genre is back! Check out the remastered HD version of Resident Evil.',
    imageAssets: 'images/residentevil.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/304240/ss_d75906451d3a57bb8fc65fdea7ce09fbf1d3b726.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/304240/ss_d27983bb8176325d81cf0ca83dfb30ec247e6f23.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/304240/ss_063bf03851cd3e8bc9746fb4735e1aed2c3843c2.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/304240/ss_8ff9a328bbfa668034356554ceb3d29a7dc7262f.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 10",
        "Processor":
            "Intel® Core™ 2 Duo 2.4 GHz, AMD Athlon™ X2 2.8 GHz, or better",
        "Memory": "2 GB RAM",
        "Graphics": "NVIDIA® GeForce® GTX260, ATI Radeon HD 6790, or better",
        "Storage": "20 GB",
      },
      "maximum": {
        "OS": "Windows 10",
        "Processor":
            "Intel® Core™ 2 Quad 2.7 GHz, AMD Phenom™ II X4 3.0 GHz or better",
        "Memory": "4 GB RAM",
        "Graphics": "NVIDIA® GeForce® GTX 560, ATI Radeon HD 6950, or better",
        "Storage": "20 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Monster Hunter: World',
    developer: 'CAPCOM Co., Ltd.',
    releaseDate: DateTime(2018, 08, 09),
    rating: 8.7,
    price: 9.89,
    avaible: ['Windows'],
    genre: ['Hack and Slash'],
    description:
        'Welcome to a new world! In Monster Hunter: World, the latest installment in the series, you can enjoy the ultimate hunting experience, using everything at your disposal to hunt monsters in a new world teeming with surprises and excitement.',
    imageAssets: 'images/monsterhunter.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/582010/ss_a262c53b8629de7c6547933dc0b49d31f4e1b1f1.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/582010/ss_6b4986a37c7b5c185a796085c002febcdd5357b5.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/582010/ss_681cc5358ec55a997aee9f757ffe8b418dc79a32.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/582010/ss_669f9008f708c19fe3c41d647516f7a73bf26d24.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 10 (64-bit required)",
        "Processor":
            "Intel® Core™ i5 4460 or Core™ i3 9100F or AMD FX™-6300 or Ryzen™ 3 3200G",
        "Memory": "8 GB RAM",
        "Graphics":
            "NVIDIA®GeForce®GTX 760 or GTX1050 or AMD Radeon™ R7 260x or RX 560 ",
        "Storage": " 52 GB ",
      },
      "maximum": {
        "OS": "WINDOWS® 10 (64-bit required)",
        "Processor":
            "Intel® Core™ i7 3770 or Core™ i3 8350 or Core™ i3 9350F / AMD Ryzen™ 5 1500X or Ryzen™ 5 3400G",
        "Memory": "8 GB RAM",
        "Graphics":
            "NVIDIA® GeForce® GTX 1060 (VRAM 3GB) or GTX 1650 / AMD Radeon™ RX 480 or RX 570",
        "Storage": "20 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Dead Cells',
    developer: 'Motion Twin',
    releaseDate: DateTime(2015, 09, 11),
    rating: 8.6,
    price: 17.49,
    avaible: ['Windows', 'macOS', 'Linux'],
    genre: ['Hack and Slash','Platformer'],
    description:
        "Dead Cells is a roguelite, metroidvania inspired, action-platformer. You'll explore a sprawling, ever-changing castle... assuming you’re able to fight your way past its keepers in 2D souls-lite combat. No checkpoints. Kill, die, learn, repeat.'",
    imageAssets: 'images/deadcells.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/588650/ss_ac28000ade40cc2fe5c128f32ac98ba33c008a7a.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/588650/ss_e87e72a247918d8493892e035d5e1b4b84470d2f.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/588650/ss_a099416b9f3e09d47c42f87667e6ad6f394ba652.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/588650/ss_ffef382d2a1ace63b82184caf3f6c5b293c66483.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 7+",
        "Processor": "Intel i5+",
        "Memory": "2 GB RAM",
        "Graphics": "Nvidia 450 GTS / Radeon HD 5750 or better",
        "Storage": "500 MB",
      },
      "maximum": {
        "OS": "Windows 7+",
        "Processor": "Intel i5+",
        "Memory": "4 GB RAM",
        "Graphics": "Nvidia GTX 460 / Radeon HD 7800 or better",
        "Storage": "500 MB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Chivalry 2',
    developer: 'Torn Banner Studios',
    releaseDate: DateTime(2022, 06, 12),
    rating: 7.8,
    price: 7.99,
    avaible: ['Windows'],
    genre: ['Hack and Slash'],
    description:
        'Chivalry 2 is a multiplayer first person slasher inspired by epic medieval movie battles. Players are thrust into the action of every iconic moment of the era - from clashing swords, to storms of flaming arrows, to sprawling castle sieges and more.',
    imageAssets: 'images/chivalry2.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1824220/ss_52c26b2ce4b3a340962022e5c97af69e0dc38523.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1824220/ss_6eab882f82ba56145065e87c4454edfb7cb1467c.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1824220/ss_3da2e1dd30880c0d6f525b5d4adad7f8024c2caf.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1824220/ss_aa128bc708eac669063482a139de785b3d4290b0.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 10 64-bit",
        "Processor": "Intel i3-4370",
        "Memory": "8 GB RAM",
        "Graphics": " Nvidia GeForce GTX 660 or AMD Radeon HD 7870 2 GB ",
        "Storage": "35 GB",
      },
      "maximum": {
        "OS": "Windows 10 64-bit",
        "Processor": "Intel i7 6700 or AMD Ryzen 5 3500x",
        "Memory": "8 GB RAM",
        "Graphics": "Nvidia GTX 1070 or AMD RX Vega-56",
        "Storage": "35 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'CODE VEIN',
    developer: 'Bandai Namco Studios',
    releaseDate: DateTime(2019, 09, 26),
    rating: 8.2,
    price: 8.99,
    avaible: ['Windows'],
    genre: ['Hack and Slash'],
    description:
        'In the face of certain death, we rise. Team up and embark on a journey to the ends of hell to unlock your past and escape your living nightmare in CODE VEIN.',
    imageAssets: 'images/codevein.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/678960/ss_8872f9fd79ef968f3a3023f17811c9f9133f7d64.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/678960/ss_4f2662706d87964e979c223f0264622574f151bc.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/678960/ss_ada0fd6894bcd9e1e316073f1e3ab61326d87b70.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/678960/ss_d7671321de57658244e4bdc75c23dc63d78d0d7a.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 7 SP1 or Windows 10 (64-bit)",
        "Processor": "Intel Core i5-2300",
        "Memory": "6 GB RAM",
        "Graphics": "GeForce GTX 760 or Radeon HD 7850",
        "Storage": "35 GB",
      },
      "maximum": {
        "OS": "Windows 7 SP1 or Windows 10 (64-bit)",
        "Processor": "Intel Core i5-7400 or AMD Ryzen 3 2200G",
        "Memory": "8 GB RAM",
        "Graphics": "GeForce GTX 960 or Radeon R9 380X",
        "Storage": " 35 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Skul: The Hero Slayer',
    developer: 'SOUTHPAW GAMES',
    releaseDate: DateTime(2021, 01, 20),
    rating: 9.1,
    price: 9.99,
    avaible: ['Windows', 'macOS', 'Linux'],
    genre: ['Hack and Slash', 'Indie','Platformer'],
    description:
        "Guide 'Skul' on his quest to single-handedly take on the Imperial Army and rescue his King from captivity, in an action-packed rogue-lite 2D platformer for the ages.",
    imageAssets: 'images/skull.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1147560/ss_b5ed9f9f5c95df4e168107d024cd4107bc2223e3.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1147560/ss_44eae43480fa6d9c350bf6d1100e6d8dc911d8ee.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1147560/ss_c29cf7bfb3dfc5dd7ca0428f92c12a68c8c632cb.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1147560/ss_43e7cf01e7f6066fadf8bd725aa437311820a755.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 7+",
        "Processor": "Dual core from Intel or AMD at 2.8 GHz",
        "Memory": "4 GB RAM",
        "Graphics": "Nvidia 450 GTS / Radeon HD 5750 or better",
        "Storage": "1 GB",
      },
      "maximum": {
        "OS": "Windows 7+",
        "Processor": "Dual core from Intel or AMD at 2.8 GHz",
        "Memory": "8 GB RAM",
        "Graphics": " Nvidia GTX 460 / Radeon HD 7800 or better",
        "Storage": "2 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Megabonk',
    developer: 'vedinad',
    releaseDate: DateTime(2025, 09, 18),
    rating: 9.3,
    price: 7.99,
    avaible: ['Windows', 'Linux'],
    genre: ['Arcade', 'Indie'],
    description:
        "Hajar gelombang musuh tanpa akhir dan jadi absurdly OP! Ambil loot, level up character, unlock karakter baru, upgrade senjata dan bikin build unik serta gokil sambil nahan hordes makhluk!",
    imageAssets: 'images/skull.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/3405340/ce4d8d24a3731a91490ab92b8687f07314c600b9/ss_ce4d8d24a3731a91490ab92b8687f07314c600b9.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/3405340/9ecc4f12f9031e38e546e80416c98eab310dea8b/ss_9ecc4f12f9031e38e546e80416c98eab310dea8b.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/3405340/b1e906ba6bbac4b9017fb786a1b2d88ec3b41578/ss_b1e906ba6bbac4b9017fb786a1b2d88ec3b41578.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/3405340/1d012ef02e5fbd1ed8245a62d60d620b25e84856/ss_1d012ef02e5fbd1ed8245a62d60d620b25e84856.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 7+",
        "Processor": "Dual core from Intel or AMD at 2.8 GHz",
        "Memory": "4 GB RAM",
        "Graphics": "Nvidia 450 GTS / Radeon HD 5750 or better",
        "Storage": "1 GB",
      },
      "maximum": {
        "OS": "Windows 7+",
        "Processor": "Dual core from Intel or AMD at 2.8 GHz",
        "Memory": "8 GB RAM",
        "Graphics": " Nvidia GTX 460 / Radeon HD 7800 or better",
        "Storage": "2 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Brotato',
    developer: 'Blobfish',
    releaseDate: DateTime(2023, 06, 23),
    rating: 9.5,
    price: 2.99,
    avaible: ['Windows', 'macOS', 'Linux'],
    genre: ['Arcade', 'Hack and Slash', 'Indie', 'Role-playing'],
    description:
        "Guide 'Skul' on his quest to single-handedly take on the Imperial Army and rescue his King from captivity, in an action-packed rogue-lite 2D platformer for the ages.",
    imageAssets: 'images/brotato.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1942280/ss_79be0eea0299da76bc50cef160fb669509f74e0b.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1942280/ss_61ad3d242282311207828c1a7d87c1c9d7b4d8bf.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1942280/ss_d4b4c0b552e655169719e35c964765bd27d05900.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1942280/ss_6d2f09b839af705c732d4eaf8080a24b9939aca9.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 7+",
        "Processor": " 2 Ghz",
        "Memory": "4 GB RAM",
        "Graphics": "128MB, OpenGL 3+",
        "Storage": "200 MB",
      },
      "maximum": {
        "OS": "Windows 7+",
        "Processor": " 2 Ghz",
        "Memory": "4 GB RAM",
        "Graphics": "128MB, OpenGL 3+",
        "Storage": "200 MB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'The Crew Motorfest',
    developer: 'Ubisoft Ivory Tower',
    releaseDate: DateTime(2024, 04, 18),
    rating: 7.7,
    price: 13.99,
    avaible: ['Windows'],
    genre: ['Racing', 'Sports', 'Point-and-click'],
    description:
        "Welcome to Motorfest, the ultimate open-world driving experience. Explore the Hawaiian islands of O'ahu and Maui. Celebrate the best of car culture through 20+ themed campaigns (street racing, offroad, drift...) and collect hundreds of iconic vehicles. Enjoy the game free for five hours!",
    imageAssets: 'images/motorfest.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2698940/ss_933b5c1de0571f4e0c26c39ca3a4f68a314b2e38.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2698940/ss_8f7be2c7a031b730a817773f4a1cc9b9cca301df.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2698940/ss_702c9e2b856e5cb051216cca34b9c82d654254cc.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2698940/ss_faff713d5b0c3ab73f8d0af8023c0af2f6d796ab.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 7+",
        "Processor": " 2 Ghz",
        "Memory": "4 GB RAM",
        "Graphics": "128MB, OpenGL 3+",
        "Storage": "200 MB",
      },
      "maximum": {
        "OS": "Windows 7+",
        "Processor": " 2 Ghz",
        "Memory": "4 GB RAM",
        "Graphics": "128MB, OpenGL 3+",
        "Storage": "200 MB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'The Crew 2',
    developer: 'Ivory Tower',
    releaseDate: DateTime(2025, 06, 29),
    rating: 7.6,
    price: 5.99,
    avaible: ['Windows'],
    genre: ['Racing'],
    description:
        "Take on the American motorsports scene as you explore and dominate the land, air, and sea across the entire USA. New: play The Crew 2 offline or online with the new Hybrid mode, available now!",
    imageAssets: 'images/crew2.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/646910/ss_4fe5544b606d1e99fddd46f6e98064077615f03c.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/646910/ss_34662385e6d2ab37b49eae52bee0800f5e2dc767.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/646910/ss_d7a89f47597c4c1ce2d0b49b0fc3e5f5e8e671e6.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/646910/ss_7d9c6b2762f425e5c469e331381d0762f86021cc.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 7+",
        "Processor":
            "Intel Core i5-2400s @ 2.5 GHz or AMD FX-6100 @ 3.3 GHz or equivalent",
        "Memory": "8 GB RAM",
        "Graphics":
            "NVIDIA GeForce GTX 670 or AMD R9 270 (2GB VRAM with Shader Model 5.0 or better)",
        "Storage": "4 GB",
      },
      "maximum": {
        "OS": "Windows 7+",
        "Processor":
            "Intel Core i5-2400s @ 2.5 GHz or AMD FX-6100 @ 3.3 GHz or equivalent",
        "Memory": "8 GB RAM",
        "Graphics":
            "NVIDIA GeForce GTX 670 or AMD R9 270 (2GB VRAM with Shader Model 5.0 or better)",
        "Storage": "4 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Haste',
    developer: 'Landfall',
    releaseDate: DateTime(2018, 04, 1),
    rating: 8.9,
    price: 13.99,
    avaible: ['Windows'],
    genre: ['Racing', 'Adventure', 'Indie','Platformer'],
    description:
        "Run fast, soar through the air, and master your landings as you speed through procedural worlds to outrun the end of the universe, by yourself and with friends!",
    imageAssets: 'images/haste.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1796470/f07ff3c9df2ccba52797f4914dba555516f2b1c3/ss_f07ff3c9df2ccba52797f4914dba555516f2b1c3.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1796470/d69c8353a438ebced15c876e1e7c38b27bbf685a/ss_d69c8353a438ebced15c876e1e7c38b27bbf685a.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1796470/86d361a11cef4338e6f2a8cf1f01cc5457e10d9a/ss_86d361a11cef4338e6f2a8cf1f01cc5457e10d9a.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1796470/bd92701872941816705668c70489a32cea400de5/ss_bd92701872941816705668c70489a32cea400de5.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Win 10",
        "Processor":
            "Intel Core i5-2400 @ 3.1 GHz or AMD FX-6300 @ 3.5 GHz or equivalent",
        "Memory": "8 GB RAM",
        "Graphics":
            "NVIDIA GeForce GTX 670 or AMD R9 270 (2GB VRAM with Shader Model 5.0 or better)",
        "Storage": "4 GB",
      },
      "maximum": {
        "OS": "Win 10",
        "Processor":
            "ntel Core i7-4770 @ 3.4 GHz or AMD Ryzen 5 1600 @ 3.2 GHz or equivalent",
        "Memory": "8 GB RAM",
        "Graphics":
            "NVIDIA GeForce GTX 970 or AMD R9 290X (4GB VRAM with Shader Model 5.0 or better)",
        "Storage": "4 GB",
      },
    },
    isFavorite: false,
  ),

  Game(
    title: 'Black Desert',
    developer: 'Pearl Abyss',
    releaseDate: DateTime(2017, 05, 24),
    rating: 7.3,
    price: 9.99,
    avaible: ['Windows'],
    genre: ['Sports', 'Adventure', 'Role-playing', 'Strategy'],
    description:
        "Played by over 20 million Adventurers - Black Desert Online is an open-world, action MMORPG. Experience intense, action-packed combat, battle massive world bosses, fight alongside friends to siege and conquer castles, and train in professions such as fishing, trading, crafting, cooking, and more!",
    imageAssets: 'images/blackdesert.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/582660/b784aa30aea23768ef2b793b9a064347d3609b6d/ss_b784aa30aea23768ef2b793b9a064347d3609b6d.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/582660/ss_e8cf6710f8ab86f933d0e212e2d2b0e620cb70c9.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/582660/ss_8cd369deed11b84f64e37d08ea8e835be888d3f5.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/582660/ss_e2cfd7db29677295dc76311d151d795ea818ced2.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 10 (64-bit)",
        "Processor": "Intel Core i3 (4th Generation)",
        "Memory": "8 GB RAM",
        "Graphics": "GeForce GTX 970, Radeon RX 480",
        "Storage": "80 GB",
      },
      "maximum": {
        "OS": "Windows 10 (64-bit)",
        "Processor": "Intel Core i3 (4th Generation)",
        "Memory": "8 GB RAM",
        "Graphics": "GeForce GTX 970, Radeon RX 480",
        "Storage": "80 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Escape Simulator 2',
    developer: 'Pine Studio',
    releaseDate: DateTime(2025, 10, 27),
    rating: 8.9,
    price: 15.99,
    avaible: ['Windows', 'macOS'],
    genre: ['Point-and-click', 'Indie', 'Adventure', 'Simulation'],
    description:
        "Played by over 20 million Adventurers - Black Desert Online is an open-world, action MMORPG. Experience intense, action-packed combat, battle massive world bosses, fight alongside friends to siege and conquer castles, and train in professions such as fishing, trading, crafting, cooking, and more!",
    imageAssets: 'images/escapesim2.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2879840/d6b0836c1df5b7286c54228434b87725bef9f89e/ss_d6b0836c1df5b7286c54228434b87725bef9f89e.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2879840/a6e6c2ad9d3f12fb380d9eb1580770bedc7bd39a/ss_a6e6c2ad9d3f12fb380d9eb1580770bedc7bd39a.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2879840/0c1171c0b7fa863f976cf919fd6fc60ebaed193a/ss_0c1171c0b7fa863f976cf919fd6fc60ebaed193a.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2879840/6667b999dc09931283c28051f093f741af6eea83/ss_6667b999dc09931283c28051f093f741af6eea83.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 11 64bit",
        "Processor": "AMD Ryzen 5 1400 or Intel Core i5-6600",
        "Memory": "12 GB RAM",
        "Graphics":
            "AMD Radeon RX 470, NVIDIA GeForce GTX 1060, Intel® Arc™ A580",
        "Storage": "45 GB",
      },
      "maximum": {
        "OS": "Windows 11 64bit",
        "Processor": "AMD Ryzen 7 3700X or Intel® Core i7-6700K",
        "Memory": "16 GB RAM",
        "Graphics":
            "AMD Radeon RX 6600XT, NVIDIA GeForce RTX 3060, Intel Arc B580",
        "Storage": "45 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'TEKKEN 7',
    developer: 'BANDAI NAMCO Studios Inc.',
    releaseDate: DateTime(2017, 06, 1),
    rating: 8.2,
    price: 9.99,
    avaible: ['Windows'],
    genre: ['Point-and-click', 'Sports', 'Adventure', 'Simulation'],
    description:
        "Played by over 20 million Adventurers - Black Desert Online is an open-world, action MMORPG. Experience intense, action-packed combat, battle massive world bosses, fight alongside friends to siege and conquer castles, and train in professions such as fishing, trading, crafting, cooking, and more!",
    imageAssets: 'images/tekken7.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/389730/ss_d92a558644ad60ae5814fc4d2bbaebc5abf62fa3.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/389730/ss_ed3246605518907954918eb06e90705249be77d6.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/389730/ss_40faa5ba39563cb899f1ab2ddd2afbf8b451d52f.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/389730/ss_e4266a29ed7485522c85ff61b454f3765151a0db.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 11 64bit",
        "Processor": "AMD Ryzen 5 1400 or Intel Core i5-6600",
        "Memory": "12 GB RAM",
        "Graphics":
            "AMD Radeon RX 470, NVIDIA GeForce GTX 1060, Intel® Arc™ A580",
        "Storage": "45 GB",
      },
      "maximum": {
        "OS": "Windows 11 64bit",
        "Processor": "AMD Ryzen 7 3700X or Intel® Core i7-6700K",
        "Memory": "16 GB RAM",
        "Graphics":
            "AMD Radeon RX 6600XT, NVIDIA GeForce RTX 3060, Intel Arc B580",
        "Storage": "45 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Cats & Cups',
    developer: 'Rogue Duck Interactive',
    releaseDate: DateTime(2025, 11, 1),
    rating: 8.2,
    price: 5.99,
    avaible: ['Windows', 'macOS', 'Linux'],
    genre: ['Point-and-click', 'Indie', 'Simulation', 'Strategy'],
    description:
        "Played by over 20 million Adventurers - Black Desert Online is an open-world, action MMORPG. Experience intense, action-packed combat, battle massive world bosses, fight alongside friends to siege and conquer castles, and train in professions such as fishing, trading, crafting, cooking, and more!",
    imageAssets: 'images/catscup.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/389730/ss_d92a558644ad60ae5814fc4d2bbaebc5abf62fa3.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/389730/ss_ed3246605518907954918eb06e90705249be77d6.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/389730/ss_40faa5ba39563cb899f1ab2ddd2afbf8b451d52f.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/389730/ss_e4266a29ed7485522c85ff61b454f3765151a0db.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Win 10",
        "Processor":
            "Intel Core i5-2400 @ 3.1 GHz or AMD FX-6300 @ 3.5 GHz or equivalent",
        "Memory": "8 GB RAM",
        "Graphics":
            "NVIDIA GeForce GTX 670 or AMD R9 270 (2GB VRAM with Shader Model 5.0 or better)",
        "Storage": "4 GB",
      },
      "maximum": {
        "OS": "Win 10",
        "Processor":
            "ntel Core i7-4770 @ 3.4 GHz or AMD Ryzen 5 1600 @ 3.2 GHz or equivalent",
        "Memory": "8 GB RAM",
        "Graphics":
            "NVIDIA GeForce GTX 970 or AMD R9 290X (4GB VRAM with Shader Model 5.0 or better)",
        "Storage": "4 GB",
      },
    },
    isFavorite: false,
  ),

  Game(
    title: 'Wartales',
    developer: 'Shiro Games',
    releaseDate: DateTime(2025, 04, 12),
    rating: 8.6,
    price: 13.99,
    avaible: ['Windows'],
    genre: ['Turn-based Strategy', 'Strategy', 'Indie', 'Role-playing'],
    description:
        "Wartales is an open world RPG in which you lead a group of mercenaries in their search for wealth across a massive medieval universe. Explore the world, recruit companions, collect bounties and unravel the secrets of the tombs of the ancients!",
    imageAssets: 'images/wartales.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1527950/ss_09714a62ca142a8a1eb27fa5a408cfc168d9e786.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1527950/ss_e407391b8719bb941b74f6edec9f95f91e9c043b.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1527950/ss_6654e16f9b86732b1be46f246bef63359219c02a.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1527950/ss_1bfaa045d41a258ee7072078a55738f78a42cbf9.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 11 64bit",
        "Processor": "AMD Ryzen 5 1400 or Intel Core i5-6600",
        "Memory": "12 GB RAM",
        "Graphics":
            "AMD Radeon RX 470, NVIDIA GeForce GTX 1060, Intel® Arc™ A580",
        "Storage": "45 GB",
      },
      "maximum": {
        "OS": "Windows 11 64bit",
        "Processor": "AMD Ryzen 7 3700X or Intel® Core i7-6700K",
        "Memory": "16 GB RAM",
        "Graphics":
            "AMD Radeon RX 6600XT, NVIDIA GeForce RTX 3060, Intel Arc B580",
        "Storage": "45 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Songs Of Silence',
    developer:
        'Firaxis Games, Feral Interactive (Mac), Feral Interactive (Linux)',
    releaseDate: DateTime(2024, 11, 13),
    rating: 7.7,
    price: 14.99,
    avaible: ['Windows'],
    genre: ['Turn-based Strategy', 'Strategy', 'Indie', 'Role-playing'],
    description:
        "Lead armies, rebuild fallen kingdoms, and rise to greatness! Embark on an epic journey of strategy in an Art Nouveau-inspired fantasy world. Fight intense battles and uncover a captivating story.",
    imageAssets: 'images/songofsilence.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2195410/ss_3162b32a69b1fb78bda88223b2d1d23627cf49f3.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2195410/ss_eb3f8e766844113ccd7ab243d914a2d59f2b485f.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2195410/ss_cb82910918c56231fc18ba7afd9021cfbb68e05d.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/2195410/ss_adfa37886941737e9c01dc14e182d5642d130288.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 11 64bit",
        "Processor": "AMD Ryzen 5 1400 or Intel Core i5-6600",
        "Memory": "12 GB RAM",
        "Graphics":
            "AMD Radeon RX 470, NVIDIA GeForce GTX 1060, Intel® Arc™ A580",
        "Storage": "45 GB",
      },
      "maximum": {
        "OS": "Windows 11 64bit",
        "Processor": "AMD Ryzen 7 3700X or Intel® Core i7-6700K",
        "Memory": "16 GB RAM",
        "Graphics":
            "AMD Radeon RX 6600XT, NVIDIA GeForce RTX 3060, Intel Arc B580",
        "Storage": "45 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Songs of Conquest',
    developer: 'Lavapotion',
    releaseDate: DateTime(2024, 05, 20),
    rating: 8.3,
    price: 7.49,
    avaible: ['Windows', 'macOS'],
    genre: ['Turn-based Strategy', 'Adventure', 'Role-playing'],
    description:
        "Raise mighty armies, wield ancient magic and forge an empire. This turn-based strategy adventure game fuses strategic decision making, tactical combat and kingdom management.",
    imageAssets: 'images/songofconquest.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/867210/ss_1c38ce7a38d35207ce440c50cc2c2fc88ce8a770.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/867210/ss_05aa6a23efd2bb4ef348f496836ea99287307763.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/867210/ss_3300c853abec9643113916ceb6569d9728f4cb03.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/867210/ss_669bb5c811e023f69e38dc035d89f7a89d583d13.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Windows 7 SP1 or Windows 10 (64-bit)",
        "Processor": "Intel Core i5-2300",
        "Memory": "6 GB RAM",
        "Graphics": "GeForce GTX 760 or Radeon HD 7850",
        "Storage": "35 GB",
      },
      "maximum": {
        "OS": "Windows 7 SP1 or Windows 10 (64-bit)",
        "Processor": "Intel Core i5-7400 or AMD Ryzen 3 2200G",
        "Memory": "8 GB RAM",
        "Graphics": "GeForce GTX 960 or Radeon R9 380X",
        "Storage": " 35 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Blasphemous',
    developer: 'The Game Kitchen',
    releaseDate: DateTime(2019, 09, 10),
    rating: 8.8,
    price: 2.49,
    avaible: ['Windows', 'macOS', 'Linux'],
    genre: ['Platformer', 'Adventure', 'Indie'],
    description:
        "Blasphemous is a brutal action-platformer with skilled hack’n slash combat set in the nightmare world of Cvstodia. Explore, upgrade your abilities, and perform savage executions on the hordes of enemies that stand between you and your quest to break eternal damnation.",
    imageAssets: 'images/blasphemous.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/774361/ss_23c70f980432d67b527ed562a42c41f55d9f9fc8.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/774361/ss_a0e79191b0488482e5175ce1c0b4386d817f8c3d.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/774361/ss_bd57bcb1e9183cbea61339727a97bcc5206677b2.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/774361/ss_933510ac0fd13c6bd4ecc4c187e0506d520f2e70.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Win 10",
        "Processor":
            "Intel Core i5-2400 @ 3.1 GHz or AMD FX-6300 @ 3.5 GHz or equivalent",
        "Memory": "8 GB RAM",
        "Graphics":
            "NVIDIA GeForce GTX 670 or AMD R9 270 (2GB VRAM with Shader Model 5.0 or better)",
        "Storage": "4 GB",
      },
      "maximum": {
        "OS": "Win 10",
        "Processor":
            "ntel Core i7-4770 @ 3.4 GHz or AMD Ryzen 5 1600 @ 3.2 GHz or equivalent",
        "Memory": "8 GB RAM",
        "Graphics":
            "NVIDIA GeForce GTX 970 or AMD R9 290X (4GB VRAM with Shader Model 5.0 or better)",
        "Storage": "4 GB",
      },
    },
    isFavorite: false,
  ),
  Game(
    title: 'Little Nightmares III',
    developer: 'Supermassive Games',
    releaseDate: DateTime(2025, 10, 9),
    rating: 4.6,
    price: 39.59,
    avaible: ['Windows'],
    genre: ['Platformer', 'Adventure'],
    description:
        "Little Nightmares III is an atmospheric adventure game in which you follow the journey of Low and Alone, two best friends in search of a way out of the Nowhere. In 2 players online cooperation or solo with an A.I., work together to solve puzzles and survive in this nightmarish world.",
    imageAssets: 'images/lilnight3.jpg',
    screenShots: [
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1392860/d0802b426b1116c4d0f7c92cc81de359bc342345/ss_d0802b426b1116c4d0f7c92cc81de359bc342345.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1392860/c4ff1a965b1a769314a9952f40e6bf445b2adfac/ss_c4ff1a965b1a769314a9952f40e6bf445b2adfac.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1392860/951d2a14c6ac62284111d3708816df8766d39b17/ss_951d2a14c6ac62284111d3708816df8766d39b17.jpg',
      'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1392860/dad38fdb7026a015146f21be5268192f25eb54f2/ss_dad38fdb7026a015146f21be5268192f25eb54f2.jpg',
    ],
    systemRequirements: {
      "minimum": {
        "OS": "Win 10",
        "Processor":
            "Intel Core i5-2400 @ 3.1 GHz or AMD FX-6300 @ 3.5 GHz or equivalent",
        "Memory": "8 GB RAM",
        "Graphics":
            "NVIDIA GeForce GTX 670 or AMD R9 270 (2GB VRAM with Shader Model 5.0 or better)",
        "Storage": "4 GB",
      },
      "maximum": {
        "OS": "Win 10",
        "Processor":
            "ntel Core i7-4770 @ 3.4 GHz or AMD Ryzen 5 1600 @ 3.2 GHz or equivalent",
        "Memory": "8 GB RAM",
        "Graphics":
            "NVIDIA GeForce GTX 970 or AMD R9 290X (4GB VRAM with Shader Model 5.0 or better)",
        "Storage": "4 GB",
      },
    },
    isFavorite: false,
  ),
];
