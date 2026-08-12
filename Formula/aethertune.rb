class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.11.0"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.0/AetherTune-v0.11.0-macos-aarch64.tar.gz"
      sha256 "070c4e0276709eec4d073c29ee118fc9725f3b02a24957a5f5da6f988885475a"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.0/AetherTune-v0.11.0-macos-x86_64.tar.gz"
      sha256 "efa042e84d6fb08920e9abde0eac02b343f842ad6f40e920fe1d26c0a2ef12ca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.0/AetherTune-v0.11.0-linux-x86_64.tar.gz"
      sha256 "29a4729cf2dc3543bd1181c39a4734af60f9f6c632b8aa3326732086d25f270f"
    end
  end

  depends_on "mpv"

  def install
    bin.install "AetherTune" => "aethertune"
  end

  def caveats
    <<~EOS
      On Linux, you'll also need pulseaudio-utils or pipewire-pulse
      for real-time audio visualization.
      On macOS, the visualizer runs in simulated mode.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aethertune --version 2>&1", 2)
  end
end
