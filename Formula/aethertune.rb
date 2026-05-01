class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  url "https://github.com/nevermore23274/AetherTune/releases/download/v0.8.0/AetherTune-v0.8.0-linux-x86_64.tar.gz"
  sha256 "dd4d2e4389d07557af4cc65b73b101af522080c230f9a1ba6ee1c8743fccd317"
  license "MIT"
  version "0.8.0"

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
