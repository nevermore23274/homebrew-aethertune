class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.11.3"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.3/AetherTune-v0.11.3-macos-aarch64.tar.gz"
      sha256 "8837311212d83b4eea224ab1d56f8dceea0d9ea83d4917374e590b78c3b05412"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.3/AetherTune-v0.11.3-macos-x86_64.tar.gz"
      sha256 "932e1825b518932736faf16696d586970816912b6072bab810a0295facb93a7b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.3/AetherTune-v0.11.3-linux-x86_64.tar.gz"
      sha256 "4081c528ca6a2ab6a3abfea7b96be96e5e06b2d9b28a3231c572d0f5c1ef4464"
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
