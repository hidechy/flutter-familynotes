class SelectPanelConstValue {
  //nutrition

  final List<Map<String, String>> nutritionValueList = [
    {'key': '1', 'value': '母乳'},
    {'key': '2', 'value': '人工乳'},
    {'key': '3', 'value': '混合'}
  ];

  final List<Map<String, String>> nutritionMilkValueList = [
    {'key': '1', 'value': '飲んでいない'},
    {'key': '2', 'value': '飲んでいる'},
  ];

  final List<Map<String, String>> nutritionWeaningValueList = [
    {'key': '1', 'value': '完了'},
    {'key': '2', 'value': '未完了'},
  ];

  final List<Map<String, String>> nutritionCheckValueList = [
    {'key': '1', 'value': '良'},
    {'key': '2', 'value': '要指導'}
  ];

  //dental

  final List<Map<String, String>> dentalCheckDecayValueList = [
    {'key': '0', 'value': 'なし'},
    {'key': '1', 'value': '要注意'},
    {'key': '2', 'value': 'あり'}
  ];

  final List<String> resultPulldownValues4 = [
    '',
    '問題なし',
    '要指導',
    '要経過観察',
    '要治療'
  ];

  //detail

  final List<Map<String, String>> valueList = [
    {'key': '0', 'value': '-'},
    {'key': '1', 'value': '+'}
  ];

  final List<String> resultPulldownValues2 = [
    '',
    '異常なし',
    '既医療',
    '要経過観察',
    '要紹介（要精密）',
    '要紹介（要治療）'
  ];

  //precision

  final List<String> resultPulldownValues3 = ['', '異常なし', '要経過観察', '要医療'];

  //urinalysis

  final List<Map<String, String>> urinalysisValueList = [
    {'key': '1', 'value': '－'},
    {'key': '2', 'value': '±'},
    {'key': '3', 'value': '＋'}
  ];

  ///////////////////////////////////////////////////////
  // parent_report

  //detail

  final List<Map<String, String>> anxietyChildRearingValueList = [
    {'key': '1', 'value': 'はい'},
    {'key': '2', 'value': 'いいえ'},
    {'key': '3', 'value': '何ともいえない'}
  ];

  ///////////////////////////////////////////////////////
  // child

  final List<Map<String, String>> childGendarValueList = [
    {'key': '1', 'value': '男の子'},
    {'key': '2', 'value': '女の子'},
  ];
}
