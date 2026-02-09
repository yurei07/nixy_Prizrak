# Discord is a popular chat application.
{
  pkgs,
  lib,
  ...
}: {
  home.packages = [pkgs.vesktop];
  # Записываем конфиг туда, где ты его нашел (в папку settings)
  xdg.configFile."vesktop/settings/settings.json".text = builtins.toJSON {
    discordBranch = "stable";
    firstLaunch = false;
    useQuickCss = true;
    # Двойная запись для верности (Vesktop капризный)
    enabledPlugins = {
      FakeNitro = true;
      FakeProfileThemes = true;
      MessageLogger = true;
      VoiceMessages = true;
      MemberCount = true;
      ShowMeYourName = true;
      ShikiCodeblocks = true;
      Translate = true;
      ViewRaw = true;
      SilentTyping = true;
      USRBG = true;
      Decor = true;
    };
    plugins = {
      FakeNitro.enabled = true;
      FakeProfileThemes.enabled = true;
      MessageLogger.enabled = true;
      VoiceMessages.enabled = true;
      MemberCount.enabled = true;
      ShowMeYourName.enabled = true;
      ShikiCodeblocks.enabled = true;
      Translate.enabled = true;
      ViewRaw.enabled = true;
      SilentTyping.enabled = true;
      USRBG.enabled = true; #
      Decor.enabled = true; #
      CommandsAPI.enabled = true;
      UserSettingsAPI.enabled = true;
      MessageAccessoriesAPI.enabled = true;
    };
  };
}
