class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.11.2"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.2/AetherTune-v0.11.2-macos-aarch64.tar.gz"
      sha256 "2c6bfab86e6847f4ea1cdf6d2be78eba52858ac2c7f90729c331b49be142eedc"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.2/AetherTune-v0.11.2-macos-x86_64.tar.gz"
      sha256 "0d4a3048323ab7fa5b29cbb7d51241a15496855714c37a46d43b3c528774a29c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.2/AetherTune-v0.11.2-linux-x86_64.tar.gz"
      sha256 "3f4bed1e72bf05518af3397fbf31c973e36d2fccc04218617d0c2ad1916729dc"
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
