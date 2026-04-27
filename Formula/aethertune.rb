class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  url "https://github.com/nevermore23274/AetherTune/releases/download/v0.6.2/AetherTune-v0.6.2-linux-x86_64.tar.gz"
  sha256 "f9b3494961901340fc3f52ab9f123adf84cd0cdd8f797319ef54b1cf0bbda4eb"
  license "MIT"
  version "0.6.2"

  depends_on :linux

  def install
    bin.install "AetherTune" => "aethertune"
  end

  def caveats
    <<~EOS
      AetherTune requires mpv and PulseAudio/PipeWire for full functionality:
        sudo apt install mpv pulseaudio-utils    # Debian/Ubuntu
        sudo pacman -S mpv pipewire-pulse        # Arch
      Without parec, the visualizer falls back to simulated mode.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aethertune --version 2>&1", 2)
  end
end
