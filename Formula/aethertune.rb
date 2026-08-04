class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.10.2"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.10.2/AetherTune-v0.10.2-macos-aarch64.tar.gz"
      sha256 "349a04952aa9fbc7f7b70430d78c9c4deab49fa1024c6e75a433f6cfb819fef2"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.10.2/AetherTune-v0.10.2-macos-x86_64.tar.gz"
      sha256 "4ecd284a91b5cee8adb701f913524a905ec8dbb53724149bed1d350a123443c5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.10.2/AetherTune-v0.10.2-linux-x86_64.tar.gz"
      sha256 "172f2a9f6f383b6924be9fa363277ef0a8ab9097e35a7fd1e7d5290dbb2076c5"
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
