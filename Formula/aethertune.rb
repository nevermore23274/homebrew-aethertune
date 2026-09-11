class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.11.3"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.3/AetherTune-v0.11.3-macos-aarch64.tar.gz"
      sha256 "7684c996163b70c6d45bf632c73345b922e86b61a2a991803de48e20b064b839"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.3/AetherTune-v0.11.3-macos-x86_64.tar.gz"
      sha256 "8fc3442a0526b5fbc18835eb28b3f42235d3a0582cfbeb772a0555978ab10624"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.3/AetherTune-v0.11.3-linux-x86_64.tar.gz"
      sha256 "8c01ddf6643cf578ee437bb44ff34807c3e43fb3d696db5d61aa6ac441d8584d"
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
