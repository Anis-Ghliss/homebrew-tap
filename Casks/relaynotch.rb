# Homebrew cask for RelayNotch. scripts/release.sh fills in the version and checksum and
# publishes this to the Anis-Ghliss/homebrew-tap repo on every release.
cask "relaynotch" do
  version "1.4.1"
  sha256 "7a83da1bd3323b0fe66d441ae210cbb3752a980629e69c7f78a6a7ab1a29f70f"

  url "https://github.com/Anis-Ghliss/relaynotch-releases/releases/download/v#{version}/RelayNotch-#{version}.zip"
  name "RelayNotch"
  desc "Notch for developers: AI coding agents, pull requests and CI at a glance"
  homepage "https://github.com/Anis-Ghliss/relaynotch-releases"

  livecheck do
    url "https://github.com/Anis-Ghliss/relaynotch-releases/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  # RelayNotch updates itself with Sparkle.
  auto_updates true
  depends_on macos: :sonoma

  app "RelayNotch.app"

  zap trash: [
    "~/Library/Application Support/Notchless",
    "~/Library/Caches/app.notchless.Notchless",
    "~/Library/HTTPStorages/app.notchless.Notchless",
    "~/Library/Preferences/app.notchless.Notchless.plist",
  ]

  caveats <<~EOS
    RelayNotch is in beta: expect rough edges. Fixes arrive as automatic updates.
  EOS
end
