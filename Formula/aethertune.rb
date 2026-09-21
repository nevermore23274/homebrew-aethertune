class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.11.4"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.4/AetherTune-v0.11.4-macos-aarch64.tar.gz"
      sha256 "2eadd1e4900bcb950d543b56138b0d41a24432375252a7bb618c0969da0f868f"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.4/AetherTune-v0.11.4-macos-x86_64.tar.gz"
      sha256 "ef7bee9ed4a4867fdbfc17206546f3797c661222ee25128bfe0d2d4f39db36ce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.4/AetherTune-v0.11.4-linux-x86_64.tar.gz"
      sha256 "2c6eae0d52bca9d0bb2f5a1fe4e7e950c75f4bd2b9ebdd65359564cfd5c1e9bf"
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
