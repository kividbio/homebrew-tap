class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "0.1.13"
  
  on_macos do
    on_arm do
      url "https://releases.kividb.io/v0.1.13/kividb-darwin-aarch64.tar.gz"
      sha256 "97d0691fd86acd3b3291877b7840d7aa2e72ce3b520aca71a386b8b1cbf4ef08"
    end
    on_intel do
      url "https://releases.kividb.io/v0.1.13/kividb-darwin-x86_64.tar.gz"
      sha256 "0e0636eada075f7c7cb16ee055585017241868cd0b16beef1ab2c7502c4e7895"
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