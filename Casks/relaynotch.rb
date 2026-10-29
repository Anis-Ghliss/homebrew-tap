# Homebrew cask for RelayNotch. scripts/release.sh fills in the version and checksum and
# publishes this to the Anis-Ghliss/homebrew-tap repo on every release.
cask "relaynotch" do
  version "1.5.3"
  sha256 "0267ade67ff5581e1ed79394437938ede0d7bab70afd81a96ae603929e7112d1"

  url "https://relaynotch.app/updates/RelayNotch-#{version}.zip"
  name "RelayNotch"
  desc "Notch for developers: AI coding agents, pull requests and CI at a glance"
  homepage "https://relaynotch.app"

  livecheck do
    url "https://relaynotch.app/updates/appcast.xml"
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
