import '../../models/interaction_type.dart';
import '../../models/puzzle_category.dart';
import '../../models/puzzle_level.dart';

final List<PuzzleLevel> levels26To50 = [
  // Level 26
  const PuzzleLevel(
    id: 26,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'What has keys but no locks, space but no room, and you can enter but not go in?',
    questionHi: 'किसमें कुंजियाँ (Keys) हैं लेकिन ताले नहीं, स्पेस है लेकिन कमरा नहीं, और आप एंटर कर सकते हैं पर अंदर नहीं जा सकते?',
    instructionEn: 'Solve the riddle!',
    instructionHi: 'पहेली सुलझाएं!',
    explanationEn: 'A Keyboard has keys, spacebar, enter key, and no locks!',
    explanationHi: 'कीबोर्ड (Keyboard) में keys, spacebar और enter key होते हैं!',
    hintsEn: [
      'It is used with computers.',
      'You type on it.',
      'Select "Keyboard".'
    ],
    hintsHi: [
      'यह कंप्यूटर के साथ उपयोग किया जाता है।',
      'आप इस पर टाइप करते हैं।',
      '"कीबोर्ड" चुनें।'
    ],
    options: ['Piano', 'Keyboard', 'Map', 'Secret Box'],
    optionsHi: ['पियानो', 'कीबोर्ड', 'नक्शा', 'गुप्त बक्सा'],
    solutionIndex: 1,
  ),

  // Level 27
  const PuzzleLevel(
    id: 27,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.tap,
    questionEn: 'Tap the green alien among the astronaut crowd!',
    questionHi: 'अंतरिक्ष यात्रियों की भीड़ में से हरे एलियन पर टैप करें!',
    instructionEn: 'Look for antenna ears!',
    instructionHi: 'एंटीना वाले कानों को खोजें!',
    explanationEn: 'Alien #2 was disguising in a suit with tiny antenna ears sticking out!',
    explanationHi: 'एलियन #2 सूट पहनकर छिपा हुआ था, जिसके छोटे एंटीना कान बाहर निकले थे!',
    hintsEn: [
      'Look at head helmet accessories.',
      'Check the top center character.',
      'Tap Alien (Index 1).'
    ],
    hintsHi: [
      'हेलमेट पर लगे सामान को देखें।',
      'ऊपर बीच वाले पात्र को देखें।',
      'एलियन (इंडेक्स 1) पर टैप करें।'
    ],
    solutionIndex: 1,
  ),

  // Level 28
  const PuzzleLevel(
    id: 28,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Light up the dark room!',
    questionHi: 'अंधेरे कमरे में रोशनी करें!',
    instructionEn: 'Drag the matchstick to the candle wick.',
    instructionHi: 'माचिस की तीली को खींचकर मोमबत्ती की बत्ती पर लाएं।',
    explanationEn: 'Flicker! The candle ignited and filled the room with bright warm light!',
    explanationHi: 'मोमबत्ती जल उठी और पूरे कमरे में रोशनी फैल गई!',
    hintsEn: [
      'Fire comes from matchstick.',
      'Candle wick needs fire.',
      'Drag Matchstick -> Candle Wick.'
    ],
    hintsHi: [
      'माचिस से आग मिलती है।',
      'मोमबत्ती की बत्ती को आग चाहिए।',
      'माचिस को मोमबत्ती पर लाएं।'
    ],
    dragSourceId: 'lit_matchstick',
    dragTargetId: 'candle_wick',
  ),

  // Level 29
  const PuzzleLevel(
    id: 29,
    category: PuzzleCategory.mathNumbers,
    interactionType: InteractionType.patternObservation,
    questionEn: 'Find the missing number: 3, 6, 12, 24, ?',
    questionHi: 'लुप्त संख्या ज्ञात करें: 3, 6, 12, 24, ?',
    instructionEn: 'Doubling pattern logic.',
    instructionHi: 'दोगुना करने वाला पैटर्न लागू करें।',
    explanationEn: '24 x 2 = 48!',
    explanationHi: '24 x 2 = 48!',
    hintsEn: [
      'Multiply prior term by 2.',
      '24 doubled.',
      'Answer is 48.'
    ],
    hintsHi: [
      'पिछली संख्या को 2 से गुणा करें।',
      '24 का दोगुना।',
      'उत्तर 48 है।'
    ],
    extraData: {'answer': '48'},
  ),

  // Level 30
  const PuzzleLevel(
    id: 30,
    category: PuzzleCategory.positioning,
    interactionType: InteractionType.positioning,
    questionEn: 'Place the crown on top of the king\'s head!',
    questionHi: 'राजा के सिर पर मुकुट पहनाएं!',
    instructionEn: 'Drag the gold crown onto the king\'s head.',
    instructionHi: 'सोने के मुकुट को खींचकर राजा के सिर पर रखें।',
    explanationEn: 'Long live the King! The crown fits majestically!',
    explanationHi: 'राजा महाराजा की जय हो! मुकुट बिल्कुल सही फिट बैठा!',
    hintsEn: [
      'King is standing in center.',
      'Move crown above forehead.',
      'Target position is (180, 100).'
    ],
    hintsHi: [
      'राजा बीच में खड़े हैं।',
      'मुकुट को माथे के ऊपर लाएं।',
      'लक्ष्य स्थिति (180, 100) है।'
    ],
    positionTarget: {'x': 180.0, 'y': 100.0, 'tolerance': 35.0},
  ),

  // Level 31
  const PuzzleLevel(
    id: 31,
    category: PuzzleCategory.multiStepMaster,
    interactionType: InteractionType.multiStep,
    questionEn: 'Bake a delicious birthday cake!',
    questionHi: 'एक स्वादिष्ट जन्मदिन का केक बनाएं!',
    instructionEn: 'Step 1: Mix batter. Step 2: Bake in oven. Step 3: Put candles on top.',
    instructionHi: 'चरण 1: घोल मिलाएं। चरण 2: ओवन में पकाएं। चरण 3: ऊपर मोमबत्तियां लगाएं।',
    explanationEn: 'Tada! A fresh 3-tier birthday cake is ready with lit candles!',
    explanationHi: 'ताज़ा जन्मदिन का केक तैयार है!',
    hintsEn: [
      'Mix ingredients before baking.',
      'Bake before decorating.',
      'Complete all 3 baking steps.'
    ],
    hintsHi: [
      'पकाने से पहले मिलाएं।',
      'सजाने से पहले ओवन में रखें।',
      '3 चरणों को पूरा करें।'
    ],
    extraData: {'totalSteps': 3},
  ),

  // Level 32
  const PuzzleLevel(
    id: 32,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'What goes up but never comes down?',
    questionHi: 'वह क्या चीज है जो हमेशा बढ़ती है पर कभी घटती नहीं?',
    instructionEn: 'Think about human growth and time.',
    instructionHi: 'मानव विकास और समय के बारे में सोचें।',
    explanationEn: 'Your age increases every year and can never decrease!',
    explanationHi: 'आपकी उम्र (Age) हर साल बढ़ती है और कभी कम नहीं हो सकती!',
    hintsEn: [
      'It increases every birthday.',
      'Number of years alive.',
      'Select "Your Age".'
    ],
    hintsHi: [
      'यह हर जन्मदिन पर बढ़ती है।',
      'जीवित रहने के वर्ष।',
      '"आपकी उम्र" चुनें।'
    ],
    options: ['Balloon', 'Your Age', 'Rainfall', 'Rocket'],
    optionsHi: ['गुब्बारा', 'आपकी उम्र', 'बारिश', 'रॉकेट'],
    solutionIndex: 1,
  ),

  // Level 33
  const PuzzleLevel(
    id: 33,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.tap,
    questionEn: 'Which coffee cup will fill up first?',
    questionHi: 'कौन सा कॉफी कप सबसे पहले भरेगा?',
    instructionEn: 'Follow sealed pipe joints!',
    instructionHi: 'बंद पाइप जोड़ों को ध्यान से देखें!',
    explanationEn: 'Cup #3 is the only one with an unblocked continuous flow pipe!',
    explanationHi: 'कप #3 एकमात्र ऐसा कप है जिसका पाइप कहीं से बंद नहीं है!',
    hintsEn: [
      'Pipe to Cup 1 is blocked.',
      'Pipe to Cup 2 has a hole.',
      'Tap Cup 3.'
    ],
    hintsHi: [
      'कप 1 का पाइप बंद है।',
      'कप 2 का पाइप टूटा है।',
      'कप 3 पर टैप करें।'
    ],
    solutionIndex: 2,
    extraData: {'itemsCount': 4},
  ),

  // Level 34
  const PuzzleLevel(
    id: 34,
    category: PuzzleCategory.memoryTimed,
    interactionType: InteractionType.timedMemory,
    questionEn: 'Remember the keypad code: 9 -> 4 -> 1 -> 7',
    questionHi: 'कीपैड कोड याद रखें: 9 -> 4 -> 1 -> 7',
    instructionEn: 'Enter 9, then 4, then 1, then 7.',
    instructionHi: '9, फिर 4, फिर 1, फिर 7 दर्ज करें।',
    explanationEn: 'Access Granted! Security passcode accepted.',
    explanationHi: 'अनुमति मिली! पासकोड सही है।',
    hintsEn: [
      'Starts with 9.',
      'Ends with 7.',
      'Sequence: [9, 4, 1, 7]'
    ],
    hintsHi: [
      '9 से शुरू करें।',
      '7 पर समाप्त करें।',
      'क्रम: [9, 4, 1, 7]'
    ],
    targetSequence: [9, 4, 1, 7],
  ),

  // Level 35
  const PuzzleLevel(
    id: 35,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Catch the falling star!',
    questionHi: 'गिरते हुए तारे को पकड़ें!',
    instructionEn: 'Drag the net directly under the falling star trajectory.',
    instructionHi: 'जाल को खींचकर गिरते तारे के ठीक नीचे लाएं।',
    explanationEn: 'Swoosh! The star landed safely in your star catcher net!',
    explanationHi: 'तारा सीधा जाल में आकर गिरा!',
    hintsEn: [
      'Position net at landing target.',
      'Center of bottom screen.',
      'Drag Net -> Landing Target.'
    ],
    hintsHi: [
      'जाल को गिरने की जगह पर रखें।',
      'स्क्रीन के नीचे बीच में।',
      'जाल को लक्ष्य पर रखें।'
    ],
    dragSourceId: 'star_net',
    dragTargetId: 'landing_target',
  ),

  // Level 36
  const PuzzleLevel(
    id: 36,
    category: PuzzleCategory.mathNumbers,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'How many months have 28 days?',
    questionHi: 'कितने महीनों में 28 दिन होते हैं?',
    instructionEn: 'Don\'t fall for the February trap!',
    instructionHi: 'फरवरी वाले झांसे में न आएं!',
    explanationEn: 'All 12 months have AT LEAST 28 days!',
    explanationHi: 'साल के सभी 12 महीनों में कम से कम 28 दिन तो होते ही हैं!',
    hintsEn: [
      'Does January have 28 days? Yes.',
      'Does March have 28 days? Yes.',
      'Select "All 12 months".'
    ],
    hintsHi: [
      'क्या जनवरी में 28 दिन होते हैं? हाँ।',
      'क्या मार्च में होते हैं? हाँ।',
      '"सभी 12 महीने" चुनें।'
    ],
    options: ['1 Month (Feb)', '6 Months', '12 Months', '0 Months'],
    optionsHi: ['१ महीना (फरवरी)', '६ महीने', '१२ महीने', '० महीने'],
    solutionIndex: 2,
  ),

  // Level 37
  const PuzzleLevel(
    id: 37,
    category: PuzzleCategory.patternRecognition,
    interactionType: InteractionType.patternObservation,
    questionEn: 'What is the odd one out? Apple, Banana, Orange, Potato',
    questionHi: 'इनमें से सबसे अलग क्या है? सेब, केला, संतरा, आलू',
    instructionEn: 'Classify fruits vs vegetables.',
    instructionHi: 'फल और सब्जी का अंतर पहचानें।',
    explanationEn: 'Potato is a vegetable root, while all others are sweet fruits!',
    explanationHi: 'आलू (Potato) एक सब्जी/सब्जी की जड़ है, जबकि बाकी सभी फल हैं!',
    hintsEn: [
      'Three of them grow on trees.',
      'One grows underground.',
      'Answer is Potato.'
    ],
    hintsHi: [
      'इनमें से 3 पेड़ों पर उगते हैं।',
      '1 ज़मीन के नीचे उगता है।',
      'उत्तर आलू है।'
    ],
    extraData: {'answer': 'Potato'},
  ),

  // Level 38
  const PuzzleLevel(
    id: 38,
    category: PuzzleCategory.positioning,
    interactionType: InteractionType.positioning,
    questionEn: 'Align the battery poles (+ and -) correctly into the flashlight!',
    questionHi: 'टॉर्च में बैटरी के ध्रुवों (+ और -) को सही ढंग से बैठाएं!',
    instructionEn: 'Drag battery positive pole to top slot.',
    instructionHi: 'बैटरी के धनात्मक (+) सिरे को ऊपर की ओर खिसकाएं।',
    explanationEn: 'Click! The flashlight beam turns on bright!',
    explanationHi: 'टॉर्च चालू हो गई और तेज़ रोशनी देने लगी!',
    hintsEn: [
      'Plus sign faces upwards.',
      'Insert into tube slot.',
      'Position is (160, 180).'
    ],
    hintsHi: [
      'प्लस (+) का निशान ऊपर होना चाहिए।',
      'ट्यूब के अंदर खिसकाएं।',
      'स्थिति (160, 180) है।'
    ],
    positionTarget: {'x': 160.0, 'y': 180.0, 'tolerance': 30.0},
  ),

  // Level 39
  const PuzzleLevel(
    id: 39,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'If you overtake the 2nd person in a running race, what position are you in?',
    questionHi: 'यदि आप दौड़ में दूसरे (2nd) स्थान वाले व्यक्ति को पीछे छोड़ देते हैं, तो आप किस स्थान पर आ जाएंगे?',
    instructionEn: 'Think carefully about race positions!',
    instructionHi: 'दौड़ के स्थानों के बारे में ध्यान से सोचें!',
    explanationEn: 'You took the 2nd person\'s spot, so you are now in 2nd place!',
    explanationHi: 'आपने दूसरे व्यक्ति की जगह ले ली, इसलिए अब आप 2nd स्थान पर हैं!',
    hintsEn: [
      'Did you pass the 1st place runner? No.',
      'You replaced runner #2.',
      'Select "2nd Place".'
    ],
    hintsHi: [
      'क्या आपने पहले वाले को पीछे छोड़ा? नहीं।',
      'आपने दूसरे वाले की जगह ली।',
      '"2nd स्थान" चुनें।'
    ],
    options: ['1st Place', '2nd Place', '3rd Place', 'Last Place'],
    optionsHi: ['पहला स्थान', 'दूसरा (2nd) स्थान', 'तीसरा स्थान', 'अंतिम स्थान'],
    solutionIndex: 1,
  ),

  // Level 40
  const PuzzleLevel(
    id: 40,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Pop the floating red balloon!',
    questionHi: 'उड़ते हुए लाल गुब्बारे को फोड़ें!',
    instructionEn: 'Drag the sharp pin onto the balloon.',
    instructionHi: 'नुकीली पिन को खींचकर गुब्बारे पर लाएं।',
    explanationEn: 'POP! The balloon burst into tiny latex shreds!',
    explanationHi: 'धांय! गुब्बारा फूट गया!',
    hintsEn: [
      'Sharp object pops rubber.',
      'Pin is on the left table.',
      'Drag Pin -> Red Balloon.'
    ],
    hintsHi: [
      'नुकीली चीज से गुब्बारा फूटता है।',
      'पिन बाईं मेज पर है।',
      'पिन को गुब्बारे पर लाएं।'
    ],
    dragSourceId: 'sharp_pin',
    dragTargetId: 'red_balloon',
  ),

  // Level 41
  const PuzzleLevel(
    id: 41,
    category: PuzzleCategory.multiStepMaster,
    interactionType: InteractionType.multiStep,
    questionEn: 'Grow a blooming sunflower from a seed!',
    questionHi: 'बीज से खिलता हुआ सूरजमुखी का फूल उगाएं!',
    instructionEn: 'Step 1: Plant seed in soil. Step 2: Water soil. Step 3: Sun shines.',
    instructionHi: 'चरण 1: मिट्टी में बीज बोएं। चरण 2: पानी दें। चरण 3: धूप आने दें।',
    explanationEn: 'A vibrant yellow sunflower opens its petals towards the sun!',
    explanationHi: 'एक खूबसूरत पीला सूरजमुखी खिल गया!',
    hintsEn: [
      'Seed comes first.',
      'Water encourages roots.',
      'Follow 3 growth steps.'
    ],
    hintsHi: [
      'पहले बीज बोएं।',
      'फिर पानी दें।',
      '3 चरणों का पालन करें।'
    ],
    extraData: {'totalSteps': 3},
  ),

  // Level 42
  const PuzzleLevel(
    id: 42,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.tap,
    questionEn: 'Tap the real diamond among glass gems!',
    questionHi: 'कांच के रत्नों के बीच असली हीरे पर टैप करें!',
    instructionEn: 'The real diamond reflects rainbow spectrum light sparkles!',
    instructionHi: 'असली हीरा सतरंगी रोशनी की चमक बिखेरता है!',
    explanationEn: 'Diamond #3 refracts light into brilliant colorful sparkles!',
    explanationHi: 'हीरा #3 रोशनी को सतरंगी चमक में बदलता है!',
    hintsEn: [
      'Look for multicolored sparkles.',
      'Top right gemstone.',
      'Tap Diamond 3.'
    ],
    hintsHi: [
      'सतरंगी चमक को देखें।',
      'ऊपर दाईं ओर का रत्न।',
      'हीरा 3 पर टैप करें।'
    ],
    solutionIndex: 2,
    extraData: {'itemsCount': 4},
  ),

  // Level 43
  const PuzzleLevel(
    id: 43,
    category: PuzzleCategory.mathNumbers,
    interactionType: InteractionType.patternObservation,
    questionEn: 'Solve the equation: 5 + 5 x 0 + 5 = ?',
    questionHi: 'समीकरण हल करें: 5 + 5 x 0 + 5 = ?',
    instructionEn: 'Apply standard BODMAS / PEMDAS order of operations!',
    instructionHi: 'BODMAS नियम लागू करें (पहले गुणा, फिर जोड़)!',
    explanationEn: '5 x 0 = 0. Then 5 + 0 + 5 = 10!',
    explanationHi: '5 x 0 = 0. फिर 5 + 0 + 5 = 10!',
    hintsEn: [
      'Do multiplication first: (5 x 0 = 0).',
      'Add remaining fives: 5 + 0 + 5.',
      'Answer is 10.'
    ],
    hintsHi: [
      'पहले गुणा करें: (5 x 0 = 0)।',
      'फिर जोड़ें: 5 + 0 + 5।',
      'उत्तर 10 है।'
    ],
    extraData: {'answer': '10'},
  ),

  // Level 44
  const PuzzleLevel(
    id: 44,
    category: PuzzleCategory.memoryTimed,
    interactionType: InteractionType.timedMemory,
    questionEn: 'Tap the Simon sequence: Yellow -> Blue -> Red -> Yellow',
    questionHi: 'सायमन पैटर्न दोहराएं: पीला -> नीला -> लाल -> पीला',
    instructionEn: 'Tap Yellow, Blue, Red, Yellow.',
    instructionHi: 'पीला, नीला, लाल, पीला पर टैप करें।',
    explanationEn: 'Perfect rhythm memory!',
    explanationHi: 'बिल्कुल सही याददाश्त!',
    hintsEn: [
      'Yellow is index 0.',
      'Blue is index 1, Red is 2.',
      'Sequence: [0, 1, 2, 0]'
    ],
    hintsHi: [
      'पीला इंडेक्स 0 है।',
      'नीला 1, लाल 2 है।',
      'क्रम: [0, 1, 2, 0]'
    ],
    targetSequence: [0, 1, 2, 0],
  ),

  // Level 45
  const PuzzleLevel(
    id: 45,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'Mary\'s father has 5 daughters: Nana, Nene, Nini, Nono. What is the name of the 5th daughter?',
    questionHi: 'मैरी के पिता की 5 बेटियां हैं: नाना, नेने, नीनी, नोनो। 5वीं बेटी का नाम क्या है?',
    instructionEn: 'Read the first word of the question carefully!',
    instructionHi: 'सवाल का पहला शब्द ध्यान से पढ़ें!',
    explanationEn: 'It is Mary\'s father, so the 5th daughter is Mary!',
    explanationHi: 'यह "मैरी" के पिता हैं, इसलिए 5वीं बेटी का नाम मैरी ही है!',
    hintsEn: [
      'Whose father is it?',
      'Check the possessive name in sentence 1.',
      'Select "Mary".'
    ],
    hintsHi: [
      'ये किसके पिता हैं?',
      'पहले वाक्य में नाम पढ़ें।',
      '"मैरी" चुनें।'
    ],
    options: ['Nunu', 'Mary', 'Nina', 'Nena'],
    optionsHi: ['नुनू', 'मैरी', 'नीना', 'नेना'],
    solutionIndex: 1,
  ),

  // Level 46
  const PuzzleLevel(
    id: 46,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Save the drowning teddy bear from the deep pool!',
    questionHi: 'गहरे स्विमिंग पूल में डूबते टेडी बियर को बचाएं!',
    instructionEn: 'Drag the inflatable lifebuoy floatie onto the teddy bear.',
    instructionHi: 'लाइफबॉय (हवा वाले छल्ले) को टेडी बियर पर खींचें।',
    explanationEn: 'The lifebuoy popped the teddy bear back up to safety!',
    explanationHi: 'लाइफबॉय ने टेडी बियर को पानी के ऊपर तैरा दिया!',
    hintsEn: [
      'Floatation device saves drowning items.',
      'Lifebuoy ring is on poolside.',
      'Drag Lifebuoy -> Teddy Bear.'
    ],
    hintsHi: [
      'लाइफबॉय चीज़ों को तैरने में मदद करता है।',
      'लाइफबॉय पूल किनारे है।',
      'लाइफबॉय को टेडी बियर पर रखें।'
    ],
    dragSourceId: 'lifebuoy_ring',
    dragTargetId: 'teddy_bear',
  ),

  // Level 47
  const PuzzleLevel(
    id: 47,
    category: PuzzleCategory.positioning,
    interactionType: InteractionType.positioning,
    questionEn: 'Hang the painting straight on the wall hook!',
    questionHi: 'पेंटिंग को दीवार के हुक पर सीधा टांगें!',
    instructionEn: 'Position painting at (150, 120).',
    instructionHi: 'पेंटिंग को खींचकर (150, 120) स्थिति पर रखें।',
    explanationEn: 'The frame is level and hanging neatly on the wall!',
    explanationHi: 'पेंटिंग दीवार पर एकदम सीधी टंग गई है!',
    hintsEn: [
      'Center top string over hook.',
      'Move slightly up.',
      'Target position is (150, 120).'
    ],
    hintsHi: [
      'धागे को हुक के ऊपर लाएं।',
      'थोड़ा ऊपर की ओर खिसकाएं।',
      'लक्ष्य स्थिति (150, 120) है।'
    ],
    positionTarget: {'x': 150.0, 'y': 120.0, 'tolerance': 30.0},
  ),

  // Level 48
  const PuzzleLevel(
    id: 48,
    category: PuzzleCategory.patternRecognition,
    interactionType: InteractionType.patternObservation,
    questionEn: 'Complete the pattern: Circle, Square, Circle, Square, ?',
    questionHi: 'पैटर्न पूरा करें: वृत्त, वर्ग, वृत्त, वर्ग, ?',
    instructionEn: 'Alternating shape pattern.',
    instructionHi: 'एकांतर (एक के बाद एक) पैटर्न।',
    explanationEn: 'The sequence alternates between Circle and Square, so next is Circle!',
    explanationHi: 'पैटर्न वृत्त और वर्ग के बीच बदल रहा है, इसलिए अगला वृत्त होगा!',
    hintsEn: [
      'What comes after Square?',
      'Check alternating terms.',
      'Answer is Circle.'
    ],
    hintsHi: [
      'वर्ग के बाद क्या आता है?',
      'बारी-बारी आने वाले पैटर्न को देखें।',
      'उत्तर वृत्त है।'
    ],
    extraData: {'answer': 'Circle'},
  ),

  // Level 49
  const PuzzleLevel(
    id: 49,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'If a doctor gives you 3 pills and tells you to take 1 every half hour, how long will they last?',
    questionHi: 'यदि डॉक्टर आपको 3 गोलियां देता है और हर आधे घंटे में 1 गोली लेने को कहता है, तो गोलियां कितने समय तक चलेंगी?',
    instructionEn: 'Track start time at Minute 0!',
    instructionHi: 'मिनट 0 से शुरुआत गिनें!',
    explanationEn: 'Pill 1 at 0:00, Pill 2 at 0:30, Pill 3 at 1:00. Total time elapsed = 1 Hour (60 mins)!',
    explanationHi: 'पहली गोली 0:00 मिनट पर, दूसरी 0:30 पर, तीसरी 1:00 घंटे पर। कुल समय = 1 घंटा!',
    hintsEn: [
      'Take Pill 1 immediately at start (Minute 0).',
      'Take Pill 2 at 30 minutes.',
      'Take Pill 3 at 60 minutes (1 Hour).'
    ],
    hintsHi: [
      'पहली गोली तुरंत लें (0 मिनट)।',
      'दूसरी गोली 30 मिनट पर लें।',
      'तीसरी गोली 60 मिनट (1 घंटा) पर लें।'
    ],
    options: ['1.5 Hours', '1 Hour', '2 Hours', '3 Hours'],
    optionsHi: ['१.५ घंटे', '१ घंटा', '२ घंटे', '३ घंटे'],
    solutionIndex: 1,
  ),

  // Level 50
  const PuzzleLevel(
    id: 50,
    category: PuzzleCategory.multiStepMaster,
    interactionType: InteractionType.multiStep,
    questionEn: 'Launch the space rocket to the moon!',
    questionHi: 'अंतरिक्ष रॉकेट को चांद पर लॉन्च करें!',
    instructionEn: 'Step 1: Fuel up. Step 2: Countdown 3-2-1. Step 3: Ignition!',
    instructionHi: 'चरण 1: ईंधन भरें। चरण 2: उल्टी गिनती 3-2-1। चरण 3: इग्निशन (लॉन्च)!',
    explanationEn: 'BOOM! The rocket blasts off through the clouds into outer space!',
    explanationHi: 'रॉकेट बादलों को चीरता हुआ अंतरिक्ष की ओर निकल पड़ा!',
    hintsEn: [
      'Fill tank before countdown.',
      'Press launch ignition button after countdown.',
      'Follow 3 launch phases.'
    ],
    hintsHi: [
      'उल्टी गिनती से पहले ईंधन भरें।',
      'गिनती के बाद इग्निशन दबाएं।',
      '3 चरणों का पालन करें।'
    ],
    extraData: {'totalSteps': 3},
  ),
];
