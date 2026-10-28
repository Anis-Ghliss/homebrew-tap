# Homebrew cask for RelayNotch. scripts/release.sh fills in the version and checksum and
# publishes this to the Anis-Ghliss/homebrew-tap repo on every release.
cask "relaynotch" do
  version "1.3.0"
  sha256 "01d554a2a127a975786cc53f24ccd9dcc3b7ff23da3be95ecb4364bb7b42a6d9"

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
