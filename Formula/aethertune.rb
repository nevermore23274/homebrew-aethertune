class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.10.1"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.10.1/AetherTune-v0.10.1-macos-aarch64.tar.gz"
      sha256 "4c6504dbf730561b69c2714525c22d2dc08586e03ab6b2645a4d2d2c2ca0c464"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.10.1/AetherTune-v0.10.1-macos-x86_64.tar.gz"
      sha256 "f52ec6da4ab57d20117393de4dde244e8ae35b1f4ca48ae8d127e6608ef362d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.10.1/AetherTune-v0.10.1-linux-x86_64.tar.gz"
      sha256 "4e4a6a82fbbe75739a0041621604910ae79db8baa97c8021e65cb7a53ed655a7"
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
