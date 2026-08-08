class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.10.2"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.10.2/AetherTune-v0.10.2-macos-aarch64.tar.gz"
      sha256 "7fce5bf94c6b732b9929789d6e34275956a88d2af672da70a681cba95ca3c9a7"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.10.2/AetherTune-v0.10.2-macos-x86_64.tar.gz"
      sha256 "84e6fd5794eb21ab1f1db1bf56f1f330387a26653c01fcebaab203ccbb9914b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.10.2/AetherTune-v0.10.2-linux-x86_64.tar.gz"
      sha256 "efa1c58522aae83e4c2faa16ed39a9635e7a28f3d41498e54800c4e3a3f81662"
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
