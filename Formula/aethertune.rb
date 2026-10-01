class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.12.0"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.12.0/AetherTune-v0.12.0-macos-aarch64.tar.gz"
      sha256 "cb4b90cff56d5a0e8a93f5dcc9002dc7198baf9dc29d02b1ceb22457509057bb"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.12.0/AetherTune-v0.12.0-macos-x86_64.tar.gz"
      sha256 "1781727e7fbbe75a1aad39ae25065d63a2726d975e4389f0984f7b34619711e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.12.0/AetherTune-v0.12.0-linux-x86_64.tar.gz"
      sha256 "95b145c618e47c9e16c014b3c769f6dd2925ba2ada2d3a3646b528c10552f33f"
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
