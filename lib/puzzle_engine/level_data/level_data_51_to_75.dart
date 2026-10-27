import '../../models/interaction_type.dart';
import '../../models/puzzle_category.dart';
import '../../models/puzzle_level.dart';

final List<PuzzleLevel> levels51To75 = [
  // Level 51
  const PuzzleLevel(
    id: 51,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'Which weighs more: 1 kg of feathers or 1 kg of iron rocks?',
    questionHi: 'किसका वजन ज्यादा होगा: 1 किग्रा पंख या 1 किग्रा लोहे के पत्थर?',
    instructionEn: 'Compare mass values.',
    instructionHi: 'द्रव्यमान (मात्रा) की तुलना करें।',
    explanationEn: 'Both are exactly 1 kg, so they weigh the SAME!',
    explanationHi: 'दोनों का वजन 1 किग्रा ही है, इसलिए दोनों बराबर हैं!',
    hintsEn: [
      'Look at the number 1 kg.',
      'Weight is specified identical.',
      'Select "Both Weigh the Same".'
    ],
    hintsHi: [
      '1 किग्रा संख्या पर ध्यान दें।',
      'वजन दोनों का समान दिया गया है।',
      '"दोनों का वजन बराबर है" चुनें।'
    ],
    options: ['1 kg Feathers', '1 kg Iron Rocks', 'Both Weigh the Same', 'Depends on gravity'],
    optionsHi: ['१ किग्रा पंख', '१ किग्रा लोहा', 'दोनों का वजन बराबर है', 'गुरुत्वाकर्षण पर निर्भर है'],
    solutionIndex: 2,
  ),

  // Level 52
  const PuzzleLevel(
    id: 52,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.tap,
    questionEn: 'Spot the fake 100 dollar note!',
    questionHi: 'नकली 100 डॉलर (रुपये) का नोट पहचानें!',
    instructionEn: 'The fake bill has Benjamin Franklin wearing sunglasses!',
    instructionHi: 'नकली नोट पर चश्मा बना हुआ है!',
    explanationEn: 'Bill #2 had cool sunglasses painted on the portrait!',
    explanationHi: 'नोट #2 पर बने चित्र में चश्मा पहनाया गया था!',
    hintsEn: [
      'Look at portrait faces.',
      'Note on top right.',
      'Tap Bill 2.'
    ],
    hintsHi: [
      'चित्रों के चेहरों को देखें।',
      'ऊपर दाईं ओर का नोट।',
      'नोट 2 पर टैप करें।'
    ],
    solutionIndex: 1,
    extraData: {'itemsCount': 4},
  ),

  // Level 53
  const PuzzleLevel(
    id: 53,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Cool down the hot soup bowl!',
    questionHi: 'गर्म सूप के कटोरे को ठंडा करें!',
    instructionEn: 'Drag ice cubes into the steaming soup.',
    instructionHi: 'बर्फ के टुकड़ों को खींचकर भाप निकलते सूप में डालें।',
    explanationEn: 'Clink! The ice melted and brought the soup to warm drinking temperature!',
    explanationHi: 'बर्फ पिघल गई और सूप पीने लायक ठंडा हो गया!',
    hintsEn: [
      'Cold ice reduces temperature.',
      'Ice bowl is on right.',
      'Drag Ice -> Hot Soup Bowl.'
    ],
    hintsHi: [
      'बर्फ तापमान कम करती है।',
      'बर्फ की कटोरी दाईं तरफ है।',
      'बर्फ को सूप में डालें।'
    ],
    dragSourceId: 'ice_cubes',
    dragTargetId: 'hot_soup',
  ),

  // Level 54
  const PuzzleLevel(
    id: 54,
    category: PuzzleCategory.mathNumbers,
    interactionType: InteractionType.patternObservation,
    questionEn: 'Solve the riddle: I am an odd number. Take away one letter and I become even. What number am I?',
    questionHi: 'पहेली: मैं एक विषम संख्या हूँ। एक अक्षर हटाने पर मैं सम (Even) बन जाती हूँ। मैं कौन सी संख्या हूँ?',
    instructionEn: 'Think word spelling of 7!',
    instructionHi: 'अंग्रेजी में 7 (SEVEN) की वर्तनी सोचें!',
    explanationEn: 'SEVEN minus letter "S" becomes EVEN!',
    explanationHi: 'SEVEN (7) में से अक्षर "S" हटाने पर EVEN बन जाता है!',
    hintsEn: [
      'Spelling is S-E-V-E-N.',
      'Remove S -> E-V-E-N.',
      'Answer is 7.'
    ],
    hintsHi: [
      'स्पेलिंग S-E-V-E-N है।',
      'S हटाएं -> E-V-E-N।',
      'उत्तर 7 है।'
    ],
    extraData: {'answer': '7'},
  ),

  // Level 55
  const PuzzleLevel(
    id: 55,
    category: PuzzleCategory.positioning,
    interactionType: InteractionType.positioning,
    questionEn: 'Put the missing puzzle piece into the jigsaw landscape!',
    questionHi: 'जिगसॉ परिदृश्य में गायब टुकड़ा सही जगह बैठाएं!',
    instructionEn: 'Drag piece to coordinates (140, 160).',
    instructionHi: 'टुकड़े को स्थिति (140, 160) पर लाएं।',
    explanationEn: 'Click! The mountain landscape image is now 100% complete!',
    explanationHi: 'पहेली का टुकड़ा बैठ गया और तस्वीर पूरी हो गई!',
    hintsEn: [
      'Match mountain peak contour.',
      'Move left-center.',
      'Target position is (140, 160).'
    ],
    hintsHi: [
      'पहाड़ की चोटी के आकार से मिलाएं।',
      'बाईं-मध्य स्थिति में लाएं।',
      'लक्ष्य (140, 160) है।'
    ],
    positionTarget: {'x': 140.0, 'y': 160.0, 'tolerance': 35.0},
  ),

  // Level 56
  const PuzzleLevel(
    id: 56,
    category: PuzzleCategory.multiStepMaster,
    interactionType: InteractionType.multiStep,
    questionEn: 'Plant a fresh apple tree!',
    questionHi: 'सेब का एक नया पेड़ लगाएं!',
    instructionEn: 'Step 1: Dig soil hole. Step 2: Put sapling. Step 3: Water plant.',
    instructionHi: 'चरण 1: गड्ढा खोदें। चरण 2: पौधा लगाएं। चरण 3: पानी दें।',
    explanationEn: 'The sapling roots take hold and grow into a healthy young apple tree!',
    explanationHi: 'पौधा मिट्टी में जम गया और बढ़कर हरा-भरा पेड़ बन गया!',
    hintsEn: [
      'Dig ground first.',
      'Place green sapling.',
      'Finish with watering.'
    ],
    hintsHi: [
      'पहले गड्ढा खोदें।',
      'पौधा लगाएं।',
      'आखिर में पानी दें।'
    ],
    extraData: {'totalSteps': 3},
  ),

  // Level 57
  const PuzzleLevel(
    id: 57,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'What has a head and a tail but no body?',
    questionHi: 'किसके पास सिर (Head) और पूंछ (Tail) है पर शरीर नहीं?',
    instructionEn: 'Think currency and flipping!',
    instructionHi: 'सिक्के और टॉस के बारे में सोचें!',
    explanationEn: 'A Coin has Head and Tail sides, but no physical body!',
    explanationHi: 'एक सिक्के (Coin) के दो पहलू होते हैं: हेड और टेल!',
    hintsEn: [
      'You flip it to make decisions.',
      'Made of metal.',
      'Select "Coin".'
    ],
    hintsHi: [
      'आप निर्णय लेने के लिए इसे उछालते हैं।',
      'धातु का बना होता है।',
      '"सिक्का" चुनें।'
    ],
    options: ['Snake', 'Coin', 'Kite', 'Comet'],
    optionsHi: ['सांप', 'सिक्का', 'पतंग', 'पुच्छल तारा'],
    solutionIndex: 1,
  ),

  // Level 58
  const PuzzleLevel(
    id: 58,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.tap,
    questionEn: 'Find the sleeping cat among dogs!',
    questionHi: 'कुत्तों की भीड़ में सोई हुई बिल्ली ढूंढें!',
    instructionEn: 'Look for pointed triangular ears and whiskers!',
    instructionHi: 'नुकीले कानों और मूंछों को देखें!',
    explanationEn: 'Cat #3 was napping curled up with small pointy ears!',
    explanationHi: 'बिल्ली #3 दुबक कर सो रही थी!',
    hintsEn: [
      'Pointy triangle ears.',
      'Bottom left corner.',
      'Tap Animal 3.'
    ],
    hintsHi: [
      'त्रिकोण जैसे कान।',
      'नीचे बाएं कोने में।',
      'जानवर 3 पर टैप करें।'
    ],
    solutionIndex: 2,
    extraData: {'itemsCount': 4},
  ),

  // Level 59
  const PuzzleLevel(
    id: 59,
    category: PuzzleCategory.memoryTimed,
    interactionType: InteractionType.timedMemory,
    questionEn: 'Memory Tap: Red -> Yellow -> Green -> Blue -> Red',
    questionHi: 'याद रखकर दबाएं: लाल -> पीला -> हरा -> नीला -> लाल',
    instructionEn: 'Follow 5 color steps.',
    instructionHi: '5 रंगों के क्रम का पालन करें।',
    explanationEn: 'Incredible visual sequence memory!',
    explanationHi: 'अद्भुत याददाश्त!',
    hintsEn: [
      'Red (0) -> Yellow (1).',
      'Green (2) -> Blue (3) -> Red (0).',
      'Sequence: [0, 1, 2, 3, 0]'
    ],
    hintsHi: [
      'लाल (0) -> पीला (1)।',
      'हरा (2) -> नीला (3) -> लाल (0)।',
      'क्रम: [0, 1, 2, 3, 0]'
    ],
    targetSequence: [0, 1, 2, 3, 0],
  ),

  // Level 60
  const PuzzleLevel(
    id: 60,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Help the sailboat catch the wind to reach shore!',
    questionHi: 'नाव को किनारे तक पहुंचाने के लिए हवा चलाएं!',
    instructionEn: 'Drag the fan behind the sailboat sails.',
    instructionHi: 'पंखे (Fan) को खींचकर नाव के पाल के पीछे लाएं।',
    explanationEn: 'Whoosh! Strong artificial wind pushed the sailboat across the pond!',
    explanationHi: 'पंखे की तेज़ हवा ने नाव को किनारे पहुंचा दिया!',
    hintsEn: [
      'Wind pushes sails.',
      'Fan generates wind stream.',
      'Drag Fan -> Sailboat Sails.'
    ],
    hintsHi: [
      'हवा से पाल आगे बढ़ते हैं।',
      'पंखा हवा देता है।',
      'पंखे को नाव के पीछे लाएं।'
    ],
    dragSourceId: 'electric_fan',
    dragTargetId: 'sailboat_sail',
  ),

  // Level 61
  const PuzzleLevel(
    id: 61,
    category: PuzzleCategory.mathNumbers,
    interactionType: InteractionType.patternObservation,
    questionEn: 'What comes next in pattern: 1, 1, 2, 3, 5, 8, 13, ?',
    questionHi: 'श्रृंखला आगे बढ़ाएं: 1, 1, 2, 3, 5, 8, 13, ?',
    instructionEn: 'Fibonacci sequence logic (add previous two terms).',
    instructionHi: 'फाइबोनैचि नियम (पिछले दो पदों को जोड़ें)।',
    explanationEn: '8 + 13 = 21!',
    explanationHi: '8 + 13 = 21!',
    hintsEn: [
      'Add last two numbers.',
      '8 plus 13.',
      'Answer is 21.'
    ],
    hintsHi: [
      'पिछले दो नंबरों को जोड़ें।',
      '8 + 13।',
      'उत्तर 21 है।'
    ],
    extraData: {'answer': '21'},
  ),

  // Level 62
  const PuzzleLevel(
    id: 62,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'What building has the most stories?',
    questionHi: 'किस इमारत में सबसे ज्यादा स्टोरियाँ (कहानियां/मंजिलें) होती हैं?',
    instructionEn: 'Think word pun (Stories = Tales/Books vs Floors)!',
    instructionHi: 'शब्दों के खेल पर ध्यान दें (Stories = कहानियां vs मंजिलें)!',
    explanationEn: 'The Library contains thousands of stories (books)!',
    explanationHi: 'लाइब्रेरी (पुस्तकालय) में हज़ारों स्टोरियाँ (कहानियाँ/किताबें) होती हैं!',
    hintsEn: [
      'Where do you find thousands of books?',
      'Play on the word "Stories".',
      'Select "Library".'
    ],
    hintsHi: [
      'हज़ारों किताबें कहाँ मिलती हैं?',
      '"Stories" (कहानियों) के अर्थ पर सोचें।',
      '"लाइब्रेरी" चुनें।'
    ],
    options: ['Burj Khalifa', 'Empire State', 'Library', 'Hospital'],
    optionsHi: ['बुर्ज खलीफा', 'एम्पायर स्टेट', 'लाइब्रेरी (पुस्तकालय)', 'अस्पताल'],
    solutionIndex: 2,
  ),

  // Level 63
  const PuzzleLevel(
    id: 63,
    category: PuzzleCategory.positioning,
    interactionType: InteractionType.positioning,
    questionEn: 'Place the cherry right on top of the ice cream sundae scoop!',
    questionHi: 'चेरी को आइसक्रीम सुंडे के बिल्कुल ऊपर रखें!',
    instructionEn: 'Drag cherry to (170, 110).',
    instructionHi: 'चेरी को खींचकर (170, 110) पर लाएं।',
    explanationEn: 'Yum! The cherry completes the delicious ice cream dessert!',
    explanationHi: 'वाह! चेरी लगते ही आइसक्रीम सुंडे तैयार हो गया!',
    hintsEn: [
      'Look at the top of the ice cream bowl.',
      'Center of top whipped cream peak.',
      'Target position is (170, 110).'
    ],
    hintsHi: [
      'आइसक्रीम बाउल के ऊपरी हिस्से को देखें।',
      'क्रीम की चोटी पर रखें।',
      'लक्ष्य स्थिति (170, 110) है।'
    ],
    positionTarget: {'x': 170.0, 'y': 110.0, 'tolerance': 30.0},
  ),

  // Level 64
  const PuzzleLevel(
    id: 64,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Clean up the dirty coffee stain on the table!',
    questionHi: 'मेज पर गिरे कॉफी के दाग को साफ करें!',
    instructionEn: 'Drag the sponge over the stain.',
    instructionHi: 'स्पंज को खींचकर दाग के ऊपर रगड़ें।',
    explanationEn: 'Wipe! The tabletop is now spotless and shiny!',
    explanationHi: 'पोंछते ही मेज एकदम चमक उठी!',
    hintsEn: [
      'Absorbent sponge cleans liquid.',
      'Sponge on lower shelf.',
      'Drag Sponge -> Coffee Stain.'
    ],
    hintsHi: [
      'स्पंज तरल पदार्थ साफ करता है।',
      'स्पंज नीचे की शेल्फ पर है।',
      'स्पंज को कॉफी के दाग पर लाएं।'
    ],
    dragSourceId: 'cleaning_sponge',
    dragTargetId: 'coffee_stain',
  ),

  // Level 65
  const PuzzleLevel(
    id: 65,
    category: PuzzleCategory.multiStepMaster,
    interactionType: InteractionType.multiStep,
    questionEn: 'Construct a cozy wooden birdhouse!',
    questionHi: 'पक्षियों के लिए एक सुंदर लकड़ी का घोंसला (घर) बनाएं!',
    instructionEn: 'Step 1: Assemble walls. Step 2: Attach roof. Step 3: Hang on branch.',
    instructionHi: 'चरण 1: दीवारें जोड़ें। चरण 2: छत लगाएं। चरण 3: टहनी पर टांगें।',
    explanationEn: 'Chirp chirp! A cute little bluebird moves into its new home!',
    explanationHi: 'चीं-चीं! चिड़िया अपने नए घर में आ गई!',
    hintsEn: [
      'Walls first.',
      'Roof on top.',
      'Hang house on tree branch.'
    ],
    hintsHi: [
      'पहले दीवारें।',
      'फिर छत।',
      'पेड़ की टहनी पर टांगें।'
    ],
    extraData: {'totalSteps': 3},
  ),

  // Level 66
  const PuzzleLevel(
    id: 66,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'What comes once in a minute, twice in a moment, but never in a thousand years?',
    questionHi: 'वह क्या है जो "Minute" में एक बार, "Moment" में दो बार, लेकिन "Thousand Years" में कभी नहीं आता?',
    instructionEn: 'Examine the letter M in the English spellings!',
    instructionHi: 'अक्षर "M" की गिनती पर ध्यान दें!',
    explanationEn: 'The letter "M" appears 1x in Minute, 2x in MoMent, 0x in Thousand Years!',
    explanationHi: 'अक्षर "M" Minute में 1 बार, MoMent में 2 बार आता है!',
    hintsEn: [
      'Look at the letter spelling.',
      'Count occurrences of letter M.',
      'Select "Letter M".'
    ],
    hintsHi: [
      'अक्षर की स्पेलिंग देखें।',
      'M अक्षर की गिनती करें।',
      '"अक्षर M" चुनें।'
    ],
    options: ['The Sun', 'Letter M', 'Full Moon', 'Leap Day'],
    optionsHi: ['सूर्य', 'अक्षर M', 'पूर्णिमा का चांद', 'लीप वर्ष का दिन'],
    solutionIndex: 1,
  ),

  // Level 67
  const PuzzleLevel(
    id: 67,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.tap,
    questionEn: 'Which star in the sky is glowing brightest?',
    questionHi: 'आसमान में कौन सा तारा सबसे तेज चमक रहा है?',
    instructionEn: 'Look for 8 rays of sparkle light.',
    instructionHi: '8 किरणों वाली चमक को देखें।',
    explanationEn: 'Star #4 radiates 8 bright sparkle rays!',
    explanationHi: 'तारा #4 आठ चमकदार किरणें बिखेर रहा है!',
    hintsEn: [
      'Count ray spikes.',
      'Star near center top.',
      'Tap Star 4.'
    ],
    hintsHi: [
      'किरणों के कोनों को गिनें।',
      'ऊपर बीच का तारा।',
      'तारा 4 पर टैप करें।'
    ],
    solutionIndex: 3,
    extraData: {'itemsCount': 4},
  ),

  // Level 68
  const PuzzleLevel(
    id: 68,
    category: PuzzleCategory.mathNumbers,
    interactionType: InteractionType.patternObservation,
    questionEn: 'If 2 + 2 = 44, 3 + 3 = 96, then 4 + 4 = ?',
    questionHi: 'यदि 2 + 2 = 44, 3 + 3 = 96, तो 4 + 4 = ?',
    instructionEn: 'Logic: First digit = A x B, Second digit = A + B.',
    instructionHi: 'तर्क: पहला अंक = A x B, दूसरा अंक = A + B.',
    explanationEn: '4 x 4 = 16, 4 + 4 = 8 -> Combine = 168!',
    explanationHi: '4 x 4 = 16, 4 + 4 = 8 -> मिलाकर = 168!',
    hintsEn: [
      'Multiply then Add.',
      '4x4=16, 4+4=8.',
      'Answer is 168.'
    ],
    hintsHi: [
      'पहले गुणा फिर जोड़ें।',
      '4x4=16, 4+4=8.',
      'उत्तर 168 है।'
    ],
    extraData: {'answer': '168'},
  ),

  // Level 69
  const PuzzleLevel(
    id: 69,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Inflate the flat bicycle tire!',
    questionHi: 'साइकिल के पंचर/पिचके टायर में हवा भरें!',
    instructionEn: 'Drag the air pump nozzle onto bicycle valve.',
    instructionHi: 'हवा के पंप की नोज़ल को साइकिल के वॉल्व पर लाएं।',
    explanationEn: 'Pfft-pfft! The tire expands firm and ready for riding!',
    explanationHi: 'हवा भरते ही टायर एकदम गोल और मजबूत हो गया!',
    hintsEn: [
      'Air pump inflates rubber.',
      'Attach hose to valve.',
      'Drag Air Pump -> Bicycle Valve.'
    ],
    hintsHi: [
      'पंप से हवा भरी जाती है।',
      'पाइप को वॉल्व से जोड़ें।',
      'पंप को वॉल्व पर लाएं।'
    ],
    dragSourceId: 'air_pump',
    dragTargetId: 'bicycle_valve',
  ),

  // Level 70
  const PuzzleLevel(
    id: 70,
    category: PuzzleCategory.positioning,
    interactionType: InteractionType.positioning,
    questionEn: 'Place the bookmark inside the open storybook page!',
    questionHi: 'कहानी की खुली किताब में बुकमार्क रखें!',
    instructionEn: 'Drag ribbon bookmark to (180, 140).',
    instructionHi: 'बुकमार्क को खींचकर (180, 140) पर लाएं।',
    explanationEn: 'Your reading position is saved neatly!',
    explanationHi: 'आपका पढ़ा हुआ पन्ना सुरक्षित चिह्नित हो गया!',
    hintsEn: [
      'Look at the middle binding spine.',
      'Between the open pages seam.',
      'Target position is (180, 140).'
    ],
    hintsHi: [
      'किताब की बीच वाली बाइंडिंग देखें।',
      'खुले पन्नों की सिलाई के बीच।',
      'लक्ष्य स्थिति (180, 140) है।'
    ],
    positionTarget: {'x': 180.0, 'y': 140.0, 'tolerance': 30.0},
  ),

  // Level 71
  const PuzzleLevel(
    id: 71,
    category: PuzzleCategory.multiStepMaster,
    interactionType: InteractionType.multiStep,
    questionEn: 'Prepare a delicious fresh fruit smoothie!',
    questionHi: 'ताज़ा फलों का स्वादिष्ट स्मूदी जूस बनाएं!',
    instructionEn: 'Step 1: Put fruits in blender. Step 2: Pour milk. Step 3: Press blend.',
    instructionHi: 'चरण 1: मिक्सर में फल डालें। चरण 2: दूध डालें। चरण 3: मिक्सर चलाएं।',
    explanationEn: 'Whirrr! A creamy strawberry smoothie is poured into a chilled glass!',
    explanationHi: 'घर्र-घर्र! स्वादिष्ट स्ट्रॉबेरी स्मूदी बनकर तैयार हो गई!',
    hintsEn: [
      'Fruit first, liquid second.',
      'Press blend button at end.',
      'Complete 3 steps.'
    ],
    hintsHi: [
      'पहले फल, फिर दूध।',
      'अंत में मिक्सर का बटन दबाएं।',
      '3 चरणों को पूरा करें।'
    ],
    extraData: {'totalSteps': 3},
  ),

  // Level 72
  const PuzzleLevel(
    id: 72,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'I have cities, but no houses; forests, but no trees; rivers, but no water. What am I?',
    questionHi: 'मुझमें शहर हैं पर मकान नहीं, जंगल हैं पर पेड़ नहीं, नदियां हैं पर पानी नहीं। मैं कौन हूँ?',
    instructionEn: 'Think cartography!',
    instructionHi: 'नक्शों (मैप) के बारे में सोचें!',
    explanationEn: 'A Map illustrates geographic features without physical structures!',
    explanationHi: 'नक्शा (Map) ज़मीन की आकृतियों को दर्शाता है, बिना असली भौतिक चीजों के!',
    hintsEn: [
      'Used by travelers and navigators.',
      'Paper or digital representation.',
      'Select "A Map".'
    ],
    hintsHi: [
      'यात्रियों द्वारा इस्तेमाल किया जाता है।',
      'कागज या स्क्रीन पर बना चित्र।',
      '"नक्शा (Map)" चुनें।'
    ],
    options: ['A Mirror', 'A Map', 'A Dream', 'A Painting'],
    optionsHi: ['दर्पण (शीशा)', 'नक्शा (Map)', 'एक सपना', 'तस्वीर'],
    solutionIndex: 1,
  ),

  // Level 73
  const PuzzleLevel(
    id: 73,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.tap,
    questionEn: 'Tap the clock showing 3:00 o\'clock exactly!',
    questionHi: 'ठीक 3:00 बजे का समय दिखाने वाली घड़ी पर टैप करें!',
    instructionEn: 'Hour hand at 3, minute hand straight up at 12.',
    instructionHi: 'छोटी सुई 3 पर और बड़ी सुई ठीक 12 पर होनी चाहिए।',
    explanationEn: 'Clock #1 has hands pointing right at 3 and up at 12!',
    explanationHi: 'घड़ी #1 में सुइयां ठीक 3:00 दिखा रही हैं!',
    hintsEn: [
      'Hour hand points right.',
      'Minute hand points top.',
      'Tap Clock 1.'
    ],
    hintsHi: [
      'छोटी सुई दाईं ओर।',
      'बड़ी सुई ऊपर की तरफ।',
      'घड़ी 1 पर टैप करें।'
    ],
    solutionIndex: 0,
    extraData: {'itemsCount': 4},
  ),

  // Level 74
  const PuzzleLevel(
    id: 74,
    category: PuzzleCategory.memoryTimed,
    interactionType: InteractionType.timedMemory,
    questionEn: 'Speed Memory: 3 -> 1 -> 4 -> 1 -> 5',
    questionHi: 'गति याददाश्त: 3 -> 1 -> 4 -> 1 -> 5',
    instructionEn: 'Tap Pi digits sequence.',
    instructionHi: 'संख्याओं के क्रम पर टैप करें।',
    explanationEn: 'First 5 digits of Pi recalled perfectly!',
    explanationHi: 'पाई (Pi) के पहले 5 अंक सही याद रहे!',
    hintsEn: [
      'Sequence of digits: 3, 1, 4, 1, 5.',
      'Follow index order.',
      'Sequence: [3, 1, 4, 1, 5]'
    ],
    hintsHi: [
      'अंकों का क्रम: 3, 1, 4, 1, 5।',
      'क्रम का पालन करें।',
      'क्रम: [3, 1, 4, 1, 5]'
    ],
    targetSequence: [3, 1, 4, 1, 5],
  ),

  // Level 75
  const PuzzleLevel(
    id: 75,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Help the cute puppy reach its bone on the high ledge!',
    questionHi: 'छोटे पिल्ले को ऊंची शेल्फ पर रखी हड्डी तक पहुँचने में मदद करें!',
    instructionEn: 'Drag wooden steps box under the puppy.',
    instructionHi: 'लकड़ी की सीढ़ी वाले बक्से को पिल्ले के नीचे खींचकर लाएं।',
    explanationEn: 'The puppy climbed up the step stool and grabbed the bone!',
    explanationHi: 'पिल्ला सीढ़ी पर चढ़कर अपनी पसंदीदा हड्डी तक पहुंच गया!',
    hintsEn: [
      'Puppy needs elevation.',
      'Wooden step box provides height.',
      'Drag Wooden Steps -> Below Ledge.'
    ],
    hintsHi: [
      'पिल्ले को ऊंचाई चाहिए।',
      'लकड़ी का बक्सा ऊंचाई देगा।',
      'बक्से को शेल्फ के नीचे रखें।'
    ],
    dragSourceId: 'wooden_step_box',
    dragTargetId: 'high_ledge_base',
  ),
];
