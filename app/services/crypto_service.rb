DIGEST = Digest::SHA2.new

class CryptoService
  class << self
    def salt(password, suffix)
      5.times { password = DIGEST.digest(password + suffix) }
      password.unpack('H*')[0]
    end

    def generate(password)
      suffix = SecureRandom.hex 8
      "#{salt(password, suffix)}:#{suffix}"
    end

    def verify(password, record)
      salted = record.split(':')
      salt(password, salted[1]) == salted[0]
    end
  end
end
