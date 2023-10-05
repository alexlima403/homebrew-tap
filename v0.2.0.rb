# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class V020 < Formula
    desc "TEST INGRESS"
    homepage "https://github.com/alexlima403/testIngressSolution"
    url "https://github.com/alexlima403/testIngressSolution/archive/refs/tags/v0.2.0.tar.gz"
    sha256 "16057eaef768061da812e786ec83cd03eceb0f938af8dec26f5b97674597b475"
    license "MIT"
  
    depends_on "go" => :build

    def install
        if ENV["HOMEBREW_GOPROXY"]
        ENV["GOPROXY"] = ENV["HOMEBREW_GOPROXY"]
        end

        system "make", "VERSION=#{version}", "build-go"
        
        bin.install Dir["*"]
    end
  
    service do
        keep_alive true
        run opt_bin/"testIngressSolution"
        log_path var/"log/testIngressSolution/std_out.log"
        error_log_path var/"log/testIngressSolution/std_error.log"
    end

    test do
      # `test do` will create, run in and delete a temporary directory.
      #
      # This test will fail and we won't accept that! For Homebrew/homebrew-core
      # this will need to be a test that verifies the functionality of the
      # software. Run the test with `brew test v0.2.0`. Options passed
      # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
      #
      # The installed folder is not in the path, so use the entire path to any
      # executables being tested: `system "#{bin}/program", "do", "something"`.
      system "false"
    end
  end
  