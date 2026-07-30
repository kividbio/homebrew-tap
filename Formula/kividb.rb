class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.3"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.3/kividb-darwin-aarch64.tar.gz"
      sha256 "fdc3913481306708fafe0ef63c41bb8de7207032ce7d46e796dbe88303544074"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.3/kividb-darwin-x86_64.tar.gz"
      sha256 "7899ebbcfa292bc33b61b5c6c5299aecf404874c138a99c1b2f99776a33b17d6"
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
