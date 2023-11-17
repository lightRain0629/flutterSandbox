

  void takeFieldsForFilter(mergedProductsList, Set<dynamic> goodTypes,
      Set<dynamic> goodCategories, Set<dynamic> goodBrands) async {
    for (var i = 0; i < ( await mergedProductsList.length ?? 0); i++) {
      goodTypes.add(mergedProductsList[i].typeName);
      goodCategories.add(mergedProductsList[i].groupName);
      goodBrands.add(mergedProductsList[i].brandName);
    }
  }
