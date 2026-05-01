class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  url "https://github.com/nevermore23274/AetherTune/releases/download/v0.7.6/AetherTune-v0.7.6-linux-x86_64.tar.gz"
  sha256 "006acd542be4772ae319b3fb6c247f06d9b3d9a3ae684e9cc624e3d2f2ce4dfe"
  license "MIT"
  version "0.7.6"

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
