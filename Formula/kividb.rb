class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "0.1.15"
  
  on_macos do
    on_arm do
      url "https://releases.kividb.io/v0.1.15/kividb-darwin-aarch64.tar.gz"
      sha256 "07568e6aaff8177575460fe058f7aa44f86ce5cbfa561aac12dbf0363da519b3"
    end
    on_intel do
      url "https://releases.kividb.io/v0.1.15/kividb-darwin-x86_64.tar.gz"
      sha256 "796bd18942112ace149d14c02bc2537777de0b2e3a4698495eb5672b3c347842"
    end
  end
  
  def install
    bin.install "kividb"
    doc.install "LICENSE"
  end
  
  service do
    run [opt_bin/"kividb"]
    keep_alive true
    log_path var/"log/kividb.log"
    error_log_path var/"log/kividb.error.log"
  end
  
  test do
    system "#{bin}/kividb", "--version"
  end
end
