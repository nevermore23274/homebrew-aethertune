class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.8.1"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.8.1/AetherTune-v0.8.1-macos-aarch64.tar.gz"
      sha256 "9e323bb74dab89adb0708a1bfaf9f89c4ed6d1e8e48702b36faa06f97b3296ad"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.8.1/AetherTune-v0.8.1-macos-x86_64.tar.gz"
      sha256 "dccb4c5a253e90d3657cf5e45849404953ac9389e2040b7252843d4f9e198399"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.8.1/AetherTune-v0.8.1-linux-x86_64.tar.gz"
      sha256 "f286fe9827cf4c4a4c39d4519a022216602da4dce2a4611fb233ba5c8f2b63a8"
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
