import '../../models/interaction_type.dart';
import '../../models/puzzle_category.dart';
import '../../models/puzzle_level.dart';

final List<PuzzleLevel> levels1To25 = [
  // Level 1
  const PuzzleLevel(
    id: 1,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'Which elephant has the biggest ears?',
    questionHi: 'किस हाथी के कान सबसे बड़े हैं?',
    instructionEn: 'Tap the elephant with the biggest ears.',
    instructionHi: 'सबसे बड़े कान वाले हाथी पर टैप करें।',
    explanationEn: 'The elephant closest to you is the largest in perspective!',
    explanationHi: 'सामने वाला हाथी नजरिए (पर्सपेक्टिव) से सबसे बड़ा है!',
    hintsEn: [
      'Look at size perspective.',
      'Check the front elephant.',
      'Tap Elephant #3 on the right.',
    ],
    hintsHi: [
      'आकार और नजरिए पर ध्यान दें।',
      'सामने वाले हाथी को देखें।',
      'दाईं ओर हाथी #3 पर टैप करें।',
    ],
    options: ['Elephant A', 'Elephant B', 'Giant Elephant C', 'Baby Elephant'],
    optionsHi: ['हाथी अ', 'हाथी ब', 'विशाल हाथी स', 'छोटा हाथी'],
    solutionIndex: 2,
  ),

  // Level 2
  const PuzzleLevel(
    id: 2,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.tap,
    questionEn: 'Find the hidden owl in the tree!',
    questionHi: 'पेड़ में छिपा हुआ उल्लू ढूंढें!',
    instructionEn: 'Tap the camouflage spot on the tree branch.',
    instructionHi: 'पेड़ की टहनी पर छिपे हुए स्थान पर टैप करें।',
    explanationEn: 'The owl was blended right into the bark texture!',
    explanationHi: 'उल्लू पेड़ की छाल के पैटर्न में छिपा हुआ था!',
    hintsEn: [
      'Check near the main trunk split.',
      'Look for two big round eyes.',
      'Tap the middle left branch.',
    ],
    hintsHi: [
      'मुख्य टहनी के जोड़ के पास देखें।',
      'दो बड़ी गोल आंखों को खोजें।',
      'बाईं ओर की बीच वाली शाखा पर टैप करें।',
    ],
    solutionIndex: 1,
    extraData: {'itemsCount': 4},
  ),

  // Level 3
  const PuzzleLevel(
    id: 3,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Put the campfire out before it spreads!',
    questionHi: 'आग फैलने से पहले कैंपफ़ायर बुझाएं!',
    instructionEn: 'Drag the cloud over the campfire to rain on it.',
    instructionHi: 'आग पर बारिश करने के लिए बादल को खींचकर लाएं।',
    explanationEn:
        'Dragging the rain cloud directly over the fire extinguishes it!',
    explanationHi:
        'बारिश के बादल को आग पर लाने से पानी गिरता है और आग बुझ जाती है!',
    hintsEn: [
      'Look at the sky objects.',
      'Water extinguishes fire.',
      'Drag Cloud -> Campfire.',
    ],
    hintsHi: [
      'आसमान की चीजों को देखें।',
      'पानी से आग बुझती है।',
      'बादल को खींचकर आग पर रखें।',
    ],
    dragSourceId: 'cloud_rain',
    dragTargetId: 'campfire_fire',
  ),

  // Level 4
  const PuzzleLevel(
    id: 4,
    category: PuzzleCategory.mathNumbers,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'How many apples are on the tree if 3 fell off?',
    questionHi: 'अगर 3 सेब नीचे गिर गए, तो पेड़ पर कितने सेब बचे?',
    instructionEn: 'Count carefully. Do not forget the trick!',
    instructionHi: 'ध्यान से गिनें। चाल में न फंसें!',
    explanationEn: 'The fallen apples are on the ground, leaving 5 apples still on the branches!',
    explanationHi:
        'गिरे हुए सेब ज़मीन पर हैं, इसलिए पेड़ की टहनियों पर 5 सेब बचे हैं!',
    hintsEn: [
      'Look at the remaining apples on the branches.',
      'Don\'t subtract blindly.',
      'Tap 5.',
    ],
    hintsHi: [
      'टहनियों पर बचे हुए सेबों को गिनें।',
      'बिना सोचे न घटाएं।',
      '5 चुनें।',
    ],
    options: ['3', '5', '8', '0'],
    optionsHi: ['३', '५', '८', '०'],
    solutionIndex: 1,
  ),

  // Level 5
  const PuzzleLevel(
    id: 5,
    category: PuzzleCategory.patternRecognition,
    interactionType: InteractionType.tap,
    questionEn:
        'Tap the shapes in order of sides: Triangle -> Square -> Pentagon',
    questionHi: 'भुजाओं के क्रम में टैप करें: त्रिभुज -> वर्ग -> पंचभुज',
    instructionEn: 'Tap 3 sides, then 4 sides, then 5 sides.',
    instructionHi: 'पहले 3 भुजाएं, फिर 4, फिर 5 भुजाओं वाली आकृति पर टैप करें।',
    explanationEn: '3 sides (Triangle), 4 sides (Square), 5 sides (Pentagon)!',
    explanationHi: '3 भुजाएं (त्रिभुज), 4 भुजाएं (वर्ग), 5 भुजाएं (पंचभुज)!',
    hintsEn: [
      'Count geometric corners.',
      'Triangle is first.',
      'Sequence: [0, 1, 2]',
    ],
    hintsHi: ['कोनों को गिनें।', 'त्रिभुज पहला है।', 'क्रम: [0, 1, 2]'],
    targetSequence: [0, 1, 2],
  ),

  // Level 6
  const PuzzleLevel(
    id: 6,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn:
        'If a electric train runs North, which way does the smoke blow?',
    questionHi: 'यदि एक इलेक्ट्रिक ट्रेन उत्तर की ओर चलती है, तो धुआं किस दिशा में जाएगा?',
    instructionEn: 'Think carefully about electric trains!',
    instructionHi: 'इलेक्ट्रिक ट्रेन के बारे में ध्यान से सोचें!',
    explanationEn: 'Electric trains don\'t produce smoke!',
    explanationHi: 'इलेक्ट्रिक ट्रेनें धुआं नहीं छोड़ती हैं!',
    hintsEn: [
      'What powers the train?',
      'Does electricity emit smoke?',
      'Select "No Smoke".',
    ],
    hintsHi: [
      'ट्रेन किससे चलती है?',
      'क्या बिजली से धुआं निकलता है?',
      '"कोई धुआं नहीं" चुनें।',
    ],
    options: ['North', 'South', 'West', 'No Smoke!'],
    optionsHi: ['उत्तर', 'दक्षिण', 'पश्चिम', 'कोई धुआं नहीं!'],
    solutionIndex: 3,
  ),

  // Level 7
  const PuzzleLevel(
    id: 7,
    category: PuzzleCategory.positioning,
    interactionType: InteractionType.positioning,
    questionEn: 'Park the red car neatly inside the yellow box!',
    questionHi: 'लाल कार को पीले बॉक्स के अंदर पार्क करें!',
    instructionEn: 'Drag the red car into the marked parking slot.',
    instructionHi: 'लाल कार को खींचकर पार्किंग बॉक्स में रखें।',
    explanationEn: 'The car is now safely parked in the center slot!',
    explanationHi: 'कार अब सुरक्षित रूप से बॉक्स के बीच में पार्क है!',
    hintsEn: [
      'Move the car directly.',
      'Align with yellow dashed border.',
      'Aim for the middle of the outlined circle.',
    ],
    hintsHi: [
      'कार को सीधे खिसकाएं।',
      'पीली सीमा रेखा में मिलाएं।',
      'निशाने के ठीक बीच में लक्ष्य करें।',
    ],
    positionTarget: {'x': 0.52, 'y': 0.57, 'tolerance': 0.14},
  ),

  // Level 8
  const PuzzleLevel(
    id: 8,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.patternObservation,
    questionEn: 'What number comes next? 2, 4, 8, 16, ?',
    questionHi: 'अगली संख्या क्या होगी? 2, 4, 8, 16, ?',
    instructionEn: 'Type the next number in the doubling sequence.',
    instructionHi: 'दोगुनी होने वाली श्रृंखला में अगली संख्या टाइप करें।',
    explanationEn: 'Each number doubles! 16 x 2 = 32.',
    explanationHi: 'हर संख्या दोगुनी हो रही है! 16 x 2 = 32.',
    hintsEn: ['Multiply by 2 each time.', '16 times 2.', 'Answer is 32.'],
    hintsHi: [
      'हर बार 2 से गुणा करें।',
      '16 को 2 से गुणा करें।',
      'उत्तर 32 है।',
    ],
    extraData: {'answer': '32'},
  ),

  // Level 9
  const PuzzleLevel(
    id: 9,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Feed the hungry monkey!',
    questionHi: 'भूखे बंदर को खाना खिलाएं!',
    instructionEn: 'Peel the banana first by dragging peel away, then feed it.',
    instructionHi: 'पहले केला छीलें फिर बंदर के पास ले जाएं।',
    explanationEn: 'Peeling the banana made it edible for the happy monkey!',
    explanationHi: 'केला छीलने के बाद ही बंदर ने उसे चाव से खाया!',
    hintsEn: [
      'Monkeys love peeled bananas.',
      'Drag peel off banana.',
      'Drag Banana -> Monkey.',
    ],
    hintsHi: [
      'बंदर छिला हुआ केला पसंद करते हैं।',
      'केला छीलें।',
      'केले को बंदर पर खींचें।',
    ],
    dragSourceId: 'peeled_banana',
    dragTargetId: 'hungry_monkey',
  ),

  // Level 10
  const PuzzleLevel(
    id: 10,
    category: PuzzleCategory.multiStepMaster,
    interactionType: InteractionType.multiStep,
    questionEn: 'Make a cup of hot tea!',
    questionHi: 'एक कप गरमा-गरम चाय बनाएं!',
    instructionEn: 'Step 1: Water into kettle. Step 2: Boil kettle. Step 3: Pour into cup.',
    instructionHi: 'चरण 1: पानी केतली में। चरण 2: उबालें। चरण 3: कप में डालें।',
    explanationEn: 'Water + Heat + Cup = Fresh Delicious Tea!',
    explanationHi: 'पानी + गर्मी + कप = ताज़ा और स्वादिष्ट चाय!',
    hintsEn: [
      'Follow tea brewing steps.',
      'Boil before pouring.',
      'Complete 3 steps sequentially.',
    ],
    hintsHi: [
      'चाय बनाने के चरणों का पालन करें।',
      'डालने से पहले उबालें।',
      '3 चरण पूरे करें।',
    ],
    extraData: {
      'totalSteps': 3,
      'stepTextsEn': [
        'Pour water into the kettle',
        'Boil the water',
        'Pour the tea into the cup',
      ],
      'stepTextsHi': [
        'केतली में पानी डालें',
        'पानी को उबालें',
        'चाय को कप में डालें',
      ],
    },
  ),

  // Level 11
  const PuzzleLevel(
    id: 11,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'Which bucket fills up first with water?',
    questionHi: 'कौन सी बाल्टी सबसे पहले पानी से भरेगी?',
    instructionEn: 'Trace the pipes carefully to see blocked routes!',
    instructionHi: 'बंद रास्तों को देखने के लिए पाइपों को ध्यान से देखें!',
    explanationEn: 'Pipes to A and C are blocked, so Bucket B fills first!',
    explanationHi: 'अ और स के पाइप बंद हैं, इसलिए बाल्टी ब सबसे पहले भरेगी!',
    hintsEn: [
      'Look for solid blocked pipe caps.',
      'Pipe to Bucket A is closed.',
      'Bucket B has open path.',
    ],
    hintsHi: [
      'बंद पाइप कैप्स को देखें।',
      'बाल्टी अ का रास्ता बंद है।',
      'बाल्टी ब का रास्ता खुला है।',
    ],
    options: ['Bucket A', 'Bucket B', 'Bucket C', 'All at once'],
    optionsHi: ['बाल्टी अ', 'बाल्टी ब', 'बाल्टी स', 'सब एक साथ'],
    solutionIndex: 1,
  ),

  // Level 12
  const PuzzleLevel(
    id: 12,
    category: PuzzleCategory.memoryTimed,
    interactionType: InteractionType.timedMemory,
    questionEn: 'Memorize & repeat the light sequence: Green -> Red -> Blue',
    questionHi: 'रंगों का क्रम याद रखें और दोहराएं: हरा -> लाल -> नीला',
    instructionEn: 'Tap Green, then Red, then Blue.',
    instructionHi: 'पहले हरा, फिर लाल, फिर नीला दबाएं।',
    explanationEn: 'You correctly remembered the color pattern!',
    explanationHi: 'आपने रंगों के क्रम को सही ढंग से याद रखा!',
    hintsEn: [
      'Green is index 0.',
      'Red is index 1.',
      'Sequence is Green (0) -> Red (1) -> Blue (2).',
    ],
    hintsHi: ['हरा 0 पर है।', 'लाल 1 पर है।', 'क्रम: हरा -> लाल -> नीला।'],
    targetSequence: [0, 1, 2],
  ),

  // Level 13
  const PuzzleLevel(
    id: 13,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.tap,
    questionEn: 'Find the different coin!',
    questionHi: 'दूसरों से अलग सिक्का ढूंढें!',
    instructionEn: 'One coin has an inverted emblem!',
    instructionHi: 'एक सिक्के पर उल्टा निशान बना है!',
    explanationEn: 'Coin #4 had an upside-down star emblem!',
    explanationHi: 'सिक्का #4 पर उल्टा तारा बना था!',
    hintsEn: [
      'Look at the central stars.',
      'Coin on bottom right is flipped.',
      'Tap Coin 4.',
    ],
    hintsHi: [
      'बीच वाले तारों को देखें।',
      'नीचे दाईं ओर का सिक्का उल्टा है।',
      'सिक्का 4 पर टैप करें।',
    ],
    solutionIndex: 3,
    extraData: {'itemsCount': 4},
  ),

  // Level 14
  const PuzzleLevel(
    id: 14,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Balance the seesaw perfectly!',
    questionHi: 'सी-सॉ (झूले) को पूरी तरह संतुलित करें!',
    instructionEn:
        'Drag the small weight to the left end and heavy weight near center.',
    instructionHi: 'छोटे वजन को दूर और भारी वजन को केंद्र के पास रखें।',
    explanationEn:
        'Torque physics balanced! Mass x Distance equalized both sides.',
    explanationHi: 'भौतिकी का संतुलन! दोनों तरफ का टॉर्क बराबर हो गया।',
    hintsEn: [
      'Physics torque rule applies.',
      'Heavy item closer to pivot.',
      'Drag Heavy Weight -> Center Slot.',
    ],
    hintsHi: [
      'टॉर्क का नियम लागू होता है।',
      'भारी वस्तु केंद्र के पास रखी जाएगी।',
      'भारी वजन को केंद्र में रखें।',
    ],
    dragSourceId: 'heavy_weight',
    dragTargetId: 'seesaw_center',
  ),

  // Level 15
  const PuzzleLevel(
    id: 15,
    category: PuzzleCategory.mathNumbers,
    interactionType: InteractionType.multipleChoice,
    questionEn: '3 cats catch 3 mice in 3 minutes. How many cats catch 100 mice in 100 minutes?',
    questionHi: '3 बिल्लियां 3 मिनट में 3 चूहे पकड़ती हैं। 100 मिनट में 100 चूहे पकड़ने के लिए कितनी बिल्लियां चाहियें?',
    instructionEn: 'Think rate per cat!',
    instructionHi: 'प्रति बिल्ली की गति सोचें!',
    explanationEn: 'Each cat catches 1 mouse every 3 minutes! So 3 cats will catch 100 mice in 100 minutes!',
    explanationHi: 'हर बिल्ली 3 मिनट में 1 चूहा पकड़ती है! तो 3 बिल्लियां 100 मिनट में 100 चूहे पकड़ लेंगी!',
    hintsEn: [
      'Calculate time per mouse per cat.',
      '1 cat catches 1 mouse in 3 minutes.',
      'Answer is 3 cats!',
    ],
    hintsHi: [
      'प्रति बिल्ली समय की गणना करें।',
      '1 बिल्ली 3 मिनट में 1 चूहा पकड़ती है।',
      'उत्तर 3 बिल्लियां हैं!',
    ],
    options: ['100 Cats', '33 Cats', '3 Cats', '1 Cat'],
    optionsHi: ['१०० बिल्लियां', '३३ बिल्लियां', '३ बिल्लियां', '१ बिल्ली'],
    solutionIndex: 2,
  ),

  // Level 16
  const PuzzleLevel(
    id: 16,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'Turn off all the lights in the room!',
    questionHi: 'कमरे की सारी बत्तियां बुझाएं!',
    instructionEn: 'Tap the main circuit breaker, not individual light bulbs!',
    instructionHi: 'अलग-अलग बल्बों के बजाय मेन स्विच पर टैप करें!',
    explanationEn: 'Flipping the main switch turns off all lights instantly!',
    explanationHi:
        'मेन स्विच बंद करते ही कमरे की सारी बत्तियां एक साथ बंद हो गईं!',
    hintsEn: [
      'Individual bulbs take too long.',
      'Look for the master switch.',
      'Tap "Main Switch".',
    ],
    hintsHi: [
      'एक-एक करके बंद करने में समय लगेगा।',
      'मुख्य (मेन) स्विच खोजें।',
      '"मेन स्विच" पर टैप करें।',
    ],
    options: ['Bulb 1', 'Bulb 2', 'Bulb 3', 'Main Switch'],
    optionsHi: ['बल्ब १', 'बल्ब २', 'बल्ब ३', 'मेन स्विच'],
    solutionIndex: 3,
  ),

  // Level 17
  const PuzzleLevel(
    id: 17,
    category: PuzzleCategory.patternRecognition,
    interactionType: InteractionType.patternObservation,
    questionEn: 'How many triangles are in this star shape?',
    questionHi: 'इस तारे की आकृति में कुल कितने त्रिभुज हैं?',
    instructionEn:
        'Count small outer triangles + large inner overlapping triangles.',
    instructionHi:
        'छोटे बाहरी त्रिभुजों और बड़े आंतरिक त्रिभुजों को मिलाकर गिनें।',
    explanationEn: '5 small outer points + 1 large central pentagram triangle structures = 8 triangles!',
    explanationHi:
        '5 छोटे बाहरी कोने + 3 बड़े आंतरिक मिलाकर कुल 8 त्रिभुज हैं!',
    hintsEn: [
      'Don\'t miss the overlapping big ones.',
      'Count 5 outer + 3 inner.',
      'Answer is 8.',
    ],
    hintsHi: [
      'बड़े वाले त्रिभुजों को न भूलें।',
      '5 बाहरी + 3 आंतरिक।',
      'उत्तर 8 है।',
    ],
    extraData: {'answer': '8'},
  ),

  // Level 18
  const PuzzleLevel(
    id: 18,
    category: PuzzleCategory.positioning,
    interactionType: InteractionType.positioning,
    questionEn: 'Fit the triangular piece into the puzzle grid!',
    questionHi: 'त्रिभुज के टुकड़े को पहेली की ग्रिड में सही बैठाएं!',
    instructionEn: 'Drag the triangle onto the marked circle.',
    instructionHi: 'त्रिभुज को खींचकर चिह्नित गोल निशान पर लाएं।',
    explanationEn: 'The piece clicked right into place!',
    explanationHi: 'टुकड़ा पहेली में एकदम सही फिट हो गया!',
    hintsEn: [
      'Align points with hollow slot.',
      'Move right and slightly up.',
      'Drop it onto the outlined circle.',
    ],
    hintsHi: [
      'कोनों को खाली जगह से मिलाएं।',
      'दिए गए स्थान की ओर खिसकाएं।',
      'घेरे हुए गोल निशान पर छोड़ दें।',
    ],
    positionTarget: {'x': 0.69, 'y': 0.43, 'tolerance': 0.12},
  ),

  // Level 19
  const PuzzleLevel(
    id: 19,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Wake up the sleeping panda!',
    questionHi: 'सोए हुए पांडा को जगाएं!',
    instructionEn: 'Drag the bamboo shoot near its nose to let it smell food.',
    instructionHi:
        'बांस की टहनी को खींचकर उसकी नाक के पास लाएं ताकि वह खुशबू सूंघ सके।',
    explanationEn: 'The delicious bamboo smell woke the panda right up!',
    explanationHi: 'बांस की खुशबू सूंघते ही पांडा तुरंत जाग गया!',
    hintsEn: [
      'Pandas love bamboo.',
      'Place food near nostrils.',
      'Drag Bamboo -> Panda Nose.',
    ],
    hintsHi: [
      'पांडा को बांस पसंद है।',
      'भोजन को नाक के पास रखें।',
      'बांस को पांडा की नाक पर खींचें।',
    ],
    dragSourceId: 'bamboo_shoot',
    dragTargetId: 'panda_nose',
  ),

  // Level 20
  const PuzzleLevel(
    id: 20,
    category: PuzzleCategory.multiStepMaster,
    interactionType: InteractionType.multiStep,
    questionEn: 'Unlock the secret safe box!',
    questionHi: 'गुप्त तिजोरी का ताला खोलें!',
    instructionEn:
        'Step 1: Insert key. Step 2: Turn key right. Step 3: Open latch.',
    instructionHi:
        'चरण 1: चाबी लगाएं। चरण 2: चाबी दाएं घुमाएं। चरण 3: हैंडल खोलें।',
    explanationEn: 'Click! The vault door swings open revealing gold coins!',
    explanationHi:
        'खटक्! तिजोरी का दरवाजा खुल गया और सोने के सिक्के दिखने लगे!',
    hintsEn: [
      'Key goes in keyhole first.',
      'Rotate clockwise.',
      '3 steps sequence.',
    ],
    hintsHi: [
      'पहले चाबी लगाएं।',
      'घड़ी की दिशा में घुमाएं।',
      '3 चरणों का पालन करें।',
    ],
    extraData: {
      'totalSteps': 3,
      'stepTextsEn': [
        'Insert the key into the lock',
        'Turn the key to the right',
        'Open the latch',
      ],
      'stepTextsHi': [
        'ताले में चाबी लगाएं',
        'चाबी को दाएं घुमाएं',
        'हैंडल खोलें',
      ],
    },
  ),

  // Level 21
  const PuzzleLevel(
    id: 21,
    category: PuzzleCategory.logic,
    interactionType: InteractionType.multipleChoice,
    questionEn: 'Which statement is ALWAYS true?',
    questionHi: 'कौन सा कथन हमेशा सत्य (TRUE) होता है?',
    instructionEn: 'Read carefully and evaluate logical necessity.',
    instructionHi: 'ध्यान से पढ़ें और तार्किक सत्य को समझें।',
    explanationEn:
        'Tomorrow has not happened yet, so tomorrow is always in the future!',
    explanationHi:
        'कल अभी तक नहीं आया है, इसलिए "कल" हमेशा भविष्य में ही होता है!',
    hintsEn: [
      'Think about time.',
      'Yesterday is past, Tomorrow is future.',
      'Choose "Tomorrow comes after today".',
    ],
    hintsHi: [
      'समय के बारे में सोचें।',
      'बीता कल अतीत है, आने वाला कल भविष्य।',
      '"कल हमेशा आज के बाद आता है" चुनें।',
    ],
    options: [
      'Cats fly in space',
      'Tomorrow comes after today',
      'Sun rises in West',
      'Water boils at 0°C',
    ],
    optionsHi: [
      'बिल्लियां उड़ती हैं',
      'कल हमेशा आज के बाद आता है',
      'सूर्य पश्चिम में उगता है',
      'पानी 0°C पर उबलता है',
    ],
    solutionIndex: 1,
  ),

  // Level 22
  const PuzzleLevel(
    id: 22,
    category: PuzzleCategory.observation,
    interactionType: InteractionType.tap,
    questionEn: 'Tap the fastest animal on the screen!',
    questionHi: 'स्क्रीन पर सबसे तेज़ जानवर पर टैप करें!',
    instructionEn: 'Cheetah, Turtle, Snail, Sloth.',
    instructionHi: 'चीता, कछुआ, घोंघा, सुस्त।',
    explanationEn:
        'Cheetah is the land speed champion reaching up to 120 km/h!',
    explanationHi: 'चीता ज़मीन पर सबसे तेज़ भागने वाला जीव है!',
    hintsEn: [
      'Which animal sprints like lightning?',
      'Spotted feline predator.',
      'Tap Cheetah (Index 0).',
    ],
    hintsHi: [
      'कौन सा जानवर बिजली की तरह भागता है?',
      'चित्तीदार शिकारी।',
      'चीता (इंडेक्स 0) पर टैप करें।',
    ],
    solutionIndex: 0,
  ),

  // Level 23
  const PuzzleLevel(
    id: 23,
    category: PuzzleCategory.memoryTimed,
    interactionType: InteractionType.timedMemory,
    questionEn: 'Tap numbers in ascending order: 1 -> 5 -> 9 -> 12',
    questionHi: 'बढ़ते क्रम में संख्याओं पर टैप करें: 1 -> 5 -> 9 -> 12',
    instructionEn: 'Tap smallest to largest.',
    instructionHi: 'सब्स छोटी से सबसे बड़ी संख्या पर टैप करें।',
    explanationEn: '1, 5, 9, 12 is in perfect ascending order!',
    explanationHi: '1, 5, 9, 12 एकदम सही बढ़ते क्रम में है!',
    hintsEn: ['Start with 1.', 'Then 5.', 'Sequence: [0, 1, 2, 3]'],
    hintsHi: ['1 से शुरू करें।', 'फिर 5।', 'क्रम: [0, 1, 2, 3]'],
    targetSequence: [0, 1, 2, 3],
  ),

  // Level 24
  const PuzzleLevel(
    id: 24,
    category: PuzzleCategory.mathNumbers,
    interactionType: InteractionType.patternObservation,
    questionEn: 'If 1=5, 2=25, 3=125, 4=625, then 5=?',
    questionHi: 'यदि 1=5, 2=25, 3=125, 4=625, तो 5=?',
    instructionEn: 'Look back at the first equation!',
    instructionHi: 'पहले समीकरण को ध्यान से देखें!',
    explanationEn: 'If 1 = 5, then logically 5 = 1!',
    explanationHi: 'अगर 1 = 5 है, तो तार्किक रूप से 5 = 1 होगा!',
    hintsEn: ['Don\'t compute 5^5.', 'Read statement 1 again.', 'Answer is 1.'],
    hintsHi: ['5^5 की गणना न करें।', 'पहला वाक्य फिर से पढ़ें।', 'उत्तर 1 है।'],
    extraData: {'answer': '1'},
  ),

  // Level 25
  const PuzzleLevel(
    id: 25,
    category: PuzzleCategory.trickPhysics,
    interactionType: InteractionType.dragDrop,
    questionEn: 'Help the car cross the broken bridge!',
    questionHi: 'टूटे हुए पुल को पार करने में कार की मदद करें!',
    instructionEn: 'Drag the wooden plank over the chasm gap.',
    instructionHi: 'लकड़ी के तख्ते को खींचकर पुल की दरार पर रखें।',
    explanationEn:
        'The wooden plank covered the gap so the car could zoom across safely!',
    explanationHi:
        'लकड़ी का तख्ता रखते ही रास्ता बन गया और कार सुरक्षित निकल गई!',
    hintsEn: [
      'Bridge has a missing section.',
      'Wood plank bridges gap.',
      'Drag Wooden Plank -> Bridge Gap.',
    ],
    hintsHi: [
      'पुल का एक हिस्सा गायब है।',
      'लकड़ी का तख्ता दरार भरेगा।',
      'तख्ते को पुल की दरार पर रखें।',
    ],
    dragSourceId: 'wooden_plank',
    dragTargetId: 'bridge_gap',
  ),
];
