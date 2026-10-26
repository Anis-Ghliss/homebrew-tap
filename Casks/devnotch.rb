# Homebrew cask for DevNotch. scripts/release.sh fills in the version and checksum and
# publishes this to the Anis-Ghliss/homebrew-tap repo on every release.
cask "devnotch" do
  version "1.1.0"
  sha256 "8d262e37ab38affdcb39fa96b18865a86cedae8a8779e2f754a49320dbe1359a"

  url "https://github.com/Anis-Ghliss/devnotch-releases/releases/download/v#{version}/DevNotch-#{version}.zip"
  name "DevNotch"
  desc "Notch for developers: AI coding agents, pull requests and CI at a glance"
  homepage "https://github.com/Anis-Ghliss/devnotch-releases"

  livecheck do
    url "https://github.com/Anis-Ghliss/devnotch-releases/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  # DevNotch updates itself with Sparkle.
  auto_updates true
  depends_on macos: :sonoma

  app "DevNotch.app"

  zap trash: [
    "~/Library/Application Support/Notchless",
    "~/Library/Caches/app.notchless.Notchless",
    "~/Library/HTTPStorages/app.notchless.Notchless",
    "~/Library/Preferences/app.notchless.Notchless.plist",
  ]

  caveats <<~EOS
    DevNotch isn't notarized yet, so macOS blocks it on first launch. Open it once, then
    allow it under System Settings → Privacy & Security → Open Anyway.
  EOS
end
