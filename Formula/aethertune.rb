class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.11.1"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.1/AetherTune-v0.11.1-macos-aarch64.tar.gz"
      sha256 "af1e3b073c73ea2758f12e22fbe14d1370d95805af1fc95ff631e5f815bb19ff"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.1/AetherTune-v0.11.1-macos-x86_64.tar.gz"
      sha256 "45cdcca984d67ec854c89467fcac3ad4aaacfb69393c780d729415814f61a3e5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.1/AetherTune-v0.11.1-linux-x86_64.tar.gz"
      sha256 "3b226ee86d06db3dafc0a14b495d7b1cfa325c387203b31dffeade5990c97463"
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
