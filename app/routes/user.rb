USER_ROUTE = proc do
  post '/register' do
    req = JSON.parse(request.body.read)
    user = User.create(
      username: req['username'],
      password: CryptoService.generate(req['password']),
      nickname: req['nickname'],
      is_admin: false,
    )
    yajl :empty
  rescue Sequel::UniqueConstraintViolation => _e
    raise UnauthorizedError.new('User Existed')
  end

  post '/login' do
    req = JSON.parse(request.body.read)
    user, token = User.login(req['username'], req['password'])
    yajl :login, locals: { token: token, user: user }
  end

  get '/:uid' do |uid|

  end

  put '/:uid' do |uid|

  end
end
