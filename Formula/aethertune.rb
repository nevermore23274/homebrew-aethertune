class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.8.2"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.8.2/AetherTune-v0.8.2-macos-aarch64.tar.gz"
      sha256 "0ab5ccb1abe20d3588900a3955944d9f30124caa27416cd5249cfea3d257d5d2"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.8.2/AetherTune-v0.8.2-macos-x86_64.tar.gz"
      sha256 "b3164e6a2cfd2e2098c218249cd2c1daeb716ab16fd2d67d37d4ec964b0e35e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.8.2/AetherTune-v0.8.2-linux-x86_64.tar.gz"
      sha256 "59aa01dbbf53810ed93409ef5a424bc2e97a02b6c40a0b5add3e889ae7fa8c07"
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
