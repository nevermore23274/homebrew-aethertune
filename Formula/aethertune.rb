class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.9.0"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.9.0/AetherTune-v0.9.0-macos-aarch64.tar.gz"
      sha256 "a78b6d3c54314b68ef708a1b5223abb6419f810d350e0ec57e6fb618845a92a5"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.9.0/AetherTune-v0.9.0-macos-x86_64.tar.gz"
      sha256 "6b409829c756d527ddbe1aad052e1d62e0aa12f27127405c8c7dd3036d71f681"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.9.0/AetherTune-v0.9.0-linux-x86_64.tar.gz"
      sha256 "1bcf9ef9836a441273841c72e4bf52e7d0784ee72ff61694419fb8509f7b7a9a"
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
