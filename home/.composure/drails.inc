drails ()
{
    about 'load rails development environment'
    param '*: optional arguments to rails command'
    example '$ drails console'
    group 'ruby'

    RAILS_ENV=development rails $@
}
