class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  url "https://github.com/nevermore23274/AetherTune/releases/download/v0.7.3/AetherTune-v0.7.3-linux-x86_64.tar.gz"
  sha256 "de23a15297ce3a46411b6cc397fe9ba5386343595f9f0e95d8cb979e6b31d8d7"
  license "MIT"
  version "0.7.3"

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
