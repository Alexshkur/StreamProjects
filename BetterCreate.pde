public class Project {
  String LOG = "log", TMP = "tmp";
  PrintWriter tmp;
  PrintWriter log;
  String windowName = "BetterCreate";
  float version = 0.0;
  float FPS;
  boolean showFPS = false;
  boolean disable(String what) {
    try {
      switch(what) {
      case "log":
        log.close();
      }
    }
    catch(Exception e) {
      return false;
    }
    return true;
  }
  boolean setWindowName(String Name) {
    try {
      windowTitle(Name + " ver. " + version);
      windowName = Name;
      log.println("Название окна изменено на " + windowName);
      log.flush();
    }
    catch(Exception e) {
      return false;
    }
    return true;
  }
  boolean setVersion(float ver) {
    try {
      version = ver;
      windowTitle(windowName + " ver. " + version);
      log.println("Версия изменена на " + version);
      log.flush();
    }
    catch(Exception e) {
      return false;
    }
    return true;
  }
  boolean showFPS(boolean show) {
    try {
      showFPS = show;
      log.println("Теперь показ ФПС установлен в " + show);
      log.flush();
    }
    catch(Exception e) {
      return false;
    }
    return true;
  }
  boolean setup() {
    try {
      log = createWriter("data/BetterCreate.log");
    }
    catch(Exception e) {
      return false;
    }
    return true;
  }
}
boolean tick() {
  try {
    project.FPS = frameRate;
    project.tmp = createWriter("data/BetterCreate.tmp");
    project.tmp.println(project.windowName);
    project.tmp.println(project.version);
    project.tmp.println(project.FPS);
    project.tmp.flush();
    if (keyPressed && keyCode == CONTROL) {
      delay(50);
      if (keyPressed && key == 'q') {
        exit();
      }
    }
    if (project.showFPS) {
      textAlign(LEFT);
      fill(0);
      text("FPS:" + project.FPS, 10, 10);
    }
  }
  catch(Exception e) {
    return false;
  }
  return true;
}
Project project = new Project();
