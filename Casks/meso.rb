cask "meso" do
  version "0.2.2"
  sha256 "6781aa94cd5b2affb08da8c9c9ad75ab82fa9f361588e047a0618f034270341c"

  url "https://github.com/linmi/meso/releases/download/v#{version}/Meso-#{version}.dmg",
      verified: "github.com/linmi/meso/"
  name "Meso"
  desc "Manage and automate mice, keyboards, trackpads, remotes and other devices"
  homepage "https://meso.ac/"

  livecheck do
    url "https://linmi.github.io/meso/appcast.xml"
    # The feed also carries Beta items (sparkle:channel beta); the cask follows stable only.
    strategy :sparkle do |items|
      items.find { |item| item.channel.nil? }&.short_version
    end
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Meso.app"

  uninstall launchctl: "ac.meso.app.packetlogger",
            quit:      "ac.meso.app",
            delete:    "/Library/Audio/Plug-Ins/HAL/MesoMicrophone.driver"

  zap trash: [
    "/var/db/ac.meso.app.packetlogger",
    "~/Library/Application Support/Meso",
    "~/Library/Caches/ac.meso.app",
    "~/Library/HTTPStorages/ac.meso.app",
    "~/Library/Preferences/ac.meso.app.plist",
    "~/Library/Saved Application State/ac.meso.app.savedState",
  ]
end
