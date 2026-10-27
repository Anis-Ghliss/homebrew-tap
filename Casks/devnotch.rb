# Homebrew cask for DevNotch. scripts/release.sh fills in the version and checksum and
# publishes this to the Anis-Ghliss/homebrew-tap repo on every release.
cask "devnotch" do
  version "1.1.1"
  sha256 "834f6f5693d2effbca83285a4c1b1a21a065646edc00bce0990641525a5bb169"

  url "https://github.com/Anis-Ghliss/devnotch-releases/releases/download/v#{version}/DevNotch-#{version}.zip"
  name "DevNotch"
  desc "Notch for developers: AI coding agents, pull requests and CI at a glance"
  homepage "https://github.com/Anis-Ghliss/devnotch-releases"

  livecheck do
    url "https://github.com/Anis-Ghliss/devnotch-releases/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
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
    DevNotch is in beta: expect rough edges. Fixes arrive as automatic updates.
  EOS
end
