import '../../models/interaction_type.dart';
import '../../models/puzzle_category.dart';
import '../../models/puzzle_level.dart';

final List<PuzzleLevel> levels76To100 = [
  // Level 76
  const PuzzleLevel(
    id: 76,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'What gets wetter and wetter the more it dries?',
    questionHi:
        'वह क्या चीज है जो दूसरों को सुखाते-सुखाते खुद गीली होती जाती है?',
    instructionEn: 'Think after bathing!',
    instructionHi: 'नहाने के बाद इस्तेमाल होने वाली चीज सोचें!',
    explanationEn: 'A Towel absorbs water to dry your body, getting wetter!',
    explanationHi:
        'तौलिया (Towel) पानी सोखकर आपको सुखाता है और खुद गीला हो जाता है!',
    hintsEn: ['Found in bathroom.', 'Absorbs moisture.', 'Select "A Towel".'],
    hintsHi: [
      'बाथरूम में मिलता है।',
      'नमी सोखता है।',
      '"तौलिया (Towel)" चुनें।',
    ],
    options: ['A Sponge', 'A Towel', 'The Sun', 'A Hairdryer'],
    optionsHi: ['स्पंज', 'तौलिया (Towel)', 'सूर्य', 'हेयर ड्रायर'],
    solutionIndex: 1,
  ),

  // Level 77
  const PuzzleLevel(
    id: 77,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.tap,
    questionEn: 'Find the odd pair of socks in the laundry pile!',
    questionHi: 'कपड़ों के ढेर में मोजों का बेमेल (अलग) जोड़ा ढूंढें!',
    instructionEn:
        'One sock pair has stripes going vertically instead of horizontally!',
    instructionHi: 'एक जोड़े में धारियां सीधी (खड़ी) बनी हैं!',
    explanationEn: 'Sock Pair #3 has vertical stripes while all others have horizontal stripes!',
    explanationHi: 'मोज़े का जोड़ा #3 अलग डिज़ाइन का है!',
    hintsEn: [
      'Look at stripe directions.',
      'Pair on bottom right.',
      'Tap Sock Pair 3.',
    ],
    hintsHi: [
      'धारियों की दिशा देखें।',
      'नीचे दाईं ओर का जोड़ा।',
      'जोड़ा 3 पर टैप करें।',
    ],
    solutionIndex: 2,
    extraData: {'itemsCount': 4},
  ),

  // Level 78
  const PuzzleLevel(
    id: 78,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Keep the ice cream cone from melting in the hot sun!',
    questionHi: 'कड़कती धूप में आइसक्रीम कोन को पिघलने से बचाएं!',
    instructionEn: 'Drag beach umbrella over the ice cream cone.',
    instructionHi: 'समुद्री छतरी (Umbrella) को खींचकर आइसक्रीम के ऊपर लाएं।',
    explanationEn: 'The cool shade of the umbrella stopped the hot sun rays!',
    explanationHi: 'छांव मिलते ही आइसक्रीम पिघलने से बच गई!',
    hintsEn: [
      'Shade blocks solar heat.',
      'Beach umbrella provides shadow.',
      'Drag Umbrella -> Ice Cream Cone.',
    ],
    hintsHi: [
      'छांव से धूप रुकती है।',
      'छतरी छांव देगी।',
      'छतरी को आइसक्रीम पर लाएं।',
    ],
    dragSourceId: 'beach_umbrella',
    dragTargetId: 'ice_cream_cone',
  ),

  // Level 79
  const PuzzleLevel(
    id: 79,
    category: PuzzleCategory.mathNumbers,
    interactionType: InteractionType.patternObservation,
    questionEn: 'Solve the riddle: How many letters are in "THE ALPHABET"?',
    questionHi: 'पहेली: "THE ALPHABET" शब्द में कुल कितने अक्षर (Letters) हैं?',
    instructionEn:
        'Count the physical letters inside quotes "T-H-E A-L-P-H-A-B-E-T"!',
    instructionHi:
        'उद्धरण चिन्हों "THE ALPHABET" के अक्षरों को गिनें (26 नहीं)!',
    explanationEn: 'T-H-E-A-L-P-H-A-B-E-T has 11 letters (excluding space)!',
    explanationHi: '"THE ALPHABET" में कुल 11 अक्षर हैं!',
    hintsEn: [
      'Do not answer 26.',
      'Count T-H-E (3) + A-L-P-H-A-B-E-T (8).',
      'Answer is 11.',
    ],
    hintsHi: [
      '26 उत्तर न दें।',
      'T-H-E (3) + A-L-P-H-A-B-E-T (8) को गिनें।',
      'उत्तर 11 है।',
    ],
    extraData: {'answer': '11'},
  ),

  // Level 80
  const PuzzleLevel(
    id: 80,
    category: PuzzleCategory.positioning,
    interactionType: InteractionType.positioning,
    questionEn: 'Place the cherry pie inside the warm oven shelf!',
    questionHi: 'चेरी पाई (केक) को गरम ओवन की शेल्फ में रखें!',
    instructionEn: 'Drag the pie onto the marked circle.',
    instructionHi: 'पाई को खींचकर चिह्नित गोल निशान पर लाएं।',
    explanationEn: 'The pie is baking to golden perfection!',
    explanationHi: 'पाई ओवन में रखकर अच्छे से बेक होने लगी!',
    hintsEn: [
      'Open the oven door.',
      'Center oven rack position.',
      'Target position is the outlined circle.',
    ],
    hintsHi: [
      'ओवन का दरवाजा खोलें।',
      'ओवन की बीच वाली रैक।',
      'लक्ष्य घेरा हुआ गोल निशान है।',
    ],
    positionTarget: {'x': 0.55, 'y': 0.43, 'tolerance': 0.10},
  ),

  // Level 81
  const PuzzleLevel(
    id: 81,
    category: PuzzleCategory.multiStepMaster,
    interactionType: InteractionType.multiStep,
    questionEn: 'Send a sealed wax stamp secret letter!',
    questionHi: 'मोहर बंद सीक्रेट पत्र (Letter) भेजें!',
    instructionEn:
        'Step 1: Fold paper. Step 2: Drip wax seal. Step 3: Stamp seal.',
    instructionHi:
        'चरण 1: पत्र मोड़ें। चरण 2: मोम पिघलाएं। चरण 3: मोहर (स्टैम्प) लगाएं।',
    explanationEn: 'The royal seal is pressed onto the red wax!',
    explanationHi: 'लाल मोम पर शाही मोहर लग गई!',
    hintsEn: ['Fold before wax.', 'Wax before stamping.', '3 steps sequence.'],
    hintsHi: [
      'मोम से पहले मोड़ें।',
      'स्टैम्प से पहले मोम लगाएं।',
      '3 चरणों का पालन करें।',
    ],
    extraData: {
      'totalSteps': 3,
      'stepTextsEn': ['Fold the paper', 'Drip the hot wax', 'Press the stamp'],
      'stepTextsHi': ['पत्र को मोड़ें', 'गरम मोम टपकाएं', 'मोहर लगाएं'],
    },
  ),

  // Level 82
  const PuzzleLevel(
    id: 82,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn:
        'What belongs to you, but other people use it much more than you do?',
    questionHi: 'वह क्या चीज है जो है तो आपकी, लेकिन दूसरे लोग उसका उपयोग आपसे ज्यादा करते हैं?',
    instructionEn: 'Think how people call you!',
    instructionHi: 'लोग आपको कैसे पुकारते हैं, सोचें!',
    explanationEn: 'Your Name belongs to you, but family and friends speak it far more often!',
    explanationHi: 'आपका नाम (Your Name) आपका है, पर दूसरे आपको बुलाने के लिए इसे बोलते हैं!',
    hintsEn: [
      'Given to you at birth.',
      'Used when someone speaks to you.',
      'Select "Your Name".',
    ],
    hintsHi: [
      'जन्म के समय मिलता है।',
      'आपसे बात करते समय लोग इसे बोलते हैं।',
      '"आपका नाम" चुनें।',
    ],
    options: ['Your Smartphone', 'Your Name', 'Your House', 'Your Shoes'],
    optionsHi: ['स्मार्टफोन', 'आपका नाम', 'आपका घर', 'आपके जूते'],
    solutionIndex: 1,
  ),

  // Level 83
  const PuzzleLevel(
    id: 83,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.tap,
    questionEn: 'Which flashlight has a working battery inside?',
    questionHi: 'किस टॉर्च के अंदर काम करने वाली बैटरी लगी है?',
    instructionEn: 'Look for glowing light beam indicator!',
    instructionHi: 'रोशनी की चमक वाली टॉर्च देखें!',
    explanationEn: 'Flashlight #2 casts a bright yellow light cone!',
    explanationHi: 'टॉर्च #2 से तेज़ पीली रोशनी निकल रही है!',
    hintsEn: [
      'Light beam visible.',
      'Second item from left.',
      'Tap Flashlight 2.',
    ],
    hintsHi: [
      'रोशनी की किरण दिख रही है।',
      'बाईं से दूसरी टॉर्च।',
      'टॉर्च 2 पर टैप करें।',
    ],
    solutionIndex: 1,
    extraData: {'itemsCount': 4},
  ),

  // Level 84
  const PuzzleLevel(
    id: 84,
    category: PuzzleCategory.memoryTimed,
    interactionType: InteractionType.timedMemory,
    questionEn: 'Memory Flash: Square -> Circle -> Triangle -> Star -> Square',
    questionHi:
        'आकृतियों की याददाश्त: वर्ग -> वृत्त -> त्रिभुज -> तारा -> वर्ग',
    instructionEn: 'Tap shapes in exact order.',
    instructionHi: 'आकृतियों को सही क्रम में दबाएं।',
    explanationEn: 'Master of shape pattern recall!',
    explanationHi: 'आकृतियों के मास्टर!',
    hintsEn: [
      'Square (0) -> Circle (1).',
      'Triangle (2) -> Star (3) -> Square (0).',
      'Sequence: [0, 1, 2, 3, 0]',
    ],
    hintsHi: [
      'वर्ग (0) -> वृत्त (1)।',
      'त्रिभुज (2) -> तारा (3) -> वर्ग (0)।',
      'क्रम: [0, 1, 2, 3, 0]',
    ],
    targetSequence: [0, 1, 2, 3, 0],
  ),

  // Level 85
  const PuzzleLevel(
    id: 85,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Fly the colorful kite high into the windy sky!',
    questionHi: 'रंग-बिरंगी पतंग को हवादार आसमान में उड़ाएं!',
    instructionEn: 'Drag kite spool thread upwards.',
    instructionHi: 'पतंग की चरखी की डोर को ऊपर आसमान की ओर खींचें।',
    explanationEn: 'The kite soars high into the clouds floating gracefully!',
    explanationHi: 'पतंग हवा में लहराती हुई बादलों के पास पहुँच गई!',
    hintsEn: [
      'Upwards motion launches kites.',
      'Spool is at bottom.',
      'Drag Kite String -> Upper Sky.',
    ],
    hintsHi: [
      'ऊपर की ओर खींचने से पतंग उड़ती है।',
      'चरखी नीचे है।',
      'डोर को ऊपर आसमान की तरफ खींचें।',
    ],
    dragSourceId: 'kite_spool',
    dragTargetId: 'upper_sky',
  ),

  // Level 86
  const PuzzleLevel(
    id: 86,
    category: PuzzleCategory.mathNumbers,
    interactionType: InteractionType.patternObservation,
    questionEn: 'What is half of two plus two?',
    questionHi: 'दो प्लस दो का आधा कितना होता है?',
    instructionEn: 'Evaluate: (Half of 2) + 2.',
    instructionHi: 'गणना करें: (2 का आधा) + 2.',
    explanationEn: 'Half of two is 1. Plus two equals 3!',
    explanationHi: 'दो का आधा 1 होता है। उसमें 2 जोड़ने पर 3 बनता है!',
    hintsEn: ['Take half of 2 first (= 1).', 'Add 2 to it.', 'Answer is 3.'],
    hintsHi: [
      'पहले 2 का आधा करें (= 1)।',
      'फिर उसमें 2 जोड़ें।',
      'उत्तर 3 है।',
    ],
    extraData: {'answer': '3'},
  ),

  // Level 87
  const PuzzleLevel(
    id: 87,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'Forward I am heavy, backward I am not. What am I?',
    questionHi:
        'सीधा पढ़ो तो भारी (TON), उल्टा पढ़ो तो नहीं (NOT)। मैं क्या हूँ?',
    instructionEn: 'Look at word "TON" spelled backward!',
    instructionHi: 'अंग्रेजी शब्द "TON" को उल्टा पढ़ कर देखें!',
    explanationEn: 'TON spelled backward is N-O-T (Not)!',
    explanationHi: 'TON को उल्टा लिखने पर N-O-T (Not) बन जाता है!',
    hintsEn: [
      'Word TON means heavy weight.',
      'Spell T-O-N in reverse -> N-O-T.',
      'Select "Ton".',
    ],
    hintsHi: [
      'TON शब्द का अर्थ भारी वजन होता है।',
      'उल्टा लिखें T-O-N -> N-O-T।',
      '"Ton" चुनें।',
    ],
    options: ['Stone', 'Ton', 'Feather', 'Anchor'],
    optionsHi: ['पत्थर', 'Ton (टन)', 'पंख', 'लंगर'],
    solutionIndex: 1,
  ),

  // Level 88
  const PuzzleLevel(
    id: 88,
    category: PuzzleCategory.positioning,
    interactionType: InteractionType.positioning,
    questionEn: 'Place the star on top of the Christmas tree!',
    questionHi: 'क्रिसमस ट्री के सबसे ऊपरी सिरे पर तारा लगाएं!',
    instructionEn: 'Drag the gold star onto the marked circle.',
    instructionHi: 'सोने के तारे को खींचकर चिह्नित गोल निशान पर लाएं।',
    explanationEn: 'Twinkle! The holiday tree shines beautifully!',
    explanationHi: 'ट्री के ऊपर तारा चमक उठा!',
    hintsEn: [
      'Top of the pine tree.',
      'Apex tip of green tree.',
      'Aim for the outlined circle.',
    ],
    hintsHi: [
      'पेड़ के सबसे ऊपरी हिस्से पर।',
      'पेड़ की सबसे ऊपरी चोटी पर।',
      'लक्ष्य घेरा हुआ गोल निशान है।',
    ],
    positionTarget: {'x': 0.55, 'y': 0.26, 'tolerance': 0.10},
  ),

  // Level 89
  const PuzzleLevel(
    id: 89,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.tap,
    questionEn: 'Find the hidden ladybug among autumn leaves!',
    questionHi: 'पतझड़ के पत्तों में छिपी लेडीबग (लाल कीड़ा) ढूंढें!',
    instructionEn: 'Look for red shell with black polka dots!',
    instructionHi: 'काले बिंदुओं वाले लाल ढाल को देखें!',
    explanationEn: 'Ladybug #3 was camouflaged under a brown leaf!',
    explanationHi: 'लेडीबग #3 भूरे पत्ते के नीचे छिपी थी!',
    hintsEn: [
      'Red color with black spots.',
      'Bottom center area.',
      'Tap Ladybug 3.',
    ],
    hintsHi: [
      'काले धब्बों वाला लाल रंग।',
      'नीचे बीच के हिस्से में।',
      'लेडीबग 3 पर टैप करें।',
    ],
    solutionIndex: 2,
    extraData: {'itemsCount': 4},
  ),

  // Level 90
  const PuzzleLevel(
    id: 90,
    category: PuzzleCategory.multiStepMaster,
    interactionType: InteractionType.multiStep,
    questionEn: 'Build an epic winter snowman!',
    questionHi: 'बर्फ का एक शानदार स्नोमैन (Snowman) बनाएं!',
    instructionEn: 'Step 1: Large snow ball. Step 2: Medium snow head. Step 3: Carrot nose.',
    instructionHi:
        'चरण 1: बड़ा बर्फ का गोला। चरण 2: सिर का गोला। चरण 3: गाजर की नाक।',
    explanationEn:
        'Brrr! A cute smiling snowman with a carrot nose is complete!',
    explanationHi: 'गाजर की नाक वाला स्नोमैन तैयार है!',
    hintsEn: [
      'Large base ball first.',
      'Head ball second.',
      'Attach carrot nose last.',
    ],
    hintsHi: ['पहले बड़ा गोला।', 'फिर सिर का गोला।', 'आखिर में गाजर की नाक।'],
    extraData: {
      'totalSteps': 3,
      'stepTextsEn': [
        'Make the large base ball',
        'Add the head ball',
        'Stick on the carrot nose',
      ],
      'stepTextsHi': [
        'बड़ा गोला बनाएं',
        'सिर का गोला जोड़ें',
        'गाजर की नाक लगाएं',
      ],
    },
  ),

  // Level 91
  const PuzzleLevel(
    id: 91,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'If 5 machines take 5 minutes to make 5 widgets, how long would it take 100 machines to make 100 widgets?',
    questionHi: 'यदि 5 मशीनें 5 मिनट में 5 उत्पाद बनाती हैं, तो 100 मशीनों को 100 उत्पाद बनाने में कितना समय लगेगा?',
    instructionEn: 'Calculate speed per machine!',
    instructionHi: 'एक मशीन की गति की गणना करें!',
    explanationEn: 'Each machine takes 5 minutes to make 1 widget. So 100 machines making 100 widgets still takes 5 minutes!',
    explanationHi: 'हर मशीन 1 उत्पाद बनाने में 5 मिनट लेती है। इसलिए 100 मशीनें भी 5 मिनट में ही 100 उत्पाद बना लेंगी!',
    hintsEn: [
      '1 machine produces 1 widget in 5 mins.',
      'More machines work in parallel.',
      'Select "5 Minutes".',
    ],
    hintsHi: [
      '1 मशीन 5 मिनट में 1 उत्पाद बनाती है।',
      'सभी मशीनें एक साथ काम कर रही हैं।',
      '"5 मिनट" चुनें।',
    ],
    options: ['100 Minutes', '20 Minutes', '5 Minutes', '1 Minute'],
    optionsHi: ['१०० मिनट', '२० मिनट', '५ मिनट', '१ मिनट'],
    solutionIndex: 2,
  ),

  // Level 92
  const PuzzleLevel(
    id: 92,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Help the frog jump across the lily pad pond!',
    questionHi: 'मेंढक को तालाब के कमल के पत्ते पर छलांग लगाने में मदद करें!',
    instructionEn: 'Drag spring board behind frog.',
    instructionHi: 'स्प्रिंग बोर्ड को खींचकर मेंढक के पीछे लाएं।',
    explanationEn:
        'Boing! The spring launched the frog right onto the lily pad!',
    explanationHi: 'छलांग! मेंढक सीधे कमल के पत्ते पर जा उतरा!',
    hintsEn: [
      'Spring gives jump momentum.',
      'Place spring board at frog feet.',
      'Drag Spring -> Frog Base.',
    ],
    hintsHi: [
      'स्प्रिंग से छलांग में बल मिलता है।',
      'स्प्रिंग बोर्ड को पैरों के पास लाएं।',
      'स्प्रिंग को मेंढक के पीछे लाएं।',
    ],
    dragSourceId: 'spring_board',
    dragTargetId: 'frog_feet',
  ),

  // Level 93
  const PuzzleLevel(
    id: 93,
    category: PuzzleCategory.mathNumbers,
    interactionType: InteractionType.patternObservation,
    questionEn: 'Count how many circles are in number 8806?',
    questionHi: 'संख्या 8806 में कुल कितने गोल चक्कर (Circles) हैं?',
    instructionEn: 'Count rounded loops in digits 8, 8, 0, 6!',
    instructionHi: '8, 8, 0, 6 के अंकों में गोल घेरों को गिनें!',
    explanationEn: 'Digit 8 has 2 loops (x2 = 4), 0 has 1 loop, 6 has 1 loop -> 4 + 1 + 1 = 6 circles!',
    explanationHi: '8 में 2 घेरे (x2 = 4), 0 में 1 घेरा, 6 में 1 घेरा -> 4 + 1 + 1 = 6 घेरे!',
    hintsEn: [
      'Digit 8 has 2 circles.',
      'Digit 0 has 1, digit 6 has 1.',
      'Answer is 6.',
    ],
    hintsHi: ['8 में 2 घेरे होते हैं।', '0 में 1, 6 में 1।', 'उत्तर 6 है।'],
    extraData: {'answer': '6'},
  ),

  // Level 94
  const PuzzleLevel(
    id: 94,
    category: PuzzleCategory.positioning,
    interactionType: InteractionType.positioning,
    questionEn: 'Place the pirate treasure chest inside the cave X spot!',
    questionHi: 'समुद्री डाकू के खजाने के संदूक को गुफा के "X" निशान पर रखें!',
    instructionEn: 'Drag the chest onto the marked circle.',
    instructionHi: 'संदूक को खींचकर चिह्नित गोल निशान पर लाएं।',
    explanationEn: 'Gold coins sparkle under the mysterious cave spotlight!',
    explanationHi: 'X निशान पर खजाना रखते ही सोने के सिक्के चमकने लगे!',
    hintsEn: [
      'Look for the marked spot on the ground.',
      'Center of red X mark on ground.',
      'Target position is the outlined circle.',
    ],
    hintsHi: [
      'जमीन पर बने निशान को देखें।',
      'जमीन पर लाल X निशान के ऊपर।',
      'लक्ष्य घेरा हुआ गोल निशान है।',
    ],
    positionTarget: {'x': 0.52, 'y': 0.49, 'tolerance': 0.10},
  ),

  // Level 95
  const PuzzleLevel(
    id: 95,
    category: PuzzleCategory.memoryTimed,
    interactionType: InteractionType.timedMemory,
    questionEn: 'Ultimate Memory Recall: 7 -> 2 -> 9 -> 4 -> 1 -> 8',
    questionHi: 'अंतिम याददाश्त चुनौती: 7 -> 2 -> 9 -> 4 -> 1 -> 8',
    instructionEn: '6 digit passcode lock sequence.',
    instructionHi: '6 अंकों का पासकोड दर्ज करें।',
    explanationEn: 'Grand Master level memory recall unlocked!',
    explanationHi: 'ग्रैंड मास्टर स्तर की याददाश्त पूरा हुआ!',
    hintsEn: [
      'Digits: 7, 2, 9, 4, 1, 8.',
      'Follow exact order.',
      'Sequence: [7, 2, 9, 4, 1, 8]',
    ],
    hintsHi: [
      'अंक: 7, 2, 9, 4, 1, 8।',
      'सही क्रम का पालन करें।',
      'क्रम: [7, 2, 9, 4, 1, 8]',
    ],
    targetSequence: [7, 2, 9, 4, 1, 8],
  ),

  // Level 96
  const PuzzleLevel(
    id: 96,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'Which tiger is identical to the main hero tiger?',
    questionHi: 'कौन सा बाघ (Tiger) मुख्य हीरो बाघ के बिल्कुल समान है?',
    instructionEn: 'Compare forehead stripe pattern!',
    instructionHi: 'माथे की धारियों के पैटर्न की तुलना करें!',
    explanationEn: 'Tiger #3 has the exact matching 3-stripe forehead pattern!',
    explanationHi: 'बाघ #3 के माथे का धारियों का पैटर्न एकदम समान है!',
    hintsEn: [
      'Look at forehead markings.',
      'Tiger on right side.',
      'Select "Tiger 3".',
    ],
    hintsHi: ['माथे के निशानों को देखें।', 'दाईं ओर का बाघ।', '"बाघ 3" चुनें।'],
    options: ['Tiger 1', 'Tiger 2', 'Tiger 3', 'Tiger 4'],
    optionsHi: ['बाघ १', 'बाघ २', 'बाघ ३', 'बाघ ४'],
    solutionIndex: 2,
  ),

  // Level 97
  const PuzzleLevel(
    id: 97,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn:
        'Help the astronaut float safely back into the space shuttle airlock!',
    questionHi:
        'अंतरिक्ष यात्री को स्पेस शटल के एयरलॉक में वापस लौटने में मदद करें!',
    instructionEn: 'Drag tether cable to astronaut belt.',
    instructionHi: 'सुरक्षा केबल को खींचकर अंतरिक्ष यात्री की बेल्ट पर लगाएं।',
    explanationEn:
        'Click! The tether pulled the astronaut safely back into the shuttle!',
    explanationHi:
        'केबल जुड़ते ही अंतरिक्ष यात्री सुरक्षित शटल में वापस आ गया!',
    hintsEn: [
      'Tether rope connects astronaut.',
      'Airlock cable is hanging.',
      'Drag Cable -> Astronaut Belt.',
    ],
    hintsHi: [
      'केबल से सुरक्षा मिलती है।',
      'शटल से केबल लटक रही है।',
      'केबल को बेल्ट पर लाएं।',
    ],
    dragSourceId: 'shuttle_cable',
    dragTargetId: 'astronaut_belt',
  ),

  // Level 98
  const PuzzleLevel(
    id: 98,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.tap,
    questionEn: 'Tap the magic potion bottle with a heart emblem!',
    questionHi: 'दिल के निशान वाली जादुई औषधि (Potion) की बोतल पर टैप करें!',
    instructionEn: 'Look closely at potion bottle glass labels!',
    instructionHi: 'बोतलों के लेबल को ध्यान से देखें!',
    explanationEn: 'Potion #4 glows pink with a red heart emblem!',
    explanationHi: 'बोतल #4 में गुलाबी लिक्विड और दिल का निशान है!',
    hintsEn: ['Pink liquid bottle.', 'Bottom right shelf.', 'Tap Potion 4.'],
    hintsHi: [
      'गुलाबी लिक्विड की बोतल।',
      'नीचे दाईं शेल्फ पर।',
      'बोतल 4 पर टैप करें।',
    ],
    solutionIndex: 3,
    extraData: {'itemsCount': 4},
  ),

  // Level 99
  const PuzzleLevel(
    id: 99,
    category: PuzzleCategory.multiStepMaster,
    interactionType: InteractionType.multiStep,
    questionEn: 'Craft a glowing magic wizard wand!',
    questionHi: 'एक चमकती हुई जादुई जादूगर की छड़ी (Wand) बनाएं!',
    instructionEn: 'Step 1: Carve wood stick. Step 2: Attach crystal gem. Step 3: Enchant spell.',
    instructionHi:
        'चरण 1: लकड़ी तराशें। चरण 2: क्रिस्टल रत्न लगाएं। चरण 3: मंत्र फूकें।',
    explanationEn:
        'Sparkles! Magic energy crackles around your completed wizard wand!',
    explanationHi: 'मंत्र फूँकते ही जादू की छड़ी से नीली किरणें निकलने लगीं!',
    hintsEn: ['Carve wood body.', 'Gem on top tip.', 'Cast spell at end.'],
    hintsHi: ['पहले लकड़ी तराशें।', 'ऊपर रत्न लगाएं।', 'अंत में मंत्र फूँकें।'],
    extraData: {
      'totalSteps': 3,
      'stepTextsEn': [
        'Carve the wooden stick',
        'Attach the crystal gem',
        'Cast the magic spell',
      ],
      'stepTextsHi': ['लकड़ी तराशें', 'क्रिस्टल रत्न लगाएं', 'मंत्र फूंकें'],
    },
  ),

  // Level 100
  const PuzzleLevel(
    id: 100,
    category: PuzzleCategory.multiStepMaster,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'CONGRATULATIONS! You reached Level 100! What is the ultimate secret of a Mind Master?',
    questionHi: 'बधाई हो! आप 100वें स्तर पर पहुंच गए! एक माइंड मास्टर का सबसे बड़ा रहस्य क्या है?',
    instructionEn: 'Choose the true wisdom!',
    instructionHi: 'सच्चे ज्ञान को चुनें!',
    explanationEn:
        'Thinking outside the box and having fun makes you a true Mind Master!',
    explanationHi: 'अलग हटकर सोचना और हमेशा कुछ नया सीखना ही असली माइंड मास्टर की पहचान है!',
    hintsEn: [
      'Curiosity and creative thinking.',
      'Always believe in your brain power!',
      'Select "Creative Thinking & Joy!".',
    ],
    hintsHi: [
      'जिज्ञासा और रचनात्मक सोच।',
      'हमेशा अपने दिमाग पर विश्वास रखें!',
      '"रचनात्मक सोच और आनंद!" चुनें।',
    ],
    options: [
      'Rote Memorization',
      'Speed Button Mashing',
      'Creative Thinking & Joy!',
      'Giving Up',
    ],
    optionsHi: [
      'रटना',
      'जल्दी-जल्दी बटन दबाना',
      'रचनात्मक सोच और आनंद!',
      'हार मान लेना',
    ],
    solutionIndex: 2,
  ),
];
