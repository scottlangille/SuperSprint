class Settings {
  String[][] settingsData;
  int cols;

  String[] lines;

  Settings() {
    lines = loadStrings("settings.txt");
    cols = split(lines[0], '\t').length;

    settingsData = new String[lines.length-1][cols];

    parseDataFile();
  }

  void parseDataFile() {
    for (int i = 1; i < lines.length; i++) { // Skip first line (titles)
      String[] pieces = split(lines[i], '\t');
      //println();

      for (int j = 0; j < cols; j++) {
        settingsData[i-1][j] = pieces[j];
        //print(settingsData[i-1][j] + ", ");
      }
    }
  }

  // https://stackoverflow.com/questions/338887/java-generics-generic-type-defined-as-return-type-only

  int getIDofSetting(String name) {
    for (int i = 0; i < settingsData.length; i++) {
      if (name.equals(settingsData[i][0])) {
        return i;
      }
    }
    return -1;
  }

  <T> T getProperty(String name) {
    int settingID = getIDofSetting(name);
    
    if (settingID == -1) return (T) "Failure1";

    if (settingsData[settingID][3].equals("bool")) {
      return (T) Boolean.valueOf(settingsData[settingID][2]);
    } else if (settingsData[settingID][3].equals("int")) {
      return (T) Integer.valueOf(settingsData[settingID][2]);
    } else if (settingsData[settingID][3].equals("float")) {
      return (T) Float.valueOf(settingsData[settingID][2]);
    } else if (settingsData[settingID][3].equals("char")) {
      return (T) new Character((settingsData[settingID][2]).charAt(0));
    } else {
      return (T) "Failure2";
    }
  }
}
